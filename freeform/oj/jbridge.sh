#!/bin/bash
#ssh -L 30200:$(hostname -I | awk '{print $1}'):30200 tamayo@10.2.0.238
ssh -L 30200:localhost:30200 tamayo@10.2.0.238
