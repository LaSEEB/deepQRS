clear, clc, close all
addpath(genpath('./functions'))

%% Load
load('data/data.mat','EEG');
ecg = EEG.data(ismember(upper({EEG.chanlocs(:).labels}),{'ECG','EKG'}),:);
W = load('/model/model.mat');

%% Detect
marks = deepQRS(ecg,W,50);

%% Plot
figure
plot(ecg)
hold on
plot(marks,ecg(marks),'*r')