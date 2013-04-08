%--------------------------------------------------------------------------
% FILEPATHS -> File location. 
%--------------------------------------------------------------------------
FilePaths = {...
%     '/homes/abiasiuc/Desktop/Sub15/AR/Sub15.20111212.133013.offline.mi.mi_rlrest.gdf'...
   '/homes/abiasiuc/Desktop/Sub33/AR/Sub33.20120113.114835.offline.mi.mi_rlrest.gdf'...
};

%--------------------------------------------------------------------------
% PRESETS -> Trains a Classifier using these features, only. 
%--------------------------------------------------------------------------
presets.channels = [7 8 10 11 13 15];
presets.bands = {...           
                            [] ...
           []        []     []    []        [] ...
        [8 10 12] [8 10 12] [] [8 10 12] [8 10 12] ... 
           []      [10 12]  []  [10 12]     [] ...
           };

eegc3_smr_autotrain(FilePaths,presets);