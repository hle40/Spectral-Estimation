function [spec,fvec, S1, S2]=avgspec(x,fs,wintype,Nblock,Nfft, noverlap)
%% INPUT
%% fs       : sampling rate
%% wintype  : Type of window, i.e. Rectangular or Hanning
%% Nblock   : Length of each window
%% Nfft     :  size of FFT
%% noverlap : number of overlapping samplings between two windows
%% OUTPUT:
%% spec     : Power average of X(e(jw)) by averaging segments of length Nblock with noverlap
%% fvec     : frequency axis to plot spec against.

% Window with length Nblock
win = feval(wintype,Nblock);
% Length of input signal
x_len = length(x);

% Samples between the starts of two consecutive blocks, for overlapping purpose 
step = Nblock - noverlap;

% Number of blocks
L = floor((x_len - noverlap)/step);

% Partition signal x into matrix with each column contains the data for
% each block
sc = zeros(Nblock, L);
% pointer for x[n] to partition x[n] to sc 
pointer = 1;
for i = 1:L
    sc(:, i) = x(pointer:(Nblock + pointer-1))';
    sc(:, i) = sc(:,i) .* win;
    pointer = pointer + step;
end

sc_fft = fftshift(fft(sc, Nfft), 1);
sc_fft = abs(sc_fft).^2;
spec = (1/L) * sum(sc_fft, 2);

w=(2*pi/Nfft)*[0:(Nfft-1)]'-pi;
fvec = w * fs /(2*pi);

% Power Spectrum normalizing factor:
S1 = sum(win);
% Power Spectral density normalizing factor:
S2 = sum(win.^2);
end