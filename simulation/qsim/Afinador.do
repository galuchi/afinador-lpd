onerror {quit -f}
vlib work
vlog -work work Afinador.vo
vlog -work work Afinador.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Afinador_vlg_vec_tst
vcd file -direction Afinador.msim.vcd
vcd add -internal Afinador_vlg_vec_tst/*
vcd add -internal Afinador_vlg_vec_tst/i1/*
add wave /*
run -all
