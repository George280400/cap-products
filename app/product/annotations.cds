using CatalogService as service from '../../srv/catalog-service';

annotate service.Products with @(

    Capabilities       : {DeleteRestrictions : {
        $Type     : 'Capabilities.DeleteRestrictionsType',
        Deletable : false
    }, },

    UI.HeaderInfo     : {
        TypeName      : '{i18n>Product}',
        TypeNamePlural: '{i18n>Products}',
        ImageUrl      : ImageUrl,
        Title         : {Value: ProductName},
        Description   : {Value: Description}
    },

    UI.SelectionFields: [

        ToCategory_ID,
        ToCurrency_ID,
        StockAvailability
    ],

    UI.LineItem       : [
        {
            $Type: 'UI.DataField',
            Label: 'ImageUrl',
            Value: ImageUrl,
        },

        {
            $Type: 'UI.DataField',
            Label: 'ProductName',
            Value: ProductName,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: Description,
        },

        {
            $Type : 'UI.DataFieldForAnnotation',
            Label : 'Supplier',
            Target: 'Supplier/@Communication.Contact'
        },

        {
            $Type: 'UI.DataField',
            Label: 'ReleaseDate',
            Value: ReleaseDate,
        },
        {
            $Type: 'UI.DataField',
            Label: 'DiscontinuedDate',
            Value: DiscontinuedDate,
        },
        {
            Label      : 'Stock Availibility',
            Value      : StockAvailability,
            Criticality: StockAvailability
        },
        {
            // $Type: 'UI.DataField',
            Label : 'Rating',
            // Value: Rating
            $Type : 'UI.DataFieldForAnnotation',
            Target: '@UI.DataPoint#AverageRating'

        },
        {
            $Type: 'UI.DataField',
            Label: 'Price',
            Value: Price
        }
    ]

);

annotate service.Products with {

    ToCategory @title : 'Category';
    ToCurrency @title : 'Currency';
    StockAvailability @title : 'Stock Availability';

};

annotate service.Products with {
    Supplier @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Supplier',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: Supplier_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'Name',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'Email',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'Phone',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'Fax',
            },
        ],
    }
};

annotate service.Products with @(
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            // {
            //     $Type: 'UI.DataField',
            //     Label: 'ProductName',
            //     Value: ProductName,
            // },
            // {
            //     $Type: 'UI.DataField',
            //     Label: 'Description',
            //     Value: Description,
            // },
            // {
            //     $Type: 'UI.DataField',
            //     Label: 'ImageUrl',
            //     Value: ImageUrl,
            // },
            {
                $Type: 'UI.DataField',
                Label: 'ReleaseDate',
                Value: ReleaseDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'DiscontinuedDate',
                Value: DiscontinuedDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Price',
                Value: Price,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Height',
                Value: Height,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Width',
                Value: Width,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Depth',
                Value: Depth,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Quantity',
                Value: Quantity,
            },
            {
                $Type: 'UI.DataField',
                Label: 'ToUnitOfMeasure_ID',
                Value: ToUnitOfMeasure_ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'ToCurrency_ID',
                Value: ToCurrency_ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'ToCategory_ID',
                Value: ToCategory_ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Category',
                Value: Category,
            },
            {
                $Type: 'UI.DataField',
                Label: 'ToDimensionUnit_ID',
                Value: ToDimensionUnit_ID,
            },
            // {
            //     // $Type: 'UI.DataField',
            //     Label : 'Rating',
            //     // Value: Rating,
            //     $Type : 'UI.DataFieldForAnnotation',
            //     Target: '@UI.DataPoint#AverageRating'
            // },
            {
                $Type: 'UI.DataField',
                Label: 'StockAvailability',
                Value: StockAvailability,
            },
        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup1',
    } ],
    UI.HeaderFacets:[{
        $Type:'UI.ReferenceFacet',
        Target                    : '@UI.DataPoint#AverageRating'
}]);

annotate service.Products with {
ImageUrl @(UI.IsImageURL : true)
};


/**
 * Annotations for SH
 */
annotate service.Products with {
//Category
ToCategory @(Common : {
    Text : {
        $value : Category, ![@UI.TextArrangement] : #TextOnly,
    }, ValueList : {
        $Type : 'Common.ValueListType', CollectionPath : 'VH_Categories', Parameters : [{
            $Type : 'Common.ValueListParameterInOut', LocalDataProperty : ToCategory_ID, ValueListProperty : 'Code'
        }, {
            $Type : 'Common.ValueListParameterInOut', LocalDataProperty : ToCategory_ID, ValueListProperty : 'Text'
        }]
    },
});

//Currency
ToCurrency @(Common : {
    ValueListWithFixedValues : false, ValueList : {
        $Type : 'Common.ValueListType', CollectionPath : 'VH_Currencies', Parameters : [{
            $Type : 'Common.ValueListParameterInOut', LocalDataProperty : ToCurrency_ID, ValueListProperty : 'Code'
        }, {
            $Type : 'Common.ValueListParameterDisplayOnly', ValueListProperty : 'Text'
        }]
    },
});

StockAvailability @(Common : {
    ValueListWithFixedValues : true, ValueList : {
        $Type : 'Common.ValueListType', CollectionPath : 'StockAvailability', Parameters : [{
            $Type : 'Common.ValueListParameterInOut', LocalDataProperty : StockAvailability, ValueListProperty : 'ID'
        }]
    },
});
};

/**
 * Annotations for VH_Categories Entity
 */
annotate service.VH_Categories with {
Code @(UI : {
    Hidden : true
}, Common : {
    Text : {
        $value : Text, ![@UI.TextArrangement] : #TextOnly,
    }
});
Text @(UI : {
    HiddenFilter : true
});
};

/**
 * Annotations for VH_Currency Entity
 */
annotate service.VH_Currencies {
Code @(UI : {
    title : '{i18n>Code}', HiddenFilter : true
});
Text @(UI : {
    title : '{i18n>Text}', HiddenFilter : true
});
};

/**
 * Annotations for StockAvailability Entity
 */
annotate service.StockAvailability {
ID @(Common : {
    Text : {
        $value : Description, ![@UI.TextArrangement] : #TextOnly,
    },
})
};

/**
 * Annotations for VH_UnitOfMeasure Entity
 */
annotate service.VH_UnitOfMeasure {
Code @(UI : {
    title : '{i18n>Code}', HiddenFilter : true
});
Text @(UI : {
    title : '{i18n>Text}', HiddenFilter : true
});
};

/**
 * Annotations for VH_DimensionUnits Entity
 */
annotate service.VH_DimensionUnits {
Code @(UI : {
    title : '{i18n>Code}', HiddenFilter : true
});
Text @(UI : {
    title : '{i18n>Text}', HiddenFilter : true
});
};

/**
 * Annotations for Supplier Entity
 */
annotate service.Supplier with @(Communication : {
Contact : {
    $Type : 'Communication.ContactType', fn : Name, role : 'Supplier', photo : 'sap-icon://supplier', email : [{
        type : #work, address : Email
    }], tel : [{
        type : #work, uri : Phone
    }, {
        type : #fax, uri : Fax
    }]
},
});

/**
 * Data Point for Average Rating
 */
annotate service.Products with @(UI.DataPoint #AverageRating : {
Value : Rating, Title : '{i18n>Rating}', TargetValue : 5, Visualization : #Rating
});
