(function (){
	'use strict';
	
	angular
		.module('app')
		.controller('skillManagerController', skillManagerController);
		
		skillManagerController.$inject = ['$window'];
		
		function skillManagerController($window){
			var vm = this;
			
			vm.show = false;
			vm.skill = [];
			vm.subSkill = [];
			vm.template = [];
			
			vm.showPanel = showPanel;
			vm.addSkill = addSkill;
			vm.addSubSkill = addSubSkill;
			
			function showPanel(){
				vm.show = true;				
				return vm.show;
			}
			
			function addSkill(){ }
			
			function addSubSkill() {
				vm.template = "<input type='text'>";
				return vm.template;
			}
		}

})();