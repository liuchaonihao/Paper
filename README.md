# TPSVR-HGN
1. Abstract
   
Twin proximal support vector regression, a novel approach, merges twin support vector regression (TSVR) with proximal support vector regression (PSVR) for regression analysis. Classical PSVR and TSVR assume that the data noise follows a homoscedastic Gaussian distribution with zero mean. However, in the real world, like predicting short-term wind speed and assessing fatigue crack, noise tends to follow a heteroscedastic Gaussian distribution with zero mean. Therefore, based on the aforementioned model framework and added the heteroscedastic noise feature, we develope a novel regression model named the twin proximal support vector regression model with heteroscedastic Gaussian noise (TPSVR-HGN). The Augment Lagrange multiplier approach is used to solve the proposed TPSVR-HGN model.

2. Installation

Set up a Matlab environment for R2016a version

3. Datasets

You can download the dataset by referring to the URL.

https://github.com/liuchaonihao/Paper.git

4. Training

Run mulphrdemo.m

# Application
MATLAB Compiler

1. Prerequisites for Deployment 

. Verify the MATLAB Runtime is installed and ensure you    
  have installed version 9.0.1 (R2016a).   

. If the MATLAB Runtime is not installed, do the following:
  (1) enter
  
      >>mcrinstaller
      
      at MATLAB prompt. The MCRINSTALLER command displays the location of the MATLAB Runtime installer.

  (2) run the MATLAB Runtime installer.

      Or download the Windows 64-bit version of the MATLAB Runtime for R2016a from the MathWorks Web site by navigating to http://www.mathworks.com/products/compiler/mcr/index.html
      
For more information about the MATLAB Runtime and the MATLAB Runtime installer, see Package and Distribute in the MATLAB Compiler documentation in the MathWorks Documentation Center.    


NOTE: You will need administrator rights to run MCRInstaller. 


2. Files to Deploy and Package

Files to package for Standalone 
================================
-Gui.exe

-MCRInstaller.exe 
   
   -if end users are unable to download the MATLAB Runtime using the above link, include it when building your component by clicking the "Runtime downloaded from web" link in the Deployment Tool

-This readme file 

3. Definitions

For information on deployment terminology, go to http://www.mathworks.com/help. Select MATLAB Compiler >  Getting Started > About Application Deployment > Deployment Product Terms in the MathWorks Documentation Center.

