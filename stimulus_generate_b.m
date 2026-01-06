function stimulus = stimulus_generate_b(HW_RZ6)
global gen q;
%nstim = 10 ;% total no of stimulus in each trial
stim_dur = 0.4; % duration of each stimulus 200 ms 
%fs= 195312.5; % sampling rate
fs=HW_RZ6;
att=20;% db 
ramp_dur=0.01; %ramp duration in seconds
si_dur=.2; %ISI duration in seconds
t = 0:1/fs:(stim_dur-1/fs);
si=zeros(fix(si_dur*fs),1);
mxpts = length(t);
% for two difeerent tones to be played
a_fre = 14000;
b_fre =14000;
%tone_a= sqrt(2)*20e-6*10^(stimdb/20)*sin(2*pi*a_fre*t);
tone_a= 10*(10^(-att/20))*sin(2*pi*a_fre*t);
rampSamps = floor(fs*ramp_dur);
tone_a(1:rampSamps)=tone_a(1:rampSamps).*(0:(rampSamps-1))/rampSamps; 
tone_a((mxpts-rampSamps):mxpts)=tone_a((mxpts-rampSamps):mxpts).*(rampSamps:-1:0)/rampSamps;
stimulus= (tone_a);
tone_b= 10*(10^(-att/20))*sin(2*pi*b_fre*t);
rampSamps = floor(fs*ramp_dur);
tone_b(1:rampSamps)=tone_b(1:rampSamps).*(0:(rampSamps-1))/rampSamps; 
tone_b((mxpts-rampSamps):mxpts)=tone_b((mxpts-rampSamps):mxpts).*(rampSamps:-1:0)/rampSamps;
stimulusb= (tone_b);
% figure()
% hold on
stimulus = [stimulus'; si ;stimulusb'];
stimulus=[stimulus stimulus];

%pause(0.2);
% plot((1:length(stimulus))/HW_RZ6,stimulus,'r')
gen.stimcode(1,q)=2;
end
