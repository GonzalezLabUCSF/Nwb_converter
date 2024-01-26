% Access nwb files in matlab

% Add the matnwb directory(if it can't be accessable from this
% computer clone the gihub repo - git clone https://github.com/NeurodataWithoutBorders/matnwb.git
% alternatively download the zip file from github - https://github.com/NeurodataWithoutBorders/matnwb)

addpath('C:\Users\Michael\Documents\Code\matnwb-master');

%load the nwb file
nwbfile = nwbRead('A:\nwb_B119_chronic_NPIX\2021-04-16_19-59-23\nwb_file.nwb');

%To better visualize all the data inside the nwb file use nwbTree widget - It will open a separate dialogue 
util.nwbTree(nwbfile);

% access subject information
nwbfile.general_subject

% Information about the experiment
nwbfile.general_experiment_description

% recording device
nwbfile.general_devices

% record date
nwbfile.session_start_time

% institution and Lab information
nwbfile.general_institution
nwbfile.general_lab

% To access acquisations (all recording data)
nwbfile.acquisition

% Access segment of a data
AP_data = nwbfile.acquisition.get('AP ElectricalSeries').data;
file_size = AP_data.dims;
FS = 30000;
num_channels = 384;
samples=int64(file_size/2/num_channels);

samples_atonce = num_channels*3000;
%Data = AP_data(1:num_channels*FS);
Data = -0.195*single(AP_data(1:samples_atonce));
reshaped_data = reshape(Data,[num_channels,samples_atonce/num_channels]);

% load original to cross check
filepath = 'A:\B119_chronic_NPIX\2021-04-16_19-59-23\experiment1\recording1\continuous\Neuropix-PXI-100.0';
contFile = fullfile(filepath,'continuous.dat');
Data_original = memmapfile(contFile,'format','int16');

Data_orig = -0.195*single(Data_original.Data(1:samples_atonce));
reshaped_data_orignal = reshape(Data_orig,[num_channels,samples_atonce/num_channels]);

difference = reshaped_data - reshaped_data_orignal;

subplot(2,2,1)
imagesc(reshaped_data);
title('from nwb')

subplot(2,2,2)
imagesc(reshaped_data_orignal);
title('original data')

subplot(2,2,3)
imagesc(difference); 
title('Difference of the two')

% save part of the data as a binary file
file_id= fopen('D:\testing_first\binary_test_file.dat','w');
fwrite(file_id,reshaped_data ,'int16');
fclose(file_id);


%once everything is finished
nwbfile.close(); %% not the write way in matlab -- check how to close hdf5 files in matlab


% what should work
AP_data = nwbfile.acquisition.get('AP ElectricalSeries').data;
file_size = AP_data.dims;
FS = 30000;
num_channels = 384;
%samples=int64(file_size/num_channels);
samples = int64(file_size/num_channels);

% might crash loading all data at once
all_data = nwbfile.acquisition.get('AP ElectricalSeries').data.load();
reshape_all_data = reshape(all_data,[num_channels,samples]);

% save ap data as binary
file_id= fopen('D:\testing_first\AP_binary_to_test_kilosort.dat','w');
fwrite(file_id,all_data ,'int16');
fclose(file_id);





