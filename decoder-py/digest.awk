function is_num(x) { return (((x+1)-1) == x); }

BEGIN {
  # global variables
  FS=",";

  # field identification
  MNE_FIELD=1;  # textual unique instruction signature
  PR_FIELD=2;   # processor release
  UIS_FIELD=3;  # hexadecimal unique instruction signature
  CPLX_FIELD=4; # complex=1 (>4uops), simple=0(<=4uops)
  # Note: the subsequent columns flag (regardless of the criteria) if an
  # instruction should be included or not in the ISA/decoder. 
  BASE_FILTER_FIELD=5;

  # processor release hash table
  pr["80386+"]=1;
  pr["80486+80387"]=2;
  pr["Pentium+PentiumPro"]=3;
  pr["Pentium2+MMX"]=4;
  pr["SSE"]=5;
  pr["SSE2"]=6;
  pr["SSE3"]=7;
  pr["SSSE3"]=8;
  pr["SSE4.1"]=9;
  pr["SSE4.2+AES+CLMUL"]=10;
  pr["AVX"]=11;
  pr["AVX2+FMA3"]=12;

  MIN_PR=pr["80386+"];
  MAX_PR=pr["AVX2+FMA3"];
}

(NR==1){
  # by default, we print all instructions
  FILTER_COL = 0;
  enabled = 1; # enables all instructions

  # if a constraint column is specified in VERSION
  # we emulate some instructions
  if(is_num(VERSION)) {
    #print "VERSION IS A NUMBER"
    TMP = VERSION + BASE_FILTER_FIELD;
    #print "COL=",TMP
    #print "NF=",NF
    if(TMP >= BASE_FILTER_FIELD && TMP <= NF) {
      FILTER_COL = TMP;
      #print "valid FILTER_COL=",FILTER_COL
    } else {
      #print "invalid FILTER_COL=",FILTER_COL
    }
  }

  # invalid generation prints all generations
  if(GENERATION < MIN_PR || GENERATION>MAX_PR) {
    GENERATION = MAX_PR; # prints up to last generation
  } # otherwise use the picked generation

  hexToDec["0"] = 0;  hexToDec["1"] = 1;
  hexToDec["2"] = 2;  hexToDec["3"] = 3;
  hexToDec["4"] = 4;  hexToDec["5"] = 5;
  hexToDec["6"] = 6;  hexToDec["7"] = 7;
  hexToDec["8"] = 8;  hexToDec["9"] = 9;
  hexToDec["a"] = 10; hexToDec["b"] = 11;
  hexToDec["c"] = 12; hexToDec["d"] = 13;
  hexToDec["e"] = 14; hexToDec["f"] = 15;

  lastOpcode="xxx";

  #print "Family,Mnemonic,Enabled,Complex,Op1,Op2,Op3,Op4";
  NOPC=4; # number of opcode fields
}

function getOpcode(x,separator) {
  split(x,bytes," "); 
  n = length(bytes);

  # strip the '0x' prefixes and 
  for(i=1; i<=n; i++) {
    msb = hexToDec[substr(bytes[i],3,1)];
    lsb = hexToDec[substr(bytes[i],4,1)];
    bytes[i] = (msb*16) + lsb;
  }

  # print the existing bytes with separators
  opcode = bytes[1];
  for(i=2; i<=n; i++) {
    opcode = opcode""separator""bytes[i];
  }  

  # put empty fields with separators if necessary
  for(i=n; i<NOPC; i++)
    opcode = opcode""separator; 

  return opcode;
}

{uis=$MNE_FIELD;}
{category=pr[$PR_FIELD];}
{code=$UIS_FIELD;}
{curOpcode = getOpcode(code,",");}
{complex = $CPLX_FIELD; }

# we selected an OS version to filter out instructions
# the selected column has the number of times the instruction appears
# if > 0 we print the instruction, otherwise we skip it
(FILTER_COL > 0){ if($FILTER_COL > 0) { enabled=1; } else { enabled=0; }}

# error handling
(category==""){ sprintf(stderr,"ERROR: no ProcessorRelease",$0); }

(lastOpcode==curOpcode){ 
  sprintf(stderr, "ERROR: repeated opcode %d %s",curOpcode,uis);
}

# printing ISA
(category!="") && (NR>1) && !/Invalid/ && (category<=GENERATION){
  print category","uis","enabled","complex","curOpcode;
  lastOpcode = curOpcode;
}
