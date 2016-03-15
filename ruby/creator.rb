require 'yaml'

hash = YAML::load(File.open(ARGV[0]).read)

def flatten_hash(my_hash, parent=[])
  my_hash.flat_map do |key, value|
    case value
      when Hash then flatten_hash( value, parent+[key] )
      else line = [(parent+[key]).join('')]
        out = "#{line}"
        out = out[2..-3]
        print "$config#{out} = #{value};""\n"
    end
  end
end

flatten_hash(hash)
