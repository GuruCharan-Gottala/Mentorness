select * from hotel;

# 1. What is the total number of reservations in the dataset?
select count(*) from hotel;

# 2. Which meal plan is the most popular among guests?
select type_of_meal_plan as tp,count(*) as cnt 
from hotel
group by type_of_meal_plan
order by cnt desc
limit 1;

# 3. What is the average price per room for reservations involving children?
select avg(avg_price_per_room) 
from hotel h
where (no_of_children > 0);

# 4. How many reservations were made for the year 20XX (replace XX with the desired year)?
select count(*) 
from hotel h
where year(arrival_date) = 2017;

# 5. What is the most commonly booked room type?
select room_type_reserved as tp,count(*) as cnt 
from hotel
group by room_type_reserved
order by cnt desc
limit 1;

# 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
select sum(no_of_weekend_nights) 
from hotel h
where (no_of_weekend_nights > 0);

# 7. What is the highest and lowest lead time for reservations?
select max(lead_time) as max,min(lead_time) as min
from hotel h;

# 8. What is the most common market segment type for reservations?
select market_segment_type,count(*) as c
from hotel h
group by market_segment_type
order by market_segment_type desc
limit 1;

# 9. How many reservations have a booking status of "Confirmed"?
select booking_status,count(*) 
from hotel
where booking_status = 'Not_Canceled';

# 10. What is the total number of adults and children across all reservations?
select sum(no_of_children) as children,sum(no_of_adults) as adults
from hotel h;

# 11. What is the average number of weekend nights for reservations involving children?
select avg(no_of_weekend_nights) from 
(select * 
from hotel h
where no_of_children > 0
) as c;

# 12. How many reservations were made in each month of the year?
select month(arrival_date) as Months,count(Booking_ID) 
from hotel h
group by month(arrival_date)
order by  month(arrival_date) asc;

# 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select room_type_reserved,count(*),avg(no_of_week_nights) as week_nights,avg(no_of_weekend_nights) as weeknd_nights
from hotel
group by room_type_reserved;

# 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
select room_type_reserved,count(room_type_reserved) as cnt,round(avg(avg_price_per_room),2) as average_price_of_room_type 
from hotel 
where no_of_children > 0
group by room_type_reserved
order by cnt desc
limit 1;

# 15. Find the market segment type that generates the highest average price per room
select market_segment_type,count(market_segment_type) as cnt,avg(avg_price_per_room) as avg_genrated_price
from hotel
group by market_segment_type
order by avg_genrated_price desc
limit 1;