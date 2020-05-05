function [varargout]=batman(n)

% function [varargout]=batman(n)
% ------------------------------------------------------------------------
% This function computes the batman curve using n points. The output is
% either a single nx2 array or two nx1 arrays (x and y seperately). 
%
% This is a MATLAB implementation of the parameterised Batman equation
% presented by Jerome White (http://www.talljerome.com/ @talljerome,
% https://youtu.be/oaIsCJw0QG8), in particular the form presented here: 
% https://www.desmos.com/calculator/ajnzwedvql
% Modification: The batman is scaled to be 2 in width. 
% 
% 2020/05/05
% ------------------------------------------------------------------------
%%


t=linspace(0,8,1000)';

t1=abs(t-1);
t2=abs(t-2);
t3=abs(t-3);
t4=abs(t-4);
t5=abs(t-5);
t7=abs(t-7);
t8=abs(t-8);

x=(0.3*t)+(0.2*t1)+(2.2*t2)-(2.7*t3)-(3*t5)+(3*t7)...
    +5*sin((pi/4)*(t3-t4+1))+((5/4)*((t4-t5-1)).^3)...
    -(5.3*cos((pi/2+asin(47/53)).*(1/2*(t7-t8-1))))+2.8;
y= 3/2*(t1-t2)+29/4*(t5-t4)+7/16*(t2-t3-1).^4 ...
    +4.5*sin(pi/4*(t3-t4-1))-(3*sqrt(2)/5)*abs(t5-t7).^(5/2)+ ...
    6.4*sin((pi/2+asin(47/53)).*(1/2*(t7-t8+1))+(asin(56/64)))+4.95;

V=[x y;flipud(-x(2:end-1)) flipud(y(2:end-1))]/22;
Vn=evenlySampleCurve(V,n,'pchip',1);

switch nargout
    case 1
        varargout{1}=Vn;
    case 2
        varargout{1}=Vn(:,1);
        varargout{2}=Vn(:,2);
end

