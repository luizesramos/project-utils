#!/usr/bin/env python
import sys
#import glob
###############################################################################
# keyword dictionary: tells 'get_metric' how to parse one txt file
kv = dict()
kv["all_resptime"]  = ("real", 0, 1)
kv["cpu_totcyc"] = ("cycles", 1, 0)
kv["cpu_inst"] = ("instructions", 1, 0)
kv["cpu_branch"] = ("branches", 1, 0)
kv["cpu_brmiss"] = ("branch-misses", 1, 0)
kv["cpu_cachetot"] = ("cache-references", 1, 0)
kv["cpu_cachemiss"] = ("cache-misses", 1, 0)
kv["cpu_llctot"] = ("LLC-loads", 1, 0)
kv["cpu_llcmiss"] = ("LLC-misses", 1, 0)
kv["cpu_clock"] = ("cpu-clock", 1, 0)
kv["gpu_branch"] = ("branch", 1, -1)
kv["gpu_divbr"] = ("divergent_branch", 1, -1)
kv["gpu_actcyc"] = ("active_cycles", 1, -1)
kv["gpu_inst"] = ("inst_executed", 1, -1)
kv["gpu_cta"] = ("sm_cta_launched", 1, -1)
kv["gpu_hit"] = ("l1_global_load_hit", 1, -1)
kv["gpu_miss"] = ("l1_global_load_miss", 1, -1)
kv["gpu_totcyc"] = ("elapsed_cycles_sm", 1, -1)

# metrics contains the sorted list of metrics
metrics = list()
for metric in kv:
  metrics.append(metric)
metrics.sort()

###############################################################################
# gets metric from file by name (using line matching and the kv dictionary)
def get_metric(metric, fname):
  key = kv[metric][0]
  key_index = kv[metric][1]
  val_index = kv[metric][2]
  shakes = open(fname, "r")
  val = 'NA'

  for line in shakes:
    s = line.split()
    if len(s) > key_index and len(s) > val_index:
      if s[key_index] == key:
        val = s[val_index].replace(",", "")
        break

  return val

###############################################################################
# filename building
def mk_fname(prog, img, gpu_pct, blk_size, cpu_threads, ite):
  return img + "/output_" + \
         prog + "_" + \
         img + "_" + \
         gpu_pct + "_"  + \
         blk_size + "_" + \
         cpu_threads + "_" + \
         ite + ".txt"

###############################################################################
# help menu
def help():
  print "Uses:"
  print " ", sys.argv[0], "for help."
  print " ", sys.argv[0], "<conv | fast | gol>\n"
        
  print "Metrics:"
  for metric in metrics:
    print " ", metric

###############################################################################
# csv functions
# get all iterations and calculate average
def mk_csv_header(prog):
  header = "tag,prog,img,gpu_pct,blk_size,cpu_threads,ite"
  for m in metrics:
    header += "," + str(m)
  return header

def mk_csv(tag, prog, img, gpu_pct, blk_size, cpu_threads, ite):
  fname = mk_fname(prog, img, gpu_pct, blk_size, cpu_threads, ite)
  sep = ","
  head = tag + sep + prog + sep + img + sep + gpu_pct + sep  + blk_size + sep + cpu_threads + sep + ite 

  vals = ''
  for m in metrics:
    vals += sep + get_metric(m,fname)

  return head + vals

###############################################################################
# main 
prog = ''
if len(sys.argv) > 1:
  if sys.argv[1] == 'conv':
    prog = 'convolution'
  elif sys.argv[1] == 'fast':
    prog = 'fast'
  elif sys.argv[1] == 'gol':
    prog = 'gol'

if not prog:
  help()
  sys.exit(0)

print mk_csv_header(prog)
#print mk_csv(prog, "1", "0.25", "8", "2", "1") #test

#for IMAGE in ('1', '4', '7'):
#  for GPU_PERCENT in ('0.25', '0.5', '0.75'):
#     for BLOCK_SIZE in ('8', '16', '32'):
#       for CPU_THREADS in ('2', '4', '8'):
#          for ITERATION in range(4):
#            mk_csv(prog, IMAGE, GPU_PERCENT, BLOCK_SIZE, CPU_THREADS, str(ITERATION))

# cases (IMAGE,GPU_PERCENT,BLOCK_SIZE,CPU_THREADS,ITERATION)

