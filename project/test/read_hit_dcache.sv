//=====================================================================
// Project: 4 core MESI cache design
// File Name: read_hit_dcache.sv
// Description: Test for read-hit to I-cache
// Designers: Venky & Suru
//=====================================================================

class read_hit_dcache extends base_test;

    //component macro
    `uvm_component_utils(read_hit_dcache)

    //Constructor
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    //UVM build phase
    function void build_phase(uvm_phase phase);
        uvm_config_wrapper::set(this, "tb.vsequencer.run_phase", "default_sequence", read_hit_dcache_seq::type_id::get());
        super.build_phase(phase);
    endfunction : build_phase

    //UVM run phase()
    task run_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "Executing read_hit_dcache test" , UVM_LOW)
    endtask: run_phase

endclass : read_hit_dcache

// Sequence for a read-hit on D-cache
class read_hit_dcache_seq extends base_vseq;
    //object macro
    `uvm_object_utils(read_hit_dcache_seq)

    cpu_transaction_c trans;

    //constructor
    function new (string name="read_hit_dcache_seq");
        super.new(name);
    endfunction : new

    virtual task body();
        `uvm_do_on_with(trans, p_sequencer.cpu_seqr[0], {request_type == READ_REQ; access_cache_type == DCACHE_ACC; address == 32'h41004100;})
	`uvm_do_on_with(trans, p_sequencer.cpu_seqr[1], {request_type == READ_REQ; access_cache_type == DCACHE_ACC; address == 32'h71004100;})
	`uvm_do_on_with(trans, p_sequencer.cpu_seqr[2], {request_type == READ_REQ; access_cache_type == DCACHE_ACC; address == 32'ha1004100;})
	`uvm_do_on_with(trans, p_sequencer.cpu_seqr[3], {request_type == READ_REQ; access_cache_type == DCACHE_ACC; address == 32'he1004100;})
	`uvm_do_on_with(trans, p_sequencer.cpu_seqr[0], {request_type == READ_REQ; access_cache_type == DCACHE_ACC; address == 32'hba004100;})
	`uvm_do_on_with(trans, p_sequencer.cpu_seqr[1], {request_type == READ_REQ; access_cache_type == DCACHE_ACC; address == 32'hab004100;})
        `uvm_do_on_with(trans, p_sequencer.cpu_seqr[2], {request_type == READ_REQ; access_cache_type == DCACHE_ACC; address == 32'hba004100;})
	`uvm_do_on_with(trans, p_sequencer.cpu_seqr[3], {request_type == READ_REQ; access_cache_type == DCACHE_ACC; address == 32'hab004100;})
	`uvm_do_on_with(trans, p_sequencer.cpu_seqr[0], {request_type == READ_REQ; access_cache_type == DCACHE_ACC; address == 32'h41004100;})
	`uvm_do_on_with(trans, p_sequencer.cpu_seqr[1], {request_type == READ_REQ; access_cache_type == DCACHE_ACC; address == 32'h71004100;})
	`uvm_do_on_with(trans, p_sequencer.cpu_seqr[2], {request_type == READ_REQ; access_cache_type == DCACHE_ACC; address == 32'ha1004100;})
	`uvm_do_on_with(trans, p_sequencer.cpu_seqr[3], {request_type == READ_REQ; access_cache_type == DCACHE_ACC; address == 32'he1004100;})

    endtask

endclass : read_hit_dcache_seq
