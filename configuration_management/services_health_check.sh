#!/bin/bash

LOG_DIR="/home/ubuntu/task-ci-cd/configuration_management/log/service_health"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/service_health_$(date +'%Y-%m-%d_%H-%M').log"

{
  echo "===== Health Check: $(date '+%Y-%m-%d %H:%M:%S') ====="
  
  echo -n "Docker: "
  systemctl is-active --quiet docker && echo "Running" || echo "Not Running"

  echo -n "Jenkins: "
  systemctl is-active --quiet jenkins && echo "Running" || echo "Not Running"

  echo -n "NGINX: "
  systemctl is-active --quiet nginx && echo "Running" || echo "Not Running"
  
  echo "============================================="
} >> "$LOG_FILE" 2>&1

