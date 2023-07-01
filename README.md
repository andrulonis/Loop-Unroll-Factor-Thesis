Repository of the practical part of thesis about loop unroll factor choice in hardware design and software compilation. The repository contains the majority of the files created and used, the parts that use `myopt` can also be replaced with just using `opt` from Clang. If not, myopt was an `opt` wrapper provided by the following framework from a Compiler Construction course: https://bitbucket.org/vusec/vu-coco-public/src/master/. Some scripts (always annotated on top of the files) need to be placed in specific directories to work correctly.

Hardware part relies on the ALADDIN tool from https://github.com/harvard-acc/ALADDIN, it can be installed the simplest as a docker container, all is described in the repository. In order to replicate the results: after cloning the ALADDIN repository into the docker container, you need to create a folder in each directory of a benchmark (in `MachSuite` and `SHOC` directories) called "example" and add respective config file from `hardware_ML/config_files` to it, renaming it to "config_example". Finally, add the `hardware_ML/code/run_unrolls.py` file to each directory of a benchmark and run it (all still inside the docker container). This will run the latency/area tests. 

For getting the loop metrics, you can use either the precompiled files that are already there or you can also recompile them using `hardware_ML/code/compile_hardware.py` and then get the metrics using `hardware_ML/code/gather_loops_metrics.py`.This requires the analysis pass to be registered in `opt`.

Finally, the `hardware_ML/code/LUF_predictor.py` needs the `hardware_ML/code/loops_data` (the file with all measurement data in a specific layout) and can be run to predict the loop unroll factors. `hardware_ML/code/Results` file is a cleaner display of this data.

Software parts rely on hyperfine tool from https://github.com/sharkdp/hyperfine. After installing it, in both directories `software_ML` and `software_clang`, you can either compile the code using `compile_software_ML` or `compile_software_clang`, or use the already precompiled code and run the `run_hyperfine_ML`/`run_hyperfine_clang` and then run `hyperfine_analysis_ML`/`hyperfine_analysis_clang`. 

References: 
- Aladdin: A Pre-RTL, Power-Performance Accelerator Simulator Enabling Large Design Space Exploration of Customized Architectures, Yakun Sophia Shao, Brandon Reagen, Gu-Yeon Wei and David Brooks, International Symposium on Computer Architecture, June, 2014
- Peter, D. (2023). hyperfine (Version 1.16.1) [Computer software]. https://github.com/sharkdp/hyperfine
