%%Results plotting
figure
plot(mu(2:max(size(mu))),trans_sumrate_cu_SP1_avg(2:max(size(mu))),'-bo','LineWidth',1.5)
hold on
grid on
plot(mu(2:max(size(mu))),trans_sumrate_cu_SP2_avg(2:max(size(mu))),'-r*','LineWidth',1.25);
hold on
plot(mu(2:max(size(mu))),trans_sumrate_cu_SP3_avg(2:max(size(mu))),'-ks','LineWidth',1.25)
hold on
plot(mu(2:max(size(mu))),trans_sumrate_cu_SP1_itr_avg(2:max(size(mu))),'--g>','LineWidth',1.25)
hold on
plot(mu(2:max(size(mu))),trans_sumrate_cu_SP2_itr_avg(2:max(size(mu))),'--c<','LineWidth',1.25)
hold on
plot(mu(2:max(size(mu))),trans_sumrate_cu_SP3_itr_avg(2:max(size(mu))),'--mv','LineWidth',1.25)
xlabel('Average Shadowing Loss(dB)')
ylabel('Sumrate(kbits/s)')
title('Average Aggregate Cellular Sumrate')
xlim([3 11])
legend('SP1-BIP','SP2-BIP','SP3-BIP','SP1-Heuristic','SP2-Heuristic','SP3-Heuristic')
 
figure
plot(mu(2:max(size(mu))),trans_sumrate_d2d_SP1_avg(2:max(size(mu))),'-bo','LineWidth',1.25)
hold on
grid on
plot(mu(2:max(size(mu))),trans_sumrate_d2d_SP2_avg(2:max(size(mu))),'-r*','LineWidth',1.25)
hold on
plot(mu(2:max(size(mu))),trans_sumrate_d2d_SP3_avg(2:max(size(mu))),'-ks','LineWidth',1.25)
hold on
plot(mu(2:max(size(mu))),trans_sumrate_d2d_SP1_itr_avg(2:max(size(mu))),'--g>','LineWidth',1.25)
hold on
plot(mu(2:max(size(mu))),trans_sumrate_d2d_SP2_itr_avg(2:max(size(mu))),'--c<','LineWidth',1.25)
hold on
plot(mu(2:max(size(mu))),trans_sumrate_d2d_SP3_itr_avg(2:max(size(mu))),'--mv','LineWidth',1.25)
xlabel('Average Shadowing Loss(dB)')
ylabel('Sumrate(kbits/s)')
title('Average Aggregate D2D Sumrate')
xlim([3 11])
legend('SP1-BIP','SP2-BIP','SP3-BIP','SP1-Heuristic','SP2-Heuristic','SP3-Heuristic')

figure
plot(mu(2:max(size(mu))),trans_sumrate_cu_SP1_avg(2:max(size(mu)))+trans_sumrate_d2d_SP1_avg(2:max(size(mu))),'-bo','LineWidth',1.25)
hold on
grid on
plot(mu(2:max(size(mu))),trans_sumrate_cu_SP2_avg(2:max(size(mu)))+trans_sumrate_d2d_SP2_avg(2:max(size(mu))),'-r*','LineWidth',1.25);
hold on
plot(mu(2:max(size(mu))),trans_sumrate_cu_SP3_avg(2:max(size(mu)))+trans_sumrate_d2d_SP3_avg(2:max(size(mu))),'-ks','LineWidth',1.25)
hold on
plot(mu(2:max(size(mu))),trans_sumrate_cu_SP1_itr_avg(2:max(size(mu)))+trans_sumrate_d2d_SP1_itr_avg(2:max(size(mu))),'--g>','LineWidth',1.25)
hold on
plot(mu(2:max(size(mu))),trans_sumrate_cu_SP2_itr_avg(2:max(size(mu)))+trans_sumrate_d2d_SP2_itr_avg(2:max(size(mu))),'--c<','LineWidth',1.25)
hold on
plot(mu(2:max(size(mu))),trans_sumrate_cu_SP3_itr_avg(2:max(size(mu)))+trans_sumrate_d2d_SP3_itr_avg(2:max(size(mu))),'--mv','LineWidth',1.25)
xlabel('Average Shadowing Loss(dB)')
ylabel('Sumrate(kbits/s)')
title('Average Aggregate Combined Cellular & D2D Sumrate')
xlim([3 11])
legend('Cell+D2D-SP1-BIP','Cell+D2D-SP2-BIP','Cell+D2D-SP3-BIP','Cell+D2D-SP1-Heuristic','Cell+D2D-SP2-Heuristic','Cell+D2D-SP3-Heuristic')

figure
plot(mu(2:max(size(mu))),rb_access_percent_SP1_avg(2:max(size(mu))),'-bo','LineWidth',1.25)
hold on
grid on
plot(mu(2:max(size(mu))),rb_access_percent_SP2_avg(2:max(size(mu))),'-r*','LineWidth',1.25);
hold on
plot(mu(2:max(size(mu))),rb_access_percent_SP3_avg(2:max(size(mu))),'-ks','LineWidth',1.25)
hold on
plot(mu(2:max(size(mu))),rb_access_percent_SP1_itr_avg(2:max(size(mu))),'--g>','LineWidth',1.25)
hold on
plot(mu(2:max(size(mu))),rb_access_percent_SP2_itr_avg(2:max(size(mu))),'--c<','LineWidth',1.25)
hold on
plot(mu(2:max(size(mu))),rb_access_percent_SP3_itr_avg(2:max(size(mu))),'--mv','LineWidth',1.25)
xlabel('Average Shadowing loss(dB)')
ylabel('Resource Block Access Probability')
title('Average Resource Block Access Ratio')
xlim([3 11])
ylim([min(rho_min)-0.05 max(rho_min)+0.05])
legend('SP1-BIP','SP2-BIP','SP3-BIP','SP1-Heuristic','SP2-Heuristic','SP3-Heuristic')

figure
plot(mu(2:max(size(mu))),mean(time_bip_avg)*ones(1,10),'-bo','LineWidth',1.25)
hold on
grid on
plot(mu(2:max(size(mu))),mean(time_itr_avg)*ones(1,10),'-r*','LineWidth',1.25);
xlabel('Average Shadowing Loss(dB)')
xlim([3 11])
%ylim([0.002 0.025])
ylabel('Running time(s)')
title('Average Runtime')
legend('BIP','Heuristic')