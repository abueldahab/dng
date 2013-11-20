'use strict'

html = """
<div class="row">
  <div class="row">
    <div class="col-md-12">
      <form name="form" class="form" role="form" ng-submit="signin(form)" id="login-nav"
        novalidate>

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
          <span ng-show="form.password.$error.required &&
            form.password.$dirty">Password is required</span>
        </div>

        <div class="form-group">
          <button type="submit" class="btn btn-success btn-block">Sign in</button>
        </div>
      </form>
    </div>
  </div>
  <div class="divider"></<div>
  <div class="row">
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
      return
    
    Parse.User.logIn scope.model.email, scope.model.password,
      success: (user) ->
        root.user = user
        root.go '/'
      ,
      error: (user, error) ->
        alert("Invalid username or password. Please try again.")

angular.module("dng.parse").directive "login", ->
  template: html
  restrict: "E"
  replace: yes
  scope: on
  controller: ['$rootScope', '$scope', controller]

