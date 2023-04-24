require_relative 'click.rb'

filepath = "../data/encodes.csv"
filename = "../data/decodes.json"
click = Click.new(filepath).decode_access(filename)

     
