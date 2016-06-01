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

            if (password1 === password2 && password1 !== '') {
                equals = true;
            }else {
                equals = false;
            }

            /*equals = angular.equals(password1, password2);*/

            return display(equals);

            function display(equals) {
                var text;
                if (equals === true) {
                    text = 'Les mots de passe correspondent';
                }else {
                    text = 'Les mots de passe ne correspondent pas';
                }

                return text;
            }
        }

    }

})();
