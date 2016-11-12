/* pat.indexController
 * Creado por Dillan
 */
(function(){
    angular.controller('IndexController', IndexController);
    function IndexController(){
        index = this;
        index.logged = false;
        index.isLogged = isLogged;
        index.loginSession = loginSession;
        index.closeSession = closeSession;
        
        function isLogged(){
            return index.logged;
        }
        function loginSession(){
            index.logged = true;
        }
        function closeSession(){
            index.logged = false;
        }
    }
})();