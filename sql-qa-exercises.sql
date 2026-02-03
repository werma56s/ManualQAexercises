/* Zadanie 1
Lista pracowników z działami:
przygotuj zapytanie, które zwróci pełne imię i nazwisko pracownika,
nazwę działu oraz wynagrodzenie. Posortuj wynik rosnąco po nazwie działu, a następnie po nazwisku.
*/

Select 
CONCAT(e.first_name, ' ', e.last_name) AS [imię i nazwisko pracownika],
d.name as [Nazwa dzialu],
e.salary as [Pensja]
from employees e 
Join departments d on d.id = e.department_id
order by d.name, e.last_name 

/* Zadanie 2
Średnie wynagrodzenie w działach:
oblicz średnią pensję i liczbę pracowników dla każdego działu. Posortuj wynik malejąco po średnim wynagrodzeniu. 
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
Projekty o dużym nakładzie pracy:
zwróć nazwę działu, nazwę projektu oraz łączną liczbę przepracowanych godzin 
(interesuje nas liczba godzin w projekcie poświęcona przez dany dział). Pokaż tylko projekty, 
w których suma godzin przekracza 40, i posortuj wynik malejąco po liczbie godzin. 
*/
Select 
--CONCAT(e.first_name, ' ', e.last_name) AS [imię i nazwisko pracownika],
d.name as [Nazwa dzialu],
t.project_name as [nazwa projektu],
sum(t.hours) as [Przepracoawne godziny]
from employees e 
Join departments d on d.id = e.department_id
Join timesheets t on t.employee_id = e.id
group by d.name, t.project_name
having sum(t.hours) > 40

order by sum(t.hours) desc
