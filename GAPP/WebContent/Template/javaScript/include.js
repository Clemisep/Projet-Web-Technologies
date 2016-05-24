(function() {
    'use strict';

    angular
        .module('app', [])
        .controller('include', include);

    function include() {
        /*jshint validthis:true*/
        var vm = this;

<<<<<<< HEAD
=======
        vm.template = 'views/student.jsp';
        
>>>>>>> branch 'Rbranch' of https://github.com/Clemisep/Projet-Web-Technologies
        vm.redirect = redirect;

        function redirect(path) {
            vm.template = 'views/' + path + '.jsp';
            return vm.template;
        }
    }
})();
