    %Aggregates the results for the particular iteration
    trans_sumrate_cu_SP1_bip(1,z)=sum(trans_rate_cu_SP1);
    trans_sumrate_cu_SP2_bip(1,z)=sum(trans_rate_cu_SP2);
    trans_sumrate_cu_SP3_bip(1,z)=sum(trans_rate_cu_SP3);
    trans_sumrate_cu_bip(1,z)=sum(trans_rate_cu_SP1)+sum(trans_rate_cu_SP2)+sum(trans_rate_cu_SP3);
    
    trans_sumrate_cu_SP1_itr(1,z)=sum(trans_rate_cu_SP1_itr);
    trans_sumrate_cu_SP2_itr(1,z)=sum(trans_rate_cu_SP2_itr);
    trans_sumrate_cu_SP3_itr(1,z)=sum(trans_rate_cu_SP3_itr);
    trans_sumrate_cu_itr(1,z)=sum(trans_rate_cu_SP1_itr)+sum(trans_rate_cu_SP2_itr)+sum(trans_rate_cu_SP3_itr);
    
    trans_sumrate_d2d_SP1_bip(1,z)=sum(trans_rate_d2d_SP1);
    trans_sumrate_d2d_SP2_bip(1,z)=sum(trans_rate_d2d_SP2);
    trans_sumrate_d2d_SP3_bip(1,z)=sum(trans_rate_d2d_SP3);
    trans_sumrate_d2d_bip(1,z)=(sum(trans_rate_d2d_SP1)+sum(trans_rate_d2d_SP2)+sum(trans_rate_d2d_SP1));
    
    trans_sumrate_d2d_SP1_itr(1,z)=sum(trans_rate_d2d_SP1_itr);
    %trans_sumrate_d2d_SP1_itr(1,z)=max(trans_rate_d2d_SP1_itr);
    trans_sumrate_d2d_SP2_itr(1,z)=sum(trans_rate_d2d_SP2_itr);
    trans_sumrate_d2d_SP3_itr(1,z)=sum(trans_rate_d2d_SP3_itr);
    trans_sumrate_d2d_itr(1,z)=(sum(trans_rate_d2d_SP1_itr)+sum(trans_rate_d2d_SP2_itr)+sum(trans_rate_d2d_SP3_itr));
    
    rb_access_percent_SP1_bip(1,z)=sum(n_c_SP1)/(M*L);
    rb_access_percent_SP2_bip(1,z)=sum(n_c_SP2)/(M*L);
    rb_access_percent_SP3_bip(1,z)=sum(n_c_SP3)/(M*L);
    
    rb_access_percent_SP1_itr(1,z)=sum(n_c_SP1_itr)/(M*L);
    rb_access_percent_SP2_itr(1,z)=sum(n_c_SP2_itr)/(M*L);
    rb_access_percent_SP3_itr(1,z)=sum(n_c_SP3_itr)/(M*L);