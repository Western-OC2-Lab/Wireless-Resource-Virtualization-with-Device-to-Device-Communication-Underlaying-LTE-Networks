% Determines the Heuristic solution for the LTE cellular users
%%%%%%%%%%%%%%%%%%%%%%HEURISTIC SOLUTION%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%Cellular Users RA problem%%%%%%%%%%%%%%%%%%%%%%%%
    tic
    temp_BS_cu_itr=[G_BS_cu_SP1 G_BS_cu_SP1 G_BS_cu_SP1];
    trans_rate_cu_itr=zeros(1,M*C);
    x_cu_sol_itr=zeros(M*L,M*C);
    index_chann_itr=zeros(1,M*C);
    for p=1:M*C
        [max_chann,index_chann]=max(temp_BS_cu_itr(:,p));
        SNR_cu_itr=P_BS_peruser*max_chann/N_o;
        index_chann_itr(p)=index_chann;
        trans_rate_cu_itr(p)=floor(132*specteff_finder(SNR_cu_itr));
        x_cu_sol_itr(index_chann,p)=1;
        temp_BS_cu_itr(index_chann,:)=zeros(1,M*C);
    end
    
    rb1=ceil(rho_min(1)*M*L-C);
    rb2=ceil(rho_min(2)*M*L-C);
    rb3=floor(rho_min(3)*M*L-C);
    
    for q1=1:rb1
        [max1,y1]=max(temp_BS_cu_itr(:,[1:C]));
        [max11,x1]=max(max1);
        x_cu_sol_itr(y1(x1),x1)=1;
        temp_BS_cu_itr(y1(x1),:)=zeros(1,M*C);
    end
    
    for q2=1:rb2
        [max2,y2]=max(temp_BS_cu_itr(:,[C+1:2*C]));
        [max22,x2]=max(max2);
        x_cu_sol_itr(y2(x2),C+x2)=1;
        temp_BS_cu_itr(y2(x2),:)=zeros(1,M*C);
    end
    
    for q3=1:rb3
        [max3,y3]=max(temp_BS_cu_itr(:,[2*C+1:3*C]));
        [max33,x3]=max(max3);
        x_cu_sol_itr(y3(x3),2*C+x3)=1;
        temp_BS_cu_itr(y3(x3),:)=zeros(1,M*C);
    end
    G_BS_cu_itr=[G_BS_cu_SP1 G_BS_cu_SP1 G_BS_cu_SP1];
    active_chann_SNR_itr=P_BS_peruser.*x_cu_sol_itr.*G_BS_cu_itr./N_o;%determines the SNR of the channels assigned to each cellular user
    min_active_chann_SNR_itr=zeros(1,M*C);%Minimum channel's SNR of each cellular user for heuristic algorithm
    
    for w=1:M*C
       w1=find(active_chann_SNR_itr(:,w)~=0);
       if(isempty(w1))
           min_active_chann_SNR_itr(w)=0;
       else
           min_active_chann_SNR_itr(w)=active_chann_SNR_itr(min(find(active_chann_SNR_itr(:,w)~=0)),w);
       end
    end
    trans_rate_cu_itr=zeros(1,M*C);
    for e=1:M*C
     trans_rate_cu_itr(e)=floor(132*specteff_finder(min_active_chann_SNR_itr(e))*sum(x_cu_sol_itr(:,e)));
    end
    
    x_cu_SP1_itr=x_cu_sol_itr(:,1:C);
    x_cu_SP2_itr=x_cu_sol_itr(:,C+1:2*C);
    x_cu_SP3_itr=x_cu_sol_itr(:,2*C+1:3*C);
    
    n_c_SP1_itr=sum(x_cu_SP1_itr);
    n_c_SP2_itr=sum(x_cu_SP2_itr);
    n_c_SP3_itr=sum(x_cu_SP3_itr);
    
    trans_rate_cu_SP1_itr=trans_rate_cu_itr(1:C);
    trans_rate_cu_SP2_itr=trans_rate_cu_itr(C+1:2*C);
    trans_rate_cu_SP3_itr=trans_rate_cu_itr(2*C+1:3*C);