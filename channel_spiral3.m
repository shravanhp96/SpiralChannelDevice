function[width, height, Rftable] = channel_spiral3(p, u, ap, flow) % density, viscosity, particle diameter, flow rate
% Function that returns possible dimensions of a spiral channel used for
% partical separation. 
% Function takes in four inputs: density, viscosity, particle radius, and
% flow rate of the solution. Function has three outputs: possible heights,
% possible widghts, and satisfactory Rf values 

% Varying heights and widths are useful for mass manufacturing
h = [10:1:90]; % possible heights of device (um)
w = [80:1:150]'; % possible widths of device (um)

% ap  = 2*[3:4];
% ap = ap/2; % particle radius in um
% flow = 0.5*(10^12)/60; % flow rate (um^3/s)
% p = 1/(10^12); % density (rho) of water (g/um^3)
% u = 0.01/(10^4); % viscosity of water (g/(um*s))
r_c = 0.5*10^4; % radius of curvature in um

area=w*h; % calculates areas from all possible combinations of heights and widths

% calculates D_h (um), which is the hydraulic mean diameter, with the equation D_h = 2hw/(h+w)
for ii=1:length(h)
    for jj=1:length(w)
        D_h(jj,ii)=2*area(jj,ii)./(h(ii)+w(jj));
    end
end

% calculates lambda values, which is particle radius divided by the D_h values
lambda1 = ap(1)./D_h; % (unitless)
% dimensions will be considered only if their lambda value is greater than or equal to 0.07
% generates matrix of zeroes and non-zero values; the zeroes are the lambda
% values that we can ignore, while the non-zero values are the ones worth
% considering
wanted_lambdas1 = lambda1.*(lambda1 >= 0.07);  

% all non-zero values are D_h values worth considering
wanted_Dh1 = D_h.*(lambda1 >= 0.07); 

% Velocity
Uf1 = (flow)./(area); % (cm/s)  *60cm/min_  1ml/min:1600, 2ml/min:3200 3ml/min:4800
%Uf2 = Uf; 
Um1 = Uf1.*(3/2); % (cm/s) maximum channel velocity 

% Reynold's number (unitless) = (density * max channel velocity * hydraulic mean diameter)/viscosity
Re1 = (p.*Um1.*wanted_Dh1./u);  %*(10^4/60); % Reynolds number. 

% Dean number (unitless) = Reynold's number * sqrt(D_h/(2*radius of curvature))
De1 = Re1.*sqrt(wanted_Dh1./(2*r_c));

% Average Dean velocity (unitless) = (4*10^-4) * (Dean velocity)^1.39
U_sf1 = 4.0E4.*De1.^1.39; 
% secondary flow drag force. from Stokes drag force, calculated from 
% dean 

% Dean drag force (g/cm^2) = 3*pi*density*average Dean velocity*particle radius
F_d1 = 3*pi.*u.*U_sf1.*ap(1);

% Lift coefficient (unitless) = 0.05*hydraulic mean diameter / particle radius
C_sg1 = (0.05*wanted_Dh1./ap(1)); 

% Lift force (g*um/s^2) = lift coefficient*density*(max channel velocity)^2 * (particle radius)^4/(hydraulic mean diameter)^2
F_sg1 = ((C_sg1.*p.*(Um1).^2.*(ap(1)).^4)./(wanted_Dh1).^2);

% ratio (cm^2/s^2) = Lift force/Dean drag force
R_f1 = F_sg1./F_d1;

% we're looking for the R_f values that are greater than 0.08
wanted_Rf1 = ((R_f1 >= 0.08) & (R_f1 <= 0.15)); % logical matrix
R_f1 = double(wanted_Rf1.*R_f1);
[a1,b1] = find((R_f1 ~= 0) & (~isnan(R_f1)));
c1 = find((R_f1 ~= 0) & (~isnan(R_f1)));

% compiling all the dimensions whose corresponding R_f value is greater than 0.08
width1 = w(a1); % width output in cm
height1 = h(b1)'; % height output in cm

