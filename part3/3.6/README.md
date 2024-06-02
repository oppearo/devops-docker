# Optimizing image sizes

## Starting point

The sizes at the beginning of the exercise without optimizations:

```text
➜  3.6 git:(main) ✗ docker image ls
REPOSITORY         TAG       IMAGE ID       CREATED          SIZE
example-backend    latest    bc66312e4933   35 minutes ago   447MB
example-frontend   latest    ba2453430367   37 minutes ago   1.42GB
```

## Backend image

The backend image was optimized from 447 MB to 248 MB. This was mainly achieved by switching the image from the golang-alpine image to the 'vanilla' alpine image, in which go was removed after the successful build. The joining of the RUN commands did not have much of an effect.

```text
➜  3.6 git:(main) ✗ docker image ls | grep backend
example-backend           latest    03d7f3325ccd   About a minute ago   248MB
example-backend-stage1    latest    986c672ebe77   13 minutes ago       447MB
```

## Frontend image

The frontend image was optimized from a whopping 1.42GB to 474MB. This was achieved by using the node-alpine image as a basis to copy node and npm binaries to a fresh alpine image. As the example-frontend did not manage to install the packages on my tests by just adding the LTS node package in alpine, this was a necessary action.

```text
➜  3.6 git:(main) ✗ docker image ls | grep frontend
example-frontend          latest    c0a69f0548d3   5 minutes ago       474MB
example-frontend-stage1   latest    ad05eef63606   40 minutes ago      1.42GB
```
