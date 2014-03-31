#!/usr/bin/env coffee
#
# Author: Thibaut Despoulain

five = require 'johnny-five'

board = new five.Board()
board.on 'ready', ->

  m = 45
  M = 135
  r = M - m
  fps = 100
  dt = 1000/fps

  servo = new five.Servo(pin: 5, range: [m, M])
  board.repl.inject servo: servo
  servo.to m

  @wait 1000, ->
    t = 0
    @loop dt, ->
      t++
      cos = Math.cos(t / fps * 2)
      scos = (cos + 1) * 0.5
      target = (scos * r + m)
      servo.to target

