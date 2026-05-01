module muxes (
    input  logic       a_i, b_i, c_i, d_i,
    input  logic [1:0] sel4_i,
    output logic       y0_o, y1_o
);

    logic xor_out;

    assign xor_out = a_i ^ b_i;

    always_comb begin
        case (sel4_i[0])
            1'b0: y0_o = xor_out;
            1'b1: y0_o = c_i;
        endcase
    end

    always_comb begin
        case (sel4_i)
            2'b00: y1_o = 1'b0;
            2'b01: y1_o = c_i;
            2'b10: y1_o = 1'b0;
            2'b11: y1_o = d_i;
        endcase
    end

endmodule