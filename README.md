# NIE_Enzyme_Model_Shared
It's a model of COMSOL Multiphysics we illustrated in the paper 
This repo contains the model files and corresponding Livelink matlab script with the random walk script for the enzyme and electrode surface distance calculation.
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
You probably need to read the documentation of COMSOL Multiphysics to launch the server accordingly to the system you used and link the MATLAB with COMSOL Multiphysics. After the connection you can directly run the script in MATLAB and the model will be launched in COMSOL Multiphysics and you will have the model in the working space in MATLAB for extracting plots etc.
## Random walk script
The random walk script is used to calculate the distance between the enzyme and the electrode surface. The script is written in MATLAB and can be run in MATLAB. The script will generate ten random walks at once, meanwhile at which step on which walk that enzyme collide on the electrode is printed and you can choose the number of the cell to see the corresponding trajectory of the enzyme. you can perform the parametric study in COMSOL by changing the parameter x simulated in the script to output the corresponding current output in COMSOL.

