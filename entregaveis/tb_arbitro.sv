`timescale 1ns/1ps

module tb_arbitro();
    logic [3:0] req;
    logic [3:0] grant;
    logic available;
    logic [1:0] grant_num;

    arbitro uu_arbritro(
        .req(req),
        .grant(grant),
        .available(available),
        .grant_num(grant_num)
    );


    initial begin
         $monitor( "Tempo= %0t | req = %b | grant = %b | grant_num = %b | available = %b",
            $time, req, grant, grant_num, available);

        req = 4'b0000;
        #5;

        for(int i = 0; i <= 15; i = i+1) begin
            req = i;
            #5;
        end
        
        $finish;
    end


endmodule