(function() {
    'use strict';

    angular
        .module('app', [])
        .controller('include', include);

    
    function include() {
        /*jshint validthis:true*/
        var vm = this;

        var default_redirect = document.getElementById('default_redirect').innerHTML;
        
        vm.template = default_redirect;

        vm.redirect = redirect;

        function redirect(path) {
            vm.template = 'views/' + path + '.jsp';
            return vm.template;
        }
    }
})();
