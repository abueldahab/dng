'use strict';

angular.module('dngApp')
  .directive('logout', () ->
    template: '<div></div>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'this is the logout directive'
  )