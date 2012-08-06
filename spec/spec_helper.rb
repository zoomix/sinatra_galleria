# encoding: utf-8

$: << File.expand_path('../../lib', __FILE__)

ENV['RACK_ENV'] = 'test'
ENV['LOG_LEVEL'] ||= 'FATAL'

require 'bundler/setup'
require 'rack/test'
require 'bomcl'
require 'butterflies'
