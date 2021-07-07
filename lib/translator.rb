require 'yaml'

def load_library(file_path)
  YAML.load_file(file_path).each_with_object({}) do |(key, value), new_hash|
    if !new_hash[key]
      new_hash[key] = {:english => value[0], :japanese => value[1]}
    end
  end
end

def get_japanese_emoticon(file_path, english_emoticon)
  load_library(file_path).each do |key, value| 
    if english_emoticon == value[:english]
      return value[:japanese]
    end 
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, japanese_emoticon)
  load_library(file_path).each do |key, value|
    if japanese_emoticon == value[:japanese]
      return key 
    end 
  end
  return "Sorry, that emoticon was not found"
end