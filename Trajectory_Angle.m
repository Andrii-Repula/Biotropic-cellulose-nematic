clear all
close all

load Geit_Nematic_Surface_22_Smooth.txt %NAME

Trajectory=0;
Trajectory=Geit_Nematic_Surface_22_Smooth;

%FrameRate=2; %delta time
%PixelSize=0.05737; %how many micron in 1 pixel
%VelocityLinear=(((TRajectory(end,2)-TRajectory(1,2))^2+(TRajectory(end,3)-TRajectory(1,3))^2)^0.5)/(TRajectory(end,1)-TRajectory(1,1));

N=length(Trajectory);
Step=5;

A=0;
B=0;
X=0;
Angle=0;
Cosinus=0;

for i=1:N-2*Step
    A(i,1)=Trajectory(i+Step,1)-Trajectory(i,1);
    A(i,2)=Trajectory(i+Step,2)-Trajectory(i,2);
    
    B(i,1)=Trajectory(i+2*Step,1)-Trajectory(i+Step,1);
    B(i,2)=Trajectory(i+2*Step,2)-Trajectory(i+Step,2);
    
   % Cosinus(i,1)=(A(i,1)*B(i,1)+A(i,2)*B(i,2))/((A(i,1)*A(i,1)+A(i,2)*A(i,2))^0.5*((B(i,1)*B(i,1)+B(i,2)*B(i,2))^0.5));
   Cosinus(i,1)=(A(i,1)*(2^0.5/2)+A(i,2)*(-2^0.5/2))/(((A(i,1)^2+A(i,2)^2)^0.5));  %PROJECTION or COSINUS; HERE WE USE VECTOR n=(1;0) for a scalar product
   X(i,1)=acos(Cosinus(i,1));
    
        if( A(i,2)>B(i,2) )
             Angle(i,1)=X(i,1)*180/pi;
        end
        
        if( A(i,2)<B(i,2) )
            Angle(i,1)= - X(i,1)*180/pi;
        end
        
end

