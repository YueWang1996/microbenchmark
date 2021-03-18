## SCONE FSPF Volume Demo
This repository contains SCONE FSPF volume demo.

### Details
```bash
docker-compose.yml: configurations of las, cas, and volume-demo services
run.sh: include gen_policy.sh and submit_policy.sh, used for deploying session for encrypting benchmark to CAS
benchmarkrun.sh:  used for CAS and deploying session for running encrypted benchmark to CAS
newrun.sh: include run.sh, used for CAS and deploying sessions for encrypting benchmark and running encrypted benchmark to CAS
session_template.yml: session policy for encrypting benchmark using test.py
test.py: encrypt benchmark from input folder to encrypted volume
session_benchmark.yml: session policy for running encrypted benchmark imported from the encrypted volume
input: benchmark files
```

Try it out by executing:
```bash
git clone https://github.com/YueWang1996/volume-demo.git && cd volume-demo
```
Then, you execute the following command:
```bash
docker-compose run volume-demo bash
```
Note that running with docker-compose it automatically start CAS service for you.
Next go to the demo directory:
```bash
 cd /demo/ && ./run.sh
```
Alternatively, you can just run this demo by a single command: 
```bash
docker-compose up
```
If you check the content of the input file in the encrypted volume:
```bash
vi encrypted_volume/input.txt
```
you will see only cipher text, e.g.,: 
```
À¹^E&¡<91>D>^Eû^O~Eãç«ò^N<88>p<87>Î95
```
### Contacts
Send emails to info@scontain.com
