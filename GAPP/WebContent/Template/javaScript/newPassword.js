(function() {
    'use strict';

    angular
        .module('app')
        .controller('newPassword', newPassword);

    newPassword.$inject = ['comparePasswordFactory'];

    function newPassword (comparePasswordFactory){
        /*jshint validthis:true*/
        var vm = this;

        vm.text = '';

        vm.activate = activate;

        function activate(password1, password2){
            vm.text = comparePasswordFactory.compare(password1, password2);
            return vm.text;
        }

    }

})();
