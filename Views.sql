-- создание представления из таблицы goods
CREATE VIEW vw_goods AS
SELECT 
  id_goods,
  goods,
  brief_description,
  price,
  id_categories
FROM goods

-- создание представления из таблицы goods_categories
CREATE VIEW vw_goods AS
SELECT 
  id_categories,
  categories_name,
  categories_description
FROM goods_categories

-- выборка количества товаров при использовании внутреннего пересечения
SELECT 
  gc.id_categories,
  gc.categories_name,
  COUNT(g.id_goods) AS 'количество товаров в категории'  
FROM vw_goods_categories AS gc 
  INNER JOIN vw_goods g 
    ON g.id_categories = gc.id_categories
GROUP BY gc.id_categories

-- выборка количества товаров при использовании внешнего пересечения
SELECT 
  gc.id_categories,
  gc.categories_name,
  COUNT(g.id_goods) AS 'количество товаров в категории'  
FROM vw_goods_categories AS gc 
  RIGHT JOIN vw_goods g 
    ON g.id_categories=gc.id_categories
GROUP BY gc.id_categories
