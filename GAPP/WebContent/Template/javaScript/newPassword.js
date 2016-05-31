(function() {
	'use strict';
	
	angular
		.module('app')
		.controller('newPassword', newPassword);
	
	newPassword.$inject = ['comparePasswordFactory'];
	
	function newPassword (comparePasswordFactory){
		/*jshint validthis:true*/
		var vm = this;
	
		vm.password = '';
		vm.password2 = '';
		vm.text = '';
		
		vm.activate = activate;
		
		activate(vm.password, vm.password2);
		
		function activate(password1, password2){
			vm.text = comparePasswordFactory.compare(password1, password2);
			return vm.text;
		}
		
	}
	
})();
