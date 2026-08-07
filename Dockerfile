# Step 1: Base Image
FROM nginx:alpine

# Step 2: Remove Default Nginx Config
RUN rm /etc/nginx/conf.d/default.conf

# Step 3: Inject Custom Config & Web Code
COPY nginx.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/index.html

# Step 4: Expose Port 80
EXPOSE 80

# Step 5: Start Server
CMD ["nginx", "-g", "daemon off;"]
