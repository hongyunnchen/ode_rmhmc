addpath(genpath('./'))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set random numbers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%randn('state', sum(100*clock));
%rand('twister', sum(100*clock));

% Fixed
randn('state', 1);
rand('twister', 1);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load required toolboxes etc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% This part loads the toolbox for solving the ODEs quickly %%%

JobID = 1;
TaskID = 1;
JobName = 'SBodeMAPK';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set options to pass to MCMC file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set name for saving results
Options.EquationName          = [JobName '_' num2str(JobID) '_' num2str(TaskID)]

Options.NumOfSpecies          = 2;
Options.NumOfParameters       = 2;
Options.NumOfOutputs          = 1;
Options.OutputMatrix          = [0,1];
Options.SBModelName           = 'SBexpMAPK';
Options.SBModelParameterNames = SBparameters(Options.SBModelName)';

MAPKsetup
% Call main population MCMC routine
SB_RMHMC_Single_MCMC(Data, U, Options);
