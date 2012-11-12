require 'bundler'
Bundler.require

Dir[File.dirname(__FILE__) + '/../lib/**/*.rb'].each {|file| require file }
