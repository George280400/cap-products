using com.george as george from '../db/schema';

// service CatalogService {

//     entity Products as projection on george.materials.Products;
//      entity Supplier as projection on george.sales.Suppliers;
//      entity Currency as projection on george.materials.Currencies;
//      entity DimensionUnit as projection on george.materials.DimensionUnits;
//      entity Category as projection on george.materials.Categories;
//      entity SalesData as projection on george.sales.SalesData;
//      entity Reviews as projection on george.materials.ProductReview;
//      entity UnitOfMeasure as projection on george.materials.UnitOfMeasures;
//      entity Months as projection on george.sales.Months;
//      entity Order as projection on george.sales.Orders;
//      entity OrderItem as projection on george.sales.OrderItems;
//     //  entity Car as projection on george.Car;

// }

define service CatalogService {

    entity Products          as
        select from george.reports.Products {

            ID,
            Name          as ProductName     @mandatory,
            Description                      @mandatory,
            ImageUrl,
            ReleaseDate,
            DiscontinuedDate,
            Price                            @mandatory,
            Height,
            Width,
            Depth,
            Quantity                         @(
                mandatory,
                assert.range: [
                    0.00,
                    20.00
                ]
            ),
            UnitOfMeasure as ToUnitOfMeasure @mandatory,
            Currency      as ToCurrency      @mandatory,
            Category      as ToCategory      @mandatory,
            Category.Name as Category        @readonly,
            DimensionUnit as ToDimensionUnit,
            SalesData,
            Supplier,
            Reviews,
            Rating,
            StockAvailability,
            ToStockAvailibilty

        };

    @readonly

    entity Supplier          as
        select from george.sales.Suppliers {

            ID,
            Name,
            Email,
            Phone,
            Fax,
            Product as ToProducts

        };

    entity Reviews           as
        select from george.materials.ProductReview {

            ID,
            Name,
            Rating,
            Comment,
            Product as ToProduct
        };

    @readonly
    entity SalesData         as
        select from george.sales.SalesData {

            ID,
            DeliveryDate,
            Revenue,
            Currency.ID               as CurrencyKey,
            DeliveryMonth.ID          as DeliveryMonthId,
            DeliveryMonth.Description as DeliveryMonth,
            Product                   as ToProduct

        };

    @readonly
    entity StockAvailability as
        select from george.materials.StockAvailability {

            ID,
            Description,
            Product as ToProduct

        };

    @readonly
    entity VH_Categories     as
        select from george.materials.Categories {

            ID   as Code,
            Name as Text

        };

    @readonly
    entity VH_Currencies     as
        select from george.materials.Currencies {

            ID          as Code,
            Description as Text

        };

    @readonly
    entity VH_UnitOfMeasure  as
        select from george.materials.UnitOfMeasures {

            ID          as Code,
            Description as Text

        };

    @readonly
    entity VH_DimensionUnits as
        select
            ID          as Code,
            Description as Text
        from george.materials.DimensionUnits;
}

define service MyService {

    entity SuppliersProduct  as
        select from george.materials.Products[Name = 'Bread']{

            *,
            Name,
            Description,
            Supplier.Address

        }
        where
            Supplier.Address.PostalCode = 98074;

    entity SupliersToSales   as
        select
            Supplier.Email,
            Category.Name,
            SalesData.Currency.ID,
            SalesData.Currency.Description
        from george.materials.Products;


    entity EntityInFix       as
        select

        Supplier[Name = 'Exotic Liquids'].Phone

        from george.materials.Products
        where
            Products.Name = 'Bread';

    entity EntityJoin        as
        select Phone from george.materials.Products
        left join george.sales.Suppliers as supp
            on(
                supp.ID = Products.Supplier.ID
            )
            and supp.Name = 'Exotic Liquids'

        where
            Products.Name = 'Bread'
}

define service Reports {

    entity AverageRating     as projection on george.reports.AverageRating;

    entity EntityCasting     as
        select
            cast(
                Price as      Integer
            )     as Price,
            Price as Price2 : Integer
        from george.materials.Products;


        entity EntityExist as select from george.materials.Products{
            Name
        } where exists Supplier[Name = 'Exotic Liquids'];

}