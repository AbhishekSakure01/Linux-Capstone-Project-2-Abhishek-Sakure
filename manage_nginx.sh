
#!/bin/bash

case "$1" in
    start)
        sudo systemctl start nginx
        ;;
    stop)
        sudo systemctl stop nginx
        ;;
    restart)
        sudo systemctl restart nginx
        ;;
    status)
        sudo systemctl status nginx --no-pager
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac
