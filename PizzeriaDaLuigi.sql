create database PizzeriaDaLuigi

create table Pizza(
    --Nome_campo tipo vincoli;
    IdPizza int primary key identity (1,1), 
    Nome nvarchar(50) not null,
    Prezzo decimal(18,2) not null, 
)

create table Ingrediente(
    --Nome_campo tipo vincoli;
    IdIngrediente int primary key identity (1,1), 
    Nome nvarchar(50) not null,
    Costo decimal(18,2) not null, 
	Scorte int not null,
)

create table Pizza_Ingrediente(
IdPizza int foreign key references Pizza(IdPizza) not null,
 IdIngrediente int foreign key references Ingrediente(IdIngrediente) not null,
)

--Check

ALTER TABLE Pizza
ADD CHECK (Prezzo > 0);

ALTER TABLE Ingrediente
ADD CHECK (Costo > 0);

ALTER TABLE Ingrediente
ADD CHECK (Scorte >= 0);

--Procedura inserimento

create procedure InsertPizza

@nome nvarchar(50),
@prezzo decimal(18,2)

as 
begin try
if not exists (select IdPizza from Pizza p where p.Nome = @nome)
insert into Pizza values(@nome, @prezzo);
end try
begin catch
select @@ERROR
end catch
go

execute InsertPizza 'Margherita', 5;
execute InsertPizza 'Bufala', 7;
execute InsertPizza 'Diavola', 6;
execute InsertPizza 'Quattro Stagioni', 6.5;
execute InsertPizza 'Porcini', 7;
execute InsertPizza 'Dioniso', 8;
execute InsertPizza 'Ortolana', 8;
execute InsertPizza 'Patate e Salsiccia', 6;
execute InsertPizza 'Pomodorini', 6;
execute InsertPizza 'Quattro Formaggi', 7.5;
execute InsertPizza 'Caprese', 7.5;
execute InsertPizza 'Zeus', 7.5;

create procedure InsertIngrediente

@nome nvarchar(50),
@costo decimal(18,2),
@scorte int

as 
begin try
if not exists (select IdIngrediente from Ingrediente i where i.Nome = @nome)
insert into Ingrediente values(@nome, @costo, @scorte);
end try
begin catch
select @@ERROR
end catch
go

execute InsertIngrediente 'pomodoro', 4, 10;
execute InsertIngrediente 'mozzarella', 10, 3;
execute InsertIngrediente 'mozzarella di bufala', 18, 2;
execute InsertIngrediente 'spianata piccante', 3, 5;
execute InsertIngrediente 'funghi', 7.5, 5;
execute InsertIngrediente 'carciofi', 6.5, 2;
execute InsertIngrediente 'cotto', 5.5, 8;
execute InsertIngrediente 'olive', 4, 6;
execute InsertIngrediente 'funghi porcini', 9.5, 3;
execute InsertIngrediente 'stracchino', 6.5, 6;
execute InsertIngrediente 'speck', 5.5, 4;
execute InsertIngrediente 'rucola', 2, 10;
execute InsertIngrediente 'grana', 8, 8;
execute InsertIngrediente 'verdure di stagione', 12, 10;
execute InsertIngrediente 'patate', 3, 7;
execute InsertIngrediente 'salsiccia', 10, 4;
execute InsertIngrediente 'pomodorini', 4, 10;
execute InsertIngrediente 'ricotta', 5, 9;
execute InsertIngrediente 'provola', 6, 6;
execute InsertIngrediente 'gorgonzola', 5.5, 5;
execute InsertIngrediente 'pomodoro fresco', 6, 10;
execute InsertIngrediente 'basilico', 2, 10;
execute InsertIngrediente 'bresaola', 12, 6;

create procedure InsertPizzaIngrediente

@nomePizza nvarchar(50),
@nomeIngrediente nvarchar(50)

as 
begin try
if (exists (select IdIngrediente from Ingrediente i where i.Nome = @nomeIngrediente) and
exists (select IdPizza from Pizza p where p.Nome = @nomePizza))
insert into Pizza_Ingrediente values((select IdPizza from Pizza p where p.Nome = @nomePizza), (select IdIngrediente from Ingrediente i where i.Nome = @nomeIngrediente));
end try
begin catch
select @@ERROR
end catch
go

