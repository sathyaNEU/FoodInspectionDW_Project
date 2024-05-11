# Food Inspection Visualization Project: Chicago and Dallas
This project focuses on analyzing food inspection data from two cities, Chicago and Dallas, as well as including geographic data from various other regions, states, and cities. The project is structured into four stages, each serving a specific purpose.

# Stage 1: Data Staging
In this stage, the data is staged into a **staging schema in Microsoft SQL Server, hosted locally and in the Azure cloud** for smooth collaboration with our team. **Talend** and **Alteryx** are utilized for staging the data. During staging, certain transformations, such as date formatting, are applied to ensure consistency. Data profiling is conducted using Alteryx Data Profiling tool to understand the schema and data consistency. A unified integration schema is devised to accommodate the differing schemas of both datasets within a single Data Warehouse schema.

# Stage 2: Data Cleaning and Data Warehouse Design
This stage involves data cleaning processes alongside Data Warehouse Design. A specific ETL process is implemented to remove noisy data, such as inspections belonging to areas other than Chicago and Dallas. This is achieved by writing an ETL process to filter out irrelevant data. The cleaned data is then staged again, serving as the input for subsequent ETL processes.

Given that the project serves as an introduction to BI concepts, dimensions are kept as Type 0 and facts are transactional, with the **granularity defined at the transaction level**.


**Physical Model**
![Food_Inspection_MidTerm_Dimension_Modelling](https://github.com/sathyaNEU/FoodInspectionDW_Project/assets/144740003/56c67737-853a-4ebc-84d6-958c9de893f8)

# Stage 3: ETL Processes
ETL processes for all dimensions are developed using **Talend** and executed in this phase. The process successfully loads 100% of the source data into respective facts and dimensions. Details of data consistency checks can be found in the attached PDF document.

# Stage 4: Visualizations
Visualizations are created from the Data Warehouse schema using **Tableau** and **Power BI**. All visualizations are cross-verified using SQL commands (attached as sql_validations.SQL file in the main repository).

**For more information please refer to this document ->** [Food_Inspection_Doc.pdf](https://github.com/sathyaNEU/FoodInspectionDW_Project/files/14487577/Food_Inspection_Doc.pdf)