for img in ('1', '4', '7'):
  # Note: unrolling the options below to simplify 
  # enabljg and disabling them

  # sequential sequ: "output_convolution_*_0_*_1_*.txt" # 0% GPU, 1 CPU thread
  #mk_csv(tag, prog, img, gpu_pct, blk_size, cpu_threads, ite):
  print mk_csv('sequ', prog, img, '0', '0', '1', '1')
  print mk_csv('sequ', prog, img, '0', '0', '1', '2')
  print mk_csv('sequ', prog, img, '0', '0', '1', '3')
  
  # gpu only: 
  # gpuo="output_convolution_*_1_*_*_*.txt" # different block sizes (8,16,32)          
  print mk_csv('gpuo', prog, img, '1', '8', '0', '1')
  print mk_csv('gpuo', prog, img, '1', '8', '0', '2')
  print mk_csv('gpuo', prog, img, '1', '8', '0', '3')
  print mk_csv('gpuo', prog, img, '1', '16', '0', '1')
  print mk_csv('gpuo', prog, img, '1', '16', '0', '2')
  print mk_csv('gpuo', prog, img, '1', '16', '0', '3')
  print mk_csv('gpuo', prog, img, '1', '32', '0', '1')
  print mk_csv('gpuo', prog, img, '1', '32', '0', '2')
  print mk_csv('gpuo', prog, img, '1', '32', '0', '3')

  # cpu only
  # cpuo="output_convolution_*_0_0_[2-8]_*.txt" # >1 threads (=2,4,8)
  print mk_csv('cpuo', prog, img, '0', '0', '2', '1')
  print mk_csv('cpuo', prog, img, '0', '0', '2', '2')
  print mk_csv('cpuo', prog, img, '0', '0', '2', '3')
  print mk_csv('cpuo', prog, img, '0', '0', '4', '1')
  print mk_csv('cpuo', prog, img, '0', '0', '4', '2')
  print mk_csv('cpuo', prog, img, '0', '0', '4', '3')
  print mk_csv('cpuo', prog, img, '0', '0', '8', '1')
  print mk_csv('cpuo', prog, img, '0', '0', '8', '2')
  print mk_csv('cpuo', prog, img, '0', '0', '8', '3')

  # gpu 25%
  # gpu25="output_convolution_*_0.25_*_*_*.txt"
  print mk_csv('gpu25', prog, img, '0.25', '8', '2', '1')
  print mk_csv('gpu25', prog, img, '0.25', '8', '2', '2')
  print mk_csv('gpu25', prog, img, '0.25', '8', '2', '3')
  print mk_csv('gpu25', prog, img, '0.25', '8', '4', '1')
  print mk_csv('gpu25', prog, img, '0.25', '8', '4', '2')
  print mk_csv('gpu25', prog, img, '0.25', '8', '4', '3')
  print mk_csv('gpu25', prog, img, '0.25', '8', '8', '1')
  print mk_csv('gpu25', prog, img, '0.25', '8', '8', '2')
  print mk_csv('gpu25', prog, img, '0.25', '8', '8', '3')
  print mk_csv('gpu25', prog, img, '0.25', '16', '2', '1')
  print mk_csv('gpu25', prog, img, '0.25', '16', '2', '2')
  print mk_csv('gpu25', prog, img, '0.25', '16', '2', '3')
  print mk_csv('gpu25', prog, img, '0.25', '16', '4', '1')
  print mk_csv('gpu25', prog, img, '0.25', '16', '4', '2')
  print mk_csv('gpu25', prog, img, '0.25', '16', '4', '3')
  print mk_csv('gpu25', prog, img, '0.25', '16', '8', '1')
  print mk_csv('gpu25', prog, img, '0.25', '16', '8', '2')
  print mk_csv('gpu25', prog, img, '0.25', '16', '8', '3')
  print mk_csv('gpu25', prog, img, '0.25', '32', '2', '1')
  print mk_csv('gpu25', prog, img, '0.25', '32', '2', '2')
  print mk_csv('gpu25', prog, img, '0.25', '32', '2', '3')
  print mk_csv('gpu25', prog, img, '0.25', '32', '4', '1')
  print mk_csv('gpu25', prog, img, '0.25', '32', '4', '2')
  print mk_csv('gpu25', prog, img, '0.25', '32', '4', '3')
  print mk_csv('gpu25', prog, img, '0.25', '32', '8', '1')
  print mk_csv('gpu25', prog, img, '0.25', '32', '8', '2')
  print mk_csv('gpu25', prog, img, '0.25', '32', '8', '3')

  # gpu 50%
  # gpu50="output_convolution_*_0.5_*_*_*.txt"
  print mk_csv('gpu50', prog, img, '0.5', '8', '2', '1')
  print mk_csv('gpu50', prog, img, '0.5', '8', '2', '2')
  print mk_csv('gpu50', prog, img, '0.5', '8', '2', '3')
  print mk_csv('gpu50', prog, img, '0.5', '8', '4', '1')
  print mk_csv('gpu50', prog, img, '0.5', '8', '4', '2')
  print mk_csv('gpu50', prog, img, '0.5', '8', '4', '3')
  print mk_csv('gpu50', prog, img, '0.5', '8', '8', '1')
  print mk_csv('gpu50', prog, img, '0.5', '8', '8', '2')
  print mk_csv('gpu50', prog, img, '0.5', '8', '8', '3')
  print mk_csv('gpu50', prog, img, '0.5', '16', '2', '1')
  print mk_csv('gpu50', prog, img, '0.5', '16', '2', '2')
  print mk_csv('gpu50', prog, img, '0.5', '16', '2', '3')
  print mk_csv('gpu50', prog, img, '0.5', '16', '4', '1')
  print mk_csv('gpu50', prog, img, '0.5', '16', '4', '2')
  print mk_csv('gpu50', prog, img, '0.5', '16', '4', '3')
  print mk_csv('gpu50', prog, img, '0.5', '16', '8', '1')
  print mk_csv('gpu50', prog, img, '0.5', '16', '8', '2')
  print mk_csv('gpu50', prog, img, '0.5', '16', '8', '3')
  print mk_csv('gpu50', prog, img, '0.5', '32', '2', '1')
  print mk_csv('gpu50', prog, img, '0.5', '32', '2', '2')
  print mk_csv('gpu50', prog, img, '0.5', '32', '2', '3')
  print mk_csv('gpu50', prog, img, '0.5', '32', '4', '1')
  print mk_csv('gpu50', prog, img, '0.5', '32', '4', '2')
  print mk_csv('gpu50', prog, img, '0.5', '32', '4', '3')
  print mk_csv('gpu50', prog, img, '0.5', '32', '8', '1')
  print mk_csv('gpu50', prog, img, '0.5', '32', '8', '2')
  print mk_csv('gpu50', prog, img, '0.5', '32', '8', '3')

  # gpu 75%
  # gpu75="output_convolution_*_0.75_*_*_*.txt"
  print mk_csv('gpu75', prog, img, '0.75', '8', '2', '1')
  print mk_csv('gpu75', prog, img, '0.75', '8', '2', '2')
  print mk_csv('gpu75', prog, img, '0.75', '8', '2', '3')
  print mk_csv('gpu75', prog, img, '0.75', '8', '4', '1')
  print mk_csv('gpu75', prog, img, '0.75', '8', '4', '2')
  print mk_csv('gpu75', prog, img, '0.75', '8', '4', '3')
  print mk_csv('gpu75', prog, img, '0.75', '8', '8', '1')
  print mk_csv('gpu75', prog, img, '0.75', '8', '8', '2')
  print mk_csv('gpu75', prog, img, '0.75', '8', '8', '3')
  print mk_csv('gpu75', prog, img, '0.75', '16', '2', '1')
  print mk_csv('gpu75', prog, img, '0.75', '16', '2', '2')
  print mk_csv('gpu75', prog, img, '0.75', '16', '2', '3')
  print mk_csv('gpu75', prog, img, '0.75', '16', '4', '1')
  print mk_csv('gpu75', prog, img, '0.75', '16', '4', '2')
  print mk_csv('gpu75', prog, img, '0.75', '16', '4', '3')
  print mk_csv('gpu75', prog, img, '0.75', '16', '8', '1')
  print mk_csv('gpu75', prog, img, '0.75', '16', '8', '2')
  print mk_csv('gpu75', prog, img, '0.75', '16', '8', '3')
  print mk_csv('gpu75', prog, img, '0.75', '32', '2', '1')
  print mk_csv('gpu75', prog, img, '0.75', '32', '2', '2')
  print mk_csv('gpu75', prog, img, '0.75', '32', '2', '3')
  print mk_csv('gpu75', prog, img, '0.75', '32', '4', '1')
  print mk_csv('gpu75', prog, img, '0.75', '32', '4', '2')
  print mk_csv('gpu75', prog, img, '0.75', '32', '4', '3')
  print mk_csv('gpu75', prog, img, '0.75', '32', '8', '1')
  print mk_csv('gpu75', prog, img, '0.75', '32', '8', '2')
  print mk_csv('gpu75', prog, img, '0.75', '32', '8', '3')

#print 'nargs:', len(sys.argv), 'arg list:', str(sys.argv)

##fname = "1/output_convolution_1_0_0_1_1.txt"
#fname = "1/output_convolution_1_0.25_8_8_1.txt"
#
#for metric in kv:
#  print metric, get_metric(metric, fname)
