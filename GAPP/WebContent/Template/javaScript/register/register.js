(function() {
    'use strict';

    angular
        .module('app')
        .controller('newPassword', newPassword);

    newPassword.$inject = ['comparePasswordFactory'];

    function newPassword (comparePasswordFactory){
        /*jshint validthis:true*/
        var vm = this;

        vm.result = [];
        
        vm.compare = compare;

        function compare(password1, password2){
        	vm.result = comparePasswordFactory.compare(password1, password2);
            return vm.result;
        }

    }

})();
