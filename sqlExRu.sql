--Задание: 1
--Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

SELECT pc.model, pc.speed, pc.hd
FROM pc
WHERE pc.price<500
GO
--------------------


--Задание: 2
--Найдите производителей принтеров. Вывести: maker

SELECT DISTINCT p.maker
FROM product p
WHERE p.type='printer'
GO
-------------------


--Задание: 3 
--Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

SELECT la.model, la.ram, la.screen
FROM laptop la 
WHERE la.price>1000
GO
---------------------


--Задание: 4
--Найдите все записи таблицы Printer для цветных принтеров.

SELECT *
FROM printer pr
WHERE pr.color='y'
GO
-------------------


--Задание: 5
--Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

SELECT pc.model, pc.speed, pc.hd
FROM pc
WHERE (cd='12x' OR cd='24x') AND pc.price<600
GO
-------------------


--Задание: 6
--Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

SELECT DISTINCT Product.maker, Laptop.speed
FROM Product JOIN Laptop ON product.model=laptop.model 
WHERE Laptop.hd >= 10
GO
----------------------


--Задание: 7
--Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT DISTINCT  p.model, p.price
FROM product pr JOIN pc p ON pr.model=p.model
WHERE pr.maker='B'
UNION 
SELECT  la.model, la.price
FROM product pr JOIN laptop la ON pr.model=la.model
WHERE pr.maker='B'
UNION 
SELECT  pri.model, pri.price
FROM product pr JOIN printer pri ON pr.model=pri.model
WHERE pr.maker='B'
GO
-------------------


--Задание: 8
--Найдите производителя, выпускающего ПК, но не ПК-блокноты.

SELECT maker
FROM product
WHERE type='pc' 
EXCEPT
SELECT maker
FROM product
WHERE type='laptop' 
GO
--------------------------


--Задание: 9
--Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

SELECT DISTINCT pr.maker
FROM product pr JOIN pc p ON pr.model=p.model
WHERE p.speed>=450
GO
----------------------


--Задание: 10
--Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

SELECT model, price
FROM printer
WHERE price IN  ( SELECT MAX(price) AS p1
                  FROM printer) 
GO
----------------------------


--Задание: 11
--Найдите среднюю скорость ПК.

SELECT AVG (speed) AS SPEEDE
FROM PC;
GO
---------------------------------


--Задание: 12
--Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.

SELECT AVG(speed) AS speed
FROM laptop
WHERE price>1000
GO
-----------------------


--Задание: 13
--Найдите среднюю скорость ПК, выпущенных производителем A.

SELECT AVG(speed) srednya
FROM product pr JOIN pc p ON pr.model=p.model
WHERE maker='A'
GROUP BY maker
GO
-----------------------


--Задание: 14
--Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.

SELECT s.class, s.name, c.country
FROM ships s JOIN classes c ON s.class=c.class
WHERE numGuns>=10
