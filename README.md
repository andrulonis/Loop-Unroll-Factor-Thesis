Repository of the practical part of thesis about loop unroll factor choice in hardware design and software compilation. The repository contains the majority of the files created and used, the parts that use `myopt` can also be replaced with just using `opt` from Clang. If not, `myopt` was an `opt` wrapper provided by the following framework from a Compiler Construction course: https://bitbucket.org/vusec/vu-coco-public/src/master/.

Hardware part relies on the ALADDIN tool from https://github.com/harvard-acc/ALADDIN for the latency and area measurements, it can be installed the simplest as a docker container, all is described in the repository. In order to replicate the results: after cloning the ALADDIN repository into the docker container, you need to create a folder in each directory of a benchmark (in `MachSuite` and `SHOC` directories) called "example" and add respective config file from `hardware_ML/gather_latency_area/config_files` to it, renaming it to "config_example". Finally, add the `hardware_ML/gather_latency_area/run_unrolls.py` file to each directory of a benchmark and run it (all still inside the docker container). This will run the latency/area tests. 

For getting the loop metrics, you can use either the precompiled files that are already there or you can also recompile them using `hardware_ML/gather_loops_metrics/benchmark_codes/compile_hardware.py` and then get the metrics using `hardware_ML/gather_loops_metrics/benchmark_codes/gather_loops_metrics.py`. This requires the Compiler Construction framework installed - do so by going to `hardware_ML/gather_loops_metrics` directory and run `run.sh` (requires docker). Afterwards, run `make passes` and now you can gather the metrics or use the tool on a single .ll file to see how it works, for example: `myopt -loop-analysis benchmark_codes/pp_scan/pp_scan.ll`. The results are printed on top of the pritned out code in the console. It is worth noting it prints all the loops, not only the ones that were used for the measurements. It prints them in a specific order and to be sure which loop you are looking for in the code, use `myopt -loop-analysis benchmark_codes/pp_scan/pp_scan_dbg.ll` to see at which line exactly the loop resides (other metrics given here may not be accurate, the former command is used for this).

Finally, the `hardware_ML/LUF_predictor.py` needs the `hardware_ML/loops_data` (the file with all measurement data in a specific layout that were copied from `hardware_ML/gather_loops_metrics/benchmark_codes/metrics_export.txt`) and can be run to train the models. `hardware_ML/Results` file is a cleaner display of this data.

Software parts rely on hyperfine tool from https://github.com/sharkdp/hyperfine. After installing it, in both directories `software_ML` and `software_clang`, you can either compile the code using `compile_software_ML` or `compile_software_clang`, or use the already precompiled code and run the `run_hyperfine_ML`/`run_hyperfine_clang` and then run `hyperfine_analysis_ML`/`hyperfine_analysis_clang`. 

References: 
- Aladdin: A Pre-RTL, Power-Performance Accelerator Simulator Enabling Large Design Space Exploration of Customized Architectures, Yakun Sophia Shao, Brandon Reagen, Gu-Yeon Wei and David Brooks, International Symposium on Computer Architecture, June, 2014
- Peter, D. (2023). hyperfine (Version 1.16.1) [Computer software]. https://github.com/sharkdp/hyperfine
