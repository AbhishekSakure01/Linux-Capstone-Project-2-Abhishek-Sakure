
#!/bin/bash
LOG="/var/log/health_check.log"

echo "=== $(date) ===" | sudo tee -a "$LOG"

for service in nginx firewalld; do
    if systemctl is-active --quiet "$service"; then
        echo "PASS: $service is running" | sudo tee -a "$LOG"
    else
        echo "FAIL: $service is not running" | sudo tee -a "$LOG"
    fi
done

if curl -fsS http://localhost >/dev/null; then
    echo "PASS: Website is responding" | sudo tee -a "$LOG"
else
    echo "FAIL: Website is not responding" | sudo tee -a "$LOG"
fi

df -h / | tail -1 | sudo tee -a "$LOG"
free -h | grep Mem | sudo tee -a "$LOG"
