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
-----------------------


--Задание: 15
--Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD

SELECT hd
FROM PC 
GROUP BY hd
HAVING COUNT(hd)>1
-----------------------


--Задание: 16
--Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.

SELECT DISTINCT A.model AS model_1, B.model AS model_2, A.speed,  A.ram

FROM PC AS A, PC B
WHERE A.model>B.model
   AND      
      A.speed=B.speed
  AND
      A.ram=B.ram
 -----------------------


 --Задание: 17
 --Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
--Вывести: type, model, speed

SELECT DISTINCT pr.type, pr.model, la.speed
FROM product pr JOIN laptop la ON pr.model=la.model
WHERE la.speed<(SELECT MIN(speed)
FROM pc);
------------------------


--Задание: 18
--Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price

SELECT DISTINCT pr.maker, p.price
FROM product pr JOIN printer p ON pr.model=p.model
WHERE p.color='y' AND p.price=(SELECT MIN(pr.price) FROM printer pr 
WHERE pr.color='y')
----------------------------


--Задание: 19
--Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
--Вывести: maker, средний размер экрана.

SELECT t1.maker, AVG(t1.screen) AS avgscreen

FROM(
SELECT  pr.maker, la.screen
FROM product pr JOIN laptop la ON pr.model=la.model
)t1
GROUP BY maker
------------------------------


--Задание: 20
--Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.

SELECT p.maker, COUNT(p.model) AS Ql_type
FROM product p
WHERE type='pc' 
GROUP BY maker
HAVING COUNT(p.model)>2;
--------------------------
