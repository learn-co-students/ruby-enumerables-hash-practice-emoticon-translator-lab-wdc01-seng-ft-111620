# require modules here
require 'pry'
require 'yaml'

def load_library(file)
  # code goes here
  new_emoticons = {}
  emoticons = YAML.load_file(file)
  emoticons.each do |key,value|
    new_emoticons[key] = {}
    #binding.pry
    new_emoticons[key][:english] = value[0]
    new_emoticons[key][:japanese] = value[1]
  end
  new_emoticons
end


def get_english_meaning(file, emoticon)
  # code goes here
  hash = load_library(file)
  message = "Sorry, that emoticon was not found"
  hash.each do |key, value|
    #binding.pry
    if emoticon == value[:japanese]
      return key
    #binding.pry
    end
  end
  return message
end


def get_japanese_emoticon(file, emoticon)
  # code goes here
  message = "Sorry, that emoticon was not found"
  load_library(file).each do |key, value|
    if emoticon == value[:english]
      return value[:japanese]
    end
    #binding.pry
  end
  return message
end
