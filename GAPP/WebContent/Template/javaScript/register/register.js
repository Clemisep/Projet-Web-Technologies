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
        
        vm.result1 = [];
        vm.result2 = [];
        
        vm.compare = compare;
        vm.validatePassword = validatePassword;
        
        function compare(password1, password2){
        	vm.result1 = comparePasswordFactory.compare(password1, password2);
            return vm.result1;
        }
        function validatePassword(password){
        	var resulta = passwordValidator.validLength(password1);
        	var resultb = passwordValidator.validPattern(password1);
        	vm.result2 = resulta && resultb;
        	return result2;
        }

    }

})();
