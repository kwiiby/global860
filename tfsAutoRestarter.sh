#!/bin/bash
 ulimit -c unlimited

while true; do
  ./tfs > data/logs/output.log &
  PID=$!
  echo $PID > theforgottenserver.pid
  wait $PID
  sleep 60
done

