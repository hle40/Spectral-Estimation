function  [sc, t] = sumSine(A, f, P, fs)
    %% Sum of two cosine
    %% Input: 
    % A: vectors containing 2 amplitude
    % f: vectors containing 2 frequency [Hz]
    % Sampling frequency fs
    % P seconds of the sum
    %% Outut:
    % Time axis from 0 to P seconds, with spacing 1/fs
    % The sum of two cosine corresponds to the time axis
    t= 0: 1/fs : P;
    sc = A(1) * cos(2 * pi * f(1) * t) + A(2) * cos (2 * pi * f(2) * t);
end 