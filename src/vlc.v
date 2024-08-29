module vlc(input Turn_Left,Turn_Right,Emergency,clk,rst,output reg
[2:0]Left_Lamp,Right_Lamp);
wire newclock,newclock2,out_newclock;
clockdivider clock(.clk100(clk),.newclk(newclock));
clockdivider2 clock2(.clk1002(clk),.newclk2(newclock2));
parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5;
reg [3:0]ps,ns ;
always @(posedge out_newclock or posedge rst)
begin
if(rst)
ps<=s0;
else
ps<=ns;
end
assign out_newclock = (Emergency ==1)? newclock2 :newclock;
always @(ps,Turn_Left,Turn_Right,Emergency)
begin
if(Emergency)
case(ps)
s0:begin{Left_Lamp,Right_Lamp}='b0;ns=s1;end
s1:begin{Left_Lamp,Right_Lamp}=6'b100001;ns=s2;end
s2:begin{Left_Lamp,Right_Lamp}=6'b110011;ns=s3;end
s3:begin{Left_Lamp,Right_Lamp}=6'b111111;ns=s4;end
s4:begin{Left_Lamp,Right_Lamp}=6'b110011;ns=s5;end
s5:begin{Left_Lamp,Right_Lamp}=6'b100001;ns=s0;end
default:begin{Left_Lamp,Right_Lamp}=0;ns=s0;end
endcase
else if(Turn_Left)
case(ps)
s0:begin{Left_Lamp,Right_Lamp}=0;ns=s1;end
s1:begin{Left_Lamp,Right_Lamp}=6'b100000;ns=s2;end
s2:begin{Left_Lamp,Right_Lamp}=6'b110000;ns=s3;end
s3:begin{Left_Lamp,Right_Lamp}=6'b111000;ns=s0;end
default:begin{Left_Lamp,Right_Lamp}=0;ns=0;end
endcase
else if(Turn_Right == 1&& Turn_Left==0)
case(ps)
s0:begin{Left_Lamp,Right_Lamp}=0;ns=s1;end
s1:begin{Left_Lamp,Right_Lamp}=6'b000001;ns=s2;end
s2:begin{Left_Lamp,Right_Lamp}=6'b000011;ns=s3;end
s3:begin{Left_Lamp,Right_Lamp}=6'b000111;ns=s0;end
default:begin{Left_Lamp,Right_Lamp}=0;ns=s0;end
endcase
else
begin{Left_Lamp,Right_Lamp}=0;ns=s0;end
end
endmodule
module clockdivider(input clk100,output reg newclk);

reg[25:0] cnt;
//reg newclk;
initial begin
cnt=0;newclk=0;
end
always @ (posedge clk100)
begin
cnt= cnt+1;
if (cnt == 49999999)
begin
newclk =~newclk;
cnt=0;
end
end
endmodule
module clockdivider2(input clk1002,output reg newclk2);
reg[25:0] cnt2;
//reg newclk;
initial begin
cnt2=0;
newclk2=0;
end
always @ (posedge clk1002)
begin
cnt2= cnt2+1;
if (cnt2 == 249999999)
begin
newclk2=~newclk2;
cnt2=0;
end
end
endmodule
