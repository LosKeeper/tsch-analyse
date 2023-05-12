# TSCH-analyse

## Introduction
The goal of this project is to analyse TSCH protocol and Orchestra implementation.

## Execution
To execute the project, you need one of the following command:
```
sh start_tsch.sh
```
This command will run the simulation for TSCH and Orchestra.
```
sh start_csma.sh
```
This command will run the simulation for CSMA.

## Results
> You have to copy the `macro.sh` file into your `.bashrc` file to use the following command.

* The results are available using the following command:
```
plotConsumption <ID> <Number_Of_Nodes>
plotRadio <ID> <Number_Of_Nodes>
```
>The `ID` is the ID of the node you want to plot the consumption. The `Number_Of_Nodes` is the number of nodes in the simulation.

* To analyse the results and the lost packets, you can use the following command:
```
python3 parsinglostpackets.py
```
> This command will plot the lost packets for each relevant simulation in the `assets` folder.

* The all raw results are available in the `raw-results` folder.
## Authors
* **Thomas DUMOND** 
* **Nicolas CIPOLLA**
