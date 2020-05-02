//------------------------------------------------------------
//   Copyright 2010-2018 Mentor Graphics Corporation
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//------------------------------------------------------------

//
// Class Description:
//
//
class apb_slave_monitor extends uvm_component;

// UVM Factory Registration Macro
//
`uvm_component_utils(apb_slave_monitor);

// Virtual Interface
  virtual apb_slave_monitor_bfm m_bfm;

//------------------------------------------
// Data Members
//------------------------------------------
apb_slave_agent_config m_cfg;

//------------------------------------------
// Component Members
//------------------------------------------
uvm_analysis_port #(apb_slave_seq_item) ap;

//------------------------------------------
// Methods
//------------------------------------------

// Standard UVM Methods:

extern function new(string name = "apb_slave_monitor", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern function void report_phase(uvm_phase phase);

// Proxy Methods:
  
extern function void notify_transaction(apb_slave_seq_item item);

endclass: apb_slave_monitor

function apb_slave_monitor::new(string name = "apb_slave_monitor", uvm_component parent = null);
  super.new(name, parent);
endfunction

function void apb_slave_monitor::build_phase(uvm_phase phase);
  ap = new("ap", this);
  m_cfg = apb_slave_agent_config::get_config(this);
  m_bfm = m_cfg.mon_bfm;
  m_bfm.set_apb_index(m_cfg.apb_index);
  m_bfm.proxy = this;
endfunction: build_phase

task apb_slave_monitor::run_phase(uvm_phase phase);
  m_bfm.run();
endtask: run_phase

function void apb_slave_monitor::report_phase(uvm_phase phase);
// Might be a good place to do some reporting on no of analysis transactions sent etc

endfunction: report_phase

function void apb_slave_monitor::notify_transaction(apb_slave_seq_item item);
  ap.write(item);
endfunction : notify_transaction
