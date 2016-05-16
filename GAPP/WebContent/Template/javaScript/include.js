(function() {
    'use strict';

    angular
        .module('app', [])
        .controller('include', include);

    function include() {
        /*jshint validthis:true*/
        var vm = this;

        vm.redirect = redirect;

        function redirect(path) {
            vm.template = 'views/' + path + '.html';
            return vm.template;
        }
    }
})();
