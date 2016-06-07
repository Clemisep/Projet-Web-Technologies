(function() {
    'use strict';

    angular
        .module('app')
        .factory('passwordValidatorFactory', passwordValidatorFactory);
    
    function passwordValidatorFactory() {
    	return {
    		validLength: validLength,
    		validPattern: validPattern
    	};
    	
    	function validLength(password) {
    		
    		if(newPassword.length < minNumberofChars || newPassword.length > maxNumberofChars){
    	        return false;
    	    }
    		
    	}
    	
    	function validPattern(password) {
    		var regularExpression = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
    		
    		if(!regularExpression.test(password)) {
    			return {
    				text: 'password should contain at least one number and one special character',
    	        	validate: false
    			};
    	        
    	    }
    	}
    }
})();

