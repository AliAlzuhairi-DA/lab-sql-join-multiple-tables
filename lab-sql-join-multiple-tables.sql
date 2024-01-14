#  1:Write a query to display for each store its store ID, city, and country.

SELECT s.store_id, ci.city, co.country
FROM store s
JOIN city ci ON s.address_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

#  2:Write a query to display how much business, in dollars, each store brought in.

SELECT s.store_id, SUM(p.amount) AS total_sales
FROM store s
JOIN staff st ON s.manager_staff_id = st.staff_id
JOIN payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id;

#  3:What is the average running time of films by category?

SELECT c.name AS category, AVG(f.length) AS average_running_time
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

#  4:Which film categories are longest?

SELECT c.name AS category, AVG(f.length) AS average_running_time
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
order by average_running_time desc;


#  5:Display the most frequently rented movies in descending order.

SELECT f.film_id, count(r.rental_id) as rentals_count
from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
group by f.film_id
order by rentals_count desc;


#  6:List the top five genres in gross revenue in descending order.

SELECT c.name AS category, SUM(p.amount) AS total_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY total_revenue DESC
LIMIT 5;

