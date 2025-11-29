module Register_File (
    input wire pll_1_200MHz,

    input wire write_enable,
    input wire [4:0] read_reg1,
    input wire [4:0] read_reg2,
    input wire [4:0] write_reg,
    input wire [31:0] write_data,

    output wire [31:0] read_data1,
    output wire [31:0] read_data2
);

    // Create the 32bit reg space
    reg [31:0] register [31:0];
    integer i = 0;

    assign read_data1 = (read_reg1 == 5'd0) ? 32'd0 : register[read_reg1];
    assign read_data2 = (read_reg2 == 5'd0) ? 32'd0 : register[read_reg2];

    always @(posedge pll_1_200MHz) begin
        if ((write_enable == 1'b1) && (write_reg != 5'd0)) begin
            register[write_reg] <= write_data;
        end
    end

endmodule
