// Generated by CoffeeScript 1.6.3
(function() {
  'use strict';
  var controller, html;

  html = "<div class=\"row\">\n  <div class=\"col-md-12\">\n    <form name=\"form\" class=\"form\" role=\"form\" ng-submit=\"signin(form)\" id=\"login-nav\"\n      novalidate>\n\n      <div class=\"form-group\">\n        <label class=\"sr-only\" for=\"email\">Email address</label>\n        <input name=\"email\" type=\"email\" class=\"form-control\" id=\"email\" ng-model=\"model.email\"\n        placeholder=\"Email address\" required>\n        <span ng-show=\"form.email.$error.required && form.email.$dirty\">\n          Email is required\n        </span>\n      </div>\n\n      <div class=\"form-group\">\n        <label class=\"sr-only\" for=\"password\">Password</label>\n        <input type=\"password\" class=\"form-control\" ng-model=\"model.password\"\n        name=\"password\"\n        id=\"password\" placeholder=\"Password\" required>\n        <span ng-show=\"form.password.$error.required &&\n          form.password.$dirty\">Password is required</span>\n      </div>\n\n      <div class=\"form-group\">\n        <button type=\"submit\" class=\"btn btn-success btn-block\">Sign in</button>\n      </div>\n    </form>\n  </div>\n</div>\n<div class=\"divider\"></<div>\n<div class=\"row\">\n  <input class=\"btn btn-primary btn-block\" type=\"button\"\n  id=\"sign-in-facebook\" value=\"Sign In with Facebook\">\n  </input>\n</div>";

  controller = function(root, scope) {
    scope.model = {};
    return scope.signin = function(form) {
      if (form.$invalid) {
        return;
      }
      return Parse.User.logIn(scope.model.email, scope.model.password, {
        success: function(user) {
          root.user = user;
          return root.go('/');
        },
        error: function(user, error) {
          return alert("Invalid username or password. Please try again.");
        }
      });
    };
  };

  angular.module("dng.parse").directive("login", function() {
    return {
      template: html,
      restrict: "E",
      replace: true,
      scope: true,
      controller: ['$rootScope', '$scope', controller]
    };
  });

}).call(this);

/*
//@ sourceMappingURL=login.map
*/
