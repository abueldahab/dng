'use strict';

describe('Service: dngconfig', function () {

  // load the service's module
  beforeEach(module('dngApp'));

  // instantiate service
  var dngconfig;
  beforeEach(inject(function (_dngconfig_) {
    dngconfig = _dngconfig_;
  }));

  it('should do something', function () {
    expect(!!dngconfig).toBe(true);
  });

});
