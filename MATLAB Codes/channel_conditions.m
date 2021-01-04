% Generates the channel conditions using macroscopic (deterministic distance based) 
% and microscopic (probabilistic) path loss components  
%%%%%%%%%%%%%%% x and y coordinates + distances of users%%%%%%%%%%%%%
    x_BS_cu_SP1=randi([-400 400],1,C);
    x_BS_cu_SP2=randi([-400 400],1,C);
    x_BS_cu_SP3=randi([-400 400],1,C);

    y_BS_cu_SP1=randi([-400 400],1,C);
    y_BS_cu_SP2=randi([-400 400],1,C);
    y_BS_cu_SP3=randi([-400 400],1,C);

    dist_BS_cu_SP1=sqrt(x_BS_cu_SP1.^2+y_BS_cu_SP1.^2);%distance from eNodeB to cellular users of SP1
    dist_BS_cu_SP2=sqrt(x_BS_cu_SP1.^2+y_BS_cu_SP1.^2);%distance from eNodeB to cellular users of SP2
    dist_BS_cu_SP3=sqrt(x_BS_cu_SP1.^2+y_BS_cu_SP1.^2);%distance from eNodeB to cellular users of SP3

% dist_BS_cu_SP1=randi(500,1,C);%distance from eNodeB to cellular users of SP1
% dist_BS_cu_SP2=randi(500,1,C);%distance from eNodeB to cellular users of SP2
% dist_BS_cu_SP3=randi(500,1,C);%distance from eNodeB to cellular users of SP3

    x_BS_d2d_SP1=randi([-400 400],1,D);
    x_BS_d2d_SP2=randi([-400 400],1,D);
    x_BS_d2d_SP3=randi([-400 400],1,D);

    y_BS_d2d_SP1=randi([-400 400],1,D);
    y_BS_d2d_SP2=randi([-400 400],1,D);
    y_BS_d2d_SP3=randi([-400 400],1,D);

    dist_BS_d2d_SP1=sqrt(x_BS_d2d_SP1.^2+y_BS_d2d_SP1.^2);%distance from eNodeB to D2D pair of SP1
    dist_BS_d2d_SP2=sqrt(x_BS_d2d_SP2.^2+y_BS_d2d_SP2.^2);%distance from eNodeB to D2D pair of SP2
    dist_BS_d2d_SP3=sqrt(x_BS_d2d_SP3.^2+y_BS_d2d_SP3.^2);%distance from eNodeB to D2D pair of SP3
 
% dist_BS_d2d_SP1=randi(500,1,D);%distance from eNodeB to D2D pair of SP1
% dist_BS_d2d_SP2=randi(500,1,D);%distance from eNodeB to D2D pair of SP2
% dist_BS_d2d_SP3=randi(500,1,D);%distance from eNodeB to D2D pair of SP3

    d_BS_u_SP1=[dist_BS_cu_SP1 dist_BS_d2d_SP1];%distance from eNodeB to all users of SP1
    d_BS_u_SP2=[dist_BS_cu_SP2 dist_BS_d2d_SP2];%distance from eNodeB to all users of SP2
    d_BS_u_SP3=[dist_BS_cu_SP3 dist_BS_d2d_SP3];%distance from eNodeB to all users of SP3

    dist_d2d_SP1=randi([10 25],1,D);%distance between each D2D pair of SP1
    dist_d2d_SP2=randi([10 25],1,D);%distance between each D2D pair of SP2
    dist_d2d_SP3=randi([10 25],1,D);%distance between each D2D pair of SP3

    dist_c_d2d_SP1=zeros(C,D);
    dist_c_d2d_SP2=zeros(C,D);
    dist_c_d2d_SP3=zeros(C,D);

    for k=1:C
        for l=1:D
        dist_c_d2d_SP1(k,l)=sqrt((x_BS_cu_SP1(k)-x_BS_d2d_SP1(l))^2+(y_BS_cu_SP1(k)-y_BS_d2d_SP1(l))^2);%distance between cellular users and D2D pairs of SP1
        dist_c_d2d_SP2(k,l)=sqrt((x_BS_cu_SP2(k)-x_BS_d2d_SP2(l))^2+(y_BS_cu_SP2(k)-y_BS_d2d_SP2(l))^2);%distance between cellular users and D2D pairs of SP2
        dist_c_d2d_SP3(k,l)=sqrt((x_BS_cu_SP3(k)-x_BS_d2d_SP3(l))^2+(y_BS_cu_SP3(k)-y_BS_d2d_SP3(l))^2);%distance between cellular users and D2D pairs of SP32*
        end
    end

