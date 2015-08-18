#!/usr/bin/python
import csv;
import sys;
import os;
import random;

#######################################
# global variables

# by default, we output a complex decoder of the ISA
COMPLEX = True

# reserved decoder output encodings
INVALID = 0 # invalid opcode
EMULATED = 1 # removed instruction, now triggers an interrupt
FIRST_FREE_UID = 2 # first uid

# global variablies
unique_id = FIRST_FREE_UID # zero=invalid, one=removed+emulated

# a list for shuffling output signals 
outhash = list() 
maxlevel = 0

#######################################
# utils
def VHDL(s):
  print s
  pass

def DEBUG(s):
  #print s
  pass

def die():
  print 'Usage: ' + sys.argv[0] + ' <file-name.csv> [-simple]'
  sys.exit()

#######################################
# metadata
class Meta:
  def __init__(self,mne,enab,cplx):
    self.mne = mne # instruction mnemonic
    self.enab = (enab == '1') # enabled (emulated vs hardwired)
    self.smpl = (cplx == '0') # simple instruction

  def get_mne(self):
    return self.mne

  def is_enabled(self):
    return self.enab

  def is_simple(self):
    return self.smpl

#######################################
# decoder tree
class Node:
  def __init__(self, op_name, op_level):
    # nodes are internal by default
    self.name = op_name
    self.level = op_level
    self.dic={} # dic contains the children
    self.is_leaf = False 
    self.meta = None

    global maxlevel
    if maxlevel < self.level:
      maxlevel = self.level

  #def opname(self):
  #  return 'op' + str(self.level)

  #def whoami(self):
  #  DEBUG('>> op' + str(self.level) +\
  #        '[' + self.name + '] is a leaf with mne ' + self.meta.get_mne())
  #
  #  if self.is_leaf:
  #    return '[' + self.name + '--' + self.get_mne() + ']'
  #  else:
  #    s = ''
  #    for x in self.dic:
  #      s = s + '[' + str(x) + ']'
  #    return s

  # this is a leaf node (at any level)
  def set_leaf(self, meta):
    self.is_leaf = True
    self.meta = meta
    #self.whoami()

    # we only increment the unique_id if the 
    # instruction won't be emulated
    if meta.is_enabled():
      global unique_id, outhash
      outhash.append(unique_id)
      unique_id += 1

  def add(self, opcodes, meta):
    if len(opcodes) == 0:
      print 'Warning: empty line!'
      return # skip empty line

    # remove head of opcode list
    op = opcodes.pop(0)

    if op not in self.dic:
      self.dic[op] = Node(op, self.level+1)

    # this is a leaf
    if len(opcodes) == 0: 
      self.dic[op].set_leaf(meta)

    # this is an internal node
    if(len(opcodes) > 0): 
      self.dic[op].add(opcodes,meta)
      
  # traversal functions
  def __str__(self):
    self.dfs(1)
    return ''
    
  def get_spaces(self,level):
    spc = ''
    for i in range(0,level):
      spc += '    '
    return spc

  def dfs(self, level):
    global unique_id, outhash
    # case begin
    spaces = self.get_spaces(level)
    VHDL(spaces + 'case OP' + str(level) + ' is')

    for i in range (0,256):
      opcode = str(i)
      if opcode in self.dic:

        # BEGIN DEBUG: detecting collisions (a leaf node should have no children)
        child_dic = self.dic[opcode].dic
        if self.dic[opcode].is_leaf and len(child_dic) > 0:
          DEBUG('COLLISION: OPCODE ' + hex(i) + ' = ' + str(i) + ' ' +\
                self.dic[opcode].meta.get_mne() +\
                ' LEN:' + str(len(child_dic)))
          for x in child_dic:
            DEBUG('    ITEM:' + hex(int(x)) + ' = ' + str(x))

        # END DEBUG
                
        # VHDL code for the leaves (assign UID signal to OUT)
        if self.dic[opcode].is_leaf:
          if self.dic[opcode].meta.is_enabled():
            code = str(outhash[unique_id])
            comment = self.dic[opcode].meta.get_mne()
            unique_id += 1
          else:
            code = str(EMULATED)
            comment = self.dic[opcode].meta.get_mne() + ' (emulate)'

          VHDL(spaces + '    when ' + opcode + ' => NEXT_OUTS <= ' +\
               code + '; -- ' + comment + ' SANITY')

        # Nested VHDL case statements
        else:
        #if len(self.dic[opcode].dic) > 0: # makes no sense
          VHDL(spaces + '    when ' + opcode + ' => ')
          self.dic[opcode].dfs(level+1)

        #print opcode +\
        #      ' is_leaf: ' + str(self.dic[opcode].is_leaf) +\
        #      ' empty_dic ' + str(len(self.dic[opcode].dic))

    # case end
    VHDL(spaces + '    when others => NEXT_OUTS <= ' +\
         str(INVALID) + '; -- invalid')
    VHDL(spaces + 'end case;')
    
