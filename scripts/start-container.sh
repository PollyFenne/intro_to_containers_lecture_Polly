docker run -it \
-p 3000:3000 \
--name project-three \
--mount type=bind,src="$(pwd)",dst=/code \
-w /code \
node:latest \
bash -c "npm intall && npm run dev"