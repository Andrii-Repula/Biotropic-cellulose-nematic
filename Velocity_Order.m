clear all
close all

load Geit_Nematic_Surface_22.txt %NAME

TRajectory=0;
TRajectory=Geit_Nematic_Surface_22;

FrameRate=3.22; %delta time
%PixelSize=0.05737; %how many micron in 1 pixel


%VelocityLinear=(((TRajectory(end,2)-TRajectory(1,2))^2+(TRajectory(end,3)-TRajectory(1,3))^2)^0.5)/(TRajectory(end,1)-TRajectory(1,1));

N=length(TRajectory);
Velocity=0;
Positive=0;
Negative=0;
Kos2=0;
KosXin=0;

for i=1:N-1
    Velocity(i,1)=(TRajectory(i+1,1)-TRajectory(i,1))/FrameRate; %X VELOCITY

    Velocity(i,2)=(TRajectory(i+1,2)-TRajectory(i,2))/FrameRate; %Y VELOCITY
    
    Velocity(i,3)=(Velocity(i,1)^2+Velocity(i,2)^2)^0.5; %ABSOLUTE VALUE
        if Velocity(i,3)==0 
            continue
        end
 
    Velocity(i,4)=(Velocity(i,1)*1+Velocity(i,2)*0)/(((Velocity(i,1)^2+Velocity(i,2)^2)^0.5)); %PROJECTION or COSINUS; HERE WE USE VECTOR n=(1;0) for a scalar product
   % Velocity(i,4)=Velocity(i,1)/Velocity(i,3); %PROJECTION or COSINUS;
   % Velocity(i,5)=acos(Velocity(i,4))*57.2958;
   % Theta=Velocity(i,5);
   % Velocity(i,6)=2*((cosd(Theta)^2-0.5)^2+(sind(Theta)*cosd(Theta))^2)^0.5;
    Velocity(i,5)=(1-Velocity(i,4)^2)^0.5; %SINUS
   % Velocity(i,7)=(Velocity(i,1)*1+Velocity(i,2)*0)/((Velocity(i,1)^2+Velocity(i,2)^2)^0.5);
   Velocity(i,6)=Velocity(i,4)^2+Velocity(i,5)^2;
   Velocity(i,7)=Velocity(i,4)^2; %COS^2
   Velocity(i,8)=Velocity(i,4)*Velocity(i,5); %COS*SIN
    Kos2=Kos2+Velocity(i,4)^2;
    KosXin=KosXin+Velocity(i,4)*Velocity(i,5);
end

Kos2Average=Kos2/i;
KosXinAverage=KosXin/i;
Order=2*((Kos2Average-0.5)^2+(KosXinAverage)^2)^0.5;
%Order=Sum/N;
