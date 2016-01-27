$LOAD_PATH.unshift 'lib'
$LOAD_PATH.unshift '.'

require 'minitest/autorun'
require 'minitest/rg'
require 'test/helpers'
require 'rack/test'
require 'git/lighttp'

Dir['test/*_test.rb'].each do |test|
  load test
end
