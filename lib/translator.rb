# require modules here
require "yaml"
require 'pry'


def load_library(file_path)
  # code goes here

  #emoti_lib = YAML.load_file(file_path = 'lib/emoticons.yml')
  #emoti_lib = YAML.load_file(file_path)
  #binding.pry

  #USING YAML.load_file() we create a hash
  #then using each_with_object({}) we create a new hash in the block
  final = YAML.load_file(file_path).each_with_object({}) do |(key, value), hash|
                hash[key] = { :english  => value[0], 
                              :japanese => value[1]
                            }
          end
  
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  #first call load_library method to hash of emoticons
  list_of_emo = load_library (file_path)
  
  #irate through the hash to see if that emoticon exists 
  list_of_emo.each do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end 
  end

  #if no emoticon is found then return a message
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  list_of_emo = load_library (file_path)
  
  #irate through the hash to see if that emoticon exists 
  list_of_emo.each do |key, value|
    if value[:japanese] == emoticon
      return key          #note we want to return the key because we want to know the meaning what the jap emoticon means 
    end 
  end

  #if no emoticon is found then return a message
  "Sorry, that emoticon was not found"
end

#binding.pry 