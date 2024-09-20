#!/bin/bash

# WAHA API Server
[ -z "$WA_API_SERVER" ] && WA_API_SERVER=http://localhost:8081

start_typing() {
  local PAYLOAD="{ \"chatId\": \"${1}@c.us\", \"session\": \"default\" }"
  curl -XPOST -H "Content-Type: application/json" \
  $WA_API_SERVER/api/startTyping \
  -d "$PAYLOAD"
}

stop_typing() {
  local PAYLOAD="{ \"chatId\": \"${1}@c.us\", \"session\": \"default\" }"
  curl -XPOST -H "Content-Type: application/json" \
  $WA_API_SERVER/api/stopTyping \
  -d "$PAYLOAD"  
}

send_text() {
  # $1 = phone number
  local PHONE_NUMBER=$1

  # Remove the first argument (phone number) using shift
  shift

  # Join all arguments into a single string
  local MESSAGE="$@"

  local PAYLOAD="{ \"chatId\": \"$PHONE_NUMBER@c.us\", \"text\": \"$MESSAGE\", \"session\": \"default\" }"

  echo "PAYLOAD: $PAYLOAD"
  curl -XPOST -H "Content-Type: application/json" \
  $WA_API_SERVER/api/sendText \
  -d "$PAYLOAD"
}

random_sleep() {
  local min=3
  local max=10
  local range=$((max - min + 1))
  local random_seconds=$((RANDOM % range + min))
  sleep "$random_seconds"
}

trim() {
    echo "$*" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
}

broadcast_wa_registration() {
  local FILE="$1"
  local MESSAGE_ORIG="Halo %NAME%,\n\nIni adalah pesan pengingat untuk event GenAI Tour 2024 Bali.\n\nJangan lupa untuk hadir besok *Sabtu, 21 September 2024 pkl. 08.30 WITA* di Primakara University.\n\nBawa laptop kamu untuk mempermudah bermain PartyRock challenge dan juga mengikuti workshop.\n\nSampai jumpa besok :)"

  cat $FILE | while read line; do
    NAME="$( echo -e "$line" | awk -F"\t" '{print $1}' )"
    NAME="$( trim "$NAME" )"
    PHONE_NUMBER="$( echo -e "$line" | awk -F"\t" '{print $2}' )"
    PHONE_NUMBER="$( trim "$PHONE_NUMBER" )"
    MESSAGE="$( echo "$MESSAGE_ORIG" | sed "s/%NAME%/$NAME/g" )"

    echo ""
    echo "Processing \"${NAME}\": \"${PHONE_NUMBER}\""

    echo "Simulate typing..."
    start_typing "$PHONE_NUMBER"
    random_sleep
    stop_typing "$PHONE_NUMBER"

    echo "Sending message..."
    send_text "$PHONE_NUMBER" "$MESSAGE"
    echo "$MESSAGE"
    random_sleep
  done
}