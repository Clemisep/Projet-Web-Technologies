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
                    	color: 'green',
                        text: 'Les mots de passe correspondent'
                    };
                }else {
                    return {
                    	color: 'red',
                        text: 'Les mots de passe ne correspondent pas'
                    };
                }
            }
        }

    }

})();
