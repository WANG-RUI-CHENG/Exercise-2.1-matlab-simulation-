clc
clear

%% Measurement data
distance = [5 30 60 110 500];      % meters
PrPt_dB  = [-60 -80 -105 -115 -135]; % dB

%% Constants
d0 = 1;            % reference distance
f  = 900e6;        % frequency (Hz)
c  = 3e8;          % speed of light (m/s)

lambda = c/f;      % wavelength

%% Free space constant K
K = (lambda/(4*pi*d0))^2;

%% Convert variables
x = log10(distance/d0);   % log10(d/d0)
y = PrPt_dB/10;           % convert dB → log10 ratio

%% Linear regression (Least Squares)
X = [x' ones(length(x),1)];

beta = X \ y';

gamma_hat = beta(1);      % path loss exponent
intercept = beta(2);      % log10(K)

%% Compute residuals
residual = y' - (gamma_hat*x' + intercept);

%% Shadowing standard deviation
sigma_phi_dB = std(residual);

%% Display results
fprintf('Estimated path loss exponent γ = %.3f\n',gamma_hat);
fprintf('Estimated shadowing std σ_phi_dB = %.3f dB\n',sigma_phi_dB);