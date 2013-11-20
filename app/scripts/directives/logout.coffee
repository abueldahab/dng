
'use strict'
html = """
  <a style="cursor: pointer" ng-click="signout()">
    <i class="icon-off"></i>
    Sign out
  </a>
"""
controller = (root, scope)->

  scope.signout = ->
    Parse.User.logOut()
    delete root.user
    root.go '/'


angular.module('dng.parse')
  .directive 'logout', ->
    template: html
    replace: yes
    restrict: 'E'
    scope: on
    controller: ['$rootScope', '$scope', controller]
