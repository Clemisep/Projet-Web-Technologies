(function() {
    'use strict';

    angular
        .module('app', [])
        .controller('addApp', addApp);

    addApp.$inject = ['prompt'];

    function addApp(prompt) {
        /*jshint validthis:true*/
        var vm = this;

        prompt('Nom App').then(
            function(response) {
                var a = response;
            }
        );

    }
})();
