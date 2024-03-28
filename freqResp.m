function [X, w] = freqResp(x, N, fs)
%% Compute N-pt DFT and frequency axis to plot against
% Without arugment fs, wk is [-pi,pi)
% With arugment fs, wk is CT frequency f [Hz]

if nargin < 3
    fscale = 1;
else
    fscale = fs/(2*pi);
end

X=fftshift(fft(x,N));
w=(2*pi/N)*[0:(N-1)]';
mid=ceil(N/2)+1;
w(mid:N)=w(mid:N)-2*pi;

w = w*fscale;

end