Code generation from data 

* decoder0.py produces a processor decoder in VHDL from a data sheet (csv file)

* instruction-usage.csv is an example of input file containing information about CPU instructions usage and availability over time

* make.sh uses the input file to generate variations of processor decoders based on command line arguments. The variations are created under a common output directory to facilitate synthesizing circuits in batches.

./make.sh [-d [0-4] | -v VERSION | -g GEN | gen | ver | -area | -perf | -simple | -o DIR | clean]

./make.sh -d 0 # creates testpack/dec-12-full-cplx

./make.sh -d 0 -g 2 -v 1 # creates testpack/dec-02-1-cplx

./make.sh -d 0 -g 2 -v 1 -simple # testpack/dec-02-1-smpl
