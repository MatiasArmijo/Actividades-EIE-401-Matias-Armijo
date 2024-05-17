clc;clear
[audioIn, fs] = audioread('audio.wav');

% Crear el objeto reverberator
reverb = reverberator( ...
    'PreDelay', 0.5, ...            % Retardo previo en segundos
    'HighCutFrequency', 6000, ...   % Frecuencia de corte de altos en Hz
    'Diffusion', 0.8, ...           % Difusión
    'DecayFactor', 0.5, ...         % Factor de decaimiento
    'WetDryMix', 0.3);              % Mezcla seco/húmedo

% Aplicar la reverberación
audioOut = reverb(audioIn);

% Reproducir el audio procesado
sound(audioOut, fs);

% Guardar el audio procesado en un nuevo archivo
audiowrite('output_audio_reverb.wav', audioOut, fs);

% Calcular y graficar el espectrograma de la señal original
figure;

subplot(2,1,1);
spectrogram(audioIn(:,1), 256, 250, 256, fs, 'yaxis');
title('Espectrograma de la señal original');
xlabel('Tiempo (s)');
ylabel('Frecuencia (kHz)');
colorbar;

% Calcular y graficar el espectrograma de la señal con reverberación
subplot(2,1,2);
spectrogram(audioOut(:,1), 256, 250, 256, fs, 'yaxis');
title('Espectrograma de la señal con reverberación');
xlabel('Tiempo (s)');
ylabel('Frecuencia (kHz)');
colorbar;