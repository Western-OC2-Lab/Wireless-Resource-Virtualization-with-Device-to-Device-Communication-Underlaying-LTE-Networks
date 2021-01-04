function x = specteff_finder(a)

SNR_dB=10*log10(a);

if(SNR_dB<-4.962)    
    x=0.15237;
elseif(SNR_dB>=-4.962 && SNR_dB<=-2.9601)    
    x=0.2344;    
elseif(SNR_dB>=-2.9601 && SNR_dB<=-1.0135)    
    x=0.377;
elseif(SNR_dB>=-1.0135 && SNR_dB<=0.9638)    
    x=0.6016;
elseif(SNR_dB>=0.9638 && SNR_dB<=2.8801)    
    x=0.877;
elseif(SNR_dB>=2.8801 && SNR_dB<=4.9185)    
    x=1.1758;
elseif(SNR_dB>=4.9185 && SNR_dB<=6.7005)    
    x=1.4766;
elseif(SNR_dB>=6.7005 && SNR_dB<=8.7198)    
    x=1.9141;
elseif(SNR_dB>=8.7198 && SNR_dB<=10.515)    
    x=2.4063;
elseif(SNR_dB>=10.515 && SNR_dB<=12.45)    
    x=2.7305;
elseif(SNR_dB>=12.45 && SNR_dB<=14.348)    
    x=3.3223;
elseif(SNR_dB>=14.348 && SNR_dB<=16.074)    
    x=3.9023;
elseif(SNR_dB>=16.074 && SNR_dB<=17.877)    
    x=4.5234;
elseif(SNR_dB>=17.877 && SNR_dB<=19.968)    
    x=5.1152;
elseif(SNR_dB>19.968)
    x=5.5547;
end    
