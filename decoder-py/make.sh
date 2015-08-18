#!/bin/bash
MAXGEN=`grep "pr\[.*.\]=" digest.awk | wc -l`
OUTDIR="./testpack"
RC_TEMPLATES="./rc_template"
DATA_FILE="instruction-usage.csv"

function usage() {
  echo "Usage"
  echo "$0 [-d [0-4] | -v VERSION | -g GEN | gen | ver | -area | -perf | -simple | -o DIR | clean]"
  exit
}

function clean() {
  echo "Clean"
  rm -rf "$OUTDIR"
  #rm -f dec-*.vhdl dec-*.csv
  exit
}

function mkconfig() {
  gen="$1"
  ver="$2"

  base="$OUTDIR/dec-$gen-$ver-$tag"
  mkdir -p $base
#  cp "$RC_TEMPLATES/Makefile" $base
#  cp "$RC_TEMPLATES/make.tcsh" $base
#  cp "$RC_TEMPLATES/run-$optim-optimized.tcl" "$base/run.tcl"
#  cp "$RC_TEMPLATES/runtests.sh" $OUTDIR
#  cp "$RC_TEMPLATES/showresults.sh" $OUTDIR
#  cp "$RC_TEMPLATES/grab.awk" $OUTDIR
#  cp "$RC_TEMPLATES/cleartests.sh" $OUTDIR

  csv="$base/decoder.csv"
  vhd="$base/decoder.vhdl"
  echo "* generation: $gen version: $ver complexity: $tag"
  awk -vGENERATION="$gen" -vVERSION="$ver" -f digest.awk "$DATA_FILE" > $csv
  #echo "./decoder$dindex.py $csv $flags"
  ./decoder$dindex.py $csv $flags > $vhd
}

function bygen() {
  echo "By Generation"
  args="$1"
  for gen in $args; do
    mkconfig $gen "full"
  done
}

function byver() {
  echo "By Version"
  args="$1"
  for ver in $args; do
    mkconfig $MAXGEN "$ver"
  done
}

# args to array
argc=0;
for x in "$@"; do
  argv[$argc]="$x";
  let argc=$argc+1;
done

if [[ "$argc" == 0 ]]; then usage; fi

# using the args (default values)
ver="full"
gen="$MAXGEN"
optim="area"
all_gen=0
all_ver=0
flags=""
tag="cplx"
dindex="INVALID"

for((i=0;i<$argc;i++)); do
  x=${argv[$i]}

  case $x in
  "-simple")
     flags="$flags -simple"
     tag="smpl"
     ;;
  "-perf")
     optim="perf"
     ;;
  "-area")
     optim="area"
     ;;
  "-o")
     let i=$i+1
     OUTDIR=${argv[$i]}
     # did we specify a dir?
     if [[ "$OUTDIR" == "" ]]; then usage; fi
     mkdir -p $OUTDIR
     # was the dir created correctly?
     if [ ! -d "$OUTDIR" ]; then usage; fi 
     ;;
  "-v")
     let i=$i+1
     if [[ "$i" -gt "$argc" ]]; then usage; fi
     ver=${argv[$i]}
     ;;
  "-g")
     let i=$i+1
     if [[ "$i" -gt "$argc" ]]; then usage; fi
     gen=${argv[$i]}
     ;;
  "-d")
     let i=$i+1
     if [[ "$i" -gt "$argc" ]]; then usage; fi
     dindex=${argv[$i]}
     ;;
  "gen") 
     all_gen=1
     ;;
  "ver") 
     all_ver=1
     ;;
  "clean") 
     clean ;;
  *)
     usage ;;
  esac

done

if [[ "$dindex" == "INVALID" ]]; then
  echo "ERROR: dindex not specified or invalid ($dindex)."
  echo "Please specify -d [0..4]"
  usage
fi

if [[ "$all_gen" == "1" ]]; then
  bygen "`seq -f %02g 1 $MAXGEN`"
  exit
fi

if [[ "$all_ver" == "1" ]]; then
  byver "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18"
  exit
fi

if [[ "$gen" != "" || "$ver" != "" ]]; then
  gen="`seq -f %02g $gen $gen`"
  mkconfig "$gen" "$ver"
fi
