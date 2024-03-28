clear;clc;close all
load swellex_data.mat

%% Plot Power Spectrum with Hanning window
Nfft = 2^14;
Nblock = 4000;
wintype = 'rectwin';
[spec, fvec, S1, S2] = avgspec(x,fs,wintype,Nblock,Nfft,Nblock/2);

figure()
plot(fvec,10*log10(abs(spec)));
title('PSD of SwellData')
xlabel('Frequency (Hz)')
ylabel('10log|X(e^{j\omega})|^2')
grid on
title('PSD of SwellData')

start = 0;
inc = 100;
for i=start:inc:400
    figure()
    plot(fvec,10*log10(abs(spec)));
    formatFig(start,start+inc,10)
    start = start + inc;
end
%subtitle(titleCreate(wintype,Nblock));

function formatFig(start,stop,inc)
    xlabel('Frequency (Hz)')
    ylabel('10log|X(e^{j\omega})|^2')
    grid on
    title(titleCreate(start,stop))
    xticks(start:inc:stop)
    xlim([start,stop])
end
function name = titleCreate(start,stop)
    name = sprintf('Zoomed in frequency between %i Hz and %i Hz',start,stop);
end