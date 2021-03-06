export STAFF_ID=tydavis

# StatusPage specific stuff
alias fs='foreman start -f Procfile.dev -c web=1,webpack=1'
alias fsw='foreman start -f Procfile.dev -c web=1,webpack=1,worker=1,worker_nm=1,worker_other=1'
alias sp_psql='psql -h localhost -p 15432 -U hrb status-page_development'
alias sp_ctags='ctags -R --exclude=public --exclude=*.min.js --exclude=node_modules --exclude=.git --exclude=log --exclude=app/assets/javascripts . $(bundle list --paths)'

# AWS
[ -f ~/awscli-saml-auth/zshrc_additions ] && . ~/awscli-saml-auth/zshrc_additions
if [[ -f "${HOME}/.config/cloudtoken/bashrc_additions" ]]; then
    source "${HOME}/.config/cloudtoken/bashrc_additions"
fi
alias awstoken='awstoken -u $STAFF_ID'
