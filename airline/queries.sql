-- 1. Get the total number of flights in the database
SELECT COUNT(*) AS total_flights
FROM flight;

-- 2. Get the average flight distance
SELECT AVG(flight_mileage) AS average_flight_distance
FROM flight;

-- 3. Get the average number of seats per aircraft
SELECT AVG(capacity) AS average_seats
FROM aircraft;

-- 4. Get the average number of miles flown by customers grouped by status
SELECT 
  c.status,
  AVG(cf.total_mileage) AS avg_mileage
FROM 
  customers c
LEFT JOIN 
  customer_flight cf ON cf.customer_id = c.id
GROUP BY 
  c.status;

-- 5. Get the maximum number of miles flown by customers grouped by status
SELECT 
  c.status,
  MAX(cf.total_mileage) AS max_mileage
FROM 
  customers c
LEFT JOIN 
  customer_flight cf ON cf.customer_id = c.id
GROUP BY 
  c.status;

-- 6. Get the total number of aircraft with a name containing 'Boeing'
SELECT COUNT(*) AS total_aircraft_boeing
FROM aircraft
WHERE aircraft_type LIKE '%Boeing%';

-- 7. Find all flights with a distance between 300 and 2000 miles
SELECT flight_number
FROM flight
WHERE flight_mileage BETWEEN 300 AND 2000;

-- 8. Find the average flight distance booked grouped by customer status (requires JOIN)
SELECT 
  c.status,
  AVG(f.flight_mileage) AS avg_flight_distance
FROM 
  customers c
JOIN 
  customer_flight cf ON cf.customer_id = c.id
JOIN 
  flight f ON f.flight_number = cf.flight_number
GROUP BY 
  c.status;

-- 9. Find the most often booked aircraft by Gold status members (requires JOIN)
SELECT 
  a.aircraft_type, 
  COUNT(*) AS bookings
FROM 
  customers c
JOIN 
  customer_flight cf ON cf.customer_id = c.id
JOIN 
  flight f ON f.flight_number = cf.flight_number
JOIN 
  aircraft a ON f.aircraft_id = a.id
WHERE 
  c.status = 'Gold'
GROUP BY 
  a.aircraft_type;
