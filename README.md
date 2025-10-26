# 🐾 Dangerous Dog Orders in Toronto (2017–2024)

This project analyzes dangerous dog orders issued by the City of Toronto between 2017 and 2024, using open municipal data. By visualizing and interpreting yearly trends, bite severity, and incident locations, the research highlights a positive trend in dog-related attacks since 2022 and discusses possible policy and community responses.

#### 🎯 Research Objective

This study aims to:

1. Examine the frequency and severity of dangerous dog orders issued in Toronto from 2017–2024.

2. Identify where and under what circumstances these incidents occur most often.

3. Provide context and insight into the upward trend in incidents, particularly after 2022, and propose possible actions to improve public safety.

The motivation behind this analysis is to shed light on a small but important public safety issue that is often overlooked — understanding the behavioral, environmental, and policy-related factors contributing to dog attacks in an urban setting.

## 🧾 Research Design & Methodology

This paper is a descriptive and exploratory data analysis, not a predictive model. It uses official records from the City of Toronto to understand the nature of dog bite incidents and their evolution over time.

 - Software Used: R (v4.3.0)
 - Packages: tidyverse, ggplot2, dplyr, janitor, lubridate, and testthat
 - Data Source: Registry of Dogs Subject to and Issued a Dangerous Dog Order — Open Data Toronto

#### Dataset Description

 - Registry of Dogs Subject to and Issued a Dangerous Dog Order
   - Updated monthly by the City of Toronto
   - Includes all active dangerous dog orders from February 2017 to September 2024
   - Contains 354 valid records (3 null entries excluded)

#### Variables include:

 - Date of Incident
 - Ward Number & Name
 - Forward Sortation Area (FSA)
 - Location Type (e.g., owner’s property, park, public property)
 - Dog Breed, Color, and Name
 - Severity (Not a Bite, Non-Severe, Severe, Very Severe)

#### 📊 Data Processing & Definitions

Severity Classification (as defined by Municipal Licensing & Standards):

 - Not a Bite: Menacing behavior (snarling, lunging) without skin contact.
 - Non-Severe: Minor contact causing abrasions or redness.
 - Severe: Deep punctures or lacerations (>½ of canine tooth depth).
 - Very Severe: Multiple deep wounds or repeated attacks.

Location Classification:

 - Owner’s Property
 - Other’s Private Property
 - Public Property
 - Park (Leash-Free Area)
 - Park (Leash-Required Area)

## 🔍 Discussion & Insights

According to the charts on pages 5–6 of the paper, the number of total incidents and severe incidents show a clear upward trajectory from 2022 to 2024, supported by scatter plots with positive lines of best fit (Figures 7–8)

 - The upward trend since 2022 may result from:
   - Toronto’s growing population and corresponding rise in pet ownership.
   - Inconsistent follow-up on removing dogs from the registry after initial incidents.
   - Changes in reporting behavior, as awareness of the reporting process increases.
 - Public spaces, rather than parks, account for most severe incidents — likely due to unfamiliar settings and unpredictable interactions between dogs and pedestrians.
 - Ward 14, despite being a higher-income area, shows the highest incident frequency, possibly linked to denser pet ownership and access to dog-friendly spaces.
 - These results highlight the need for stronger leash enforcement, public education, and improved data transparency to monitor high-risk areas and behaviors

## 📁 File Structure

The repo is structured as:

-   `data` contains the raw data and analysis data obtained after cleaning. Analysis data is the final data used in this paper.
-   `other` contains relevant details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, clean, and test the data.


#### Statement on LLM usage

Aspects of the code were written with the help of ChatGPT. Elements of constructing the figures and graphs used in this paper were made possible by the help of ChatGPT. As well as some advice of some of the written elements. 
