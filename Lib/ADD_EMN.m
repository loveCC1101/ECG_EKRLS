function [out_vector] = ADD_EMN( in_vector, SNR_dB,emn )
%**************************************************************
%--------------------------------------------------------------
%			 ADDING ELECTRODE MOVEMENT NOISE
%--------------------------------------------------------------
%**************************************************************
% Part of ECG De-Noising using EKRLS Project
% Function Description - This routine is for adding the Electrode Movement
% noise to the input pure ECG data - in_vector with varible SNR
% Input Parameters - 
% 		-> in_vector = Input Vector (Pure ECG)
%		-> SNR_dB = The SNR of the resultant in Decibels
%		-> emn = The Electrode Movement noise vector
% Output Prameters -
%		-> out_vector = The resultant vector with the added 
%                       Electrode Movement noise
%-----------------------------------------------------------------------
   gain = 200;  %Gain as given in the .info file
    
    L = length(in_vector);
    SNR_lin = 10^(SNR_dB/10);
    
    Es =sum ((abs(in_vector)).^2)/L;
    
    n_var = sqrt(Es/SNR_lin);
    
    n = n_var*emn/gain;
    
    out_vector = in_vector + n;

end