# A Data-Driven Analysis of Traffic Violations, Searches, and Arrest Outcomes in Montgomery County

Montgomery County, Maryland, has compiled data on all electronic traffic violations issued within the county. This information includes specific details regarding the nature of the violation, as well as driver demographics such as gender and race.

This project aims to conduct a comprehensive analysis and synthesis of this data to uncover critical insights that will enhance the accuracy and efficiency of law enforcement officers.

Insights and recommendations are provided on the following key areas:

**Trends Analysis**: Evaluation of number of searches and arrests conducted by police officers by year and time to day.

**Demographics Impact on Searches and Arrests** : Impact of Race and gender on the number of searches and arrests.

**Performance Analysis**: Is there a certain demographic that has higher likelihood of getting searched or arrested.

An Interactive Tableau dashboard can be downloaded [here](https://github.com/puhan63/Traffic-Violations/blob/main/Traffic_Violations_Updated.twbx).

**DATA STRUCTURE & INITIAL CHECKS**

**Data Cleaning and Preparation**

The initial dataset contained over 1,048,570 traffic violation records and underwent a series of quality control and preparatory steps before analysis. After cleaning, the final dataset comprised 295,569 records. All operations were performed using the SQL programming language. The SQL queries used for these inspections are available [here](https://github.com/puhan63/Traffic-Violations/blob/main/Traffic_Violations_Documented_Queries.sql).

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

**EXECUTIVE SUMMARY**

OVERVIEW OF FINDINGS

Police searches peaked in 2013, while arrests reached their highest levels between 2015 and 2016. Searches occurred most frequently at night, followed by the afternoon and then the morning. Arrests showed the same pattern, with the highest numbers recorded at night, followed by the afternoon and morning.

Below is part of the Tableau dashboard reflecting searches and arrests from 2012-2026. More examples are included throughout the report. The entire interactive dashboard can be downloaded [here](https://github.com/puhan63/Traffic-Violations/blob/main/Traffic_Violations_Updated.twbx).

![image](https://github.com/puhan63/Traffic-Violations/blob/main/Traffic_Violations_Image1.png)

ANALYSIS OF DEMOGRAPHICS

**Race:** Black individuals experienced the highest number of searches and arrests, followed by Hispanic and then White individuals.

**Gender:** Males were searched and arrested most frequently, followed by females and those with undefined gender.

![image](https://github.com/puhan63/Traffic-Violations/blob/main/Traffic_Violations_Image2.png)

PERFORMANCE ANALYSIS

Overall, Black and Hispanic males were more likely to be searched or arrested, with higher rates occurring at night across all years.

From 2012 to 2025, Black individuals were consistently searched more often than other groups, except in a few years where searches for Blacks and Hispanics were similar. Arrest patterns varied slightly by year, but Hispanics and Blacks generally had the highest arrest rates, with Whites usually lower.

2012–2014: Blacks and Whites had higher search and arrest rates than Hispanics.

2015–2019: Blacks and Hispanics were most frequently searched and arrested, with Whites trailing.

2020–2024: Blacks continued to be searched the most, while Hispanics often had the highest arrest rates.

2025: Limited data—only one recorded case involving a Black male who was both searched and arrested.

RECOMMENDATIONS

Given the persistent discrepancies in the rates at which Black and Hispanic males are searched and arrested, especially during nighttime hours, the following actions are recommended:

1. Strengthen Documentation and Oversight

Require detailed, standardized documentation for all searches and arrests.

Increase supervisory presence during evening and night shifts, when disparities are most pronounced.

Conduct regular reviews to identify officers or departments that exceed established thresholds for searches or arrests involving specific demographic groups.

2. Assess and Address Potential Bias

Evaluate individual officers and departments for unconscious bias and cultural competence using validated psychological tools (e.g., Implicit Association Test [IAT], Matrix-Predictive Uniform Law Enforcement Selection Evaluation [M-PULSE], or California Psychological Inventory [CPI]).

Use assessment results to identify individuals who may be at higher risk for biased decision-making or misconduct.

3. Provide Targeted Training and Support

Deliver cultural-competence training, mentoring, or corrective coaching to stations or officers who exceed disparity thresholds.

Offer additional decision-making and accountability training for officers working high-disparity time periods such as night shifts.

4. Enhance Transparency and Accountability

Conduct random audits of body-worn camera footage.

Evaluate the consistency between policies, officer actions, body-camera footage, and associated data to ensure compliance.

FUTURE RECOMMENDATIONS

To deepen insights and strengthen the analytical impact of this project, several enhancements and extensions are recommended:

1.	Location-Based Aggregation
Group similar locations (e.g., neighborhoods, precincts, or road types) to uncover broader geographic trends and patterns that may not be visible at the individual stop level.

2.	Advanced Statistical Modeling
Move beyond exploratory analysis by conducting inferential modeling, such as logistic regression, to estimate the likelihood of a search or arrest.
o	Outcome variables: search_conducted, search_outcome
o	Predictor variables: race, gender, time of day, year, violation type, and vehicle year

3.	Dataset Expansion
Enhance the dataset by incorporating additional contextual variables that may influence outcomes, including:
o	Weather conditions
o	Road type (highway vs. local roads)
o	Officer characteristics (years of experience, rank, gender, race, and prior reprimands)

4.	Interactive Dashboard Development
Create a live, interactive dashboard to monitor trends in real time, enabling stakeholders to quickly identify emerging patterns and anomalies.

5.	Quarterly Trend Analysis
Conduct quarterly analyses to assess short-term changes and disparities, allowing for timely interventions and policy adjustments.

6.	Public Data Transparency
Make the dataset and data collection methodology publicly available to promote transparency, accountability, and community trust.

7.	Pre- and Post-Policy Evaluation
Perform pre- and post-implementation analyses following new policies or training initiatives to evaluate their effectiveness in reducing disparities in searches and arrests.

8.	Controlled Modeling for Bias Assessment
Develop models that control for key variables (e.g., time of day, violation type) to assess whether demographic factors such as race and gender remain significant predictors of search and arrest outcomes.
