LOG_DIR="/home/ubuntu/task-ci-cd/configuration_management/log/service_health"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/health_$(date +'%Y-%m-%d_%H-%M').log"

echo "Health Check - $(date)" > "$LOG_FILE"
echo "Verifying services..."
systemctl is-active --quiet docker && echo "Docker is running"
systemctl is-active --quiet jenkins && echo "Jenkins is running"
systemctl is-active --quiet nginx && echo "NGINX is running"
