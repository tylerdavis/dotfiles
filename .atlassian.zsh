export STAFF_ID=tydavis

# StatusPage specific stuff
alias fs='foreman start -f Procfile.dev -c web=1,webpack=1'
alias fsw='foreman start -f Procfile.dev -c web=1,webpack=1,worker=1,worker_nm=1,worker_other=1'

# AWS
[ -f ~/awscli-saml-auth/zshrc_additions ] && . ~/awscli-saml-auth/zshrc_additions
alias awstoken='awstoken -u $STAFF_ID'
