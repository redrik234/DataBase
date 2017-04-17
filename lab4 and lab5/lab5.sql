--1.1 Выбрать первые два значения из таблицы pharmacy, поля name_pharmacy
SELECT TOP 2 name_pharmacy FROM pharmacy;



--2.1 выбрать в таблице pharmacy,значения поля name_pharmacy, у которых поле pharmacy_address пусто
SELECT name_pharmacy FROM pharmacy WHERE pharmacy_address IS NULL;
--2.2 выбрать в таблице drug, значения полей, у которых поле drug_name имеет не пустое значение
SELECT * FROM drug WHERE drug_name IS NOT NULL;
--2.3 Выбрать из таблицы drug поле id_drug, значение которого от 4 до 8
SELECT id_drug, drug_name FROM drug WHERE id_drug BETWEEN 4 AND 8;
--2.4 Выбрать из таблицы pharmacy значения, у которых id_pharmacy равен 4, 7,9? 10
SELECT * FROM pharmacy WHERE id_pharmacy IN (4, 7, 9, 10);
--2.5 Выбрать поле pharmacy_address из таблицы pharmacy, где id_pharmacy равен 1
SELECT pharmacy_address FROM pharmacy WHERE id_pharmacy = 1;
--2.6 Выбрать поле company_name из таблицы company_manufacturer, где производителем является кто угодно, кроме Merck & Co.
SELECT company_name FROM company_manufacturer WHERE company_name <> "Merck & Co.";



--3.1 Выбрать значения из таблицы drug и отсортировать по id_drug в порядке возрастания
SELECT * FROM drug ORDER BY  id_drug ASC;
--3.2 То же самое, что в 3.1, но в порядке убывания
SELECT * FROM drug ORDER BY  id_drug DESC;
--3.3 Выбрать id_drug из таблицы presence_of_a_medicine и отсортировать в порядке возрастания по полям id_drug и id_pharmacy
SELECT id_drug FROM presence_of_a_medicine ORDER BY id_drug ASC, id_pharmacy ASC;
--3.4 Выбрать id_company_manufacturer и company_name из таблицы company_manufacturer, отсортировать по id_company_manufacturer в порядке убывания
SELECT id_company_manufacturer, company_name FROM company_manufacturer ORDER BY 1 DESC;



--4.1 Выбрать из таблицы incoming минимальную цену лекарства
SELECT MIN(price) FROM incoming;
--4.2 Выбрать из таблицы incoming максимальную цену лекарства
SELECT MAX(price) FROM incoming;
--4.3 Возвращает среднюю цену из таблицы incoming
SELECT AVG(price) FROM incoming;
--4.4 Возвращает сумму всех цен из таблицы incoming
SELECT SUM(price) FROM incoming;



--5.1 Выбрать все уникальные значения drug_name из таблицы drug
SELECT DISTINCT(drug_name) FROM drug;
--5.2 Подсчитать кол-во полей с уникальными значениями
SELECT COUNT(DISTINCT drug_name) AS CountOfDrug FROM drug;



--6.1 Выбрать из таблицы incoming id_company_manufacturer и общую сумму цен и сгруппировать всё по id_company_manufacturer
SELECT id_company_manufacturer, SUM(price) FROM incoming GROUP BY id_company_manufacturer;
--6.2 Выбрать из таблицы incoming  id_drug и сумму цен, при условии что цена т 2 до 100 у.е., сгруппировать по id_drug
SELECT id_drug, SUM(price) FROM incoming WHERE price BETWEEN 2 AND 100 GROUP BY id_drug;
--6.3 Выбрать из таблицы incoming id_drug и сумму цен, при условии что общая сумма цен > 1000 у.е.
SELECT id_drug, SUM(price) FROM incoming  GROUP BY id_drug HAVING SUM(price) > 1000;