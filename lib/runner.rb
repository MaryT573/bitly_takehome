require_relative 'click.rb'

filepath = "../data/encodes.csv"
filename = "../data/decodes.json"
input = ARGV[0].to_i
if input != 0
    var = ARGV[0].split('')
    if var.count == 4
        click = Click.new(filepath).decode_access(filename, ARGV[0])   
    else 
        p "only enter a year"
    end
else
    p "Please, only enter a year"
end

     
