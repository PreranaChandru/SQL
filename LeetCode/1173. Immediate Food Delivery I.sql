# SOLUTION 1

SELECT ROUND(
	((SELECT COUNT(*) FROM Delivery WHERE order_date = customer_pref_delivery_date) 
	/
	(SELECT COUNT(*) FROM Delivery))*100,
	2)
AS immediate_percentage;

# SOLUTION 2

SELECT ROUND( 100 * AVG (order_date = customer_pref_delivery_date), 2) AS immediate_percentage
FROM Delivery;