function beha_nostim_iti(flag2)
global timeout gen q ;
if (flag2==1)
%    gen.fa_inr_trial_int(1,q) = 1;
%     gen.resp(1,q)=6;% for lick during intertrial intervals 
%     disp('****for lick during intertrial intervals   ******');
%     beha_noise();
%     pause(timeout);

pause(0.2);
         disp('****play the stimulus******');
         %beha_noise();
         % pause(timeout;
         % gen.trial_abort(1,q)=1;
         beha_TDTtrigger
         beha_rwdchk();
         fprintf('\ntrial count = %d\n',q);
         %pause(1);
         q=q+1;
end