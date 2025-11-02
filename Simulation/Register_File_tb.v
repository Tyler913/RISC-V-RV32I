`timescale 1ns/1ps


module Register_File_tb;
    reg pll_1_200MHz;

    reg write_enable;
    reg [4:0] read_reg1;
    reg [4:0] read_reg2;
    reg [4:0] write_reg;
    reg [31:0] write_data;

    wire [31:0] read_data1;
    wire [31:0] read_data2;

    integer error_count = 0;


    Register_File Register_File_instance (
        .pll_1_200MHz(pll_1_200MHz),

        .write_enable(write_enable),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .write_data(write_data),

        .read_data1(read_data1),
        .read_data2(read_data2)
    );


    always #5 pll_1_200MHz = ~pll_1_200MHz;

    initial begin
        $display("Starting Register File Testbench...");
        
        pll_1_200MHz = 0;
        write_enable = 0;
        read_reg1 = 0;
        read_reg2 = 0;
        write_reg = 0;
        write_data = 32'hX;

        @(posedge pll_1_200MHz);

        $display("Test 1: Write to and Read from Register 5");
        write_enable = 1;
        write_reg = 5'd5;
        write_data = 32'hFFFFFFFF;
        @(posedge pll_1_200MHz);

        write_enable = 0;
        read_reg1 = 5'd5;
        #1;
        if (read_data1 !== 32'hFFFFFFFF) begin
            $error("Test 1 Failed: Expected 0xFFFFFFFF, got 0x%h", read_data1);
            error_count = error_count + 1;
        end
        else begin
            $display("Test 1 passed.");
        end
    end

endmodule
