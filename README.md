## bitly_takehome
### Description

This is a ruby program that reads the CSV file and JSON file to return a JSON output to console with all of the url's and click counts shown in descending order. Example output shown below:

<img width="1087" alt="Screen Shot 2023-04-24 at 8 22 17 PM" src="https://user-images.githubusercontent.com/81441711/234159413-9b65944e-380c-4d79-9da9-8a01e691a3aa.png">

It starts with a runner file that intializes the click class and feeds in the path to the data:

<img width="747" alt="Screen Shot 2023-04-24 at 8 34 44 PM" src="https://user-images.githubusercontent.com/81441711/234160752-f3be1dc4-0327-4a72-9da1-f628d3f3ff4d.png">

Once the class click is intialized it loops through the CSV file creating two hashes to store the urls and hashes from the csv:

<img width="705" alt="Screen Shot 2023-04-24 at 8 38 12 PM" src="https://user-images.githubusercontent.com/81441711/234161240-a6c09366-faec-46b2-8001-fba352dd72a5.png">

Then the method decode_access reads and parses the JSON file and then loops through it once. Checking each entry to make sure it took place in 2021 and checking that it matches one of the hashes from the CSV. The counter hash then matches the hash to the saved key, adding one to it's value every time one matches. Therefore adding up the number of clicks for each hash. Lastly it calls the final method decode_count.

<img width="936" alt="Screen Shot 2023-04-24 at 8 40 35 PM" src="https://user-images.githubusercontent.com/81441711/234161395-595df37b-d7bd-4351-87c5-221eb60d7b2e.png">

In decode_count a new hash is made to take the urls from the encode hash and the counted clicks from the counter hash and combine them. After they are combined they are sorted into descending order by click number and turned into a JSON object within an array.

<img width="989" alt="Screen Shot 2023-04-24 at 8 48 19 PM" src="https://user-images.githubusercontent.com/81441711/234162414-a3051d04-68c5-44a1-8d43-db0269ac6f8b.png">

### How to run

To run this program you will need ruby version 2.7.4 installed on your machine. 

Once it is installed you can run the program from within the lib directory "/bitly_takehome/lib". To run it you should enter the command "ruby runner.rb". Once run it should output:

[{"https://youtube.com/":557,"https://twitter.com/":512,"https://reddit.com/":510,"https://github.com/":497,"https://linkedin.com/":496,"https://google.com/":492}]
