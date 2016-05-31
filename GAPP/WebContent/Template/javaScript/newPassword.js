(function(){
	'use strict'
	
	angular
		.module('app', [])
		.controller('newPassword', newPassword);
	
	function newPassword (){
		/*jshint validthis:true*/
		var vm = this;
		
		
		vm.password = '';
		vm.password2 = '';
		vm.compare = false;
		vm.textCompare = '';
		
		vm.comparePassword = comparePassword;
		vm.displayCompare = displayCompare;
		
		function comparePassword(){
			if(vm.password == vm.password2){
				vm.compare = true;
			}else{
				vm.compare = false;
			}
			
			return vm.compare;
		}
		
		function displayCompare(){
			if(vm.compare == true){
				vm.textCompare = 'Les mots de passe correspondent';
			}else{
				vm.textCompare = 'Les mots de passe correspondent';
			}
			
			return vm.textCompare;
		}
	}
	
})();
