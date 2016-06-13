(function() {
    'use strict';

    angular
        .module('app')
        .controller('register', register);

    newPassword.$inject = ['comparePasswordFactory', 'passwordValidatorFactory'];

    function register (comparePasswordFactory, passwordValidatorFactory){
        /*jshint validthis:true*/
        var vm = this;

        vm.result = [];
        
        vm.compare = compare;
        vm.validatePassword = validatePassword;
        
        function compare(password1, password2){
        	vm.result1 = comparePasswordFactory.compare(password1, password2);
            return vm.result1;
        }
        function validatePassword(password){
        	vm.result2 = passwordValidator.compare(password1, password2);
        	return vm.result2;
        }

    }

})();
