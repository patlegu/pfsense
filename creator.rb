#!/usr/bin/env ruby
require 'yaml'

config_file = YAML.load_file('input.yaml')

def flatten_hash(hash)
  hash.each_with_object({}) do |(k, v), h|
    if v.is_a? Hash
      flatten_hash(v).map do |h_k, h_v|
        h["['#{k}']#{h_k}"] = h_v
      end
    else
      h["['#{k}']"] = v
    end
   end
end

flatten_hash(config_file).each do |key,val|
  puts "$config#{key} = '#{val}'"
end
