sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'poapp.poapp',
            componentId: 'PurchaseOrderSObjectPage',
            contextPath: '/PurchaseOrderS'
        },
        CustomPageDefinitions
    );
});