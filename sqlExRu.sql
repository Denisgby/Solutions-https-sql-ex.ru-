--Задание: 1
--Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

SELECT pc.model, pc.speed, pc.hd
FROM pc
WHERE pc.price<500


<<<<<<< HEAD
--�������: 3 
--������� ����� ������, ����� ������ � ������� ������� ��-���������, ���� ������� ��������� 1000 ���.

SELECT la.model, la.ram, la.screen
FROM laptop la 
WHERE la.price>1000
=======
>>>>>>> 528f80e6b2b90c4762961dc521fb29a3f85d5990
