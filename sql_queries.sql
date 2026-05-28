CREATE DATABASE Ola;
USE Ola;

SELECT * FROM bookings;


--  Questions:
-- OLA Data Analyst Project
-- 1. Retrieve all successful bookings:
CREATE VIEW Successful_Bookings AS
SELECT * FROM bookings WHERE Booking_Status = 'Success';
-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS 
SELECT Vehicle_Type, Avg(Ride_Distance) AS 'Average Ride diatnce per vehicle' FROM bookings
GROUP BY Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers:

CREATE VIEW canceled_rides_by_customers AS
SELECT COUNT(*) 
FROM bookings
WHERE Booking_Status = 'Canceled by Customer';




-- 4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customerss As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW Rides_Canceled_by_Drivers_P_C_Issues AS
SELECT COUNT(*) 
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_Min_Driver_Rating AS
SELECT 
MAX(Driver_Ratings) AS max_rating,
MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';
-- 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_Payment AS
SELECT * 
FROM bookings
WHERE Payment_Method = 'UPI';
-- 8. Find the average customer rating per vehicle type:
CREATE VIEW AVG_Cust_Rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;
-- 9. Calculate the total booking value of rides completed successfully:
CREATE VIEW total_successful_ride_value AS
SELECT SUM(Booking_Value) AS total_successful_ride_value
FROM bookings
WHERE Booking_Status = 'Success';
-- 10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';