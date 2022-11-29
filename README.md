## Intro to Containers Lecture 

### Study Notes
[Docker CLI Cheatsheet](https://github.com/getfutureproof/fp_guides_wiki/wiki/Docker-101-Cheatsheet)


## Demo Repo
- To run the demo repo code:
1. Fork and clone down the repo
2. `cd` into the folder
3. Install dependencies
    - `cd server`
    - `npm install`
4. Start your server
    - `npm run dev`

## To start the container 

- Download the image that you want from Docker Hub
    - `docker pull <image name>`
- Run the container 
    - `docker run <image name>
    
Then navigate to the local folder that you want to copy into the docker container. 
    - `docker run -it -p 3000:3000 --name project-three --mount type=bind,src="$(pwd)",dst=/code node:latest /bin/bash`
Lets break the above down:
* `-it` = open interactive terminal
* ` -p 3000:3000` = creating port at 3000
* `--name` = name of the container
* `--mount type=bind` = chosen method of getting local files. 
* `src="$(pwd)"` = print working directory command to get that full path of the chose folder
* `dst=/code"` = creating a folder called code inside the container where the local files will be added to
* `node:latest` = image and flag of the container
* `bash` = "language" chosen for the commands
 
 Then you need to navigate to the newly created code folder. Once in there you can run:
 - `npm install`
 - `npm run dev container`

You can combine the bind mount and the npm commands into one line:

`docker run -it -p 3002:3000 --name project-three --mount type=bind,src="$(pwd)",dst=/code -w /code node:latest bash -c "npm install && npm run dev"`

- `-w /code` simply navigates into the code folder that you just created
- `-c "npm install && npm run dev` installs and run dependencies

 To avoid having to rewrite this command, we can open the local folder in VSCode and create a file called start-container.sh.
 In that file you can then add the big command above as:
``` docker run -it \
-p 3000:3000 \
--name project-three \
--mount type=bind,src="$(pwd)",dst=/code \
-w /code \
node:latest \
bash -c "npm intall && npm run dev"
```

Make sure you add `"dev-container": "bash scripts/start-container.sh"` into the scripts section of the package.json file

Then from a terminal, you can simply run `npm run dev container`
    
