'use strict';

var assert = require('assert'),
		AbstractFactory = require('../Examples/example');

describe('Should work', function(){
	var abs;

	beforeEach(function(){
		abs = new AbstractFactory();
	});

	it('should return true', function(){
		var a = true, b = true;
		assert.equal(a, b);
	});

	it('should return name', function(){
		assert(abs.name).equal('AbstractFactory');
	});
});