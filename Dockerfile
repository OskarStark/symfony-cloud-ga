FROM php:7.3-alpine

LABEL "com.github.actions.name"="SymfonyCloud"
LABEL "com.github.actions.description"="Use the Symfony binary via GithubActions"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/oskarstark/symfony-cloud-ga"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Oskar Stark <oskarstark@googlemail.com>"

RUN apk add --no-cache bash \
    && apk add --no-cache git

RUN wget https://get.symfony.com/cli/installer -O - | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
