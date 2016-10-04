#!/usr/bin/env ruby
require 'yaml'

confighash = YAML.load_file(ARGV[0])['config']
begin
  unsethash = YAML.load_file(ARGV[0])['unset']
rescue
  puts 'unset not found'
  unsethash = false
end

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

flatten_hash(confighash).each do |key,val|
  puts "$config#{key} = '#{val}';"
end

if unsethash
  flatten_hash(unsethash).each do |key,val|
    puts "unset($config#{key});"
  end
end

puts "write_config();"
puts "exec"
puts "exit"
