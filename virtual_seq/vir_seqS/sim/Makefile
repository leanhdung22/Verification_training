INCLUDE=+incdir+../tb

TOP_FILE=../tb/apb_agent.sv
TOP_FILE+=../tb/spi_agent.sv
TOP_FILE+=../tb/wb_agent.sv
TOP_FILE+=../tb/tb.sv

TEST_NAME=tb_top

all: work tb sim
work:
	vlib work

tb:
	vlog $(INCLUDE) $(TOP_FILE)
sim:
	vsim -c +UVM_VERBOSITY=UVM_FULL $(TEST_NAME) -do "run -a; quit -f"
simgui:
	vsim apb_monitor_tb -voptargs=+acc

clean:
	rm -r work transcript

tarball: clean tgz

tgz:
	@(cd ../..; \
	tar -zcf apb_protocol_monitor_example/sim/apb_protocol_monitor.tgz \
	apb_protocol_monitor_example/tb \
	apb_protocol_monitor_example/sim/Makefile \
	apb_protocol_monitor_example/README \
	apb_protocol_monitor_example/protocol_monitor)
help:
	@echo Guide Makefile
	@echo 	make TEST_NAME=top
	@echo 	make tb 	: compile sv file
	@echo 	make sim	: run simulation on terminal
	@echo 	make sim gui 	: run simulation on graphics interface
