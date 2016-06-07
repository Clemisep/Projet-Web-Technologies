(function() {
    'use strict';

    angular
        .module('app', [])
        .controller('include', include);

    function include() {
        /*jshint validthis:true*/
        var vm = this;

        vm.template = 'views/student.jsp';

        vm.redirect = redirect;

        function redirect(path) {
            vm.template = 'views/' + path + '.jsp';
            return vm.template;
        }
    }
})();
