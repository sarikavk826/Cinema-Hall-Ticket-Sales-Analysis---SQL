Use hen;

SELECT * FROM hen.cinema_hall_ticket_sales;

SELECT count(*) FROM hen.cinema_hall_ticket_sales;

-- Checking the null

Select * from hen.cinema_hall_ticket_sales
where Ticket_ID is null
or Age is null
or Ticket_Price is null
or Movie_Genre is null
or Seat_Type is null
or Number_of_Person is null
or Purchase_Again is null;

-- Checking the duplicate value

Select  Ticket_ID, Age, Ticket_Price,Movie_Genre, Movie_Genre,Number_of_Person,Purchase_Again , 
count(*) as total_count
from hen.cinema_hall_ticket_sales
group by Ticket_ID, Age, Ticket_Price,Movie_Genre, Movie_Genre,Number_of_Person,Purchase_Again
having total_count > 1;

-- Sales and Revenue Analysis

-- What is the total revenue generated from all ticket sales?
Select sum(Ticket_Price) as "Total Revenue" from hen.cinema_hall_ticket_sales;

-- What is the total count for all tickets ?
Select count(*) as "Total Booked Ticktes" from hen.cinema_hall_ticket_sales;

-- What is the average price of ticket?
Select round(avg(Ticket_Price),2) as "Average Ticket price" from hen.cinema_hall_ticket_sales;

-- Which movie genre generated the highest revenue
Select Movie_Genre, round(sum(Ticket_Price),2) as Total_Revenue
from hen.cinema_hall_ticket_sales
group by Movie_Genre
order by Total_Revenue desc;
# Result: The Horror genre generated the highest revenue among all movie genres

-- What is the average age of customers for each Movie_Genre?
Select Movie_Genre, avg(Age) as Avg_age
from hen.cinema_hall_ticket_sales
group by Movie_Genre
order by Avg_age desc;

-- Which movie genre having highest bookings
Select Movie_Genre, count(*) as total_count
from hen.cinema_hall_ticket_sales
group by Movie_Genre
order by total_count desc;
# Result: Action movies have the highest number of bookings.

-- What is the average ticket price for each Seat_Type?
Select Seat_Type, round(avg(Ticket_Price),2) as Avg_price
from hen.cinema_hall_ticket_sales
group by Seat_Type
order by Avg_price desc;

-- How many tickets were sold for each Seat_Type?
Select Seat_Type, count(*) as Total_count
from hen.cinema_hall_ticket_sales
group by Seat_Type
order by Total_count desc;
#Result - VIP is the most booked seat type.

-- which seat type generated the highest revenue
Select Seat_Type, sum(Ticket_Price) as total_price
from hen.cinema_hall_ticket_sales
group by Seat_Type
order by total_price desc;
#Result - VIP seat type generated the highest revenue.

-- How many customers indicated they would Purchase_Again (“Yes” vs “No”)?
Select Purchase_Again, count(*) as total_count
from hen.cinema_hall_ticket_sales
group by Purchase_Again;
# Result - most customers responded “No”


-- Which age group contributes the most to ticket sales revenue?
Select Age, (round(sum(Ticket_Price),2)) as Total_Revenue
from hen.cinema_hall_ticket_sales
group by Age
order by Total_Revenue desc;
# Result - Customers aged 38 generate the highest total revenue for the cinema hall.

-- What is the average age of customers for each Movie_Genre?
Select Movie_Genre, avg(Age) As Average_age
from hen.cinema_hall_ticket_sales
group by Movie_Genre
order by Average_age desc;

-- Which Movie_Genre has the highest proportion of customers who indicated they would Purchase_Again ('Yes')?
Select Movie_Genre, count(*) as total_count
from hen.cinema_hall_ticket_sales
where Purchase_Again  = "Yes"
group by Movie_Genre
order by total_count desc; 
#result - Horror movies have the highest proportion of customers who said they would Purchase_Again = 'Yes'.

-- Which type of bookings are mostly happening "Alone" and "Group"
with booking_type as (
Select 
case
when Number_of_Person = "Alone" then "Alone"
else "Group" end as Type
from hen.cinema_hall_ticket_sales
)
Select Type, count(*)
from booking_type
group by Type;
#result - Group bookings are higher than individual (“Alone”) bookings

-- What is the average number of persons per booking (Number_of_Person)?
Select avg(case 
when Number_of_Person = 'Alone' then 1
else Number_of_Person end) as  Average_Persons_Per_Booking
from hen.cinema_hall_ticket_sales;

-- Which combination of Movie_Genre and Seat_Type generates the most revenue
Select Movie_Genre, Seat_Type, round(sum(Ticket_Price),2) as Total_Revenue
from hen.cinema_hall_ticket_sales
group by Movie_Genre, Seat_Type
order by Total_Revenue desc;
#Result - The highest revenue comes from customers booking VIP seats for Horror movies.

-- Which age group prefers which Seat_Type the most?
Select age, Seat_Type, count(*) as total_count
from hen.cinema_hall_ticket_sales
group by age, Seat_Type
order by total_count desc;
# Result - Customers aged 38 years show a preference for Standard seats



