#######################################
# verify the input
argc = len(sys.argv)

if argc < 2:
  die()

elif argc == 2:
  fname = sys.argv[1]

elif argc == 3:
  if sys.argv[1] == '-simple':
    COMPLEX = False;
    fname = sys.argv[2]

  elif sys.argv[2] == '-simple':
    COMPLEX = False;
    fname = sys.argv[1]

  else:
    die()

if not os.path.isfile(fname):
  print 'Error: ' + fname + ' is not a valid file' 
  die()

#######################################
# parsing loop
reader = csv.reader(open(fname,'rU'))
root = Node('ROOT',0)

for row in reader:
  family = row[0]
  meta = Meta(row[1],row[2],row[3]) # mne, enabled, complex
  opcodes = row[4:] # remainder of the row are opcodes
  # remove white spaces from the opcodes
  while opcodes.count(''):
    opcodes.remove('')

  #print 'family:' + family, ' mne:' + mne + ' => ', opcodes
  
  # simple decoder: include only simple instructions
  # complex decoder: include all instructions
  if(COMPLEX or meta.is_simple()): # original => we emulate all retired instructions
  #if((COMPLEX or meta.is_simple()) and meta.is_enabled()): # alt1: skip retired instructions
    root.add(opcodes,meta)

#######################################
# VHDL generation

# returns the next power of 2 above number x
def upper_bound(x):
  obits = 1
  while x != 0:
     obits <<= 1
     x >>= 1
  return obits

# generating input signals
if maxlevel == 0:
  print 'Error: no input signals found.'
  die()

if maxlevel == 1:
  insignals = 'OP1'
else:
  insignals = ''
  for i in range(1,maxlevel):
    insignals = insignals + 'OP'+ str(i) + ','
  insignals = insignals + 'OP' + str(maxlevel)

# obtaining the maximum number of bits in the output
# = number of non-emulated instructions + reserved_codes
obits = upper_bound(unique_id)
#print unique_id, obits

# generating output signal hashing
#print maxlevel, unique_id, outhash

# now we initialize unique_id with zero
# because we travesre outhash from 
# index 0 through len(outhash)
unique_id = 0
random.shuffle(outhash)

# header
VHDL('------------------------------------------')
VHDL('library ieee;')
VHDL('use ieee.std_logic_1164.all;')
VHDL('use ieee.numeric_std.all;')
VHDL('------------------------------------------')
VHDL('entity DECODER is')
VHDL('port(' + insignals + ': in integer range 0 to 255;')
VHDL('     CLOCK: std_logic;')
VHDL('     OUTS: out integer range 0 to ' + str(obits) + ');')
VHDL('end DECODER;')
VHDL('------------------------------------------')
VHDL('architecture behv of DECODER is')
VHDL('signal NEXT_OUTS: integer;')
VHDL('begin')
VHDL('  process(CLOCK)')
VHDL('  begin')
VHDL('    if(rising_edge(CLOCK)) then')
VHDL('      OUTS <= NEXT_OUTS;')
VHDL('    end if;')
VHDL('  end process;') 
VHDL('')
VHDL('  process(' + insignals + ')')
VHDL('  begin')

# traverses the tree structure
VHDL(root)

# footer
VHDL('  end process;')
VHDL('end behv;')

DEBUG(root)

#######################################
