# gen_policy.sh
set -x -e

# generate a security policy session for python app using template
unset MRENCLAVE SCONE_CONFIG_ID
export MRENCLAVE=$(SCONE_HASH=1 python3) # get MRENCLAVE/HASH of python3
#MRENCLAVE="e1279dcd6acdba6968cb6ac0c1149c1976ed60ecf0ebb3a405d9e1aec658d0a2"
envsubst '$MRENCLAVE' < session_template.yml > session.yml
unset MRENCLAVE SCONE_CONFIG_ID 

# submit_policy.sh
set -x -e

CAS_ADDR=cas
# get MRENCLAVE of CAS by running: docker-compose run -eSCONE_HASH=1 cas
CAS_MRENCLAVE="663ddae4f0036a39c18a533d97f7a5ba0850f2efb0147d63afa459a20315a7e1"

echo "Attesting CAS ..."
scone cas attest -G --only_for_testing-debug --only_for_testing-ignore-signer "$CAS_ADDR" "$CAS_MRENCLAVE"

echo "Uploading policy to CAS ..."
scone session create --use-env "session.yml"
echo ""

# run.sh
# clean output volume
rm -rf /demo/encrypted_volume/
mkdir /demo/encrypted_volume/

# execute the python app with the deployed security session, SCONE_CONFIG_ID --> pass remote attestation information to the container
SCONE_VERSION=7 SCONE_CONFIG_ID=volume_policy/volume_service time python3
