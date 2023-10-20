`timescale 1 ps / 1 ps
module tb_syn_doublecrack();

// Your testbench goes here.
reg clk, rst_n, en;
reg [7:0] ct_rddata;

wire rdy, key_valid;
wire [7:0] ct_addr;
wire [23:0] key;


doublecrack dut(.clk(clk), .rst_n(rst_n), .en(en), .rdy(rdy),
                .key(key), .key_valid(key_valid), .ct_addr(ct_addr), 
		.ct_rddata(ct_rddata));

initial begin
	clk <= 1'b0;
	forever #5 clk <= ~clk;
end

task reset;
 	rst_n = 1'b0;
	#10;
	rst_n = 1'b1;	
endtask
task printvalues;
	$display("rdy: %b, key_valid: %b, key: %h, ct_addr: %h", rdy, key_valid, key, ct_addr);
endtask

initial begin
	rst_n = 1'b0;
	#10;
	rst_n = 1'b1;
	ct_rddata = 8'd2;
	printvalues;

	en = 1'b1;
	#10;
	en = 1'b0;

	#28000;
	printvalues;

	#28000;
	printvalues;


	#28000;
	printvalues;

	#28000;
	printvalues;

	#24000;
	printvalues;
	
	#24000;
	printvalues;

	#24000;
	printvalues;

	#24000;
	printvalues;

	#24000;
	printvalues;

	#24000;
	printvalues;

	dut.kv1 = 1'b1;

	#24000;
	printvalues;


	$stop;

end

endmodule: tb_syn_doublecrack
