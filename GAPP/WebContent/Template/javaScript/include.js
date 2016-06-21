(function() {
    'use strict';

    angular
        .module('app', [])
        .controller('include', include);

    
    function include() {
        /*jshint validthis:true*/
        var vm = this;

        var default_redirect = document.getElementById('default_redirect').innerHTML;
        
        include_in(default_redirect, "corps");
        /*
        vm.template = default_redirect;
        */
        vm.redirect = redirect;
        vm.redirect_dynamic = redirect_dynamic;
        
        function redirect(path) {
            vm.template = 'views/' + path + '.jsp';
            return vm.template;
        }
        
        function redirect_dynamic(complete_path) {
        	vm.template = complete_path;
        	return vm.template;
        }
        
    }
})();
