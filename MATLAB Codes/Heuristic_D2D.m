% Determines the Heuristic solution for the D2D users
%%%%%%%%%%%%%%%%%%%%%%HEURISTIC SOLUTION%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%D2D Pairs RA problem%%%%%%%%%%%%%%%%%%%%%%%%    
  if (d2d_exitflag == -2)
    trans_rate_d2d_SP1_itr=zeros(1,D);
    trans_rate_d2d_SP2_itr=zeros(1,D);
    trans_rate_d2d_SP3_itr=zeros(1,D);
  elseif(d2d_exitflag == 1)
    temp_cu_d2d_SP1_itr=G_cu_d2d_SP1;
    temp_cu_d2d_SP2_itr=G_cu_d2d_SP2;
    temp_cu_d2d_SP3_itr=G_cu_d2d_SP3;
    
    temp_n_c_SP1=n_c_SP1_itr;
    temp_n_c_SP2=n_c_SP2_itr;
    temp_n_c_SP3=n_c_SP3_itr;
    
    x_d2d_SP1_itr=zeros(C,D);
    x_d2d_SP2_itr=zeros(C,D);
    x_d2d_SP3_itr=zeros(C,D);
    
    flag1=0;
    flag2=0;
    flag3=0;
    
    counter1=0;
    counter2=0;
    counter3=0;

    while(sum(x_d2d_SP1_itr(:,1))==0 || sum(x_d2d_SP1_itr(:,2))==0 || sum(x_d2d_SP1_itr(:,3))==0)
      [r1,t1]=max(temp_n_c_SP1);
      SNR_cu_SP1=(P_BS.*G_BS_cu_SP1_avg(t1))./(N_o+P_u.*temp_cu_d2d_SP1_itr(t1,:));
      if(SNR_cu_SP1(1)>SNR_cu_th_SP1(t1) && SNR_cu_SP1(2)>SNR_cu_th_SP1(t1) && SNR_cu_SP1(3)>SNR_cu_th_SP1(t1))
          [r12,t12]=min(SNR_cu_SP1);
          x_d2d_SP1_itr(t1,t12)=1;
          temp_n_c_SP1(t1)=0;
          temp_cu_d2d_SP1_itr(:,t12)=inf(C,1);
          flag1=1;
      elseif(SNR_cu_SP1(1)>SNR_cu_th_SP1(t1) && SNR_cu_SP1(2)<SNR_cu_th_SP1(t1) && SNR_cu_SP1(3)<SNR_cu_th_SP1(t1))
          x_d2d_SP1_itr(t1,1)=1;
          temp_n_c_SP1(t1)=0;
          temp_cu_d2d_SP1_itr(:,1)=inf(C,1);
          flag1=2;
      elseif(SNR_cu_SP1(1)<SNR_cu_th_SP1(t1) && SNR_cu_SP1(2)>SNR_cu_th_SP1(t1) && SNR_cu_SP1(3)<SNR_cu_th_SP1(t1))
          x_d2d_SP1_itr(t1,2)=1;
          temp_n_c_SP1(t1)=0;
          temp_cu_d2d_SP1_itr(:,2)=inf(C,1);
          flag1=3;
     elseif(SNR_cu_SP1(1)<SNR_cu_th_SP1(t1) && SNR_cu_SP1(2)<SNR_cu_th_SP1(t1) && SNR_cu_SP1(3)>SNR_cu_th_SP1(t1))
          x_d2d_SP1_itr(t1,3)=1;
          temp_n_c_SP1(t1)=0;
          temp_cu_d2d_SP1_itr(:,3)=inf(C,1);
          flag1=4;
     elseif(SNR_cu_SP1(1)>SNR_cu_th_SP1(t1) && SNR_cu_SP1(2)>SNR_cu_th_SP1(t1) && SNR_cu_SP1(3)<SNR_cu_th_SP1(t1))
          [r12,t12]=min([SNR_cu_SP1(1) SNR_cu_SP1(2) inf]);
          x_d2d_SP1_itr(t1,t12)=1;
          temp_n_c_SP1(t1)=0;
          temp_cu_d2d_SP1_itr(:,t12)=inf(C,1);
          flag1=5;
     elseif(SNR_cu_SP1(1)>SNR_cu_th_SP1(t1) && SNR_cu_SP1(2)<SNR_cu_th_SP1(t1) && SNR_cu_SP1(3)>SNR_cu_th_SP1(t1))
          [r12,t12]=min([SNR_cu_SP1(1) inf SNR_cu_SP1(3)]);
          x_d2d_SP1_itr(t1,t12)=1;
          temp_n_c_SP1(t1)=0;
          temp_cu_d2d_SP1_itr(:,t12)=inf(C,1);
          flag1=6;
     elseif(SNR_cu_SP1(1)<SNR_cu_th_SP1(t1) && SNR_cu_SP1(2)>SNR_cu_th_SP1(t1) && SNR_cu_SP1(3)>SNR_cu_th_SP1(t1))
          [r12,t12]=min([inf SNR_cu_SP1(2) SNR_cu_SP1(3)]);
          x_d2d_SP1_itr(t1,t12)=1;
          temp_n_c_SP1(t1)=0;
          temp_cu_d2d_SP1_itr(:,t12)=inf(C,1);
          flag1=7;
      else
          temp_n_c_SP1(t1)=0;
          flag1=8;
          counter1=counter1+1;
          if(counter1>C)
              break
          end
      end
    end
    
    while(sum(x_d2d_SP2_itr(:,1))==0 || sum(x_d2d_SP2_itr(:,2))==0 || sum(x_d2d_SP2_itr(:,3))==0)
      [r2,t2]=max(temp_n_c_SP2);
      SNR_cu_SP2=(P_BS.*G_BS_cu_SP2_avg(t2))./(N_o+P_u.*temp_cu_d2d_SP2_itr(t2,:));
      if(SNR_cu_SP2(1)>SNR_cu_th_SP2(t2) && SNR_cu_SP2(2)>SNR_cu_th_SP2(t2) && SNR_cu_SP2(3)>SNR_cu_th_SP2(t2))
          [r22,t22]=min(SNR_cu_SP2);
          x_d2d_SP2_itr(t2,t22)=1;
          temp_n_c_SP2(t2)=0;
          temp_cu_d2d_SP2_itr(:,t22)=inf(C,1);
          flag2=1;
      elseif(SNR_cu_SP2(1)>SNR_cu_th_SP2(t2) && SNR_cu_SP2(2)<SNR_cu_th_SP1(t2) && SNR_cu_SP2(3)<SNR_cu_th_SP2(t2))
          x_d2d_SP2_itr(t2,1)=1;
          temp_n_c_SP2(t2)=0;
          temp_cu_d2d_SP2_itr(:,1)=inf(C,1);
          flag2=2;
      elseif(SNR_cu_SP2(1)<SNR_cu_th_SP2(t2) && SNR_cu_SP2(2)>SNR_cu_th_SP2(t2) && SNR_cu_SP2(3)<SNR_cu_th_SP2(t2))
          x_d2d_SP2_itr(t2,2)=1;
          temp_n_c_SP2(t2)=0;
          temp_cu_d2d_SP2_itr(:,2)=inf(C,1);
          flag2=3;
     elseif(SNR_cu_SP2(1)<SNR_cu_th_SP2(t2) && SNR_cu_SP2(2)<SNR_cu_th_SP2(t2) && SNR_cu_SP2(3)>SNR_cu_th_SP2(t2))
          x_d2d_SP2_itr(t2,3)=1;
          temp_n_c_SP2(t2)=0;
          temp_cu_d2d_SP2_itr(:,3)=inf(C,1);
          flag2=4;
     elseif(SNR_cu_SP2(1)>SNR_cu_th_SP2(t2) && SNR_cu_SP2(2)>SNR_cu_th_SP2(t2) && SNR_cu_SP2(3)<SNR_cu_th_SP2(t2))
          [r22,t22]= min([SNR_cu_SP2(1) SNR_cu_SP2(2) inf]);
          x_d2d_SP2_itr(t2,t22)=1;
          temp_n_c_SP2(t2)=0;
          temp_cu_d2d_SP2_itr(:,t22)=inf(C,1);
          flag2=5;
     elseif(SNR_cu_SP2(1)>SNR_cu_th_SP2(t2) && SNR_cu_SP2(2)<SNR_cu_th_SP2(t2) && SNR_cu_SP2(3)>SNR_cu_th_SP2(t2))
          [r22,t22]=min([SNR_cu_SP2(1) inf SNR_cu_SP2(3)]);
          x_d2d_SP2_itr(t2,t22)=1;
          temp_n_c_SP2(t2)=0;
          temp_cu_d2d_SP2_itr(:,t22)=inf(C,1);
          flag2=6;
     elseif(SNR_cu_SP2(1)<SNR_cu_th_SP2(t2) && SNR_cu_SP2(2)>SNR_cu_th_SP2(t2) && SNR_cu_SP2(3)>SNR_cu_th_SP2(t2))
          [r22,t22]=min([inf SNR_cu_SP2(2) SNR_cu_SP2(3)]);
          x_d2d_SP2_itr(t2,t22)=1;
          temp_n_c_SP2(t2)=0;
          temp_cu_d2d_SP2_itr(:,t22)=inf(C,1);
          flag2=7;
      else
          temp_n_c_SP2(t2)=0;
          flag2=8;
          counter2=counter2+1;
          if(counter2>C)
              break
          end
      end
    end
    
    while(sum(x_d2d_SP3_itr(:,1))==0 || sum(x_d2d_SP3_itr(:,2))==0 || sum(x_d2d_SP3_itr(:,3))==0)
      [r3,t3]=max(temp_n_c_SP3);
      SNR_cu_SP3=(P_BS.*G_BS_cu_SP3_avg(t3))./(N_o+P_u.*temp_cu_d2d_SP3_itr(t3,:));
      if(SNR_cu_SP3(1)>SNR_cu_th_SP3(t3) && SNR_cu_SP3(2)>SNR_cu_th_SP3(t3) && SNR_cu_SP3(3)>SNR_cu_th_SP3(t3))
          [r32,t32]=min(SNR_cu_SP3);
          x_d2d_SP3_itr(t3,t32)=1;
          temp_n_c_SP3(t3)=0;
          temp_cu_d2d_SP3_itr(:,t32)=inf(C,1);
          flag3=1;
      elseif(SNR_cu_SP3(1)>SNR_cu_th_SP3(t3) && SNR_cu_SP3(2)<SNR_cu_th_SP3(t3) && SNR_cu_SP3(3)<SNR_cu_th_SP3(t3))
          x_d2d_SP3_itr(t3,1)=1;
          temp_n_c_SP3(t3)=0;
          temp_cu_d2d_SP3_itr(:,1)=inf(C,1);
          flag3=2;
      elseif(SNR_cu_SP3(1)<SNR_cu_th_SP3(t3) && SNR_cu_SP3(2)>SNR_cu_th_SP3(t3) && SNR_cu_SP3(3)<SNR_cu_th_SP3(t3))
          x_d2d_SP3_itr(t3,2)=1;
          temp_n_c_SP3(t3)=0;
          temp_cu_d2d_SP3_itr(:,2)=inf(C,1);
          flag3=3;
     elseif(SNR_cu_SP3(1)<SNR_cu_th_SP3(t3) && SNR_cu_SP3(2)<SNR_cu_th_SP3(t3) && SNR_cu_SP3(3)>SNR_cu_th_SP3(t3))
          x_d2d_SP3_itr(t3,3)=1;
          temp_n_c_SP3(t3)=0;
          temp_cu_d2d_SP3_itr(:,3)=inf(C,1);
          flag3=4;
     elseif(SNR_cu_SP3(1)>SNR_cu_th_SP3(t3) && SNR_cu_SP3(2)>SNR_cu_th_SP3(t3) && SNR_cu_SP3(3)<SNR_cu_th_SP3(t3))
          [r32,t32]= min([SNR_cu_SP3(1) SNR_cu_SP3(2) inf]);
          x_d2d_SP3_itr(t3,t32)=1;
          temp_n_c_SP3(t3)=0;
          temp_cu_d2d_SP3_itr(:,t32)=inf(C,1);
          flag3=5;
     elseif(SNR_cu_SP3(1)>SNR_cu_th_SP3(t3) && SNR_cu_SP3(2)<SNR_cu_th_SP3(t3) && SNR_cu_SP3(3)>SNR_cu_th_SP3(t3))
          [r32,t32]=min([SNR_cu_SP3(1) inf SNR_cu_SP3(3)]);
          x_d2d_SP3_itr(t3,t32)=1;
          temp_n_c_SP3(t3)=0;
          temp_cu_d2d_SP3_itr(:,t32)=inf(C,1);
          flag3=6;
     elseif(SNR_cu_SP3(1)<SNR_cu_th_SP3(t3) && SNR_cu_SP3(2)>SNR_cu_th_SP3(t3) && SNR_cu_SP3(3)>SNR_cu_th_SP3(t3))
          [r32,t32]=min([inf SNR_cu_SP3(2) SNR_cu_SP3(3)]);
          x_d2d_SP3_itr(t3,t32)=1;
          temp_n_c_SP3(t3)=0;
          temp_cu_d2d_SP3_itr(:,t32)=inf(C,1);
          flag3=7;
      else
          temp_n_c_SP3(t3)=0;
          flag3=8;
          counter3=counter3+1;
          if(counter3>C)
              break
          end
      end
      
    end
    
    m1_itr=zeros(1,D);
    m2_itr=zeros(1,D);
    m3_itr=zeros(1,D);
    SNR_d2d_SP1_itr=zeros(1,D);
    SNR_d2d_SP2_itr=zeros(1,D);
    SNR_d2d_SP3_itr=zeros(1,D);
    trans_rate_d2d_SP1_itr=zeros(1,D);
    trans_rate_d2d_SP2_itr=zeros(1,D);
    trans_rate_d2d_SP3_itr=zeros(1,D);
    for index1=1:D
        m1_itr(:,index1)=find(x_d2d_SP1_itr(:,index1)~=0);
        m2_itr(:,index1)=find(x_d2d_SP2_itr(:,index1)~=0);
        m3_itr(:,index1)=find(x_d2d_SP3_itr(:,index1)~=0);
        
        if(m1_itr(:,index1)~=0)
            SNR_d2d_SP1_itr(:,index1)=(P_u*G_d2d_SP1(index1))/(P_BS*G_BS_d2d_SP1(index1));
            trans_rate_d2d_SP1_itr(:,index1)=floor(132*specteff_finder(SNR_d2d_SP1_itr(:,index1))*n_c_SP1_itr(:,m1_itr(:,index1)));
        else
            continue
        end
        
        if(m2_itr(:,index1)~=0)
            SNR_d2d_SP2_itr(:,index1)=(P_u*G_d2d_SP2(index1))/(P_BS*G_BS_d2d_SP2(index1));
            trans_rate_d2d_SP2_itr(:,index1)=floor(132*specteff_finder(SNR_d2d_SP2_itr(:,index1))*n_c_SP2_itr(:,m2_itr(:,index1)));
        else
            continue
        end
        
        if(m3_itr(:,index1)~=0)
            SNR_d2d_SP3_itr(:,index1)=(P_u*G_d2d_SP3(index1))/(P_BS*G_BS_d2d_SP3(index1));
            trans_rate_d2d_SP3_itr(:,index1)=floor(132*specteff_finder(SNR_d2d_SP3_itr(:,index1))*n_c_SP3_itr(:,m3_itr(:,index1)));
        else
            continue
        end
    end
%   else
%       continue
  end
  time_itr(1,z)=toc;