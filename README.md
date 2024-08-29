# H1B Visa Petitions Data Analysis

# Problem Statement  
With the increasing demand for international talent in the United States, it is important to understand the H1B visa application process and the factors that impact visa approval rates. The H1B Visa Petition dataset contains information on thousands of visa applications, including job positions, industries, employers, and geographic locations. However, the dataset is complex and requires analysis to identify trends and patterns. The problem statement is to use this dataset to gain insights into the H1B visa application process and identify factors that impact visa approval rates, with the goal of improving the visa application process, ensuring compliance with regulations, and facilitating the hiring of international talent. 

![image](https://github.com/Twinkle-Rakesh-Jain/H1BVisaPetitions/assets/159181933/1fbb932e-15f0-4748-8709-3690b8a4230f)

## Project Insights Identified  
Through our analysis of the H1B Visa Petition dataset, we have identified 10 key insights that shed light on various aspects of the H1B visa application process, including approval rates by job position, industry, and geographic location, as well as reasons for petition withdrawals and more.

1.  Which employer had the highest number of certified H1B visa petitions?  
2.	Which employer had the highest number of H1B visa petitions filed?  
3.	In which year were the most H1B visa petitions filed?  
4.	What was the average prevailing wage for H1B visa petitions that were certified/approved?  
5.	What are the top 5 job titles held by employees for H1B visa petitions that were certified or approved?  
6.	Which state and city had the highest number of H1B petition filings between 2011 and 2016?   
7.	What are the top 5 cities and states with the highest number of H1B visa petition filings between 2011 and 2016?  
8.	Among H1B visa petitions that were certified but later withdrawn from 2011 to 2016, which employer had the highest number of such petitions?  
9.	Among H1B visa petitions that were certified but later withdrawn from 2011 to 2016, which 5 employers had the highest number of such petitions?  
10.	Among withdrawn H1B visa petitions from 2011 to 2016, what was the average prevailing wage for the employees named in those petitions?  




# Visualisation Charts

For our visualisation charts, we decided to use Tableau to create few interesting charts.

## 1.Which employer had the highest number of H1B Visa approvals?
<img width="362" alt="image" src="https://github.com/Twinkle-Rakesh-Jain/H1BVisaPetitions/assets/159181933/0c90da42-121f-4402-8b76-eb314aef94fa">

The results are same as MYSQL output with Infosys Limited having the highest number of visa petition approvals 48,626 followed by Tata Consultancy Services Limited, Wipro, Capgemini America Inc etc.

## 2.	What are the top 5 job titles held by employees for H1B visa petitions that were certified or approved?
<img width="369" alt="image" src="https://github.com/Twinkle-Rakesh-Jain/H1BVisaPetitions/assets/159181933/23d9b323-fbdb-4913-85ed-9b639f9f64c2">

The results are consistent as per MYSQL output. The pie chart reveals that the Programmer Analyst position has the highest percentage of H1B visa approvals, accounting for 43% of the total. Software Engineer comes in second with 26% of the approvals. The remaining 31% of the approvals are divided among Computer Programmer, Software Developer, and System Analyst positions. This information provides insight into the most sought-after job positions for H1B visa applicants. 

## 3.	Among withdrawn H1B visa petitions from 2011 to 2016, what was the average prevailing wage for the employees named in those petitions?  
<img width="373" alt="image" src="https://github.com/Twinkle-Rakesh-Jain/H1BVisaPetitions/assets/159181933/538d75d4-a747-4a58-bfae-3594785ed9f0">

The result shown here through visualisation chart is consistent with the result of MYSQL output. When we plotted a line chart to represent the average prevailing wage for each year from 2011-2016 for withdrawn H1B visa petitions, we observed a significant drop from $188,737 in 2011 to $101,184 in 2016. This trend indicates that prevailing wage may not have been the primary contributing factor to the petition withdrawals, and there could be other potential reasons. The average prevailing wage for withdrawn H1B visa petitions from 2011-2016 was found to be $145,066.25.

## 4.	Among all certified H1B visa petitions filed from 2011 to 2016, where was the filing location for the top 5 states with the most approved petitions?
<img width="360" alt="image" src="https://github.com/Twinkle-Rakesh-Jain/H1BVisaPetitions/assets/159181933/265b5b8c-3b6e-4552-abcf-b9dc10a170a7">

The visualisation chart clearly shows that California had the highest number of H1B visa petitions approved, with more than 160,000 petitions filed between 2011 and 2016. This is not surprising given that California is known for its booming tech industry and attracts a large number of international workers in this field. Texas and New York followed next with a significant number of approved petitions, with New Jersey, Illinois and Georgia also making it to the top 5. This information is valuable for employers and employees alike who are looking to understand where the demand for skilled workers is highest in the United States. Employers looking to sponsor H1B visas may consider these states as potential locations for hiring international talent. On the other hand, employees seeking H1B visa sponsorship can use this information to target their job search to these states.  

## 5.	Analysis of H1B VISA Case Status
<img width="360" alt="image" src="https://github.com/Twinkle-Rakesh-Jain/H1BVisaPetitions/assets/159181933/1ded8b6c-20dc-4cb4-b0f9-97da298980ca">

This insight is to gain a better understanding of the H1B visa program and its impact on the job market and the economy. By analysing the count of H1B visa status over time, we can identify trends and patterns that can inform, business strategies, and workforce planning. The data shows that the majority of H1B visa petitions during this period were certified, with a total count of 1,857,963. When analysing, the data, we can see that there was an increasing trend in the count of certified petitions from 2011 to 2016,  In contrast, the count of denied petitions was relatively stable throughout the period, Overall, this insight suggests that there is a high demand for H1B visas among foreign workers who possess specialized skills and knowledge in various fields. However, it also highlights the competitiveness of the H1B visa program, with a significant number of petitions being denied or withdrawn.



## Conclusion
In conclusion, this database project focused on analysing the H1B visa petition dataset from 2011 to 2016. We used SQL queries to extract various insights from the dataset, including the top employers filing for H1B visas, top job titles held by H1B visa holders, states with the highest number of H1B filings, and more.  
To make the analysis more interesting and easier to understand, we used visualizations such as line charts and bar graphs to display the insights. The SQL queries used for this project were specific to the H1B visa petition dataset and allowed us to extract relevant information and insights from the data.  
Overall, this project provides valuable insights into the H1B visa petition process and can be used by various stakeholders, including policymakers, employers, and international job seekers. The visualizations make it easier to understand the trends and patterns in the data, and the SQL queries provide a replicable method for further analysis in the future.  














