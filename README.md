# Traffic-Violations

Montgomery County, Maryland, has compiled data on all electronic traffic violations issued within the county. This information includes specific details regarding the nature of the violation, as well as driver demographics such as gender and race.

This project aims to conduct a comprehensive analysis and synthesis of this data to uncover critical insights that will enhance the accuracy and efficiency of law enforcement officers.

Insights and recommendations are provided on the following key areas:

**Trends Analysis**: Evaluation of number of searches and arrests conducted by police officers by year and time to day.
**Demographics Impact on Searches and Arrests** : Impact of Race and gender on the number of searches and arrests.
**Performance Analysis**: Is there a certain demographic that has higher likelihood of getting searched or arrested.

An Interactive Tableau dashboard can be downloaded [here](https://github.com/puhan63/Traffic-Violations/blob/main/Traffic_Violations_Updated.twbx).

**DATA STRUCTURE & INITIAL CHECKS**

**Data Cleaning and Preparation**

The initial dataset contained over 1,048,570 traffic violation records and underwent a series of quality control and preparatory steps before analysis. After cleaning, the final dataset comprised 295,569 records. All operations were performed using the SQL programming language.

**Initial Data Integrity and Quality Control**

**Missing Values and Skewness:** An initial assessment revealed most variables had an approximately normal distribution, while Search_Conducted and Search_Outcome required transformation due to their binary nature.

**Handling Incomplete Records:** Missing data was determined to be structured rather than random. Consequently, any row missing information from several critical columns—specifically Search_Conducted and Search_Outcome, which were central to the analysis objectives—was removed from the dataset which consisted of 297,426 rows.

**Duplicate Records:** Duplicate records were identified using a staging table methodology. A total of 455,575 redundant rows were subsequently deleted to ensure data integrity for analysis.

**Irrelevant Data:** To streamline the dataset and improve processing efficiency, columns that were not relevant to the analysis objectives were removed. Columns with systematically missing data were also excluded.

**Data Standardization and Transformation**

**Standardization:** Data standardization was performed to ensure consistency across the dataset. This included correcting spelling variations and normalizing vehicle model years.

**Car_Year Field:** Entries in the Car_Year field were set to NULL if the year was 0 or implausible, such as a future year.

**Imputation:** Where possible, missing values were inferred from related fields. For instance, the Drive_State was imputed based on the Driver_City.

**Definition and Quantitative Conversion of Key Variables:** Search_Conducted and Search_Outcome were the primary variables of interest for the analysis and were transformed into quantitative variables.

Search_Conducted: This variable indicates whether a search was performed or not. It was converted to a binary scale where yes responses were set to 1 and no responses were set to 0.

Search_Outcome: This variable indicates the result of a search. It was converted to a binary scale where arrests were set to 1 and all other outcomes (citations, SERO, warning, recovered evidence, or null) were set to 0.
