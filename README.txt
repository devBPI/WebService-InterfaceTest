Required:

On Debian/Ubuntu
sudo apt-get install php-dom

And on Centos / Fedora / Red Hat:
yum install php-xml

#Install SOAP on PHP:
#apt-get install php-soap
#+ Uncomment line "; extension=php_soap.dll" in php.ini
#+ Restart apache/httpd

Don't forget to AllowOverride All
in /etc/httpd/conf/httpd.conf or /etc/apache/apache.conf

