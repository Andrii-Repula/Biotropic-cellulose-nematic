clear all
close all

load TOCN_1.txt %NAME
%------------------------------------
PCC=0;
PCC=TOCN_1;   %NAME
FrameRate=20; %delta time
PixelSize=0.2825; %how many micron in 1 pixel
%------------------------------------
x0=PCC(1,1); y0=PCC(1,2);
T=0;
X=0;
Y=0;
event=0;
Stat=0;
MSDx=0;
MSDy=0;
MSDtotal=0;
MSD=0;

N=length(PCC);
%N=6;

for i=1:N
    PCC(i,1)=(PCC(i,1)-x0)*PixelSize;
    PCC(i,2)=(y0-PCC(i,2))*PixelSize;
    PCC(i,3)=FrameRate*i;
end


for i=1:N-1
    X=0;
    Y=0;
    Total=0;
    event=0;
    for j=i+1:N
        X=X+(PCC(j,1)-PCC(j-i,1))^2;
        Y=Y+(PCC(j,2)-PCC(j-i,2))^2;
        Total=X+Y;
        event=event+1;
    end
    T(i)=PCC(i,3);
    MSDx(i) = X/(N-i);
    MSDy(i) = Y/(N-i);
    MSDtotal(i)=Total/(N-i);
    Stat(i)=event;
end

MSD(1:N-1,1)=T(1:end);
MSD(1:N-1,2)=MSDx(1:end);
MSD(1:N-1,3)=MSDy(1:end);
MSD(1:N-1,4)=MSDtotal(1:end);
MSD(1:N-1,5)=Stat(1:end);
MSD(1:N,6)=PCC(1:N,3);
MSD(1:N,7)=PCC(1:N,1);
MSD(1:N,8)=PCC(1:N,2);
%MSD
hold on 
%plot(T,Stat)
plot(T,MSDx)
plot(T,MSDy)
plot(T,MSDtotal)