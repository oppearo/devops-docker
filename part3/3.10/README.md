# 3.10

Original Dockerfile (Dockerfile.old) is from exercise 1.11 (Spring example project). Image size was reduced from 611MB to 127MB:

```text
➜  spring-example-project git:(main) ✗ docker image ls | grep java
new-java                  latest    a2ec0aae7f9b   18 seconds ago      127MB
original-java             latest    3b68f1a16889   About an hour ago   611MB
```
