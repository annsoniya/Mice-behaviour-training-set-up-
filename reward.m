
function  reward()
%% INITIALISATION
%daqreset
global gen list1;
 delete(list1);
fs = 20000;% sampling rate
s1= daq.createSession('ni');
s1.Rate=fs;
s1.IsContinuous = true;
%s1.DurationInSeconds= 5;
ch_op= addAnalogOutputChannel(s1,'Dev1','ao3','Voltage');
ch_op.Name = 'reward pulse';

reward_pulse_dur = 0.0003;
reward_pulse = zeros(fix(reward_pulse_dur*20*fs),1);% definition of an array with 9 rows
reward_pulse(fix(reward_pulse_dur*fs):fix(reward_pulse_dur*1*fs)+3)=5;
disp(length(reward_pulse))
for i=1:3

    for tms=1:length(reward_pulse)
       s1.outputSingleScan(reward_pulse(tms));
        plot(reward_pulse(tms))
   end 
    pause(1);
  end
stop(s1);
end

