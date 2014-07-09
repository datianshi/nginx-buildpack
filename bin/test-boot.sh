export APP_ROOT=/home/vcap/app

echo "PORT is: $PORT"
mv $APP_ROOT/public/httpd.conf $APP_ROOT/public/httpd.conf.org
erb $APP_ROOT/public/httpd.conf.org > $APP_ROOT/public/httpd.conf
(tail $APP_ROOT/httpd/logs/*log &)
$APP_ROOT/httpd/bin/apachectl -f $APP_ROOT/public/httpd.conf
