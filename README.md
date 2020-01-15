# GithubAction for SymfonyCloud

## Usage

You can use it as a Github Action like this:

_.github/workflows/deploy.yml_
```
on: [push, pull_request]
name: Deploy
jobs:
  symfony-cloud:
    name: SymfonyCloud
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Symfony Cloud
      uses: docker://oskarstark/symfony-cloud-ga
      with:
        args: deploy
      env:
        # Get your token here: https://symfony.com/account/security
        # More infos: https://symfony.com/doc/master/cloud/cookbooks/api_tokens.html
        SYMFONY_TOKEN: ${{ secrets.SYMFONY_TOKEN }}

        # This is needed to link the correct project.
        # Get it via: symfony project:info command
        SYMFONY_PROJECT_ID: ${{ secrets.SYMFONY_PROJECT_ID }}
```

**You can copy/paste the .github folder (under examples/) to your project and thats all!**

## Docker

A Docker-Image is built automatically and located here:
https://hub.docker.com/r/oskarstark/symfony-cloud-ga

You can run it in any given directory like this:

`docker run --rm -it -w=/app -v ${PWD}:/app oskarstark/symfony-cloud-ga:latest deploy`

