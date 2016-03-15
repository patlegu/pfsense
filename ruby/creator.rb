require 'yaml'

hash = YAML::load(File.open(ARGV[0]).read)

def flatten_hash(my_hash, parent=[])
  my_hash.flat_map do |key, value|
    case value
      when Hash then 
      key = "['#{key}']"  
      flatten_hash( value, parent+[key] )
      else 
        key = "['#{key}']"
        line = [(parent+[key]).join('')]
        output = "#{line}"
        output = output[2..-3]
        print "$config#{output} = '#{value}';""\n"
    end
  end
end

flatten_hash(hash)
