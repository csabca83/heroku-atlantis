FROM runatlantis/atlantis:v0.17.3

# Run the image as a non-root user
RUN adduser -D myuser
USER myuser

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku
# test
CMD atlantis server \
--port=$PORT \
--gh-user=$GH_USER \
--gh-token=$GH_TOKEN \
--gh-webhook-secret=$GH_WEBHOOK_SECRET \
--repo-allowlist=$REPO_ALLOWLIST \
--repo-config-json='{"repos":[{"id":"/.*/", "allowed_overrides":["apply_requirements","workflow"], "allow_custom_workflows":true}]}'