%%%%%%%%%%%%%Channel gains%%%%%%%%%%%%%%%%%%%%%%%%
    m = log((mu(x)^2)/sqrt(sigma+mu(x)^2));
    v = sqrt(log(sigma/(mu(x)^2)+1));
    
    X_cu_SP1=lognrnd(m,v,M*L,C);%Log normal shadowing of cellular users of SP1 for all RBs 
    X_cu_SP2=lognrnd(m,v,M*L,C);%Log normal shadowing of cellular users of SP2 for all RBs
    X_cu_SP3=lognrnd(m,v,M*L,C);%Log normal shadowing of cellular users of SP3 for all RBs

    d_BS_cu_SP1=ones(M*L,1)*dist_BS_cu_SP1;%distance from eNodeB to cellular users of SP1 repeated
    d_BS_cu_SP2=ones(M*L,1)*dist_BS_cu_SP2;%distance from eNodeB to cellular users of SP2 repeated
    d_BS_cu_SP3=ones(M*L,1)*dist_BS_cu_SP3;%distance from eNodeB to cellular users of SP3 repeated

    PL_dB_BS_cu_SP1=40*(1-4*10^(-3)*h_b)*log10(d_BS_cu_SP1./d_o)-18*log10(h_b)+21*log10(f_c)+80+X_cu_SP1;%pathloss between eNodeB and users of SP1
    PL_dB_BS_cu_SP2=40*(1-4*10^(-3)*h_b)*log10(d_BS_cu_SP2./d_o)-18*log10(h_b)+21*log10(f_c)+80+X_cu_SP2;%pathloss between eNodeB and users of SP2
    PL_dB_BS_cu_SP3=40*(1-4*10^(-3)*h_b)*log10(d_BS_cu_SP3./d_o)-18*log10(h_b)+21*log10(f_c)+80+X_cu_SP3;%pathloss between eNodeB and users of SP3

    G_BS_cu_SP1=10.^(-PL_dB_BS_cu_SP1./10);%Channel gain between eNodeB and users of SP1
    G_BS_cu_SP2=10.^(-PL_dB_BS_cu_SP2./10);%Channel gain between eNodeB and users of SP2
    G_BS_cu_SP3=10.^(-PL_dB_BS_cu_SP3./10);%Channel gain between eNodeB and users of SP3


    G_BS_cu_SP1_fixed=reshape(G_BS_cu_SP1,1,C*M*L);%Channel gain of cellular users of SP1 reshaped to one row
    G_BS_cu_SP2_fixed=reshape(G_BS_cu_SP2,1,C*M*L);%Channel gain of cellular users of SP2 reshaped to one row
    G_BS_cu_SP3_fixed=reshape(G_BS_cu_SP3,1,C*M*L);%Channel gain of cellular users of SP3 reshaped to one row

    G_BS_cu_SP1_avg=mean(G_BS_cu_SP1);%Average channel gain of cellular users of SP1
    G_BS_cu_SP2_avg=mean(G_BS_cu_SP2);%Average channel gain of cellular users of SP2
    G_BS_cu_SP3_avg=mean(G_BS_cu_SP3);%Average channel gain of cellular users of SP3

    X_d2d_SP1=lognrnd(m,v,1,D);%Log normal shadowing of D2D pairs of SP1 
    X_d2d_SP2=lognrnd(m,v,1,D);%Log normal shadowing of D2D pairs of SP2 
    X_d2d_SP3=lognrnd(m,v,1,D);%Log normal shadowing of D2D pairs of SP3 

    PL_dB_BS_d2d_SP1=40*(1-4*10^(-3)*h_b)*log10(dist_BS_d2d_SP1./d_o)-18*log10(h_b)+21*log10(f_c)+80+X_d2d_SP1;%pathloss between eNodeB and D2D pair of SP1
    PL_dB_BS_d2d_SP2=40*(1-4*10^(-3)*h_b)*log10(dist_BS_d2d_SP2./d_o)-18*log10(h_b)+21*log10(f_c)+80+X_d2d_SP2;%pathloss between eNodeB and D2D pair of SP2
    PL_dB_BS_d2d_SP3=40*(1-4*10^(-3)*h_b)*log10(dist_BS_d2d_SP3./d_o)-18*log10(h_b)+21*log10(f_c)+80+X_d2d_SP3;%pathloss between eNodeB and D2D pair of SP3

    G_BS_d2d_SP1=10.^(-PL_dB_BS_d2d_SP1./10);%Channel gain between eNodeB and D2D pairs of SP1
    G_BS_d2d_SP2=10.^(-PL_dB_BS_d2d_SP2./10);%Channel gain between eNodeB and D2D pairs of SP2
    G_BS_d2d_SP3=10.^(-PL_dB_BS_d2d_SP3./10);%Channel gain between eNodeB and D2D pairs of SP3

    G_BS_d2d_SP1_rep=ones(C,1)*G_BS_d2d_SP1;%Channel gain between eNodeB and D2D pairs of SP1 repeated
    G_BS_d2d_SP2_rep=ones(C,1)*G_BS_d2d_SP2;%Channel gain between eNodeB and D2D pairs of SP2 repeated
    G_BS_d2d_SP3_rep=ones(C,1)*G_BS_d2d_SP3;%Channel gain between eNodeB and D2D pairs of SP3 repeated

    G_BS_d2d_SP1_fixed=reshape(G_BS_d2d_SP1_rep,1,C*D);%Channel gain between eNodeB and D2D pairs of SP1 reshaped to one row
    G_BS_d2d_SP2_fixed=reshape(G_BS_d2d_SP1_rep,1,C*D);%Channel gain between eNodeB and D2D pairs of SP2 reshaped to one row
    G_BS_d2d_SP3_fixed=reshape(G_BS_d2d_SP1_rep,1,C*D);%Channel gain between eNodeB and D2D pairs of SP3 reshaped to one row

    K_d2d_SP1=exprnd(mu(x),1,D);%Normalization constant of D2D pairs of SP1 
    K_d2d_SP2=exprnd(mu(x),1,D);%Normalization constant of D2D pairs of SP2 
    K_d2d_SP3=exprnd(mu(x),1,D);%Normalization constant of D2D pairs of SP3 

    G_d2d_SP1=K_d2d_SP1.*dist_d2d_SP1.^(-alpha);%Channel gain between D2D pairs of SP1
    G_d2d_SP2=K_d2d_SP2.*dist_d2d_SP2.^(-alpha);%Channel gain between D2D pairs of SP2
    G_d2d_SP3=K_d2d_SP3.*dist_d2d_SP3.^(-alpha);%Channel gain between D2D pairs of SP3

    G_d2d_SP1_rep=ones(C,1)*G_d2d_SP1;%Channel gain of D2D pairs of SP1 repeated
    G_d2d_SP2_rep=ones(C,1)*G_d2d_SP2;%Channel gain of D2D pairs of SP1 repeated
    G_d2d_SP3_rep=ones(C,1)*G_d2d_SP3;%Channel gain of D2D pairs of SP1 repeated

    G_d2d_SP1_fixed=reshape(G_BS_d2d_SP1_rep,1,C*D);%Channel gain of D2D pairs of SP1 reshaped to one row
    G_d2d_SP2_fixed=reshape(G_BS_d2d_SP1_rep,1,C*D);%Channel gain of D2D pairs of SP2 reshaped to one row
    G_d2d_SP3_fixed=reshape(G_BS_d2d_SP1_rep,1,C*D);%Channel gain of D2D pairs of SP3 reshaped to one row

