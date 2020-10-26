require "yaml"

def load_library(file_path)
  hash = YAML.load_file(file_path)
  new_hash = Hash.new {|k,h| k[h] = {} }
  hash.each do |key,value|
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
  end
  new_hash
end

def get_english_meaning(file_path, string)
  hash = load_library(file_path)
  hash.each do |k,v|
    v.each do |k1,v1|
      if v1 == string
        return k
      end
    end
  end
  "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file_path, string)
  hash = load_library(file_path)
  hash.each do |k,v|
    if v.values.include?(string)
        return v[:japanese]
    end
  end
  "Sorry, that emoticon was not found"
end

