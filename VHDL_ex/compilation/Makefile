all: work

work:
	vdel -lib lib_VHDL -all
	vlib lib_VHDL
	vmap lib_VHDL ./lib_VHDL
	vcom -work lib_VHDL vhdl_fsm.vhd