%     K_cu_d2d_SP1=exprnd(mu(x),C,D);%Normalization constant of D2D pairs of SP1 
%     K_cu_d2d_SP2=exprnd(mu(x),C,D);%Normalization constant of D2D pairs of SP2 
%     K_cu_d2d_SP3=exprnd(mu(x),C,D);%Normalization constant of D2D pairs of SP3
%     
%     G_cu_d2d_SP1=K_cu_d2d_SP1.*dist_c_d2d_SP1.^(-alpha);%Channel gain between cellular users & D2D pairs of SP1
%     G_cu_d2d_SP2=K_cu_d2d_SP2.*dist_c_d2d_SP2.^(-alpha);%Channel gain between cellular users & D2D pairs of SP2
%     G_cu_d2d_SP3=K_cu_d2d_SP3.*dist_c_d2d_SP3.^(-alpha);%Channel gain between cellular users & D2D pairs of SP3

    L_cu_d2d_SP1=35.3+37.6*log10(dist_c_d2d_SP1);%+exprnd(mu(x),C,D);
    L_cu_d2d_SP2=35.3+37.6*log10(dist_c_d2d_SP2);%+exprnd(mu(x),C,D);
    L_cu_d2d_SP3=35.3+37.6*log10(dist_c_d2d_SP3);%+exprnd(mu(x),C,D);

    G_cu_d2d_SP1=10.^(-L_cu_d2d_SP1./10);
    G_cu_d2d_SP2=10.^(-L_cu_d2d_SP2./10);
    G_cu_d2d_SP3=10.^(-L_cu_d2d_SP3./10);

    G_cu_d2d_SP1_fixed=reshape(G_cu_d2d_SP1,1,C*D);%Channel gain between cellular users & D2D pairs of SP1 reshaped to one row
    G_cu_d2d_SP2_fixed=reshape(G_cu_d2d_SP2,1,C*D);%Channel gain between cellular users & D2D pairs of SP1 reshaped to one row
    G_cu_d2d_SP3_fixed=reshape(G_cu_d2d_SP3,1,C*D);%Channel gain between cellular users & D2D pairs of SP1 reshaped to one row

    G_cu_d2d=[G_cu_d2d_SP1_fixed G_cu_d2d_SP2_fixed G_cu_d2d_SP3_fixed];