module ff_reference #(
    parameter WIDTH = 4
) (
    input                    clk,
    input                    rst,
    input  logic [WIDTH-1:0] data_i,
    output logic [WIDTH-1:0] data_o
);

    logic [WIDTH-1:0] data_d, data_q;
    logic [WIDTH-1:0] data2_d, data2_q;
    logic [WIDTH-1:0] data3_d, data3_q;

    always_comb begin
        data_d  = data_i;
        data2_d = data_q;
        data3_d = data2_q;
    end

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            data_q  <= '0;
            data2_q <= '0;
            data3_q <= '0;
        end else begin
            data_q  <= data_d;
            data2_q <= data2_d;
            data3_q <= data3_d;
        end
    end

    assign data_o = data3_q;

endmodule
