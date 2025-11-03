# SAS-based Analysis of Hospital Length of Stay Across Insurance Groups
  
  
## Project Intro/Objective
This analysis examines whether hospital length of stay varies by insurance type in the MIMIC-IV admissions dataset. The goal is to understand if certain insurance categories are associated with longer or shorter hospital stays, while controlling for patient and admission characteristics.

  
## Dataset
The dataset used for this project is part of the MIMIC-IV collection of EHR data. Due the the credentialing process to access the data, including completing human subjects protection and HIPAA training as well as signing a Data Use Agreement, I am unable to share the dataset here.
  
  
## Authors
**Bryan Jacobs**    
  
  
## Languages/Packages:
* SAS
  * PROC GLM
  * PROC SGPLOT 
  
  
## Software & Platforms
* SAS


## Models & Methods
* Linear Regression
* Analysis of Covariance
* Frequency Tables
* Descriptive Means
* Boxplot
  
  
## Repository Structure
- **`code/`**: Contains `.sas` file for data preparation, EDA, linear regression model and associated visualizations.
- **`deliverables/`**: Contains `.pdf` file of final report.
- **`README.md`**
  
  
## How To Run
#### For Simple Viewing
1. Download and open `.pdf` file from the `deliverables/` folder.

#### To Run Script
1. ACCESS TO MIMIC-IV DATA IS REQUIRED TO RUN THIS SCRIPT.
2. Download admissions.csv from MIMIC-IV.
3. Adjust file paths in script to align with location of your admissions.csv.
4. Run the script.
