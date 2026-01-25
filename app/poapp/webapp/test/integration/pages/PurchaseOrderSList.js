sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'poapp.poapp',
            componentId: 'PurchaseOrderSList',
            contextPath: '/PurchaseOrderS'
        },
        CustomPageDefinitions
    );
});