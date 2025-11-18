/* Zadanie 1
Lista pracowników z dzia³ami:
przygotuj zapytanie, które zwróci pe³ne imiê i nazwisko pracownika,
nazwê dzia³u oraz wynagrodzenie. Posortuj wynik rosn¹co po nazwie dzia³u, a nastêpnie po nazwisku.
*/

Select 
CONCAT(e.first_name, ' ', e.last_name) AS [imiê i nazwisko pracownika],
d.name as [Nazwa dzialu],
e.salary as [Pensja]
from employees e 
Join departments d on d.id = e.department_id
order by d.name, e.last_name 

/* Zadanie 2
Œrednie wynagrodzenie w dzia³ach:
oblicz œredni¹ pensjê i liczbê pracowników dla ka¿dego dzia³u. Posortuj wynik malej¹co po œrednim wynagrodzeniu. 
*/
Select distinct
d.name as [Nazwa dzialu],
AVG(e.salary) as [srednia Pensja],
count(e.department_id) as [liczba pracownikow]
from employees e 
Join departments d on d.id = e.department_id
group by d.name
order by AVG(e.salary) desc

/* Zadanie 3
Projekty o du¿ym nak³adzie pracy:
zwróæ nazwê dzia³u, nazwê projektu oraz ³¹czn¹ liczbê przepracowanych godzin 
(interesuje nas liczba godzin w projekcie poœwiêcona przez dany dzia³). Poka¿ tylko projekty, 
w których suma godzin przekracza 40, i posortuj wynik malej¹co po liczbie godzin. 
*/
Select 
--CONCAT(e.first_name, ' ', e.last_name) AS [imiê i nazwisko pracownika],
d.name as [Nazwa dzialu],
t.project_name as [nazwa projektu],
sum(t.hours) as [Przepracoawne godziny]
from employees e 
Join departments d on d.id = e.department_id
Join timesheets t on t.employee_id = e.id
group by d.name, t.project_name
having sum(t.hours) > 40
order by sum(t.hours) desc