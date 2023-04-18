-- Question 1: How many actors are there with the last name 'Wahlberg'?
select COUNT(LAST_NAME)
from actor
where LAST_NAME like 'Wahlberg';
-- (Answer: 2)

-- Question 2: How many payments were made between $3.99 and $5.99?
select COUNT(AMOUNT)
from PAYMENT
where AMOUNT >= 3.99 and AMOUNT <= 5.99;
-- (Answer: 0)

-- Question 3: What film does the store have the most of?(search inventory)
select COUNT(FILM_ID), FILM_ID
from inventory
GROUP by FILM_ID
order by COUNT(FILM_ID) DESC;
-- (Answer: film_id: 193, 789, 730, 378, 595, 849, 231, 586, 69, 764,745, 1, 767, 369, 738, 638, 31,
-- 356, 199, 683, 127, 609, 403, 174, 266, 109, 434, 220, 239, 873, 893, 468, 525, 897, 697, 835, 773,
-- 945, 444, 412, 880, 846, 331, 911, 621, 301, 1000, 361, 91, 200, 358, 973, 350, 559, 86, 489, 382,
-- 702, 531, 856, 870, 295, 206, 73, 418, 460, 103, 341, 748, 500, 753, 572)

-- Question 4: How many customers have the last name 'William'
select COUNT(LAST_NAME)
from customers
where LAST_NAME like 'William';
-- (Answer: 0)

-- Question 5: What store employee (get the id) sold the most rentals?
select COUNT(RENTAL_ID), STAFF_ID
from rental
group by STAFF_ID
order by COUNT(RENTAL_ID) DESC;

select STAFF_ID, FIRST_NAME, LAST_NAME
from staff;
-- (Answer: Mike Hillyer; staff_id: '1')

-- Question 6: How many different district names are there?
select COUNT(DISTRICT)
from address
order by COUNT(DISTRICT);
-- (Answer: 603)

-- Question 7: What film has the most actors in it? (use film_actor table and get film_id)
select COUNT(distinct FILM_ID), ACTOR_ID
from film_actor
group by ACTOR_ID
order by COUNT(distinct FILM_ID) desc;

select ACTOR_ID, FIRST_NAME, LAST_NAME
from actor
where ACTOR_ID = 107;
-- (Answer: Gina Degeneres)

--Question 8: From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select COUNT(LAST_NAME)
from customer
WHERE LAST_NAME like '%es';
-- (Answer: 21)

-- Question 9: How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
select COUNT(distinct AMOUNT), AMOUNT, COUNT(RENTAL_ID)
from payment
WHERE CUSTOMER_ID > 380 and CUSTOMER_ID < 430
group by AMOUNT
order BY COUNT(RENTAL_ID) > 250 DESC;
-- (Answer: 3 distinct payments above 250 rentals)

-- Question 10: Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
select RATING, COUNT(RATING)
from film
group by RATING
order by COUNT(RATING) desc;
-- (Answer: 5 ratings and rating with most total movies: PG-13)
