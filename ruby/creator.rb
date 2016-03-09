#!/usr/bin/env ruby  
require 'pp'
require 'yaml'
require 'erb'

hash = YAML::load(File.open(ARGV[0]).read)
template = open('template.erb', 'r') {|f| f.read}
puts ERB.new(template, 0, '<>').result
