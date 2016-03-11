#!/usr/bin/env ruby  
require 'pp'
require 'yaml'
require 'erb'

hash = YAML::load(File.open('master.yml').read)
template = open('master.erb', 'r') {|f| f.read}
puts ERB.new(template, 0, '<>').result
