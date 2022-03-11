/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT P.Name, C.Name
 FROM products P
 INNER JOIN categories C
 ON C.CategoryID = P.CategoryID
 WHERE C.Name = 'Computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT P.Name, P.Price, R.Rating
 FROM products P
 INNER JOIN reviews R 
 ON R.ProductID = P.ProductID
 WHERE R.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, Sum(s.Quantity) Total
From Sales s
INNER JOIN employees e
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID 
ORDER BY TOTAL DESC;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name, c.NAME FROM departments d
INNER JOIN categories c ON
c.DepartmentID = d.DepartmentID
WHERE c.Name = 'games' or c.Name = 'appliances';


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.NAME, SUM(s.Quantity * s.PricePerUnit) as "Gross Sales"
From products p INNER JOIN sales s on s.ProductID = p.ProductID
WHERE p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, MIN(r.Rating)
FROM products p INNER JOIN reviews r ON r.ProductID = p.ProductID
WHERE p.ProductID = 857
GROUP BY p.ProductID, r.Reviewer;


-- Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) TotalSold
FROM sales s
INNER JOIN employees e On e.EmployeeID = s.EmployeeID
INNER JOIN products p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID;




