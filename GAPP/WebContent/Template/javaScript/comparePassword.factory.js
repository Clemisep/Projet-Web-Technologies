(function() {
    'use strict';

    angular
        .module('app')
        .factory('comparePasswordFactory', comparePasswordFactory);

    function comparePasswordFactory () {
        return {
            compare:compare
        };

        function compare(password1, password2) {
            var equals;

            if (password1 === password2) {
                equals = true;
            } else {
                equals = false;
            }

            return display(equals);

            function display(equals) {
                if (equals === true) {
                    return {
                        restrict: 'EA',
                        template: '<span color="green">Les mots de passe correspondent</span>'
                    };
                }else {
                    return {
                        restrict: 'EA',
                        template: '<span color="red">Les mots de passe ne correspondent pas</span>'
                    };
                }
            }
        }

    }

})();
