# Wireless-Resource-Virtualization-with-Device-to-Device-Communication-Underlaying-LTE-Networks
Implementation of Wireless Resource Virtualization with Device-to-Device Communication Underlaying LTE Networks

•	Description:
Wireless resource virtualization is a potential solution for meeting the increasing demand for mobile data services. Virtualization allows for more efficient utilization of the spectrum, reduces capital expenditures and operating expenditures, and can support higher peak rates. Device-to-device (D2D) communication as an underlay to cellular networks is also a potential solution to satisfy the data demand. Due to the proximity of devices and thus the higher signal-to-interference and noise ratio, higher data rates can be achieved using D2D communication. This is beneficial in cases of multimedia sharing where data can be broadcast to several nearby users. However, the interference that D2D pairs introduce to cellular users should be below a target threshold so as not to reduce their performance. 

In this work, the problem of wireless resource virtualization with D2D communication underlaying the LTE network is formulated. Since the problem is an integer non-linear programming (INLP) problem, it is divided into two smaller linear integer programs that are solved to optimality. Two lower complexity heuristic algorithms, each solving one of the subproblems are introduced. 

The objective of the INLP problem is to maximize the sum rate of the cellular and D2D users. Additionally, the optimization problem considers the following constraints:
-	SINR threshold of both cellular and D2D users’ constraints.

-	Resource Block sharing constraints

-	Service Level Agreement (SLA) constraint 

-	Sum rate of both cellular and D2D users’ constraints 

The developed heuristic solution follows a greedy approach to solve the cellular users’ resource allocation sub-problem and the D2D users’ resource sharing sub-problem. Accordingly, the heuristic solution considers the same set of constraints.

The simulation was developed using MATLAB using the following files:
-	main_file.m: Main file that calls the different files within the simulation.
-	initialization.m: It creates all the matrices and vectors and sets up the simulation environment.
-	channel_conditions.m: Generates the channel conditions using macroscopic and microscopic path loss components.   
-	BIP_CU.m: Determines the bip problem solution for LTE cellular users.  
-	BIP_D2D.m: Determines the bip problem solution for D2D users.
-	bip1.m: Function that solves the bip problem.
-	min_SNR_finder.m: Finds the minimum SNR for the corresponding modulation and coding scheme after the resource blocks are allocated.
-	specteff_finder.m: Finds the effective spectrum SNR. 
-	Heuristic_CU.m: Determines the heuristic solution using a greedy methodology for LTE cellular users.  
-	Heuristic_D2D.m: Determines the heuristic solution using a greedy methodology for D2D users.
-	Results_aggregation_iteration.m; Aggregates the achieved results in each iteration.
-	Results_aggregation_mu_value.m: Averages the results for the different iterations for one mu value.
-	Results_plotting.m: Plots the results.

