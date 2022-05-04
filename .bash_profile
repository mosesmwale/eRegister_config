SERVICE="mysqld";
if ! pgrep "sshd" >/dev/null ; then echo "[Starting sshd...]" && sshd && echo "[OK]"; else echo "[ssh is running]"; fi;
rm -rf /data/data/com.termux/files/usr/var/run/apache2/httpd.pid
if ! pgrep "httpd" >/dev/null ; then echo "[Starting httpd...]" && httpd && echo "[OK]"; else echo "[httpd is running]"; fi;
mysqld --skip-grant-tables --general-log &
if ! pgrep -x "$SERVICE" >/dev/null ; then echo "[$SERVICE is running]"; else echo "[$SERVICE stopped]"; killall $SERVICE; fi;
mysqld --skip-grant-tables --general-log &