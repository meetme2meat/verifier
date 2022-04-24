== README.md



```docker
git clone https://github.com/meetme2meat/verifier.git
cd verifier
docker build --tag meetme2meat/httpserver:latest .
docker run -p 8080:8080 meetme2meat/httpserver:latest
curl http://localhost:8080/v1/:email/verification
```