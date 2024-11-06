

SELECT 
ProductSubcategoryName,
DimProductSubcategory.ProductSubcategoryKey,
DimProduct.ProductKey
FROM DimProduct
INNER JOIN DimProductSubcategory
ON ProductKey = DimProductSubcategory.ProductSubcategoryKey

--QUESTAO 2
SELECT 
ProductSubcategoryName,
DimProductSubcategory.ProductSubcategoryKey,
DimProductCategory.ProductCategoryKey,
ProductCategoryName
FROM DimProductCategory
INNER JOIN DimProductSubcategory
ON DimProductCategory.ProductCategoryKey = DimProductSubcategory.ProductSubcategoryKey

--QUESTAO 3
SELECT
DimGeography.GeographyKey,
DimStore.StoreKey,
EmployeeCount,
ContinentName,
RegionCountryName
FROM DimGeography
LEFT JOIN DimStore
ON DimStore.StoreKey = DimGeography.GeographyKey

--QUESTAO 4
SELECT 
ProductCategoryDescription,
DimProductCategory.ProductCategoryKey,
DimProduct.ProductKey,
ProductName,
ProductCategoryName
FROM DimProduct
LEFT JOIN DimProductCategory
ON DimProduct.ProductKey = DimProductCategory.ProductCategoryKey

--QUESTAO 5-A
SELECT TOP(100)*
FROM FactStrategyPlan

--5-B
