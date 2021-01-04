% Determines the BIP solution for the D2D users 
%%%%%%%%%%%%%%%%% BIP SOLUTION for D2D users%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% rates + RA for D2D pairs' problem %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    rates_d2d_SP1=B_RB.*n_c_SP1_rep.*log2(1+(P_u.*G_d2d_SP1_fixed./(N_o+P_BS.*G_BS_d2d_SP1_fixed)));%possible rates for all D2D pairs of SP1 
    rates_d2d_SP2=B_RB.*n_c_SP2_rep.*log2(1+(P_u.*G_d2d_SP2_fixed./(N_o+P_BS.*G_BS_d2d_SP2_fixed)));%possible rates for all D2D pairs of SP2
    rates_d2d_SP3=B_RB.*n_c_SP3_rep.*log2(1+(P_u.*G_d2d_SP3_fixed./(N_o+P_BS.*G_BS_d2d_SP3_fixed)));%possible rates for all D2D pairs of SP3

    objfunc2=[-rates_d2d_SP1 -rates_d2d_SP2 -rates_d2d_SP3];%objective function of the D2D RA allocation problem

    SNR_cu_th_SP1=zeros(C,1);%SNR threshold of each cellular user in SP1
    SNR_cu_th_SP2=zeros(C,1);%SNR threshold of each cellular user in SP2
    SNR_cu_th_SP3=zeros(C,1);%SNR threshold of each cellular user in SP3

    for j=1:C
     SNR_cu_th_SP1(j)=min_SNR_finder(min_active_chann_SNR_SP1(j));
     SNR_cu_th_SP2(j)=min_SNR_finder(min_active_chann_SNR_SP2(j));
     SNR_cu_th_SP3(j)=min_SNR_finder(min_active_chann_SNR_SP3(j));
    end
    SNR_cu_th=[SNR_cu_th_SP1;SNR_cu_th_SP2;SNR_cu_th_SP3];%SNR thresholds for all cellular users

    for f=1:M*C
        G_cu_d2d_rep(f,:)=G_cu_d2d;
    end

    %SNR_cu_th=10^(-9.478/10);
    m11=diag(G_cu_d2d_SP1(:,1));
    m12=diag(G_cu_d2d_SP1(:,2));
    m13=diag(G_cu_d2d_SP1(:,3));
    m21=diag(G_cu_d2d_SP2(:,1));
    m22=diag(G_cu_d2d_SP2(:,2));
    m23=diag(G_cu_d2d_SP2(:,3));
    m31=diag(G_cu_d2d_SP3(:,1));
    m32=diag(G_cu_d2d_SP3(:,2));
    m33=diag(G_cu_d2d_SP3(:,3));
    A_cu_SNR=P_u.*[m11 m12 m13 zeros(C,(M*C)) zeros(C,M*C);
                  zeros(C,M*C) m21 m22 m23 zeros(C,M*C);
                  zeros(C,M*C) zeros(C,M*C) m31 m32 m33];%cellular users SNR threshold constraint matrix
    b_cu_SNR=(P_BS./SNR_cu_th).*[min_active_chann_SP1;min_active_chann_SP2;min_active_chann_SP3]-N_o*ones(M*C,1);%cellular users SNR threshold constraint

    SNR_d2d_th=10^(-4.962/10);%D2D SNR threshold
    A_d2d_SNR=[(SNR_d2d_th*P_BS*G_BS_d2d_SP1(1)-P_u*G_d2d_SP1(1))*ones(1,C) zeros(1,C*(M*D-1));
           zeros(1,C) (SNR_d2d_th*P_BS*G_BS_d2d_SP1(2)-P_u*G_d2d_SP1(2))*ones(1,C) zeros(1,C*(M*D-2));
           zeros(1,2*C) (SNR_d2d_th*P_BS*G_BS_d2d_SP1(3)-P_u*G_d2d_SP1(3))*ones(1,C) zeros(1,C*(M*D-D));
           zeros(1,D*C) (SNR_d2d_th*P_BS*G_BS_d2d_SP2(1)-P_u*G_d2d_SP2(1))*ones(1,C) zeros(1,C*(M*D-D-1));
           zeros(1,(D+1)*C) (SNR_d2d_th*P_BS*G_BS_d2d_SP2(2)-P_u*G_d2d_SP2(2))*ones(1,C) zeros(1,C*(M*D-D-2));
           zeros(1,(D+2)*C) (SNR_d2d_th*P_BS*G_BS_d2d_SP2(3)-P_u*G_d2d_SP2(3))*ones(1,C) zeros(1,C*(M*D-2*D));
           zeros(1,2*D*C) (SNR_d2d_th*P_BS*G_BS_d2d_SP3(1)-P_u*G_d2d_SP3(1))*ones(1,C) zeros(1,C*(M*D-2*D-1));
           zeros(1,(2*D+1)*C) (SNR_d2d_th*P_BS*G_BS_d2d_SP3(2)-P_u*G_d2d_SP3(2))*ones(1,C) zeros(1,C*(M*D-2*D-2));
           zeros(1,(2*D+2)*C) (SNR_d2d_th*P_BS*G_BS_d2d_SP3(3)-P_u*G_d2d_SP3(3))*ones(1,C)];%D2D pairs SNR threshold constraint matrix
    b_d2d_SNR=-SNR_d2d_th*N_o*ones(M*D,1);%D2D pairs SNR threshold constraint

    A_cu_RB_sharing=[eye(C) eye(C) eye(C) zeros(C,M*C) zeros(C,M*C);
                    zeros(C,M*C) eye(C) eye(C) eye(C) zeros(C,M*C);
                    zeros(C,M*C) zeros(C,M*C) eye(C) eye(C) eye(C)];%Cellular users RB sharing constraint matrix
    b_cu_RB_sharing=ones(M*C,1);%Cellular users RB sharing constraint

    A_d2d_RB_sharing=[ones(1,C) zeros(1,C*(M*D-1));
                     zeros(1,C) ones(1,C) zeros(1,C*(M*D-2));
                     zeros(1,2*C) ones(1,C) zeros(1,C*(M*D-D));
                     zeros(1,D*C) ones(1,C) zeros(1,C*(M*D-D-1));
                     zeros(1,(D+1)*C) ones(1,C) zeros(1,C*(M*D-D-2));
                     zeros(1,(D+2)*C) ones(1,C) zeros(1,C*(M*D-D-D));
                     zeros(1,2*D*C) ones(1,C) zeros(1,C*(M*D-2*D-1));
                     zeros(1,(2*D+1)*C) ones(1,C) zeros(1,C*(M*D-2*D-2));
                     zeros(1,(2*D+2)*C) ones(1,C)];%D2D RB sharing constraint matrix
                 
    b_d2d_RB_sharing=ones(M*D,1);%D2D RB sharing constraint

    A_d2d_GBR=(-1).*[rates_d2d_SP1(:,1:C) zeros(1,C*(M*D-1));
                     zeros(1,C) rates_d2d_SP1(:,C+1:2*C) zeros(1,C*(M*D-2));
                     zeros(1,2*C) rates_d2d_SP1(:,2*C+1:3*C) zeros(1,C*(M*D-D));
                     zeros(1,D*C) rates_d2d_SP2(:,1:C) zeros(1,C*(M*D-D-1));
                     zeros(1,(D+1)*C) rates_d2d_SP2(:,C+1:2*C) zeros(1,C*(M*D-D-2));
                     zeros(1,(D+2)*C) rates_d2d_SP2(:,2*C+1:3*C) zeros(1,C*(M*D-D-D));
                     zeros(1,2*D*C) rates_d2d_SP3(:,1:C) zeros(1,C*(M*D-2*D-1));
                     zeros(1,(2*D+1)*C) rates_d2d_SP3(:,C+1:2*C) zeros(1,C*(M*D-2*D-2));
                     zeros(1,(2*D+2)*C) rates_d2d_SP3(:,2*C+1:3*C)];%D2D GBR constraint matrix
                 
    b_d2d_GBR=-GBR_d2d_rate*ones(M*D,1);%D2D GBR constraint upper bound

