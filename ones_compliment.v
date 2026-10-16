module ones_compliment(
         input [3 : 0]A,
         input [3 : 0]B,
         output [3 : 0]Y);
         
         wire[3 : 0] sum;
         wire[3 : 0] carry;
         wire[3 : 0] carry2;
       
         
         genvar i;
         
         generate
         
         fullAdder add0(
             .A(~A[i]), .B(1'b0), .Cin(carry[i - 1]), 
             .Y(Y[i]), .Cout(carry[i])
           );
           
            fullAdder end0(
             .A(sum[0]), .B(1'b0), .Cin(carry[0]), 
             .Y(Y[1]), .Cout(carry[1])
         );
    
         
         
         for(i = 1; i < 4; i = i + 1) begin
                   fullAdder add1 (
                     .A(A[i]), .B(B[i]), .Cin(1'b0), 
                     .Y(Y[i]), .Cout(carry[i])
              );
              
              end 
  
              for(i = 1; i < 4; i = i + 1) begin
                     fullAdder end1 (
                       .A(sum[i]), .B(1'b0), .Cin(carry[i-1]), 
                       .Y(Y[i]), .Cout(carry[i])
                     );
                      
           end
           endgenerate
           endmodule
  
 
                     
                 
                