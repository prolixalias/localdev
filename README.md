
# localdev
## Docker-based localdev environment

TODO: move to CI

### build
```shell
docker build -f base/Dockerfile -t prolixalias/localdev:latest -t prolixalias/localdev:v0.1.2 base/
docker build -f terraform/Dockerfile -t prolixalias/localdev-terraform:latest -t prolixalias/localdev-terraform:v0.1.2 terraform/
docker build -f selenium-chrome/Dockerfile -t prolixalias/localdev-selenium-chrome:latest -t prolixalias/localdev-selenium-chrome:v0.1.2 selenium-chrome/
```

### push
```shell
docker push prolixalias/localdev:v0.1.2
docker push prolixalias/localdev:latest
docker push prolixalias/localdev-terraform:latest
docker push prolixalias/localdev-terraform:v0.1.2
docker push prolixalias/localdev-selenium-chrome:latest
docker push prolixalias/localdev-selenium-chrome:v0.1.2
```
