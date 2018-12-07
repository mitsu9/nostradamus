#!/bin/sh

NAME="[ NOSTRADAMUS BOT DAEMON ]"
PID="./nostradamus-bot-daemon.pid"
CMD="bundle exec ruby nostradamus-bot.rb"

start()
{
  if [ -e $PID ]; then
    echo "$NAME already started"
    exit 1
  fi
  echo "$NAME START!"
  $CMD
}

stop()
{
  if [ ! -e $PID ]; then
    echo "$NAME not started"
    exit 1
  fi
  echo "$NAME STOP!"
  kill -INT `cat ${PID}`
  rm $PID
}

update_system()
{
  git checkout master
  git pull
  bundle install --path vendor/bundle
}

restart()
{
  stop
  sleep 2
  start
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    restart
    ;;
  *)
    echo "Usage: ./nostradamus-bot.sh [start|stop|restart]"
    ;;
esac
