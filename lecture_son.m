% Lire le fichier audio WAV
[x, fs] = audioread('BaB-SteMarie-120730_16h33_cut.wav'); %

% Paramètres pour le spectrogramme
t = (0:length(x)-1)/fs; % Axe des temps (en secondes)
window = hann(1024); % Fenêtre d'analyse
noverlap = 512; % Nombre de points de recouvrement
nfft = 1024; % Taille de la transformée de Fourier
freqfft = fs*(0:nfft/2)/nfft; % Axe des fréquences (en Hz)
X = fft(x, nfft); % Calcul de la transformée de Fourier


debut = 16; % Début de la plage de temps en secondes
fin = 20; % Fin de la plage de temps en secondes
samples_debut = round(debut * fs) + 1; % Nombre d'échantillons au début de la plage
samples_fin = round(fin * fs); % Nombre d'échantillons à la fin de la plage
x_small = x(samples_debut:samples_fin); % Extraire les échantillons 
soundsc(x_small, fs); % Jouer le signal extrait

% Calcul du spectrogramme
[S, F, T] = spectrogram(x_small, window, noverlap, nfft, fs);

% Affichage du spectrogramme
figure(1);
plot(freqfft, 20*log10(abs(X(1:nfft/2+1))));
xlabel('Fréquence (Hz)');
ylabel('Amplitude (dB)');

figure(2);
plot(freqfft, (abs(X(1:nfft/2+1))));
xlabel('Fréquence (Hz)');
ylabel('Amplitude (dB)');


figure(3);
imagesc(T, F, 20*log10(abs(S)));
set(gca, 'YDir', 'normal');
xlabel('Temps (s)');
ylabel('Fréquence (Hz)');
map = [1.0 1.0 1.0
    0.95 0.95 0.95
    0.9 0.9 0.9
    0.85 0.85 0.85
    0.8 0.8 0.8
    0.7 0.7 0.7
    0.6 0.6 0.6
    0.5 0.5 0.5
    0.4 0.4 0.4
    0.3 0.3 0.3
    0.2 0.2 0.2
    0.1 0.1 0.1
    0 0 0];

colormap(map);
colorbar;
