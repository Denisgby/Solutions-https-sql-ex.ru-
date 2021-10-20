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
