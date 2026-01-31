using { poapp.db as poapp  } from '../db/datamodels';


service CatalogService @(path: 'CatalogService', require: 'authenticated-user') {

//  Service definitions for master data
    entity EmployeeS as projection on poapp.master.employees ;


    entity ProductService as projection on poapp.master.product ;


    entity BusinessPartnerService as projection on poapp.master.businesspartner;


    entity AddressService as projection on poapp.master.address ;


// Serviec definitions for transactional data
    entity PurchaseItemsS as projection on poapp.transaction.purchaseitems ;

    @odata.draft.enabled : true
    entity PurchaseOrderS as projection on poapp.transaction.purchaseorder {
        *,
        case OVERALL_STATUS
            when 'N' then 'New'
            when 'P' then 'Ausstehend'
            when 'C' then 'Cancelled'
            else 'Completed'
        end as OST : String(15)  @(title: '{i18n>OVERALL_STATUS}'),
        case OVERALL_STATUS
            when 'N' then 3
            when 'P' then 1
            when 'C' then 2
            else 3
            end as OSC : Integer,
        case LIFECYCLE_STATUS
            when 'N' then 'Not Started'
            when 'S' then 'Started'
            when 'D' then 'Delivered'
            when 'R' then 'Returned'
        end as LST : String(15)  @(title: '{i18n>LIFECYCLE_STATUS}'),
        case LIFECYCLE_STATUS
            when 'N' then 3
            when 'P' then 1
            when 'C' then 2
            else 3
            end as LSC : Integer,
        Items: redirected to PurchaseItemsS

    }
    actions {
        // Instance Bounded Action
        @cds.odata.bindingparameter.name : 'DP'
        @Common.SideEffects : {
            TargetProperties : ['DP/GROSS_AMOUNT']
        }
        action discountPrice();
        // Instance Bounded Function
        function largetOrder() returns array of  PurchaseOrderS ;
    };


    // Declaration of Function
    function getEmployeeInfo() returns array of  String ;

    // Declaration of Custom Action
    action createEmployee(
        currency_code : String,
        ID : UUID,
        accountNumber : String,
        bankId : String,
        bankName : String,
        email : String,
        phoneNumber : String,
        nameFirst : String,
        gender : String,
        language : String,
        nameLast : String,
        loginName : String,
        nameMiddle : String,
        salary : Decimal(10,2),
        nameInitials : String
    ) returns array of EmployeeS;

}
