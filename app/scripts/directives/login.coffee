'use strict'

html = """
<div class="row">
  <div class="row">
    <form name="form" class="form" role="form" ng-submit="signin(form)" id="login"
      novalidate>

      <div class="alert alert-danger" ng-show="error">
        {{error}}
      </div>

      <div class="form-group">
        <label class="sr-only" for="email">Email address</label>
        <input name="email" type="email" class="form-control" id="email" ng-model="model.email"
        placeholder="Email address" required>
        <span ng-show="form.email.$error.required && form.email.$dirty">
          Email is required
        </span>
      </div>

      <div class="form-group">
        <label class="sr-only" for="password">Password</label>
        <input type="password" class="form-control" ng-model="model.password"
        name="password"
        id="password" placeholder="Password" required>
        <span ng-show="form.password.$error.required && form.password.$dirty">
        Password is required
        </span>
      </div>

      <div class="form-group">
        <button type="submit" class="btn btn-success btn-block">Sign in</button>
      </div>
    </form>
  </div>
  <div class="divider" ng-show="social"></<div>
  <div class="row" ng-show="facebook">
    <input class="btn btn-primary btn-block" type="button"
    id="sign-in-facebook" value="Sign In with Facebook">
    </input>
  </div>
</div>
"""

controller = (root, scope)->
  scope.model = {}
  scope.signin = (form)->
    if form.$invalid
      scope.error = "Please, fix errors."
      return
    
    Parse.User.logIn scope.model.email, scope.model.password,
      success: (user) ->
        root.user = user
        scope.$apply ->
          scope.onSuccess(user)
          scope.error = null
      ,
      error: (user, error) ->
        scope.$apply ->
          scope.error = "Invalid username or password. Please try again."
          scope.onError(user, error)

angular.module("dng.parse").directive "login", ->
  template: html
  restrict: "E"
  replace: yes
  scope:
    onError: "&error"
    onSuccess: "&success"
    social: "=social"
    facebook: "=facebook"
  controller: ['$rootScope', '$scope', controller]

