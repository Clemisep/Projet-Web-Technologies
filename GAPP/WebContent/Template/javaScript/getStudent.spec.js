(function() {
    'use strict';

    angular
        .module('app', [])
        .controller('getStudent', getStudent);

    getStudent.$inject = ['getStudentFactory', 'logger'];

    function getStudent(getStudentFactory, logger) {
        /*jshint validthis:true*/
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
