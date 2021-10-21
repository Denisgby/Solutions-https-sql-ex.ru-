--�������: 1
--������� ����� ������, �������� � ������ �������� ����� ��� ���� �� ���������� ����� 500 ���. �������: model, speed � hd

SELECT pc.model, pc.speed, pc.hd
FROM pc
WHERE pc.price<500
GO
--------------------


--�������: 2
--������� �������������� ���������. �������: maker

SELECT DISTINCT p.maker
FROM product p
WHERE p.type='printer'
GO
-------------------


--�������: 3 
--������� ����� ������, ����� ������ � ������� ������� ��-���������, ���� ������� ��������� 1000 ���.

SELECT la.model, la.ram, la.screen
FROM laptop la 
WHERE la.price>1000
GO
---------------------


--�������: 4
--������� ��� ������ ������� Printer ��� ������� ���������.

SELECT *
FROM printer pr
WHERE pr.color='y'
GO
-------------------


--�������: 5
--������� ����� ������, �������� � ������ �������� ����� ��, ������� 12x ��� 24x CD � ���� ����� 600 ���.

SELECT pc.model, pc.speed, pc.hd
FROM pc
WHERE (cd='12x' OR cd='24x') AND pc.price<600
GO
-------------------


--�������: 6
--��� ������� �������������, ������������ ��-�������� c ������� �������� ����� �� ����� 10 �����, ����� �������� ����� ��-���������. �����: �������������, ��������.

SELECT DISTINCT Product.maker, Laptop.speed
FROM Product JOIN Laptop ON product.model=laptop.model 
WHERE Laptop.hd >= 10
GO
----------------------


--�������: 7
--������� ������ ������� � ���� ���� ��������� � ������� ��������� (������ ����) ������������� B (��������� �����).

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



--�������: 7
--�������: 7
--�������: 7