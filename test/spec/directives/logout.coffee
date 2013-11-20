'use strict'

describe 'Directive: logout', () ->

  # load the directive's module
  beforeEach module 'dngApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<logout></logout>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the logout directive'
