#!/bin/bash
#ssh -L 30200:$(hostname -I | awk '{print $1}'):30200 tamayo@10.2.0.238
# sintaxis: <local port>:<minikube | cluster ip>:<remote port> <remote creds@remote hostOS ip>
ssh -L 30080:192.168.49.2:30080 tamayo@10.2.0.238