% A_d2d_ineq=[A_cu_RB_sharing;A_d2d_RB_sharing;A_d2d_GBR];%inequality matrix for D2D RA problem
% b_d2d_ineq=[b_cu_RB_sharing;b_d2d_RB_sharing;b_d2d_GBR];%inequality upper bound for D2D RA problem

    A_d2d_ineq=[A_cu_SNR;A_d2d_SNR;A_cu_RB_sharing;A_d2d_RB_sharing;A_d2d_GBR];%inequality matrix for D2D RA problem
    b_d2d_ineq=[b_cu_SNR;b_d2d_SNR;b_cu_RB_sharing;b_d2d_RB_sharing;b_d2d_GBR];%inequality upper bound for D2D RA problem

    [x_d2d_sol,d2d_value,d2d_exitflag] = bip1(objfunc2,A_d2d_ineq,b_d2d_ineq);%solves the cellular users' binary integer programming problem

    if(isempty(x_d2d_sol))
        x_d2d_opt=zeros(C,M*D);
        
    else
        x_d2d_opt=reshape(x_d2d_sol,C,M*D);%reshapes the optimal solution
        x_d2d_opt_SP1=x_d2d_opt(:,1:D);%optimal RA for SP1 cellular users
        x_d2d_opt_SP2=x_d2d_opt(:,D+1:2*D);%optimal RA for SP2 cellular users
        x_d2d_opt_SP3=x_d2d_opt(:,2*D+1:3*D);%optimal RA for SP3 cellular users
    end


    m1=zeros(1,D);
    m2=zeros(1,D);
    m3=zeros(1,D);
    SNR_d2d_SP1=zeros(1,D);
    SNR_d2d_SP2=zeros(1,D);
    SNR_d2d_SP3=zeros(1,D);
    trans_rate_d2d_SP1=zeros(1,D);
    trans_rate_d2d_SP2=zeros(1,D);
    trans_rate_d2d_SP3=zeros(1,D);
    for ind=1:D
        m1(:,ind)=find(x_d2d_opt_SP1(:,ind)~=0);
        m2(:,ind)=find(x_d2d_opt_SP2(:,ind)~=0);
        m3(:,ind)=find(x_d2d_opt_SP3(:,ind)~=0);
        
        if(m1(:,ind)~=0)
            SNR_d2d_SP1(:,ind)=(P_u*G_d2d_SP1(ind))/(P_BS*G_BS_d2d_SP1(ind));
            trans_rate_d2d_SP1(:,ind)=floor(132*specteff_finder(SNR_d2d_SP1(:,ind))*n_c_SP1(:,m1(:,ind)));
        else
            continue
        end
        
        if(m2(:,ind)~=0)
            SNR_d2d_SP2(:,ind)=(P_u*G_d2d_SP2(ind))/(P_BS*G_BS_d2d_SP2(ind));
            trans_rate_d2d_SP2(:,ind)=floor(132*specteff_finder(SNR_d2d_SP2(:,ind))*n_c_SP2(:,m2(:,ind)));
        else
            continue
        end
        
        if(m3(:,ind)~=0)
            SNR_d2d_SP3(:,ind)=(P_u*G_d2d_SP3(ind))/(P_BS*G_BS_d2d_SP3(ind));
            trans_rate_d2d_SP3(:,ind)=floor(132*specteff_finder(SNR_d2d_SP3(:,ind))*n_c_SP3(:,m3(:,ind)));
        else
            continue
        end       
    end
   time_bip(1,z)=toc;