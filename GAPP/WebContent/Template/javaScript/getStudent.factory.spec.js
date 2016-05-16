(function() {
    'use strict';
    
    angular
        .module('app', [])
        .factory('getStudentFactory', getStudentFactory);
        
        getStudentFactory.$inject = ['$http', 'logger'];
        
        function getStudentFactory($http, logger) {
            return { 
                getStudent : getStudent
            };
            
            function getStudent() {
                return $http.get('findStudent.jsp')
                    .then(getStudentComplete)
                    .catch(getStudentFail);
                    
                    function getStudentComplete() {
                        return response.data.results;
                    }
                    function getStudentFail() {
                        logger.error('Fail to get student');
                    }
            }
        }

})();