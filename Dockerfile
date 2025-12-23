FROM nginx:alpine

# Copy static site content
COPY index.html styles.css config.js /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
