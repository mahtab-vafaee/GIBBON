function [k,c,b]=waitForValidButtonPress

% function [k]=waitForValidButtonPress
% ------------------------------------------------------------------------
% This function is based on the sub-function WFBP found in the |ginput|
% function. It is equivalent to the |waitforbuttonpress| function with the
% exection that that ^C is reserved to end the function as usual. 
%
%
% Kevin Mattheus Moerman
% kevinmoerman@hotmail.com
% 03/10/2014
%------------------------------------------------------------------------

% Disabling ^C for edit menu so the only ^C is for interrupting the function.
fig = gcf;
waserr=0;
try    
    
    h=findall(fig,'type','uimenu','accel','C');
    set(h,'accel','');
    keyDown = waitforbuttonpress;
    current_char = double(get(fig,'CurrentCharacter')); % Capturing the character.
    if~isempty(current_char) && (keyDown == 1)           % If the character was generated by the
        if(current_char == 3)                       % current keypress AND is ^C, set 'waserr'to 1
            waserr = 1;                             % so that it errors out.
        end
    end   
catch
    waserr = 1;
end
set(h,'accel','C');                                 % Set back the accelerator for edit menu.
drawnow;

if(waserr == 1)
    error('MATLAB:waitForValidButtonPress:Interrupted', 'Interrupted');
end

k = keyDown;
c = get(fig,'CurrentCharacter');
b = abs(get(fig,'CurrentCharacter'));
end
 
%% 
% _*GIBBON footer text*_ 
% 
% License: <https://github.com/gibbonCode/GIBBON/blob/master/LICENSE>
% 
% GIBBON: The Geometry and Image-based Bioengineering add-On. A toolbox for
% image segmentation, image-based modeling, meshing, and finite element
% analysis.
% 
% Copyright (C) 2006-2023 Kevin Mattheus Moerman and the GIBBON contributors
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
