sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/pala/admin/test/integration/pages/BikesList",
	"com/pala/admin/test/integration/pages/BikesObjectPage"
], function (JourneyRunner, BikesList, BikesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/pala/admin') + '/test/flp.html#app-preview',
        pages: {
			onTheBikesList: BikesList,
			onTheBikesObjectPage: BikesObjectPage
        },
        async: true
    });

    return runner;
});

