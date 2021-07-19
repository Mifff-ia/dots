# taken from https://stackoverflow.com/a/16807995/13518342

script_name="$(basename "$0")"
for pid in $(pidof -x "$script_name"); do
  if [ $pid != $$ ]; then
    echo "[$(date)] : $script_name : Process is already running with PID $pid"
    exit 1
  fi
done
