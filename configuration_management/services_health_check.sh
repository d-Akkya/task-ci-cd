echo "Verifying services..."
systemctl is-active --quiet docker && echo "Docker is running"
systemctl is-active --quiet jenkins && echo "Jenkins is running"
systemctl is-active --quiet nginx && echo "NGINX is running"
