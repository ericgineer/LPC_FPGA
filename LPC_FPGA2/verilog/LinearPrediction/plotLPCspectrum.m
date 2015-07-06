Fs = 8000; % Hz

w = textread('cross_seg.txt');

coeff = textread('LPC_output.txt');

W = fftshift(fft(w));

sigLen = round(numel(W) / 2);

freq = (0:sigLen)/sigLen * Fs/2;

coeff = coeff / 8192;

C = freqz(1,coeff,sigLen+1);

% normalize

W = W / max(abs(W));
C = C / max(abs(C));

figure
plot(freq,20*log10(abs(W(siglen:end))),freq,20*log10(abs(C)))
grid on
legend('Speech spectrum','LPC spectrum')
xlabel('f (Hz)')
ylabel('|x| dB')
title('LPC FPGA')
