module twos_compliment (
           input[7 : 0]A,
           output[7 : 0]Y);
           
           wire[7 : 0] carry;
           
           genvar i;
           
           generate
            
              fullAdder lsb(
                  .A(~A[0]),
                  .B(1'b1),
                  .Y(Y[0]),
                  .Cin(1'b0), .Cout(carry[0]));
                  
       
           for(i = 1; i < 8; i = i + 1) begin
               fullAdder add(
                   .A(~A[i]),
                   .B(1'b0),
                   .Y(Y[i]),
                   .Cin(carry[i - 1]),
                   .Cout(carry[i])
             );
           end
           endgenerate
           endmodule
                 
                
                 
                