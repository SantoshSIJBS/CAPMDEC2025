namespace poapp.cdsviews ;


using { poapp.db.master, poapp.db.transaction } from './datamodels';


context CDSViews {
    define view ![POWorklist] as
        select from transaction.purchaseorder {
            key PO_ID as ![PurchaseOrderID],
            key Items.PO_ITEMS_POS as ![ItemPosition],
            PARTNER_GUID.BP_ID as ![BusinessPartnerID],
            PARTNER_GUID.COMPANY_NAME as ![CompanyName],
            GROSS_AMOUNT as ![GrossAmount],
            NET_AMOUNT as ![NetAmount],
            TAX_AMOUNT as ![TaxAmount],
            CURRENCY as ![CurrencyCode],
            OVERALL_STATUS as ![OverallStatus],
            Items.PRODUCT_GUID.PRODUCT_ID as ![ProductID],
            Items.PRODUCT_GUID.DESCRIPTION as ![Description],
            PARTNER_GUID.ADDRESS_GUID.CITY as ![City],
            PARTNER_GUID.ADDRESS_GUID.COUNTRY as ![Country]
        } ;


    define view ![ItemView] as
        select from transaction.purchaseitems {
            PARENT_KEY.PARTNER_GUID.NODE_KEY as ![CustomerKey],
            PRODUCT_GUID.NODE_KEY as ![ProductID],
            CURRENCY as ![Currency],
            GROSS_AMOUNT as ![GrossAmount],
            NET_AMOUNT as ![NetAmount],
            TAX_AMOUNT as ![TaxAmount],
            PARENT_KEY.OVERALL_STATUS as ![Status]
        }
   
    define view ProductView as select from master.product
    mixin {
        PO_ORDER : Association[*] to ItemView on PO_ORDER.ProductID = $projection.ProductKey
    } into {
        NODE_KEY as ![ProductKey],
        DESCRIPTION as ![Description],
        CATEGORY as ![Category],
        PRICE as ![Price],
        SUPPLIER_GUID.BP_ID as ![SupplierID],
        SUPPLIER_GUID.COMPANY_NAME as ![SupplierName],
        SUPPLIER_GUID.ADDRESS_GUID.CITY as ![City],
        SUPPLIER_GUID.ADDRESS_GUID.COUNTRY as ![Country],
        PO_ORDER as ![ToItems]
    }
}