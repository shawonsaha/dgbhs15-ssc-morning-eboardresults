# SSC Result (Individual) DGBHS-15 Morning

*In this project I have collected each student's result of DGBHS-15 Morning from [eboardresults](https://eboardresults.com/) and automate heavy lifting work.*

Filling the same filled every time is tedious. To automate that I have used 'AutoFill'. Though Roll and Captcha had to fill up manually. Still, this extension saves a ton of time.
![Putting query data](https://i.imgur.com/KPkGJHf.gif)

Wish I could automate this part if there was no captcha
![Saving individual's result](https://i.imgur.com/KgqSkti.gif)

processed file will be store in 'renamed' folder
![Creating renamed folder](https://i.imgur.com/puPFndp.gif)

**Task which I am going to automate**
![Manual work](https://i.imgur.com/OyOhqR1.gif)

*copy foldername > enter into folder > rename html file to folder name > cut html file > paste into ./renamed directory*

Here is the script for that

    #!/usr/bash
    # iterate through each item in the current directory
    for name in ssc *;
      do
	    # if $name is a directory then
        if [ -d "$name" ]; then
	      # go inside that folder
          cd "$name"
          # rename existing .html file to <foldername>.html
          mv WEB\ BASED\ RESULT\ PUBLICATION\ SYSTEM\ FOR\ EDUCATION\ BOARDS.html "$name".html
          # move .html file to 'renamed' folder
          mv "$name".html ../renamed
          # up to root
          cd ..
        fi
      done;
      
Final Output
![Running Automation Script](https://i.imgur.com/cMqeN63.gif)

Next I have to generate an index.html page from where I can navigate to any individual's result. To do that at first I created a script to loop through each file and print the filename on terminal. Then I copied the output from terminal and store that into a filenames.txt file
![.html filename collection](https://i.imgur.com/rBpXd9O.png)

Next, I have to create index page where we can see individual name as a list and access their result by clicking on the name. Here is the python code which loop through each line from filenames.txt and generates '\<a href='filename'>filename\</a>' html tag and store each iteration into a varible. Out of the loop it generates a nicely formated index.html file for us!

	import os
	file = open("index.html", "w")
	indexpage = ""

	with open("filenames.txt", "r") as a_file:
	  for line in a_file:
	    stripped_line = line.strip()
	    indexpage += '<a href="' + stripped_line + '">' + stripped_line + '</a> <br>\n'
	file.write(indexpage)
	file.close()

![index.html creation successful](https://i.imgur.com/oEWhElD.png)

Final Output

![Final Output](https://i.imgur.com/leWGp6z.gif)
