-- Viz verification by SQL


-- Q1  No of Inspections by result category
select result_id, count(distinct(Inspection_id)) from fact_inspection group by Result_id  


-- Q2 No of Inspections for each year
select b.Calendar_Year, count(distinct(Inspection_id)) cnt from fact_inspection a
join 
dim_date b
on a.Inspection_Date_id = b.date_sk
group by b.Calendar_Year
order by cnt desc

--Q3 -- No of violations for each restaurant
select b.Establishment_name,count(Violation_id) cnt, count(distinct Establishment_id) cnt2 from fact_inspection a
join
dim_establishment b
on
a.Establishment_id = b.Establishment_sk
where Violation_id!=1
group by b.Establishment_name
order by cnt desc


--Q4 --No of establishments
select count(distinct Establishment_name) from dim_establishment --organization
select count(distinct Establishment_sk) from dim_establishment  --branch


--Q5 --No of facilities
select count(Facility_type_sk) facility from dim_facility_type


--Q6 -- No of inspections by Zip Code
select c.Zip_Code, count(distinct(Inspection_id)) cnt from fact_inspection a
join
dim_establishment b on a.Establishment_id = b.Establishment_sk
join
dim_address c on b.Establishment_sk = c.Address_sk
group by c.Zip_Code
order by cnt desc

--Q7 No of inspections by risk
select risk_id, count(distinct(Inspection_id)) from fact_inspection group by Risk_id 


--Q8 Top and Bottom 10 Restaurants by violation score
select top 10 Inspection_id, Establishment_id, b.Establishment_name, Total_Violation_Score from fact_inspection a
join dim_establishment b on a.Establishment_id = b.Establishment_sk
group by Inspection_id, Total_Violation_Score, Establishment_id, b.Establishment_name 
order by Total_Violation_Score desc, Inspection_id, Establishment_id, b.Establishment_name

select top 10 Inspection_id, Establishment_id, b.Establishment_name, Total_Violation_Score from fact_inspection a
join dim_establishment b on a.Establishment_id = b.Establishment_sk
group by Inspection_id, Total_Violation_Score, Establishment_id, b.Establishment_name 
order by Total_Violation_Score , Inspection_id, Establishment_id, b.Establishment_name






