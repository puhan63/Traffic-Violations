# Traffic-Violations

Montgomery County, Maryland, has compiled data on all electronic traffic violations issued within the county. This information includes specific details regarding the nature of the violation, as well as driver demographics such as gender and race.

This project aims to conduct a comprehensive analysis and synthesis of this data to uncover critical insights that will enhance the accuracy and efficiency of law enforcement officers.

Insights and recommendations are provided on the following key areas:

**Trends Analysis**: Evaluation of number of searches and arrests conducted by police officers by year and time to day.
**Demographics Impact on Searches and Arrests** : Impact of Race and gender on the number of searches and arrests.
**Performance Analysis**: Is there a certain demographic that has higher likelihood of getting searched or arrested.

An Interactive Tableau dashboard can be downloaded here.

**DATA STRUCTURE & INITIAL CHECKS**

**Data Cleaning and Preparation**

The initial dataset contained over 2,052,875 traffic violation records and underwent a series of quality control and preparatory steps before analysis.After cleaning, the final dataset comprised 594,734 records.

**Initial Data Integrity and Quality Control**

**Missing Values and Skewness:** An initial assessment of the data revealed that most variables had an approximately normal distribution, with the exceptions of Search_Conducted and Search_Outcome, which were transformed. Missing data was found to be structured rather than random.

**Duplicate Records:** A staging table was used to identify and remove duplicate records from the dataset.

**Irrelevant Data:** To streamline the dataset and improve processing efficiency, columns that were not relevant to the analysis objectives were removed. Columns with systematically missing data were also excluded.

**Data Standardization and Transformation**

**Standardization:** Data standardization was performed to ensure consistency across the dataset. This included correcting spelling variations and normalizing vehicle model years.

**Car_Year Field:** Entries in the Car_Year field were set to NULL if the year was 0 or implausible, such as a future year.

**Imputation:** Where possible, missing values were inferred from related fields. For instance, the Drive_State was imputed based on the Driver_City.

**Definition and Quantitative Conversion of Key Variables:** Search_Conducted and Search_Outcome were the primary variables of interest for the analysis and were transformed into quantitative variables.

Search_Conducted: This variable indicates whether a search was performed or not. It was converted to a binary scale where yes responses were set to 1 and no responses were set to 0.

Search_Outcome: This variable indicates the result of a search. It was converted to a binary scale where arrests were set to 1 and all other outcomes (citations, SERO, warning, recovered evidence, or null) were set to 0.
