/* istanbul ignore next */
/*global angular, document*/
(function () {
    'use strict';
    var njSide = angular.module('njSide', [
        'ui.router', 'ngAnimate', 'ngMaterial',
        'angular-loading-bar'
    ]);

    njSide.config(function ($stateProvider, $urlRouterProvider, $locationProvider) {
        $urlRouterProvider.when('', '/');
        $urlRouterProvider.otherwise('/404');

        $stateProvider
        .state('home', {
            url: '/',
            controller: 'homeCtrl'
        })
        .state('404', {
            url: '/404',
            templateUrl: '404.html'
        });

        $locationProvider.html5Mode(false);
    });

    njSide.config(function (cfpLoadingBarProvider) {
        cfpLoadingBarProvider.includeSpinner = true;
    });

}());
