#!/usr/bin/env bash
set -u

# Get the git message for this commit
git_message=$(git --git-dir=/tmp/workspace/.git log --format=%B -n 1 "$CIRCLE_SHA1")
echo "The git message is:"
echo "-----------"
echo "$git_message";
echo "-----------"

# If the commit message doesn't contain [AUTO-PROCEED] don't notify
if [[ $git_message != *"[AUTO-PROCEED]"* ]]; then
    echo "The auto-proceed prefix doesn't exist so skipping release notification"
    exit 0
fi

if [ -z "$VERSION" ]; then
  echo "VERSION tag is missing"
  exit 1
fi

if [ -z "$CHANGELOG" ]; then
  echo "CHANGELOG text is missing"
  exit 1
fi

MSG_SUBJECT="🤖 Planet 4 new release: $VERSION"
MSG_BODY="Hi everyone,<br><br> A new Planet 4 release is being deployed today. Below is the full list of changes.<br><br>$CHANGELOG<br>The P4 Bot 🤖"
EMAIL_TO="$RELEASE_EMAIL_TO"
EMAIL_FROM="$RELEASE_EMAIL_FROM"


json=$(jq -n \
  --arg EMAIL_TO "$EMAIL_TO" \
  --arg EMAIL_FROM "$EMAIL_FROM" \
  --arg MSG_SUBJECT "$MSG_SUBJECT" \
  --arg MSG_BODY "$MSG_BODY" \
'{
  "personalizations": [
    {
      "to": [
        {
          "email": $EMAIL_TO
        }
      ]
    }
  ],
  "from": {"email": $EMAIL_FROM},
  "subject": $MSG_SUBJECT,
  "content": [
    {
      "type": "text/html",
      "value": $MSG_BODY
    }
  ]
}')


curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header "Authorization: Bearer $SENDGRID_API_KEY" \
  --header 'Content-Type: application/json' \
  --data "${json}"