/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Food_Inspection_MidTerm_Dimension_Modelling.DM1
 *
 * Date Created : Sunday, February 25, 2024 00:29:40
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: dim_address 
 */

CREATE TABLE dim_address(
    Address_sk           int            NOT NULL,
    Address              varchar(60)    NULL,
    City                 varchar(10)    NULL,
    State                varchar(10)    NULL,
    Zip_Code             varchar(10)    NULL,
    Latitude             varchar(25)    NULL,
    Longitude            varchar(25)    NULL,
    Created_Dt           date           NULL,
    Workflow_FileName    varchar(50)    NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (Address_sk)
)

go


IF OBJECT_ID('dim_address') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_address >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_address >>>'
go

/* 
 * TABLE: dim_date 
 */

CREATE TABLE dim_date(
    date_sk                         int            NOT NULL,
    date                            date           NULL,
    Full_Date_Description           varchar(50)    NULL,
    Calendar_Day_In_Words           varchar(30)    NULL,
    Day_Of_Week                     int            NULL,
    Calendar_Month                  varchar(10)    NULL,
    Calendar_Year                   int            NULL,
    Day_Number_In_Calendar_Week     int            NULL,
    Day_Number_In_Calender_Month    int            NULL,
    Day_Number_In_Calender_Year     int            NULL,
    Calender_Year_Quarter           int            NULL,
    WeekDay_Indicator               varchar(10)    NULL,
    Fiscal_Year                     varchar(50)    NULL,
    Created_Dt                      date           NULL,
    Workflow_FileName               varchar(50)    NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (date_sk)
)

go


IF OBJECT_ID('dim_date') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_date >>>'
go

/* 
 * TABLE: dim_establishment 
 */

CREATE TABLE dim_establishment(
    Establishment_sk      int            NOT NULL,
    Address_fk            int            NOT NULL,
    Facility_type_fk      int            NOT NULL,
    Establishment_name    varchar(80)    NULL,
    License_Number        varchar(7)     NULL,
    Created               date           NULL,
    Workflow_FileName     varchar(50)    NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (Establishment_sk)
)

go


IF OBJECT_ID('dim_establishment') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_establishment >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_establishment >>>'
go

/* 
 * TABLE: dim_facility_type 
 */

CREATE TABLE dim_facility_type(
    Facility_type_sk     int            NOT NULL,
    Facility_type        varchar(47)    NULL,
    Created_Dt           date           NULL,
    Workflow_FileName    varchar(50)    NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (Facility_type_sk)
)

go


IF OBJECT_ID('dim_facility_type') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_facility_type >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_facility_type >>>'
go

/* 
 * TABLE: dim_inspection_type 
 */

CREATE TABLE dim_inspection_type(
    Inspection_Type_sk    int            NOT NULL,
    Inspection_Type       varchar(41)    NULL,
    Created_Dt            date           NULL,
    Workflow_FileName     varchar(50)    NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (Inspection_Type_sk)
)

go


IF OBJECT_ID('dim_inspection_type') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_inspection_type >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_inspection_type >>>'
go

/* 
 * TABLE: dim_result 
 */

CREATE TABLE dim_result(
    Result_sk            int            NOT NULL,
    Result               varchar(20)    NULL,
    Lower_Limit          int            NULL,
    Upper_Limit          int            NULL,
    Created_Dt           date           NULL,
    Workflow_FileName    varchar(50)    NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (Result_sk)
)

go


IF OBJECT_ID('dim_result') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_result >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_result >>>'
go

/* 
 * TABLE: dim_risk 
 */

CREATE TABLE dim_risk(
    Risk_sk              int            NOT NULL,
    Risk_Score           int            NULL,
    Risk_ctgry           varchar(7)     NULL,
    Risk_num             int            NULL,
    Created_Dt           date           NULL,
    Workflow_FileName    varchar(50)    NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (Risk_sk)
)

go


IF OBJECT_ID('dim_risk') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_risk >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_risk >>>'
go

/* 
 * TABLE: dim_violations 
 */

CREATE TABLE dim_violations(
    Violation_sk             int             NOT NULL,
    Violation_Code           varchar(5)      NULL,
    Violation_Description    varchar(max)    NULL,
    Created_Dt               date            NULL,
    Workflow_FileName        varchar(50)     NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (Violation_sk)
)

go


IF OBJECT_ID('dim_violations') IS NOT NULL
    PRINT '<<< CREATED TABLE dim_violations >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dim_violations >>>'
go

/* 
 * TABLE: fact_inspection 
 */

CREATE TABLE fact_inspection(
    Inspection_sk            int            NOT NULL,
    Inspection_id            int            NULL,
    Total_Violation_Score    int            NULL,
    Establishment_id         int            NOT NULL,
    Violation_id             int            NOT NULL,
    Inspection_Type_id       int            NOT NULL,
    Inspection_Date_id       int            NOT NULL,
    Result_id                int            NOT NULL,
    Risk_id                  int            NOT NULL,
    Created_Dt               date           NULL,
    Workflow_FileName        varchar(50)    NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (Inspection_sk)
)

go


IF OBJECT_ID('fact_inspection') IS NOT NULL
    PRINT '<<< CREATED TABLE fact_inspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE fact_inspection >>>'
go

/* 
 * TABLE: dim_establishment 
 */

--ALTER TABLE dim_establishment ADD CONSTRAINT Refdim_address2 
--    FOREIGN KEY (Address_fk)
--    REFERENCES dim_address(Address_sk)
--go

--ALTER TABLE dim_establishment ADD CONSTRAINT Refdim_facility_type20 
--    FOREIGN KEY (Facility_type_fk)
--    REFERENCES dim_facility_type(Facility_type_sk)
--go


--/* 
-- * TABLE: fact_inspection 
-- */

--ALTER TABLE fact_inspection ADD CONSTRAINT Refdim_establishment11 
--    FOREIGN KEY (Establishment_id)
--    REFERENCES dim_establishment(Establishment_sk)
--go

--ALTER TABLE fact_inspection ADD CONSTRAINT Refdim_violations12 
--    FOREIGN KEY (Violation_id)
--    REFERENCES dim_violations(Violation_sk)
--go

--ALTER TABLE fact_inspection ADD CONSTRAINT Refdim_inspection_type13 
--    FOREIGN KEY (Inspection_Type_id)
--    REFERENCES dim_inspection_type(Inspection_Type_sk)
--go

--ALTER TABLE fact_inspection ADD CONSTRAINT Refdim_date14 
--    FOREIGN KEY (Inspection_Date_id)
--    REFERENCES dim_date(date_sk)
--go

--ALTER TABLE fact_inspection ADD CONSTRAINT Refdim_result15 
--    FOREIGN KEY (Result_id)
--    REFERENCES dim_result(Result_sk)
--go

--ALTER TABLE fact_inspection ADD CONSTRAINT Refdim_risk17 
--    FOREIGN KEY (Risk_id)
--    REFERENCES dim_risk(Risk_sk)
--go


