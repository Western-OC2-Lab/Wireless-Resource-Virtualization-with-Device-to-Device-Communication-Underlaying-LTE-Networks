% Determines the BIP solution for the LTE cellular users 
%%%%%%%%%%%%%%%%% BIP SOLUTION for LTE Cellular users%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% rates + RA for cellular users' problem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    tic
    rates_cu_SP1=B_RB*log2(1+(P_BS_peruser.*G_BS_cu_SP1_fixed/N_o));%possible rates for all users of SP1 over all channels
    rates_cu_SP2=B_RB*log2(1+(P_BS_peruser.*G_BS_cu_SP2_fixed/N_o));%possible rates for all users of SP2 over all channels
    rates_cu_SP3=B_RB*log2(1+(P_BS_peruser.*G_BS_cu_SP3_fixed/N_o));%possible rates for all users of SP3 over all channels

    objfunc1=[-rates_cu_SP1 -rates_cu_SP2 -rates_cu_SP3];%objective function of all possible rates for all the RBs of all users

    A_SLA=[-ones(1,M*C*L) zeros(1,M*C*L) zeros(1,M*C*L);
           zeros(1,M*C*L) -ones(1,M*C*L) zeros(1,M*C*L);
           zeros(1,M*C*L) zeros(1,M*C*L) -ones(1,M*C*L)];%SLA constraint matrix
    b_SLA=[-rho_min(1)*M*L;-rho_min(2)*M*L;-rho_min(3)*M*L];%SLA upper bound constraint

    A_RB=[];
    for i=1:M*C
        A_RB=[A_RB eye(M*L)]; 
    end
    A_RB;%Orthogonality constraint matrix
    b_RB=ones(M*L,1);%RB upper constraint

    A_cu_GBR=(-1).*[rates_cu_SP1(1,1:M*L) zeros(1,M*L*(M*C-1));
    zeros(1,M*L) rates_cu_SP1(1,M*L+1:2*M*L) zeros(1,M*L*(M*C-2));
    zeros(1,2*M*L) rates_cu_SP1(1,2*M*L+1:3*M*L) zeros(1,M*L*(M*C-3));
    zeros(1,3*M*L) rates_cu_SP1(1,3*M*L+1:4*M*L) zeros(1,M*L*(M*C-4));
    zeros(1,4*M*L) rates_cu_SP1(1,4*M*L+1:5*M*L) zeros(1,M*L*(M*C-5));
    zeros(1,5*M*L) rates_cu_SP1(1,5*M*L+1:6*M*L) zeros(1,M*L*(M*C-6));
    zeros(1,6*M*L) rates_cu_SP1(1,6*M*L+1:7*M*L) zeros(1,M*L*(M*C-7));
    zeros(1,7*M*L) rates_cu_SP1(1,7*M*L+1:8*M*L) zeros(1,M*L*(M*C-8));
    zeros(1,8*M*L) rates_cu_SP1(1,8*M*L+1:9*M*L) zeros(1,M*L*(M*C-9));
    zeros(1,9*M*L) rates_cu_SP1(1,9*M*L+1:10*M*L) zeros(1,M*L*(M*C-10));
    zeros(1,10*M*L) rates_cu_SP1(1,10*M*L+1:11*M*L) zeros(1,M*L*(M*C-11));
    zeros(1,11*M*L) rates_cu_SP1(1,11*M*L+1:12*M*L) zeros(1,M*L*(M*C-12));
    zeros(1,12*M*L) rates_cu_SP1(1,12*M*L+1:13*M*L) zeros(1,M*L*(M*C-13));
    zeros(1,13*M*L) rates_cu_SP1(1,13*M*L+1:14*M*L) zeros(1,M*L*(M*C-14));
    zeros(1,14*M*L) rates_cu_SP1(1,14*M*L+1:15*M*L) zeros(1,M*L*(M*C-15));
    zeros(1,15*M*L) rates_cu_SP1(1,15*M*L+1:16*M*L) zeros(1,M*L*(M*C-16));
    zeros(1,16*M*L) rates_cu_SP1(1,16*M*L+1:17*M*L) zeros(1,M*L*(M*C-17));
    zeros(1,17*M*L) rates_cu_SP1(1,17*M*L+1:18*M*L) zeros(1,M*L*(M*C-18));
    zeros(1,18*M*L) rates_cu_SP1(1,18*M*L+1:19*M*L) zeros(1,M*L*(M*C-19));
    zeros(1,19*M*L) rates_cu_SP1(1,19*M*L+1:20*M*L) zeros(1,M*L*(M*C-20));
    zeros(1,20*M*L) rates_cu_SP1(1,20*M*L+1:21*M*L) zeros(1,M*L*(M*C-21));
    zeros(1,21*M*L) rates_cu_SP1(1,21*M*L+1:22*M*L) zeros(1,M*L*(M*C-22));
    zeros(1,22*M*L) rates_cu_SP1(1,22*M*L+1:23*M*L) zeros(1,M*L*(M*C-23));
    zeros(1,23*M*L) rates_cu_SP1(1,23*M*L+1:24*M*L) zeros(1,M*L*(M*C-24));
    zeros(1,24*M*L) rates_cu_SP1(1,24*M*L+1:25*M*L) zeros(1,M*L*(M*C-25));
    zeros(1,25*M*L) rates_cu_SP1(1,25*M*L+1:26*M*L) zeros(1,M*L*(M*C-26));
    zeros(1,26*M*L) rates_cu_SP1(1,26*M*L+1:27*M*L) zeros(1,M*L*(M*C-27));
    zeros(1,27*M*L) rates_cu_SP1(1,27*M*L+1:28*M*L) zeros(1,M*L*(M*C-28));
    zeros(1,28*M*L) rates_cu_SP1(1,28*M*L+1:29*M*L) zeros(1,M*L*(M*C-29));
    zeros(1,29*M*L) rates_cu_SP1(1,29*M*L+1:C*M*L) zeros(1,M*L*(M*C-C));
    zeros(1,C*M*L) rates_cu_SP2(1,1:M*L) zeros(1,M*L*(M*C-C-1));
    zeros(1,(C+1)*M*L) rates_cu_SP2(1,M*L+1:2*M*L) zeros(1,M*L*(M*C-C-2));
    zeros(1,(C+2)*M*L) rates_cu_SP2(1,2*M*L+1:3*M*L) zeros(1,M*L*(M*C-C-3));
    zeros(1,(C+3)*M*L) rates_cu_SP2(1,3*M*L+1:4*M*L) zeros(1,M*L*(M*C-C-4));
    zeros(1,(C+4)*M*L) rates_cu_SP2(1,4*M*L+1:5*M*L) zeros(1,M*L*(M*C-C-5));
    zeros(1,(C+5)*M*L) rates_cu_SP2(1,5*M*L+1:6*M*L) zeros(1,M*L*(M*C-C-6));
    zeros(1,(C+6)*M*L) rates_cu_SP2(1,6*M*L+1:7*M*L) zeros(1,M*L*(M*C-C-7));
    zeros(1,(C+7)*M*L) rates_cu_SP2(1,7*M*L+1:8*M*L) zeros(1,M*L*(M*C-C-8));
    zeros(1,(C+8)*M*L) rates_cu_SP2(1,8*M*L+1:9*M*L) zeros(1,M*L*(M*C-C-9));
    zeros(1,(C+9)*M*L) rates_cu_SP2(1,9*M*L+1:10*M*L) zeros(1,M*L*(M*C-C-10));
    zeros(1,(C+10)*M*L) rates_cu_SP2(1,10*M*L+1:11*M*L) zeros(1,M*L*(M*C-C-11));
    zeros(1,(C+11)*M*L) rates_cu_SP2(1,11*M*L+1:12*M*L) zeros(1,M*L*(M*C-C-12));
    zeros(1,(C+12)*M*L) rates_cu_SP2(1,12*M*L+1:13*M*L) zeros(1,M*L*(M*C-C-13));
    zeros(1,(C+13)*M*L) rates_cu_SP2(1,13*M*L+1:14*M*L) zeros(1,M*L*(M*C-C-14));
    zeros(1,(C+14)*M*L) rates_cu_SP2(1,14*M*L+1:15*M*L) zeros(1,M*L*(M*C-C-15));
    zeros(1,(C+15)*M*L) rates_cu_SP2(1,15*M*L+1:16*M*L) zeros(1,M*L*(M*C-C-16));
    zeros(1,(C+16)*M*L) rates_cu_SP2(1,16*M*L+1:17*M*L) zeros(1,M*L*(M*C-C-17));
    zeros(1,(C+17)*M*L) rates_cu_SP2(1,17*M*L+1:18*M*L) zeros(1,M*L*(M*C-C-18));
    zeros(1,(C+18)*M*L) rates_cu_SP2(1,18*M*L+1:19*M*L) zeros(1,M*L*(M*C-C-19));
    zeros(1,(C+19)*M*L) rates_cu_SP2(1,19*M*L+1:20*M*L) zeros(1,M*L*(M*C-C-20));
    zeros(1,(C+20)*M*L) rates_cu_SP2(1,20*M*L+1:21*M*L) zeros(1,M*L*(M*C-C-21));
    zeros(1,(C+21)*M*L) rates_cu_SP2(1,21*M*L+1:22*M*L) zeros(1,M*L*(M*C-C-22));
    zeros(1,(C+22)*M*L) rates_cu_SP2(1,22*M*L+1:23*M*L) zeros(1,M*L*(M*C-C-23));
    zeros(1,(C+23)*M*L) rates_cu_SP2(1,23*M*L+1:24*M*L) zeros(1,M*L*(M*C-C-24));
    zeros(1,(C+24)*M*L) rates_cu_SP2(1,24*M*L+1:25*M*L) zeros(1,M*L*(M*C-C-25));
    zeros(1,(C+25)*M*L) rates_cu_SP2(1,25*M*L+1:26*M*L) zeros(1,M*L*(M*C-C-26));
    zeros(1,(C+26)*M*L) rates_cu_SP2(1,26*M*L+1:27*M*L) zeros(1,M*L*(M*C-C-27));
    zeros(1,(C+27)*M*L) rates_cu_SP2(1,27*M*L+1:28*M*L) zeros(1,M*L*(M*C-C-28));
    zeros(1,(C+28)*M*L) rates_cu_SP2(1,28*M*L+1:29*M*L) zeros(1,M*L*(M*C-C-29));
    zeros(1,(C+29)*M*L) rates_cu_SP2(1,29*M*L+1:C*M*L) zeros(1,M*L*(M*C-C-C));
    zeros(1,2*C*M*L) rates_cu_SP3(1,1:M*L) zeros(1,M*L*(M*C-2*C-1));
    zeros(1,(2*C+1)*M*L) rates_cu_SP3(1,M*L+1:2*M*L) zeros(1,M*L*(M*C-2*C-2));
    zeros(1,(2*C+2)*M*L) rates_cu_SP3(1,2*M*L+1:3*M*L) zeros(1,M*L*(M*C-2*C-3));
    zeros(1,(2*C+3)*M*L) rates_cu_SP3(1,3*M*L+1:4*M*L) zeros(1,M*L*(M*C-2*C-4));
    zeros(1,(2*C+4)*M*L) rates_cu_SP3(1,4*M*L+1:5*M*L) zeros(1,M*L*(M*C-2*C-5));
    zeros(1,(2*C+5)*M*L) rates_cu_SP3(1,5*M*L+1:6*M*L) zeros(1,M*L*(M*C-2*C-6));
    zeros(1,(2*C+6)*M*L) rates_cu_SP3(1,6*M*L+1:7*M*L) zeros(1,M*L*(M*C-2*C-7));
    zeros(1,(2*C+7)*M*L) rates_cu_SP3(1,7*M*L+1:8*M*L) zeros(1,M*L*(M*C-2*C-8));
    zeros(1,(2*C+8)*M*L) rates_cu_SP3(1,8*M*L+1:9*M*L) zeros(1,M*L*(M*C-2*C-9));
    zeros(1,(2*C+9)*M*L) rates_cu_SP3(1,9*M*L+1:10*M*L) zeros(1,M*L*(M*C-2*C-10));
    zeros(1,(2*C+10)*M*L) rates_cu_SP3(1,10*M*L+1:11*M*L) zeros(1,M*L*(M*C-2*C-11));
    zeros(1,(2*C+11)*M*L) rates_cu_SP3(1,11*M*L+1:12*M*L) zeros(1,M*L*(M*C-2*C-12));
    zeros(1,(2*C+12)*M*L) rates_cu_SP3(1,12*M*L+1:13*M*L) zeros(1,M*L*(M*C-2*C-13));
    zeros(1,(2*C+13)*M*L) rates_cu_SP3(1,13*M*L+1:14*M*L) zeros(1,M*L*(M*C-2*C-14));
    zeros(1,(2*C+14)*M*L) rates_cu_SP3(1,14*M*L+1:15*M*L) zeros(1,M*L*(M*C-2*C-15));
    zeros(1,(2*C+15)*M*L) rates_cu_SP3(1,15*M*L+1:16*M*L) zeros(1,M*L*(M*C-2*C-16));
    zeros(1,(2*C+16)*M*L) rates_cu_SP3(1,16*M*L+1:17*M*L) zeros(1,M*L*(M*C-2*C-17));
    zeros(1,(2*C+17)*M*L) rates_cu_SP3(1,17*M*L+1:18*M*L) zeros(1,M*L*(M*C-2*C-18));
    zeros(1,(2*C+18)*M*L) rates_cu_SP3(1,18*M*L+1:19*M*L) zeros(1,M*L*(M*C-2*C-19));
    zeros(1,(2*C+19)*M*L) rates_cu_SP3(1,19*M*L+1:20*M*L) zeros(1,M*L*(M*C-2*C-20));
    zeros(1,(2*C+20)*M*L) rates_cu_SP3(1,20*M*L+1:21*M*L) zeros(1,M*L*(M*C-2*C-21));
    zeros(1,(2*C+21)*M*L) rates_cu_SP3(1,21*M*L+1:22*M*L) zeros(1,M*L*(M*C-2*C-22));
    zeros(1,(2*C+22)*M*L) rates_cu_SP3(1,22*M*L+1:23*M*L) zeros(1,M*L*(M*C-2*C-23));
    zeros(1,(2*C+23)*M*L) rates_cu_SP3(1,23*M*L+1:24*M*L) zeros(1,M*L*(M*C-2*C-24));
    zeros(1,(2*C+24)*M*L) rates_cu_SP3(1,24*M*L+1:25*M*L) zeros(1,M*L*(M*C-2*C-25));
    zeros(1,(2*C+25)*M*L) rates_cu_SP3(1,25*M*L+1:26*M*L) zeros(1,M*L*(M*C-2*C-26));
    zeros(1,(2*C+26)*M*L) rates_cu_SP3(1,26*M*L+1:27*M*L) zeros(1,M*L*(M*C-2*C-27));
    zeros(1,(2*C+27)*M*L) rates_cu_SP3(1,27*M*L+1:28*M*L) zeros(1,M*L*(M*C-2*C-28));
    zeros(1,(2*C+28)*M*L) rates_cu_SP3(1,28*M*L+1:29*M*L) zeros(1,M*L*(M*C-2*C-29));
    zeros(1,(2*C+29)*M*L) rates_cu_SP3(1,29*M*L+1:C*M*L)];%minimum GBR rate constraint matrix

    b_cu_GBR=-GBR_cu_rate*ones(M*C,1);%minimum GBR rate for cellular users upper bound

    A_cu_ineq=[A_RB;A_cu_GBR;A_SLA];%Inequality constraint matrix for CU problem
    b_cu_ineq=[b_RB;b_cu_GBR;b_SLA];%Inequality constraint upper bound for CU problem

