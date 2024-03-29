
function settings = eegc3_smr_newsettings(settings)
%
% function settings = eegc3_smr_newsettings()
%
% Function to create default settings structure for the SMR CNBI BCI
%
% Inputs: 
%
% None
%
% Outputs:
%
% settings: MATLAB structure holding settings information about feature
% extraction, feature selection, classification as well as the classifier
% parameters for a CNBI classifier. This function prepares the default
% settings for the SMR BCI
%



% Default gTec SMR BCI
settings.acq.id = 501;
settings.acq.sf = 512;

%% gUSBAmp - Motor Imagery - Cybathlon 14 EEG + 2 EOG (Fp1 and Fp2)
%settings.acq.channel_lbl = {'Fz', 'FC3', 'FC1', 'FCz', 'FC2', 'FC4', 'C3',...
%				            'C1', 'Cz', 'C2', 'C4', 'Fp1', 'CP1', 'CPz', ...
%                           'CP2', 'Fp2'};
                        
% % gUSBAmp - Motor Imagery - 16 EEG
% settings.acq.channel_lbl = {'Fz', 'FC3', 'FC1', 'FCz', 'FC2', 'FC4', 'C3',...
%                              'C1', 'Cz', 'C2', 'C4', 'CP3', 'CP1', 'CPz', ...
%                              'CP2', 'CP4'};

%% AntNeuro Motor Imagery - 32 EEG
settings.acq.channel_lbl = {'FP1', 'FP2', 'FZ', 'FC5', 'FC1', 'FC2', 'FC6',  'C3',  'CZ', ... 
                'C4', 'CP5', 'CP1', 'CP2', 'CP6',  'P3', 'Pz',  'P4',  'F1', ... 
                'F2', 'FC3', 'FCZ', 'FC4', 'C5',  'C1',  'C2',  'C6', 'CP3', ...
               'CP4',  'P5',  'P1', 'P2',  'P6'};
                         
settings.acq.channels_eeg = length(settings.acq.channel_lbl);
settings.acq.channels_tri = 1;

settings.modules.smr.options.prep.dc  			= false;
settings.modules.smr.options.prep.car 			= false;
settings.modules.smr.options.prep.laplacian		= true;
settings.modules.smr.options.extraction.trials 		= false;
settings.modules.smr.options.extraction.fast 		= true;
settings.modules.smr.options.selection.dpt   		= false;
settings.modules.smr.options.selection.cva   		= true;
settings.modules.smr.options.selection.stability	= true;	
settings.modules.smr.options.selection.norm     	= false;
settings.modules.smr.options.selection.usegui		= true;
settings.modules.smr.options.classification.norm  	= false;
settings.modules.smr.options.classification.gau  	= true;
settings.modules.smr.options.classification.lda  	= false;
settings.modules.smr.options.classification.sep  	= false;
settings.modules.smr.options.classification.single 	= false;

settings.modules.wp4.datatype = 0;

% settings.modules.smr.montage = 				[0 0 1 0 0; ...
% 	 						1 1 1 1 1; ...
% 	 						1 1 1 1 1;...
%      							1 1 1 1 1];

settings.modules.smr.montage = eegc3_channels2montage(settings.acq.channel_lbl);

settings.modules.smr.laplacian = ...
	eegc3_montage(settings.modules.smr.montage);

settings.modules.smr.win.size 		= 1.00;
settings.modules.smr.win.shift		= 0.0625;

settings.modules.smr.psd.freqs		= [4:2:48];
settings.modules.smr.psd.win 		= 0.50;
settings.modules.smr.psd.ovl 		= 0.50;

settings.modules.smr.dp.threshold	= 0.50;

settings.modules.smr.gau.somunits 	= [1 1]; % QDA-style
settings.modules.smr.gau.sharedcov 	= 'f'; % No difference anyway
settings.modules.smr.gau.epochs 	= 20;
settings.modules.smr.gau.mimean		= 0.0001;
settings.modules.smr.gau.micov		= 0.00001;
settings.modules.smr.gau.th		= 0.70;
settings.modules.smr.gau.terminate	= true;

% LDA settings
settings.modules.smr.lda.priors	= [0.5 0.5];
settings.modules.smr.lda.loss	= [0 1;1 0];
settings.modules.smr.lda.fstd	= 1;
settings.modules.smr.lda.shrink	= true;
settings.modules.smr.lda.reject	= true;

% Sep settings
settings.modules.smr.sep.priors	= [0.5 0.5];
settings.modules.smr.sep.loss	= [0 1;1 0];
settings.modules.smr.sep.reject	= true;
settings.modules.smr.sep.shrink	= true;
settings.modules.smr.sep.rej_th	= 2.0;

settings.modules.smr.sep.priors	= [0.5 0.5];
settings.modules.smr.sep.loss	= [0 1;1 0];
settings.modules.smr.single.rej_th	= 2.0;


settings.bci.smr.channels  = [];
settings.bci.smr.bands     = {};
settings.bci.smr.gau.M   = [];
settings.bci.smr.gau.C   = [];


% GDF Files used for this classifier
settings.bci.smr.trace.Paths = {};

% Taskset (modality) of this classifier
settings.bci.smr.taskset.modality = '';
settings.modules.smr.taskset.classes  = [0 0];
