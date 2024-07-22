Use the official Apache HTTP Server image as a base
FROM httpd:latest

Create the necessary directories
RUN mkdir -p /usr/local/apache2/htdocs/perm-test-dev/container/test-container-esorw-fe01

Copy a dynamically generated index.html to the Apache document root
RUN echo "<h1>Hello From App Server! This is $(hostname -f)</h1>" > /usr/local/apache2/htdocs/perm-test-dev/container/test-container-esorw-fe01/index.html

Change the listening port to 3000
RUN ls -lah /usr/local/apache2/conf/httpd.conf
RUN cat /usr/local/apache2/conf/httpd.conf
RUN sed -i 's/Listen 80/Listen 3000/' /usr/local/apache2/conf/httpd.conf

Expose port 3000
EXPOSE 3000

Start Apache server when the container launches
CMD ["httpd", "-D", "FOREGROUND"]
