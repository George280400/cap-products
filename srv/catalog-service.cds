using com.george as george from '../db/schema';

service CatalogService {

    entity Products as projection on george.Products;
     entity Supplier as projection on george.Suppliers;
     entity Currency as projection on george.Currencies;
     entity DimensionUnit as projection on george.DimensionUnits;
     entity Category as projection on george.Categories;
     entity SalesData as projection on george.SalesData;
     entity Reviews as projection on george.ProductReview;
    //  entity Car as projection on george.Car;

}
