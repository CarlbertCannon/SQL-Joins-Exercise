/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select p.name as ProductName, c.name as CategoryName
from products as P
join categories as C on C.CategoryID = P.CategoryID
Where C.Name = 'Computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select p.Name, p.Price, r.Rating from products as p
 inner join reviews as r on r.ProductID = p.ProductID
 where r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName, e.LastName, Sum(s.Quantity) As Total From sales As s 
Inner Join employees As e ON e.EmployeeID = s.EmployeeID
Group By e.EmployeeID
Order By Total DESC
Limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
Select d.Name as 'Department Name', c.Name as 'Category Name' From departments as d
Inner Join categories as c On c.DepartmentID = d.DepartmentID
Where c.Name = 'Appliances' Or c.Name = 'Games';


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 Select p.Name, Sum(s.Quantity) as 'Total Sold', Sum(s.Quantity * s.PricePerUnit) as 'Total Price'
 From products as p
 Inner Join sales s on s.ProductID = p.ProductID
 Where p.ProductID = 97;
 
Select * From sales where ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. 
(only return for the lowest rating!) */
Select p.Name, r.Reviewer, r.Rating, r.Comment From products as p
Inner Join reviews as r On r.ProductID = p.ProductID
Where p.ProductID = 857 and r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, 
the name of each product, how many of that product they sold */
Select e.EmployeeID, e.FirstName, e.LastName, p.Name, Sum(s.Quantity) as TotalSold
From Sales as s
Inner Join employees as e on e.EmployeeID = s.EmployeeID
Inner Join products as p on p.ProductID = s.ProductID
Group By e.EmployeeID, p.ProductID;