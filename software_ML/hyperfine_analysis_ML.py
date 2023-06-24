import subprocess
import os

# Put this file in the directory of all benchmark programs' directories ("benchmark_codes")

dirs = ["bb_gemm", "fft", "md", "pp_scan", "reduction", "ss_sort", "stencil", "triad"]

for dir in dirs:
    files = os.listdir(f"{dir}/compile")
    for json in files: 
        if os.fsdecode(json).endswith(".json"):
            subprocess.call(f"python3 plot_whisker.py {dir}/compile/{json} -o whiskers/{dir}_{json[10:-5]}_whisker.png --title {dir}_{json[10:-5]}", shell=True)
