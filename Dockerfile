FROM nginx:latest
#Defining the work directory
WORKDIR /usr/share/nginx/html
# Copy all files into the container at webroot path
COPY . /usr/share/nginx/html
# Expose the port that the app will run on
EXPOSE 80
# Define the command to run the application
CMD [ "nginx","-g","daemon off;" ]
