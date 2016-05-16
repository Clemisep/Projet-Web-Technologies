(function() {
    'use strict';
    
    angular
        .module('app', [])
        .controller("getStudentController", getStudentController);
        
        getStudentController.$inject = ['getStudentFactory', 'logger'];
        
        function getStudentFactory(getStudentFactory, logger) {
            var vm = this;
            vm.student = [];
            
            activate();
            
            function activate () {
                return getStudent()
                    .then(function() {
                        logger.info('Activate getStudent');
                });
            }
            
            function getStudent () {
                return getStudentFactory.getStudent()
                    .then(function (data) {
                        vm.student = data;
                        return vm.student;
                });
            }
        }

})();