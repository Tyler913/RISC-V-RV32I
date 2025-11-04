module ALU_Control_Unit (
    input wire [1:0] alu_op,
    input wire [2:0] funct3,
    input wire [6:0] funct7,
    
    output reg [3:0] alu_control 
);

    always @(*) begin
        case (alu_op)

            2'b00: begin
                alu_control = 4'd0;
            end

            2'b01: begin
                case (funct3)
                    3'b000: alu_control = 4'd1;
                    3'b001: alu_control = 4'd1;
                    3'b100: alu_control = 4'd5;
                    3'b101: alu_control = 4'd5;
                    3'b110: alu_control = 4'd6;
                    3'b111: alu_control = 4'd6;
                    default: alu_control = 4'd0;
                endcase
            end

            2'b10: begin
                case (funct3)
                    3'b000: begin
                        if (funct7 == 7'b0100000)
                            alu_control = 4'd1;
                        else
                            alu_control = 4'd0;
                    end
                    3'b001: alu_control = 4'd2;
                    3'b010: alu_control = 4'd5;
                    3'b011: alu_control = 4'd6;
                    3'b100: alu_control = 4'd9;
                    3'b101: begin
                        if (funct7 == 7'b0100000)
                            alu_control = 4'd4;
                        else
                            alu_control = 4'd3;
                    end
                    3'b110: alu_control = 4'd8;
                    3'b111: alu_control = 4'd7;
                    default: alu_control = 4'd0;
                endcase
            end

            2'b11: begin
                case (funct3)
                    3'b000: alu_control = 4'd0;
                    3'b010: alu_control = 4'd5;
                    3'b011: alu_control = 4'd6;
                    3'b100: alu_control = 4'd9;
                    3'b110: alu_control = 4'd8;
                    3'b111: alu_control = 4'd7;
                    3'b001: alu_control = 4'd2;
                    3'b101: begin
                        if (funct7 == 7'b0100000)
                            alu_control = 4'd4;
                        else
                            alu_control = 4'd3;
                    end
                    default: alu_control = 4'd0;
                endcase
            end

            default: alu_control = 4'd0;

        endcase
    end

endmodule
