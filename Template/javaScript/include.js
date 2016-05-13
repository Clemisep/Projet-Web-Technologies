(function() {
    'use strict';

    angular
        .module('app')
        .controller('includeController', includeController);

    includeController.$inject = ['$window'];

    function includeController($window) {
        /*jshint validthis:true*/
        var vm = this;

        vm.redirect = redirect;

        function redirect(path) {
            vm.template = 'views/' + path + '.html';
            return vm.template;
        }
    }
})();
