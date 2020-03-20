clear
clc
Aeq=zeros(70,64);
%% Each cell contains only one value
for n=1:16
    for i=1:4
        Aeq(n,i+(n-1)*4)=1;
    end
end

%% There is no repetition number in each row
for n=1:4
    for i=1:4
       Aeq(16+n,n+(i-1)*4)=1;
       Aeq(20+n,16+n+(i-1)*4)=1;
       Aeq(24+n,32+n+(i-1)*4)=1;
       Aeq(28+n,48+n+(i-1)*4)=1;
    end
end
        
%disp(Aeq);
%% There is no repetition number in each colume 
for n=1:16
    for i=1:4
       Aeq(32+n,n+(i-1)*16)=1;
    end
end
%disp(Aeq);
%% There is no repetition number in each square
%first square
for n=1:4
    Aeq(48+n,n)=1;
    Aeq(48+n,n+4)=1;
    Aeq(48+n,n+16)=1;
    Aeq(48+n,n+20)=1;
end
%second square
for n=1:4
    Aeq(52+n,n+8)=1;
    Aeq(52+n,n+12)=1;
    Aeq(52+n,n+24)=1;
    Aeq(52+n,n+28)=1;
end
%third square
for n=1:4
    Aeq(56+n,n+32)=1;
    Aeq(56+n,n+36)=1;
    Aeq(56+n,n+48)=1;
    Aeq(56+n,n+52)=1;
end
%fourth square
for n=1:4
    Aeq(60+n,n+40)=1;
    Aeq(60+n,n+44)=1;
    Aeq(60+n,n+56)=1;
    Aeq(60+n,n+60)=1;
end

%% input knowns
Aeq(65,3)=1;
Aeq(66,6)=1;
Aeq(67,9)=1;
Aeq(68,56)=1;
Aeq(69,58)=1;
Aeq(70,63)=1;
%disp(Aeq);
%% Define matrix beq
beq=ones(70,1);
%disp(beq);
%% Solve integerlinear programming
N=64;
f=zeros(1,N);
A=zeros(1,N);
b=[0];
intcon=[1:64];
lb=zeros(64,1);
ub=ones(64,1);
x = intlinprog(f,intcon,A,b,Aeq,beq,lb,ub);
disp(x');


    
            
         
        


