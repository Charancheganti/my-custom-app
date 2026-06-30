# Use Nginx lightweight base image
FROM nginx:alpine

# Copy our clean local HTML menu file directly into Nginx web servers directory
COPY index.html /usr/share/nginx/html/index.html

# Expose standard web traffic port
EXPOSE 80
