module Data_Memory (
    input wire pll_1_200MHz,

    input wire mem_write,
    input wire mem_read,
    input wire [31:0] address,
    input wire [31:0] write_data,

    output wire [31:0] read_data
);


reg [31:0] data_memory [0:1023];


always @(posedge pll_1_200MHz) begin
    if (mem_write) begin
        data_memory[address[11:2]] <= write_data;
    end
end


assign read_data = mem_read ? data_memory[address[11:2]] : 32'd0;

endmodule