execute InsertPizzaIngrediente 'Pistacchio', 'mozzarella'
execute InsertPizzaIngrediente 'Margherita', 'pomodoro'
execute InsertPizzaIngrediente 'Margherita', 'mozzarella'
execute InsertPizzaIngrediente 'Bufala', 'pomodoro'
execute InsertPizzaIngrediente 'Bufala', 'mozzarella di bufala'
execute InsertPizzaIngrediente 'Diavola', 'pomodoro'
execute InsertPizzaIngrediente 'Diavola', 'mozzarella'
execute InsertPizzaIngrediente 'Diavola', 'spianata piccante'
execute InsertPizzaIngrediente 'Quattro Stagioni', 'pomodoro'
execute InsertPizzaIngrediente 'Quattro Stagioni', 'mozzarella'
execute InsertPizzaIngrediente 'Quattro Stagioni', 'funghi'
execute InsertPizzaIngrediente 'Quattro Stagioni', 'carciofi'
execute InsertPizzaIngrediente 'Quattro Stagioni', 'cotto'
execute InsertPizzaIngrediente 'Quattro Stagioni', 'olive'
execute InsertPizzaIngrediente 'Porcini', 'pomodoro'
execute InsertPizzaIngrediente 'Porcini', 'mozzarella'
execute InsertPizzaIngrediente 'Porcini', 'funghi porcini'
execute InsertPizzaIngrediente 'Dioniso', 'pomodoro'
execute InsertPizzaIngrediente 'Dioniso', 'mozzarella'
execute InsertPizzaIngrediente 'Dioniso', 'stracchino'
execute InsertPizzaIngrediente 'Dioniso', 'speck'
execute InsertPizzaIngrediente 'Dioniso', 'rucola'
execute InsertPizzaIngrediente 'Dioniso', 'grana'
execute InsertPizzaIngrediente 'Ortolana', 'pomodoro'
execute InsertPizzaIngrediente 'Ortolana', 'mozzarella'
execute InsertPizzaIngrediente 'Ortolana', 'verdure di stagione'
execute InsertPizzaIngrediente 'Patate e Salsiccia', 'mozzarella'
execute InsertPizzaIngrediente 'Patate e Salsiccia', 'patate'
execute InsertPizzaIngrediente 'Patate e Salsiccia', 'salsiccia'
execute InsertPizzaIngrediente 'Pomodorini', 'mozzarella'
execute InsertPizzaIngrediente 'Pomodorini', 'pomodorini'
execute InsertPizzaIngrediente 'Pomodorini', 'ricotta'
execute InsertPizzaIngrediente 'Quattro Formaggi', 'mozzarella'
execute InsertPizzaIngrediente 'Quattro Formaggi', 'provola'
execute InsertPizzaIngrediente 'Quattro Formaggi', 'gorgonzola'
execute InsertPizzaIngrediente 'Quattro Formaggi', 'grana'
execute InsertPizzaIngrediente 'Caprese', 'mozzarella'
execute InsertPizzaIngrediente 'Caprese', 'pomodoro fresco'
execute InsertPizzaIngrediente 'Caprese', 'basilico'
execute InsertPizzaIngrediente 'Zeus', 'mozzarella'
execute InsertPizzaIngrediente 'Zeus', 'bresaola'
execute InsertPizzaIngrediente 'Zeus', 'rucola'



--Query

--Estrarre tutte le pizze con prezzo > 6

select p.Nome as 'Pizza', p.Prezzo
from Pizza p
where p.Prezzo > 6

--Estrarre le pizze più costose

select p.Nome as 'Pizza', p.Prezzo
from Pizza p
where p.Prezzo = (select Max(p.Prezzo) from Pizza p)

--Estrarre le pizze bianche

select p.Nome as 'Pizza', p.Prezzo
from Pizza p
where p.IdPizza not in (select p.IdPizza from Pizza p join Pizza_Ingrediente pin on p.IdPizza=pin.IdPizza join
Ingrediente i on i.IdIngrediente=pin.IdIngrediente where i.Nome='pomodoro');

--Estrarre le pizze che contegono funghi

select p.Nome as 'Pizza'
from Pizza p
where p.IdPizza in (select p.IdPizza from Pizza p join Pizza_Ingrediente pin on p.IdPizza=pin.IdPizza join
Ingrediente i on i.IdIngrediente=pin.IdIngrediente where i.Nome like 'funghi%' );

--------------------------------------------

--Store procedure

--Inserimento Pizza "InsertPizza"
 
--Assegnazione del prezzo di una pizza "InsertPizzaIngrediente"

--Aggiornamento del prezzo di una pizza

create procedure UpdatePrezzoPizza

@nome nvarchar(50),
@prezzo decimal(18,2)

as 
begin try
if exists (select IdPizza from Pizza p where p.Nome = @nome)
update Pizza set Prezzo = @prezzo where Pizza.Nome=@nome;

end try
begin catch
select @@ERROR
end catch
go

execute UpdatePrezzoPizza 'Margherita', 5.5

--Elimina un ingrediente da una pizza

alter procedure DeleteIngredientePizza

@nomePizza nvarchar(50),
@nomeIngrediente nvarchar(50)

as 

