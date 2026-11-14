`timescale 1ns/1ps


module arbitro(
    input logic [3:0] req,
    output logic [3:0] grant,
    output logic available,
    output logic [1:0] grant_num
);

    always_comb begin 
        grant = 0;
        grant_num = 0;
        available = 1;

        priority case(1'b1) 
            req[3] : 
            begin 
                grant = 8;
                grant_num = 3;
                available = 0;
            end

            req[2] : 
            begin 
                grant = 4;
                grant_num = 2;
                available = 0;
            end

            req[1] : 
            begin 
                grant = 2;
                grant_num = 1;
                available = 0;
            end

            req[0] : 
            begin 
                grant = 1;
                grant_num = 0;
                available = 0;
            end

            default: 
            begin 
                grant = 0;
                grant_num = 0;
                available = 1;
            end
        endcase
        
    end

endmodule