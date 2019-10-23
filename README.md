# GithubAction for SymfonyCloud

## Usage

You can use it as a Github Action like this:

_.github/workflows/test.yml_
```
on: [push, pull_request]
name: Deploy
jobs:
  symfony-cloud:
    name: SymfonyCloud
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: SymfonyCloud
      uses: docker://oskarstark/phpstan-ga
      with:
        args: deploy
        env:
          SYMFONY_TOKEN: ${{ secrets.SYMFONY_TOKEN }}
```

**You can copy/paste the .github folder (under examples/) to your project and thats all!**

## Docker

A Docker-Image is built automatically and located here:
https://hub.docker.com/r/oskarstark/symfony-cloud-ga

You can run it in any given directory like this:

`docker run --rm -it -w=/app -v ${PWD}:/app oskarstark/symfony-cloud-ga:latest deploy`

