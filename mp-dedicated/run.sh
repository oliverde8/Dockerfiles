#!/bin/bash

#
# The dedicated server needs to communicate the proper external ip to the mp master server.
# We will therefore fetch this information and tell the dedicated server that this is our port.
#
# We will do the same with the port as we also might have different ports configured in docker.
#
# This runner is nearly a copy pate of the one done by MiniGod.
# @see https://github.com/MiniGod/maniaplanet-dockerfiles/blob/master/maniaplanet/runner.sh
#
IP=`wget -qO- http://ipinfo.io/ip`

# Run the server and pass all arguments to it as settings some
./ManiaPlanetServer $@ \
    /nodaemon \
    /forceip=$IP:${MP_PORT:-2350} \
    /dedicated_cfg=${MP_CONFIG:-"default.config.xml"} \
    /login=${MP_LOGIN} \
    /password=${MP_PASSWORD} \
    /title=${MP_TITLE:-TMCanyon@nadeo} \
    /game_settings=${MP_GAME_SETTINGS:-MatchSettings/TMCanyonA.txt} \
    >/dev/null &

# Remember PID of the server
serverPID=$!

# Kill server if we get SIGTERM (docker stop <container>)
trap "kill $serverPID" SIGTERM

# Sleep for 1s to make sure the server has created the log file
sleep 1

# Tail the log file, and remember pid (to kill later)
tail -fn1000 Logs/ConsoleLog.$serverPID.txt & tailPID=$!

# Wait for server to exit
wait $serverPID

# Then kill tail
kill $tailPID