if exists (select p.IdPizza from Pizza p join Pizza_Ingrediente pin on p.IdPizza=pin.IdPizza join
Ingrediente i on i.IdIngrediente=pin.IdIngrediente where i.Nome=@nomeIngrediente)
delete from Pizza_Ingrediente 
where Pizza_Ingrediente.IdIngrediente = (select i.IdIngrediente from Ingrediente i where i.Nome=@nomeIngrediente)
and Pizza_Ingrediente.IdPizza = (select p.IdPizza  from Pizza p where p.Nome=@nomePizza)



go

execute DeleteIngredientePizza 'Bufala', 'pomodoro'

--Incremento del 10% del prezzo delle pizze contenenti un ingrediente

alter procedure IncrementoPrezzoPizzaPerIngrediente
@nomeIngrediente nvarchar(50)
as 
if exists (select i.IdIngrediente from Ingrediente i where i.Nome=@nomeIngrediente)
begin
declare @idIngrediente int
set @idIngrediente = (select i.IdIngrediente from Ingrediente i where i.Nome=@nomeIngrediente)
update Pizza set Prezzo = Prezzo*1.1 where Pizza.IdPizza in (select pin.IdPizza from Pizza_Ingrediente pin where pin.IdIngrediente=@idIngrediente)
end
go

execute IncrementoPrezzoPizzaPerIngrediente 'grana'

--Funzioni

--Tabella listino pizze

create function TabellaPizze()
RETURNS TABLE
AS
RETURN
    SELECT 
       p.Nome as 'Pizza', p.Prezzo
    FROM
        Pizza p

		
select *
from TabellaPizze()
   
   
--Tabella listino pizze con un ingrediente

create function TabellaPizzeConIngrediente(@nomeIngrediente nvarchar(50))
RETURNS TABLE
AS
RETURN
    SELECT 
       p.Nome as 'Pizza', p.Prezzo
    FROM
        Pizza p
    where p.IdPizza in (select p.IdPizza from Pizza p join Pizza_Ingrediente pin on p.IdPizza=pin.IdPizza join
Ingrediente i on i.IdIngrediente=pin.IdIngrediente where i.Nome=@nomeIngrediente)
		
select *
from TabellaPizzeConIngrediente('grana')

--Tabella listino pizze che non contengono un certo ingrediente

create function TabellaPizzeSenzaIngrediente(@nomeIngrediente nvarchar(50))
RETURNS TABLE
AS
RETURN
    SELECT 
       p.Nome as 'Pizza', p.Prezzo
    FROM
        Pizza p
    where p.IdPizza not in (select p.IdPizza from Pizza p join Pizza_Ingrediente pin on p.IdPizza=pin.IdPizza join
Ingrediente i on i.IdIngrediente=pin.IdIngrediente where i.Nome=@nomeIngrediente)
		
select *
from TabellaPizzeSenzaIngrediente('grana')

--Calcolo numero pizze contenenti un ingrediente

create function CalcoloPizzeConIngrediente(@nomeIngrediente nvarchar(50))
RETURNS INT AS BEGIN
DECLARE @numeroPizze int
SELECT
    @numeroPizze = COUNT(*)
     FROM
    Pizza p
     WHERE
    p.IdPizza in (select p.IdPizza from Pizza p join Pizza_Ingrediente pin on p.IdPizza=pin.IdPizza join
Ingrediente i on i.IdIngrediente=pin.IdIngrediente where i.Nome=@nomeIngrediente)
RETURN @numeroPizze
END

select dbo.CalcoloPizzeConIngrediente('grana')

--Calcolo numero pizze che non contengono un ingrediente

create function CalcoloPizzeSenzaIngrediente(@codiceIngrediente int)
RETURNS INT AS BEGIN
DECLARE @numeroPizze int
SELECT
    @numeroPizze = COUNT(*)
     FROM
    Pizza p
     WHERE
    p.IdPizza in (select p.IdPizza from Pizza p join Pizza_Ingrediente pin on p.IdPizza=pin.IdPizza join
Ingrediente i on i.IdIngrediente=pin.IdIngrediente where i.IdIngrediente=@codiceIngrediente)
RETURN @numeroPizze
END

select dbo.CalcoloPizzeSenzaIngrediente(1)

--Calcolo numero ingredienti contenuti in una pizza

alter function CalcoloIngredientiPizza(@nomePizza nvarchar(50))
RETURNS INT AS BEGIN
DECLARE @numeroIngredienti int
SELECT
    @numeroIngredienti = COUNT(*)
     FROM
    Ingrediente i
     WHERE
    i.IdIngrediente in (select i.IdIngrediente from Pizza p join Pizza_Ingrediente pin on p.IdPizza=pin.IdPizza join
Ingrediente i on i.IdIngrediente=pin.IdIngrediente where p.Nome=@nomePizza)
RETURN @numeroIngredienti
END

select dbo.CalcoloIngredientiPizza('Zeus')

--------------------------------------------------------------

--View

alter view Menù  
as
SELECT p.Nome as 'Pizza', p.Prezzo
FROM Pizza p

select * from Menù

 




