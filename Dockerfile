FROM ubuntu
RUN apt-get update && apt-get install xmltv git -y
COPY entrypoint.sh /entrypoint.sh
COPY initrepo.sh /initrepo.sh
ENV GIT_REPO_LIST="" \
    GIT_REPO_OUTPUT="" \
    GIT_SSH_COMMAND="ssh -oStrictHostKeyChecking=no -i /key/private.key"
ENTRYPOINT ["/entrypoint.sh"]

