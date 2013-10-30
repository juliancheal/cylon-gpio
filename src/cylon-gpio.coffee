###
 * cylon-gpio
 * http://cylonjs.com
 *
 * Copyright (c) 2013 The Hybrid Group
 * Licensed under the Apache 2.0 license.
###

'use strict';

require('./led')
require('./button')
require('./analog-sensor')

module.exports =
  driver: (opts) ->
    if opts.name is 'led'
      new Cylon.Driver.GPIO.Led(opts)
    else if opts.name is 'button'
      new Cylon.Driver.GPIO.Button(opts)
    else if opts.name is 'analogSensor'
      new Cylon.Driver.GPIO.AnalogSensor(opts)

  register: (robot) ->
    Logger.debug "Registering GPIO LED driver for #{robot.name}"
    robot.registerDriver 'cylon-gpio', 'led'
    Logger.debug "Registering GPIO button driver for #{robot.name}"
    robot.registerDriver 'cylon-gpio', 'button'
    Logger.debug "Registering GPIO analogSensor driver for #{robot.name}"
    robot.registerDriver 'cylon-gpio', 'analogSensor'