% intcon=1:1:M*C*L;
% lb = zeros(M*C*L,1);
% ub = ones(M*C*L,1);
    [x_cu_sol,cu_value,cu_exitflag] = bip1(objfunc1,A_cu_ineq,b_cu_ineq);%solves the cellular users' binary integer programming problem

    x_cu_opt=reshape(x_cu_sol,M*L,M*C)';%reshapes the optimal solution
    x_cu_opt_SP1=x_cu_opt(1:C,:);%optimal RA for SP1 cellular users
    x_cu_opt_SP2=x_cu_opt(C+1:2*C,:);%optimal RA for SP2 cellular users
    x_cu_opt_SP3=x_cu_opt(2*C+1:3*C,:);%optimal RA for SP3 cellular users

    n_c_SP1=sum(x_cu_opt_SP1');%number of RBs assigned to each cellular user of SP1
    n_c_SP2=sum(x_cu_opt_SP2');%number of RBs assigned to each cellular user of SP2
    n_c_SP3=sum(x_cu_opt_SP3');%number of RBs assigned to each cellular user of SP3

    n_c_SP1_rep=reshape(n_c_SP1'*ones(1,D),1,C*D);%number of RBs assigned to each cellular user of SP1 repeated & reshaped
    n_c_SP2_rep=reshape(n_c_SP2'*ones(1,D),1,C*D);%number of RBs assigned to each cellular user of SP2 repeated & reshaped
    n_c_SP3_rep=reshape(n_c_SP3'*ones(1,D),1,C*D);%number of RBs assigned to each cellular user of SP3 repeated & reshaped

    active_chann_SP1=(x_cu_opt_SP1.*G_BS_cu_SP1');%Channels used by SP1
    active_chann_SP2=(x_cu_opt_SP2.*G_BS_cu_SP2');%Channels used by SP2
    active_chann_SP3=(x_cu_opt_SP3.*G_BS_cu_SP3');%Channels used by SP3

    active_chann_SNR_SP1=P_BS_peruser.*(x_cu_opt_SP1.*G_BS_cu_SP1')./N_o;%SNR of channels used by SP1
    active_chann_SNR_SP2=P_BS_peruser.*(x_cu_opt_SP2.*G_BS_cu_SP2')./N_o;%SNR of channels used by SP2
    active_chann_SNR_SP3=P_BS_peruser.*(x_cu_opt_SP3.*G_BS_cu_SP3')./N_o;%SNR of channels used by SP3

    min_active_chann_SP1=zeros(C,1);%Minimum channel of each cellular user in SP1
    min_active_chann_SP2=zeros(C,1);%Minimum channel of each cellular user in SP2
    min_active_chann_SP3=zeros(C,1);%Minimum channel of each cellular user in SP3

    min_active_chann_SNR_SP1=zeros(C,1);%Minimum channel's SNR of each cellular user in SP1
    min_active_chann_SNR_SP2=zeros(C,1);%Minimum channel's SNR of each cellular user in SP2
    min_active_chann_SNR_SP3=zeros(C,1);%Minimum channel's SNR of each cellular user in SP3

    for i=1:C
        a1=find(active_chann_SP1(i,:)~=0);%finds the channels assigned to cellular user i of SP1
        a2=find(active_chann_SP2(i,:)~=0);%finds the channels assigned to cellular user i of SP2
        a3=find(active_chann_SP3(i,:)~=0);%finds the channels assigned to cellular user i of SP3
    
        a11=find(active_chann_SNR_SP1(i,:)~=0);%finds the channels' SNR assigned to cellular user i of SP1
        a22=find(active_chann_SNR_SP2(i,:)~=0);%finds the channels' SNR assigned to cellular user i of SP2
        a33=find(active_chann_SNR_SP3(i,:)~=0);%finds the channels' SNR assigned to cellular user i of SP3
    
     if(isempty(a1))
        min_active_chann_SP1(i)=0;
     else
        min_active_chann_SP1(i)=active_chann_SP1(i,min(find(active_chann_SP1(i,:)~=0)));
     end
    
     if(isempty(a2))
        min_active_chann_SP2(i)=0;
     else
        min_active_chann_SP2(i)=active_chann_SP2(i,min(find(active_chann_SP2(i,:)~=0)));
     end
    
     if(isempty(a3))
        min_active_chann_SP3(i)=0;
     else
        min_active_chann_SP3(i)=active_chann_SP3(i,min(find(active_chann_SP3(i,:)~=0)));
     end
    
     if(isempty(a11))
        min_active_chann_SNR_SP1(i)=0;
     else
        min_active_chann_SNR_SP1(i)=active_chann_SNR_SP1(i,min(find(active_chann_SNR_SP1(i,:)~=0)));
     end
    
     if(isempty(a22))
        min_active_chann_SNR_SP2(i)=0;
     else
        min_active_chann_SNR_SP2(i)=active_chann_SNR_SP2(i,min(find(active_chann_SNR_SP2(i,:)~=0)));
     end
    
     if(isempty(a33))
        min_active_chann_SNR_SP3(i)=0;
     else
        min_active_chann_SNR_SP3(i)=active_chann_SNR_SP3(i,min(find(active_chann_SNR_SP3(i,:)~=0)));
     end
    end

    trans_rate_cu_SP1=zeros(C,1);%Final transmission rate of each cellular user in SP1
    trans_rate_cu_SP2=zeros(C,1);%Final transmission rate of each cellular user in SP2
    trans_rate_cu_SP3=zeros(C,1);%Final transmission rate of each cellular user in SP3

    for j=1:C
        trans_rate_cu_SP1(j)=floor(132*specteff_finder(min_active_chann_SNR_SP1(j))*sum(x_cu_opt_SP1(j,:)));
        trans_rate_cu_SP2(j)=floor(132*specteff_finder(min_active_chann_SNR_SP2(j))*sum(x_cu_opt_SP2(j,:)));
        trans_rate_cu_SP3(j)=floor(132*specteff_finder(min_active_chann_SNR_SP3(j))*sum(x_cu_opt_SP3(j,:)));
    end
