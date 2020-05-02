//
//------------------------------------------------------------------------------
//   Copyright 2018 Mentor Graphics Corporation
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
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
//   Copyright 2018 Mentor Graphics Corporation
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
//------------------------------------------------------------------------------
//----------------------------------------------------------------------
//   THIS IS AUTOMATICALLY GENERATED CODE
//   Generated by Mentor Graphics' Register Assistant UVM V4.6 (Build 8)
//   UVM Register Kit version 1.1
//----------------------------------------------------------------------
// Project         : register_model
// Unit            : gpio_reg_pkg
// File            : gpio_reg_pkg.sv
//----------------------------------------------------------------------
// Created by      : cgales
// Creation Date   : 2/19/16 3:29 PM
//----------------------------------------------------------------------
// Title           : register_model
//
// Description     : 
//
//----------------------------------------------------------------------

//----------------------------------------------------------------------
// gpio_reg_pkg
//----------------------------------------------------------------------
package gpio_reg_pkg;

   import uvm_pkg::*;

   `include "uvm_macros.svh"

   /* DEFINE REGISTER CLASSES */



   //--------------------------------------------------------------------
   // Class: gpio_in_reg
   // 
   // GPIO Input
   //--------------------------------------------------------------------

   class gpio_in_reg extends uvm_reg;
      `uvm_object_utils(gpio_in_reg)

      uvm_reg_field F;


      // Function: new
      // 
      function new(string name = "gpio_in_reg");
         super.new(name, 32, UVM_NO_COVERAGE);
      endfunction


      // Function: build
      // 
      virtual function void build();
         F = uvm_reg_field::type_id::create("F");
         F.configure(this, 32, 0, "RO", 1, 32'h00000000, 1, 0, 1);
      endfunction
   endclass



   //--------------------------------------------------------------------
   // Class: gpio_ints_reg
   // 
   // GPIO Ints
   //--------------------------------------------------------------------

   class gpio_ints_reg extends uvm_reg;
      `uvm_object_utils(gpio_ints_reg)

      rand uvm_reg_field F;


      // Function: new
      // 
      function new(string name = "gpio_ints_reg");
         super.new(name, 32, UVM_NO_COVERAGE);
      endfunction


      // Function: build
      // 
      virtual function void build();
         F = uvm_reg_field::type_id::create("F");
         F.configure(this, 32, 0, "RW", 1, 32'h00000000, 1, 1, 1);
      endfunction
   endclass



   //--------------------------------------------------------------------
   // Class: gpio_out_reg
   // 
   // GPIO Output
   //--------------------------------------------------------------------

   class gpio_out_reg extends uvm_reg;
      `uvm_object_utils(gpio_out_reg)

      rand uvm_reg_field F;


      // Function: new
      // 
      function new(string name = "gpio_out_reg");
         super.new(name, 32, UVM_NO_COVERAGE);
      endfunction


      // Function: build
      // 
      virtual function void build();
         F = uvm_reg_field::type_id::create("F");
         F.configure(this, 32, 0, "RW", 1, 32'h00000000, 1, 1, 1);
      endfunction
   endclass



   //--------------------------------------------------------------------
   // Class: gpio_inte_reg
   // 
   // GPIO Interrupt
   //--------------------------------------------------------------------

   class gpio_inte_reg extends uvm_reg;
      `uvm_object_utils(gpio_inte_reg)

      rand uvm_reg_field F;


      // Function: new
      // 
      function new(string name = "gpio_inte_reg");
         super.new(name, 32, UVM_NO_COVERAGE);
      endfunction


      // Function: build
      // 
      virtual function void build();
         F = uvm_reg_field::type_id::create("F");
         F.configure(this, 32, 0, "RW", 1, 32'h00000000, 1, 1, 1);
      endfunction
   endclass



   //--------------------------------------------------------------------
   // Class: gpio_oe_reg
   // 
   // GPIO Output Enable
   //--------------------------------------------------------------------

   class gpio_oe_reg extends uvm_reg;
      `uvm_object_utils(gpio_oe_reg)

      rand uvm_reg_field F;


      // Function: new
      // 
      function new(string name = "gpio_oe_reg");
         super.new(name, 32, UVM_NO_COVERAGE);
      endfunction


      // Function: build
      // 
      virtual function void build();
         F = uvm_reg_field::type_id::create("F");
         F.configure(this, 32, 0, "RW", 1, 32'h00000000, 1, 1, 1);
      endfunction
   endclass



   //--------------------------------------------------------------------
   // Class: gpio_nec_reg
   // 
   // GPIO nec
   //--------------------------------------------------------------------

   class gpio_nec_reg extends uvm_reg;
      `uvm_object_utils(gpio_nec_reg)

      rand uvm_reg_field F;


      // Function: new
      // 
      function new(string name = "gpio_nec_reg");
         super.new(name, 32, UVM_NO_COVERAGE);
      endfunction


      // Function: build
      // 
      virtual function void build();
         F = uvm_reg_field::type_id::create("F");
         F.configure(this, 32, 0, "RW", 1, 32'h00000000, 1, 1, 1);
      endfunction
   endclass



   //--------------------------------------------------------------------
   // Class: gpio_eclk_reg
   // 
   // GPIO eclk
   //--------------------------------------------------------------------

   class gpio_eclk_reg extends uvm_reg;
      `uvm_object_utils(gpio_eclk_reg)

      rand uvm_reg_field F;


      // Function: new
      // 
      function new(string name = "gpio_eclk_reg");
         super.new(name, 32, UVM_NO_COVERAGE);
      endfunction


      // Function: build
      // 
      virtual function void build();
         F = uvm_reg_field::type_id::create("F");
         F.configure(this, 32, 0, "RW", 1, 32'h00000000, 1, 1, 1);
      endfunction
   endclass



   //--------------------------------------------------------------------
   // Class: gpio_ctrl_reg
   // 
   // GPIO Control
   //--------------------------------------------------------------------

   class gpio_ctrl_reg extends uvm_reg;
      `uvm_object_utils(gpio_ctrl_reg)

      uvm_reg_field padding; // Reserved
      rand uvm_reg_field INTS; // Interrupt Status
      rand uvm_reg_field INTE; // Interrupt Enable


      // Function: coverage
      // 
      covergroup cg_vals;
         INTS	 : coverpoint INTS.value[0];
         INTE	 : coverpoint INTE.value[0];
      endgroup



      // Function: new
      // 
      function new(string name = "gpio_ctrl_reg");
         super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
         add_coverage(build_coverage(UVM_CVR_FIELD_VALS));
         if(has_coverage(UVM_CVR_FIELD_VALS))
            cg_vals = new();
      endfunction


      // Function: sample_values
      // 
      virtual function void sample_values();
         super.sample_values();
         if (get_coverage(UVM_CVR_FIELD_VALS))
            cg_vals.sample();
      endfunction


      // Function: build
      // 
      virtual function void build();
         padding = uvm_reg_field::type_id::create("padding");
         INTS = uvm_reg_field::type_id::create("INTS");
         INTE = uvm_reg_field::type_id::create("INTE");

         padding.configure(this, 30, 2, "RW", 0, 30'b000000000000000000000000000000, 1, 0, 0);
         INTS.configure(this, 1, 1, "RW", 0, 1'b0, 1, 1, 0);
         INTE.configure(this, 1, 0, "RW", 0, 1'b0, 1, 1, 0);
      endfunction
   endclass



   //--------------------------------------------------------------------
   // Class: gpio_ptrig_reg
   // 
   // GPIO PTRIG
   //--------------------------------------------------------------------

   class gpio_ptrig_reg extends uvm_reg;
      `uvm_object_utils(gpio_ptrig_reg)

      rand uvm_reg_field F;


      // Function: new
      // 
      function new(string name = "gpio_ptrig_reg");
         super.new(name, 32, UVM_NO_COVERAGE);
      endfunction


      // Function: build
      // 
      virtual function void build();
         F = uvm_reg_field::type_id::create("F");
         F.configure(this, 32, 0, "RW", 1, 32'h00000000, 1, 1, 1);
      endfunction
   endclass



   //--------------------------------------------------------------------
   // Class: gpio_aux_reg
   // 
   // GPIO Aux
   //--------------------------------------------------------------------

   class gpio_aux_reg extends uvm_reg;
      `uvm_object_utils(gpio_aux_reg)

      rand uvm_reg_field F;


      // Function: new
      // 
      function new(string name = "gpio_aux_reg");
         super.new(name, 32, UVM_NO_COVERAGE);
      endfunction


      // Function: build
      // 
      virtual function void build();
         F = uvm_reg_field::type_id::create("F");
         F.configure(this, 32, 0, "RW", 1, 32'h00000000, 1, 1, 1);
      endfunction
   endclass




   /* BLOCKS */



   //--------------------------------------------------------------------
   // Class: gpio_reg_block
   // 
   //--------------------------------------------------------------------

   class gpio_reg_block extends uvm_reg_block;
      `uvm_object_utils(gpio_reg_block)

      rand gpio_in_reg gpio_in; // GPIO Input
      rand gpio_out_reg gpio_out; // GPIO Output
      rand gpio_oe_reg gpio_oe; // GPIO Output Enable
      rand gpio_inte_reg gpio_inte; // GPIO Interrupt
      rand gpio_ptrig_reg gpio_ptrig; // GPIO PTRIG
      rand gpio_aux_reg gpio_aux; // GPIO Aux
      rand gpio_ctrl_reg gpio_ctrl; // GPIO Control
      rand gpio_ints_reg gpio_ints; // GPIO Ints
      rand gpio_eclk_reg gpio_eclk; // GPIO eclk
      rand gpio_nec_reg gpio_nec; // GPIO nec

      uvm_reg_map gpio_reg_block_map; 


      // Function: new
      // 
      function new(string name = "gpio_reg_block");
         super.new(name, build_coverage(UVM_CVR_ALL));
      endfunction


      // Function: build
      // 
      virtual function void build();
         gpio_in = gpio_in_reg::type_id::create("gpio_in");
         gpio_in.configure(this);
         gpio_in.build();

         gpio_out = gpio_out_reg::type_id::create("gpio_out");
         gpio_out.configure(this);
         gpio_out.build();

         gpio_oe = gpio_oe_reg::type_id::create("gpio_oe");
         gpio_oe.configure(this);
         gpio_oe.build();

         gpio_inte = gpio_inte_reg::type_id::create("gpio_inte");
         gpio_inte.configure(this);
         gpio_inte.build();

         gpio_ptrig = gpio_ptrig_reg::type_id::create("gpio_ptrig");
         gpio_ptrig.configure(this);
         gpio_ptrig.build();

         gpio_aux = gpio_aux_reg::type_id::create("gpio_aux");
         gpio_aux.configure(this);
         gpio_aux.build();

         gpio_ctrl = gpio_ctrl_reg::type_id::create("gpio_ctrl");
         gpio_ctrl.configure(this);
         gpio_ctrl.build();

         gpio_ints = gpio_ints_reg::type_id::create("gpio_ints");
         gpio_ints.configure(this);
         gpio_ints.build();

         gpio_eclk = gpio_eclk_reg::type_id::create("gpio_eclk");
         gpio_eclk.configure(this);
         gpio_eclk.build();

         gpio_nec = gpio_nec_reg::type_id::create("gpio_nec");
         gpio_nec.configure(this);
         gpio_nec.build();

         gpio_reg_block_map = create_map("gpio_reg_block_map", 'h0, 4, UVM_LITTLE_ENDIAN, 1);
         default_map = gpio_reg_block_map;

         gpio_reg_block_map.add_reg(gpio_in, 'h0, "RO");
         gpio_reg_block_map.add_reg(gpio_out, 'h4, "RW");
         gpio_reg_block_map.add_reg(gpio_oe, 'h8, "RW");
         gpio_reg_block_map.add_reg(gpio_inte, 'hc, "RW");
         gpio_reg_block_map.add_reg(gpio_ptrig, 'h10, "RW");
         gpio_reg_block_map.add_reg(gpio_aux, 'h14, "RW");
         gpio_reg_block_map.add_reg(gpio_ctrl, 'h18, "RW");
         gpio_reg_block_map.add_reg(gpio_ints, 'h1c, "RW");
         gpio_reg_block_map.add_reg(gpio_eclk, 'h20, "RW");
         gpio_reg_block_map.add_reg(gpio_nec, 'h24, "RW");

         lock_model();
      endfunction
   endclass


endpackage
