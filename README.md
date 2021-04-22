## SCONE FSPF Volume Demo
This repository forks SCONE FSPF volume demo.

### Details
```bash
docker-compose.yml: configurations of las, cas, and volume-demo services
run.sh: perform attestation, deploy sessions for encrypting benchmark, and run encrypted benchmark with CAS service
session_template.yml: session policy for encrypting benchmark using test.py
simple.py: simple Python script, just import paddle
```

Try it out by executing:
```bash
git clone https://github.com/YueWang1996/microbenchmark.git && cd microbenchmark
```
Iust run this demo by a single command: 
```bash
docker-compose up
```

### Contacts
Send emails to yuewangsue@gmail.com
