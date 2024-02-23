# NIE_Enzyme_Model_Shared
This GitHub repository contains the COMSOL Multiphysics model we illustrated in our paper "Single-Entity Protein Electrochemistry of Diffusion-Limited Enzymes". 
It consists of the model files and corresponding Livelink Matlab script with the random walk script for the enzyme and electrode surface distance calculation.
## Authors 

- Ziwen Zhao [@ziwzh166](https://github.com/ziwzh166)
- Nikolaos Kostopoulos [@ngkostop ](https://github.com/ngkostop)
- Sagar Ganguli [@gangulisagar](https://github.com/gangulisagar)
- Paul Bergstrom
- Alina Sekretareva*[@alina-sekretareva](https://github.com/alina-sekretareva)

## Installation 

Please make sure you have the following modules available in your COMSOL Multiphysics:
``` Chemical Species Transport
    Mathematics
    Livelink for MATLAB
```
## To start in COMSOL Multiphysics
You can directly open the .mph file in COMSOL Multiphysics, the model is default set for catalase. If you want to change the enzyme, please change the parameters in the model accordingly.
## To start in LiveLink for MATLAB
You probably need to read the documentation of COMSOL Multiphysics to launch the server according to the system you used and link MATLAB with COMSOL Multiphysics. After the connection, you can directly run the function by imputing a distance value(in $\mu$ m), it will output a current value(in A) in MATLAB.
```matlab
CalI_linelink(5/1000) 
% current at 5 nm distance between the enzyme and the electrode
```
## Random walk script
The random walk script is used to calculate the distance between the enzyme and the electrode surface. The script is written in MATLAB and can be run in MATLAB. The script will generate ten random walks at once, meanwhile at which step on which trajectory that enzyme collides on the electrode is printed and you can choose the number of the cell to see the corresponding trajectory of the enzyme. you can perform the parametric study in COMSOL by changing the parameter x simulated in the script to output the corresponding current output in COMSOL or use the generated trajectory in a loop to calculate the current by CalI_linelink in MATLAB. it is suggested using try and catch in the loop to avoid the error COMSOL can not select the enzyme diffusion channel since the dimension is small.

