//------------------------------------------------------------
//   Copyright 2011-2018 Mentor Graphics Corporation
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

package agent_c_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

class c_seq_item extends uvm_sequence_item;

`uvm_object_utils(c_seq_item)

rand int number;

function new(string name = "c_seq_item");
  super.new(name);
endfunction

endclass: c_seq_item

class c_driver extends uvm_driver #(c_seq_item);

`uvm_component_utils(c_driver)

int i;

function new(string name = "c_driver", uvm_component parent = null);
  super.new(name, parent);
endfunction

task run_phase(uvm_phase phase);
  c_seq_item t;
  i = 0;

  forever begin
    seq_item_port.get(t);
    `uvm_info("C_DRIVER", $sformatf("Received transaction %0d with value %0d", i, t.number), UVM_LOW)
    i++;
  end
endtask: run_phase

endclass: c_driver

class c_agent extends uvm_component;

`uvm_component_utils(c_agent)

c_driver m_driver;
uvm_sequencer #(c_seq_item) m_sequencer;

function new(string name = "c_agent", uvm_component parent = null);
  super.new(name, parent);
endfunction

function void build_phase(uvm_phase phase);
  m_driver = c_driver::type_id::create("m_driver", this);
  m_sequencer = uvm_sequencer #(c_seq_item)::type_id::create("m_sequencer", this);
endfunction: build_phase

function void connect_phase(uvm_phase phase);
  m_driver.seq_item_port.connect(m_sequencer.seq_item_export);
endfunction: connect_phase

endclass: c_agent

class c_seq extends uvm_sequence #(c_seq_item);

`uvm_object_utils(c_seq)

function new(string name = "c_seq");
  super.new(name);
endfunction

task body;
  c_seq_item item = c_seq_item::type_id::create("item");

  repeat(5) begin
    start_item(item);
    assert(item.randomize());
    finish_item(item);
  end

endtask: body

endclass: c_seq

endpackage: agent_c_pkg
