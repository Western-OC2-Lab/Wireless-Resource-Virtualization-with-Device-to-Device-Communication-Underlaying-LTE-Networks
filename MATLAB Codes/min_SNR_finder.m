function x = min_SNR_finder(a)

SNR_dB=10*log10(a);

if(SNR_dB<-4.962)    
    x=10^(-6.7536/10);
elseif(SNR_dB>=-4.962 && SNR_dB<=-2.9601)    
    x=10^(-4.962/10);    
elseif(SNR_dB>=-2.9601 && SNR_dB<=-1.0135)    
    x=10^(-2.9601);
elseif(SNR_dB>=-1.0135 && SNR_dB<=0.9638)    
    x=10^(-1.0135/10);
elseif(SNR_dB>=0.9638 && SNR_dB<=2.8801)    
    x=10^(0.9638/10);
elseif(SNR_dB>=2.8801 && SNR_dB<=4.9185)    
    x=10^(2.8801/10);
elseif(SNR_dB>=4.9185 && SNR_dB<=6.7005)    
    x=10^(4.9185/10);
elseif(SNR_dB>=6.7005 && SNR_dB<=8.7198)    
    x=10^(6.7005/10);
elseif(SNR_dB>=8.7198 && SNR_dB<=10.515)    
    x=10^(8.7198/10);
elseif(SNR_dB>=10.515 && SNR_dB<=12.45)    
    x=10^(10.515/10);
elseif(SNR_dB>=12.45 && SNR_dB<=14.348)    
    x=10^(12.45/10);
elseif(SNR_dB>=14.348 && SNR_dB<=16.074)    
    x=10^(14.348/10);
elseif(SNR_dB>=16.074 && SNR_dB<=17.877)    
    x=10^(16.074/10);
elseif(SNR_dB>=17.877 && SNR_dB<=19.968)    
    x=10^(17.877/10);
elseif(SNR_dB>19.968)
    x=10^(19.968/10);
end