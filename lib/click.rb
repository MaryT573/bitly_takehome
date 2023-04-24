require 'CSV'
require 'json'

class Click
    #this intializes the class and takes in the CSV file, and feeds relevant parts into two hashes (url and hash)
    def initialize(filepath)
        @encode = Hash.new
        @counter = Hash.new
        @csv = CSV.foreach(filepath, headers: true, header_converters: :symbol) do |row|
            @encode[row[0]] = 0
            @counter[row[2]] = 0 
        end  
    end
    #this accesses the JSON file and then checks that the date is == to 2021 and the hash in the url matches 
    #the ones from the CSV file. Once it checks that these conditions are true it adds 1 to the values counter hash
    #connected to the key relating to the hash in that click 
    def decode_access(filename)
        start = File.read(filename)
        file = JSON.parse(start, symbolize_names: true)
        file.each do |x|
            if x[:timestamp].split("")[0..3].join("") == "2021" && @counter.has_key?(x[:bitlink].split("")[-7..-1].join(""))
                @counter[x[:bitlink].split("")[-7..-1].join("")] += 1
            end
        end
        decode_count
    end
    #this creates a new hash that brings together the number of counted instances of the hashes from the CSV
    #and the url from the CSV then sorts it in descending order by value and shovels the hash into an array
    #which is transformed into a JSON object -- puts removes the whitespace created in the to_json method
    def decode_count
        count = 0
        arr = []
        compared = Hash.new
        clicks = @counter.values
        @encode.each do |x, y|
            compared[x] =clicks[count]
            count += 1
        end
        comparison = compared.invert.sort.reverse
        final = comparison.to_h.invert
        arr << final
        puts arr.to_json
    end
end