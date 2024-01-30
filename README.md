# Pynwb converter
In order to run this program first you need to add install pynwb in your anaconda environment
For more information please refer to the main documentation page https://nwb-overview.readthedocs.io/en/latest/index.html 
You can also refer https://pynwb.readthedocs.io/en/stable/

It's recommended if you have a one of the following python versions - 3.8, 3.9, 3.10, or 3.11 
### 1, Create a virtual conda envirnoment

``` conda create -n pynwb python==3.11```

Activate your conda envirnoment

``` conda activate pynwb ```

### 2, Install pynwb library 

``` pip install -U pynwb ```

Once the pynwb library is installed, it will install these libraries hdmf, h5py, numpy, pandas, python-dateutil.

### 3, Install jupyternote book

``` pip install notebook ```

 ### 4, Run jupyter notebook 

``` jupyter notebook ```

After this step please locate this notebook in your local machine and run the program. 


### Read NWB files
There is a short script written in matlab to read nwb files. 
### 1, clone gihub repo 
```git clone https://github.com/NeurodataWithoutBorders/matnwb.git```
alternatively, download the zip file from github 
```https://github.com/NeurodataWithoutBorders/matnwb```

addpath('.add your path \matnwb-master');

## Example to load nwb file in matlab 
```nwbfile = nwbRead('your path to nwb file \nwb_file.nwb');```

