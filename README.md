# Traffic-Violations

Montgomery County, Maryland, has compiled data on all electronic traffic violations issued within the county. This information includes specific details regarding the nature of the violation, as well as driver demographics such as gender and race.

This project aims to conduct a comprehensive analysis and synthesis of this data to uncover critical insights that will enhance the accuracy and efficiency of law enforcement officers.

Insights and recommendations are provided on the following key areas:

**Trends Analysis**: Evaluation of number of searches and arrests conducted by police officers by year and time to day.
**Demographics Impact on Searches and Arrests** : Impact of Race and gender on the number of searches and arrests.
**Performance Analysis**: Is there a certain demographic that has higher likelihood of getting searched or arrested.

An Interactive Tableau dashboard can be downloaded here.

**DATA STRUCTURE & INITIAL CHECKS**

The Traffic Violations dataset comprises a single table containing over 2,052,875 records. Before initiating the analysis, a series of quality control procedures and exploratory checks were conducted to ensure data integrity and build familiarity with the dataset. The MySQL Workbench quieries used for these inspections and validations are available here.

Data quality issues were identified in several columns, with missing values appearing to follow a structured rather than random pattern. To address this, columns with systematically missing data were removed. A staging table was then created to identify and eliminate duplicate records.

Next, data standardization was performed to ensure consistency across the dataset. This included correcting spelling variations and normalizing vehicle model years. Entries in the Car_Year field were set to NULL when the year was recorded as 0 or was implausible (e.g., future years such as 2026).

Missing values were further assessed, and where possible, inferred using related fields (for example, imputing the Drive_State based on the Driver_City). Additionally, columns deemed irrelevant to the analysis objectives were excluded to streamline the dataset and improve processing efficiency.
