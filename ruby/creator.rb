#!/usr/bin/env ruby  
require 'pp'
require 'yaml'
require 'erb'

hash= YAML::load(File.open('data.yml').read)

template = open('template.erb', 'r') {|f| f.read}
puts ERB.new(template, 0, '>').result
