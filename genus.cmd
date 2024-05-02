# Cadence Genus(TM) Synthesis Solution, Version 20.11-s111_1, built Apr 26 2021 14:57:38

# Date: Thu May 02 11:21:30 2024
# Host: centos (x86_64 w/Linux 3.10.0-1160.114.2.el7.x86_64) (6cores*12cpus*1physical cpu*Intel(R) Core(TM) i7-8700 CPU @ 3.20GHz 12288KB)
# OS:   CentOS Linux release 7.9.2009 (Core)

read_lib /home/tcad/Desktop/arushi/libs/slow.lib
read_hdl -sv{ICache.v}
read_hdl-sv{ICache.v}
read_hdl-sv {/home/tcad/Desktop/198017/work/ICache.v}
read_hdl -sv{/home/tcad/Desktop/198017/work/ICache.v}
read_hdl -sv{ICache.v}
read_hdl -sv ICache.v
elaborate ICache
syn_gen
syn_map
syn_opt
report area
report power
report gates
report timing -unconstrained
gui_show
