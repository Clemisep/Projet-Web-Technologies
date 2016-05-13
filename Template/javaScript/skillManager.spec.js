(function() {
    'use strict';

    angular
        .module('app', [])
        .controller('skillManagerController', skillManagerController);

    function skillManagerController() {
        /*jshint validthis:true*/
		var vm = this;
			
			/*variables*/
			vm.show = false;
			vm.skillInput = null;
			vm.subSkillInput = null;
			
			/*functions*/
			vm.showPanel = showPanel;
			vm.hidePanel = hidePanel;
			vm.addSkill = addSkill;
			vm.addSubSkill = addSubSkill;
			
			function showPanel() {
				vm.show = true;				
				return vm.show;
			}
			
			function hidePanel() {
				vm.show = false;
				vm.subSkillInput = null;
				vm.skillInput = null;
				return vm.show;
			}
			
			function addSkill() {}
			
			function addSubSkill() {}
		}

})();