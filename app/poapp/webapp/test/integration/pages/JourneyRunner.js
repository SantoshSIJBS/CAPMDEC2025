sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"poapp/poapp/test/integration/pages/PurchaseOrderSList",
	"poapp/poapp/test/integration/pages/PurchaseOrderSObjectPage",
	"poapp/poapp/test/integration/pages/PurchaseItemsSObjectPage"
], function (JourneyRunner, PurchaseOrderSList, PurchaseOrderSObjectPage, PurchaseItemsSObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('poapp/poapp') + '/test/flpSandbox.html#poapppoapp-tile',
        pages: {
			onThePurchaseOrderSList: PurchaseOrderSList,
			onThePurchaseOrderSObjectPage: PurchaseOrderSObjectPage,
			onThePurchaseItemsSObjectPage: PurchaseItemsSObjectPage
        },
        async: true
    });

    return runner;
});

