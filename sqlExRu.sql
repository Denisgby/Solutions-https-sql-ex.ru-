--�������: 1
--������� ����� ������, �������� � ������ �������� ����� ��� ���� �� ���������� ����� 500 ���. �������: model, speed � hd

SELECT pc.model, pc.speed, pc.hd
FROM pc
WHERE pc.price<500


--�������: 3 
--������� ����� ������, ����� ������ � ������� ������� ��-���������, ���� ������� ��������� 1000 ���.

SELECT la.model, la.ram, la.screen
FROM laptop la 
WHERE la.price>1000