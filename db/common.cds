namespace poapp.common;


using {Currency} from '@sap/cds/common';




// Reusable Type
type Guid        : String(32);
type PhoneNumber : String(32);
type Names       : String(64);
type PostalN     : String(12);
type Email       : String(255);


// Enumerator
type Gender      : String(1) enum {
    male = 'M';
    female = 'F';
    undisclosed = 'U';
}


// Reusable Type for Amount
type AmountT     : Decimal(10, 2) @(
    Semantics.amount.currencyCode: 'CURRENCY_CODE',
    sap.unit                     : 'CURRENCY_CODE'
);


// Reusable Aspect - Group of Fields (Structure in ABAP)
aspect Amount : {
    CURRENCY     : Currency @(title: '{i18n>CURRENCY_CODE}');
    GROSS_AMOUNT : AmountT  @(title: '{i18n>GROSS_AMOUNT}');
    NET_AMOUNT   : AmountT  @(title: '{i18n>NET_AMOUNT}');
    TAX_AMOUNT   : AmountT  @(title: '{i18n>TAX_AMOUNT}');
}


// Reusable Aspect
aspect Address {
    STREET   : Names @(title: '{i18n>STREET}');
    POSTAL   : PostalN @(title: '{i18n>POSTAL}');
    CITY     : Names @(title: '{i18n>CITY}');
    COUNTRY  : Names @(title: '{i18n>COUNTRY}');
    BUILDING : Names @(title: '{i18n>BUILDING}');
}
