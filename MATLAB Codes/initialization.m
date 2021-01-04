%Initialization file. It creates all the matrices and vectors and sets up
%the simulation enviroment.

h_b=60;%eNodeB antenna height
f_c=2000;%operating frequency in MHz
d_o=1000;%reference distance
alpha=5;%pathloss exponent
M=3;%Number of service providers
C=30;%Number of cellular users
D=3;%Number of D2D pairs
L=50;%Number of RBs in 5 MHz bandwidth per SP
B=10*10^6;%Bandwidth in Hz
B_RB=180*10^3;%Bandwidth of 1 RB
% N_o_dB=2;%noise figure in dB
% N_o=10^(-N_o_dB/10);%noise figure
%N_o=3.9810717055*10^-21; %Noise power in Watt/Hz %(in each 180KHz bandwidth)
N_o=10^-13;
P_BS=20;%Total power of eNodeB in Watt
P_BS_peruser=P_BS/(M*C);%eNodeBpower per user
P_u=0.25;%User transmission power in Watt
rho_min=[0.5 0.3 0.2];%Service Level agreement ratios
GBR_cu_rate=40;%minimum guaranteed bit rate requirement for cellular users
GBR_d2d_rate=200;%minimum guaranteed bit rate requirement for D2D pairs

%mu=4;
mu=1:1:11;
sigma=8;
num_iter=50;

trans_sumrate_cu_SP1_avg=zeros(1,max(size(mu)));%Average sumrate of cellular users of SP1 for different average channel gains for bip
trans_sumrate_cu_SP2_avg=zeros(1,max(size(mu)));%Average sumrate of cellular users of SP2 for different average channel gains for bip
trans_sumrate_cu_SP3_avg=zeros(1,max(size(mu)));%Average sumrate of cellular users of SP3 for different average channel gains for bip
trans_sumrate_cu_avg=zeros(1,max(size(mu)));%Average sumrate of all cellular users for different average channel gains for bip

trans_sumrate_cu_SP1_bip=zeros(1,num_iter);%Sumrate of cellular users of SP1 in each iteration for bip
trans_sumrate_cu_SP2_bip=zeros(1,num_iter);%Sumrate of cellular users of SP2 in each iteration for bip
trans_sumrate_cu_SP3_bip=zeros(1,num_iter);%Sumrate of cellular users of SP3 in each iteration for bip
trans_sumrate_cu_bip=zeros(1,num_iter);%Sumrate of all cellular users

trans_sumrate_cu_SP1_itr_avg=zeros(1,max(size(mu)));%Average sumrate of cellular users of SP1 for different average channel gains for heuristic
trans_sumrate_cu_SP2_itr_avg=zeros(1,max(size(mu)));%Average sumrate of cellular users of SP1 for different average channel gains for heuristic
trans_sumrate_cu_SP3_itr_avg=zeros(1,max(size(mu)));%Average sumrate of cellular users of SP1 for different average channel gains for heuristic
trans_sumrate_cu_itr_avg=zeros(1,max(size(mu)));%Average sumrate of cellular users of SP1 for different average channel gains for heuristic

trans_sumrate_cu_SP1_itr=zeros(1,num_iter);%Sumrate of cellular users of SP1 in each iteration for heuristic
trans_sumrate_cu_SP2_itr=zeros(1,num_iter);%Sumrate of cellular users of SP1 in each iteration for heuristic
trans_sumrate_cu_SP3_itr=zeros(1,num_iter);%Sumrate of cellular users of SP1 in each iteration for heuristic
trans_sumrate_cu_itr=zeros(1,num_iter);%Sumrate of all cellular users in each iteration for heuristic

trans_sumrate_d2d_SP1_avg=zeros(1,max(size(mu)));%Average sumrate of D2D pairs of SP1 for different average channel gains
trans_sumrate_d2d_SP2_avg=zeros(1,max(size(mu)));%Average sumrate of D2D pairs of SP2 for different average channel gains
trans_sumrate_d2d_SP3_avg=zeros(1,max(size(mu)));%Average sumrate of D2D pairs of SP3 for different average channel gains
trans_sumrate_d2d_avg=zeros(1,max(size(mu)));%Average sumrate of all D2D pairs for different channel gains

trans_sumrate_d2d_SP1_bip=zeros(1,num_iter);%Sumrate of D2D pairs of SP1 in each iteration
trans_sumrate_d2d_SP2_bip=zeros(1,num_iter);%Sumrate of D2D pairs of SP2 in each iteration
trans_sumrate_d2d_SP3_bip=zeros(1,num_iter);%Sumrate of D2D pairs of SP3 in each iteration
trans_sumrate_d2d_bip=zeros(1,num_iter);%Sumrate of all D2D pairs

trans_sumrate_d2d_SP1_itr_avg=zeros(1,max(size(mu)));%Average sumrate of D2D pairs of SP1 for different average channel gains
trans_sumrate_d2d_SP2_itr_avg=zeros(1,max(size(mu)));%Average sumrate of D2D pairs of SP2 for different average channel gains
trans_sumrate_d2d_SP3_itr_avg=zeros(1,max(size(mu)));%Average sumrate of D2D pairs of SP3 for different average channel gains
trans_sumrate_d2d_itr_avg=zeros(1,max(size(mu)));%Average sumrate of all D2D pairs for different channel gains

trans_sumrate_d2d_SP1_itr=zeros(1,num_iter);%Sumrate of D2D pairs of SP1 in each iteration
trans_sumrate_d2d_SP2_itr=zeros(1,num_iter);%Sumrate of D2D pairs of SP2 in each iteration
trans_sumrate_d2d_SP3_itr=zeros(1,num_iter);%Sumrate of D2D pairs of SP3 in each iteration
trans_sumrate_d2d_itr=zeros(1,num_iter);%Sumrate of all D2D pairs

rb_access_percent_SP1_avg=zeros(1,max(size(mu)));% percentage of RBs assigned to SP1 on average
rb_access_percent_SP2_avg=zeros(1,max(size(mu)));% percentage of RBs assigned to SP2 on average
rb_access_percent_SP3_avg=zeros(1,max(size(mu)));% percentage of RBs assigned to SP2 on average

rb_access_percent_SP1_bip=zeros(1,num_iter);% percentage of RBs assigned to SP1 in each iteration
rb_access_percent_SP2_bip=zeros(1,num_iter);% percentage of RBs assigned to SP2 in each iteration
rb_access_percent_SP3_bip=zeros(1,num_iter);% percentage of RBs assigned to SP2 in each iteration

rb_access_percent_SP1_itr_avg=zeros(1,max(size(mu)));% percentage of RBs assigned to SP1 on average
rb_access_percent_SP2_itr_avg=zeros(1,max(size(mu)));% percentage of RBs assigned to SP2 on average
rb_access_percent_SP3_itr_avg=zeros(1,max(size(mu)));% percentage of RBs assigned to SP2 on average

rb_access_percent_SP1_itr=zeros(1,num_iter);% percentage of RBs assigned to SP1 in each iteration
rb_access_percent_SP2_itr=zeros(1,num_iter);% percentage of RBs assigned to SP2 in each iteration
rb_access_percent_SP3_itr=zeros(1,num_iter);% percentage of RBs assigned to SP2 in each iteration

time_bip=zeros(1,num_iter);
time_itr=zeros(1,num_iter);

time_bip_avg=zeros(1,max(size(mu)));
time_itr_avg=zeros(1,max(size(mu)));