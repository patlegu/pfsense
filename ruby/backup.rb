#!/usr/bin/env ruby  
require 'pp'
require 'yaml'
require 'erb'

hash = YAML::load(File.open('backup.yml').read)
template = open('backup.erb', 'r') {|f| f.read}
puts ERB.new(template, 0, '<>').result
