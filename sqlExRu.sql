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
