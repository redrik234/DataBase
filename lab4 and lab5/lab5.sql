--1.1 ������� ������ ��� �������� �� ������� pharmacy, ���� name_pharmacy
SELECT TOP 2 name_pharmacy FROM pharmacy;



--2.1 ������� � ������� pharmacy,�������� ���� name_pharmacy, � ������� ���� pharmacy_address �����
SELECT name_pharmacy FROM pharmacy WHERE pharmacy_address IS NULL;
--2.2 ������� � ������� drug, �������� �����, � ������� ���� drug_name ����� �� ������ ��������
SELECT * FROM drug WHERE drug_name IS NOT NULL;
--2.3 ������� �� ������� drug ���� id_drug, �������� �������� �� 4 �� 8
SELECT id_drug, drug_name FROM drug WHERE id_drug BETWEEN 4 AND 8;
--2.4 ������� �� ������� pharmacy ��������, � ������� id_pharmacy ����� 4, 7,9? 10
SELECT * FROM pharmacy WHERE id_pharmacy IN (4, 7, 9, 10);
--2.5 ������� ���� pharmacy_address �� ������� pharmacy, ��� id_pharmacy ����� 1
SELECT pharmacy_address FROM pharmacy WHERE id_pharmacy = 1;
--2.6 ������� ���� company_name �� ������� company_manufacturer, ��� �������������� �������� ��� ������, ����� Merck & Co.
SELECT company_name FROM company_manufacturer WHERE company_name <> "Merck & Co.";



--3.1 ������� �������� �� ������� drug � ������������� �� id_drug � ������� �����������
SELECT * FROM drug ORDER BY  id_drug ASC;
--3.2 �� �� �����, ��� � 3.1, �� � ������� ��������
SELECT * FROM drug ORDER BY  id_drug DESC;
--3.3 ������� id_drug �� ������� presence_of_a_medicine � ������������� � ������� ����������� �� ����� id_drug � id_pharmacy
SELECT id_drug FROM presence_of_a_medicine ORDER BY id_drug ASC, id_pharmacy ASC;
--3.4 ������� id_company_manufacturer � company_name �� ������� company_manufacturer, ������������� �� id_company_manufacturer � ������� ��������
SELECT id_company_manufacturer, company_name FROM company_manufacturer ORDER BY 1 DESC;



--4.1 ������� �� ������� incoming ����������� ���� ���������
SELECT MIN(price) FROM incoming;
--4.2 ������� �� ������� incoming ������������ ���� ���������
SELECT MAX(price) FROM incoming;
--4.3 ���������� ������� ���� �� ������� incoming
SELECT AVG(price) FROM incoming;
--4.4 ���������� ����� ���� ��� �� ������� incoming
SELECT SUM(price) FROM incoming;



--5.1 ������� ��� ���������� �������� drug_name �� ������� drug
SELECT DISTINCT(drug_name) FROM drug;
--5.2 ���������� ���-�� ����� � ����������� ����������
SELECT COUNT(DISTINCT drug_name) AS CountOfDrug FROM drug;



--6.1 ������� �� ������� incoming id_company_manufacturer � ����� ����� ��� � ������������� �� �� id_company_manufacturer
SELECT id_company_manufacturer, SUM(price) FROM incoming GROUP BY id_company_manufacturer;
--6.2 ������� �� ������� incoming  id_drug � ����� ���, ��� ������� ��� ���� � 2 �� 100 �.�., ������������� �� id_drug
SELECT id_drug, SUM(price) FROM incoming WHERE price BETWEEN 2 AND 100 GROUP BY id_drug;
--6.3 ������� �� ������� incoming id_drug � ����� ���, ��� ������� ��� ����� ����� ��� > 1000 �.�.
SELECT id_drug, SUM(price) FROM incoming  GROUP BY id_drug HAVING SUM(price) > 1000;