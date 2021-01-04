% main file that calls all other files within the simulation.
clear all
clc

initialization;

for x=1:max(size(mu))
    for z=1:num_iter
     channel_conditions;%Generates the channel conditions using macroscopic and microscopic path loss components   
     BIP_CU;%Determines the bip problem solution for LTE cellular users  
     BIP_D2D;%Determines the bip problem solution  for D2D users
     Heuristic_CU;%Determines the heuristic solution for LTE cellular users  
     Heuristic_D2D;%Determines the heuristic solution for D2D users
     Results_aggregation_iteration;% Aggregates the results per iteration
    end
    Results_aggregation_mu_value;% Averages the results for the different iterations for one mu value
end

Results_plotting;%Plotting the results