% Rftable1 = R_f(a1); % table displaying values of ratio greater than or equal to .08
% Rftable2 = R_f(b1);
for kk = 1:size(a1)
    Rftable_1(kk,1) = R_f1(c1(kk));
end

% calculates lambda values, which is particle radius divided by the D_h values
lambda2 = ap(2)./D_h; % (unitless)
% dimensions will be considered only if their lambda value is greater than or equal to 0.07
wanted_lambdas2 = lambda2.*(lambda2 >= 0.07);  % generates matrix of ones and zeros

wanted_Dh2 = D_h.*(lambda2 >= 0.07); % all non-zero values are D_h values worth considering

% Velocity
Uf2 = (flow)./(area); % (cm/s)  *60cm/min_  1ml/min:1600, 2ml/min:3200 3ml/min:4800
%Uf2 = Uf; 
Um2 = Uf2.*(3/2); % (cm/s) maximum channel velocity 

% Reynold's number (unitless) = (density * max channel velocity * hydraulic mean diameter)/viscosity
Re2 = (p.*Um2.*wanted_Dh2./u);  %*(10^4/60); % Reynolds number. 

% Dean number (unitless) = Reynold's number * sqrt(D_h/(2*radius of curvature))
De2 = Re2.*sqrt(wanted_Dh2./(2*r_c));

% Average Dean velocity (unitless) = (4*10^-4) * (Dean velocity)^1.39
U_sf2 = 4.0E4.*De2.^1.39; 
% secondary flow drag force. from Stokes drag force, calculated from 
% dean 

% Dean drag force (g/cm^2) = 3*pi*density*average Dean velocity*particle radius
F_d2 = 3*pi.*u.*U_sf2.*ap(2);

% Lift coefficient (unitless) = 0.05*hydraulic mean diameter / particle radius
C_sg2 = (0.05*wanted_Dh2./ap(2)); 

% Lift force (g*um/s^2) = lift coefficient*density*(max channel velocity)^2 * (particle radius)^4/(hydraulic mean diameter)^2
F_sg2 = ((C_sg2.*p.*(Um2).^2.*(ap(2)).^4)./(wanted_Dh2).^2);

% ratio (cm^2/s^2) = Lift force/Dean drag force
R_f2 = F_sg2./F_d2;

% we're looking for the R_f values that are greater than 0.08
wanted_Rf2 = ((R_f2 >= 0.08) & (R_f2 <= 0.15)); % logical matrix
R_f2 = double(wanted_Rf2.*R_f2);
[a2,b2] = find((R_f2 ~= 0) & (~isnan(R_f2)));
c2 = find((R_f2 ~= 0) & (~isnan(R_f2)));

% compiling all the dimensions whose corresponding R_f value is greater than 0.08
width2 = w(a2); % width output in cm
height2 = h(b2)'; % height output in cm

% Rftable2 = R_f(a2); % table displaying values of ratio greater than or equal to .08
% Rftable2 = R_f(b2);
for kk = 1:size(a2)
    Rftable_2(kk,1) = R_f2(c2(kk));
end

% generates matrix consisting of overlapping dimensions and their
% corresponding Rf values
overlap = []; % initializes overlap
for tt = 1:length(width1)
    for ss = 1:length(width2)
        % compares both a height and its paired width with another height and its paired width
        if (width1(tt) == width2(ss)) && (height1(tt) == height2(ss))
            % adds the width, height, and the two Rf values generated by
            % the pair to the overlap matrix
            overlap = [overlap; width2(ss),height2(ss), Rftable_1(tt), Rftable_2(ss)];
        end
    end
end

% assigns function outputs to proper columns of the overlap matrix
if isequal(overlap, [])
    width = overlap;
    height = overlap;
    Rftable = overlap;
else
    width = overlap(:,1);
    height = overlap(:,2);
    Rftable = round(overlap(:,3:4),4);
end
