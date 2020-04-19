# general
alias l="ls -lAh"
alias sshkey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied to clipboard'"
alias pbc="pbcopy <"

# work
alias bundle='cd ~/Downloads/; process-bundle ~/HashiCorp/support-bundles/; cd ~/HashiCorp/support-bundles/'
alias dump='if [[ -e master/replicated/internal/ledis-app.dump ]]; then ptfe-support-tool --dump-file master/replicated/internal/ledis-app.dump | jq . && echo "ledis-dump used"; else jq . master/replicated/internal/app-config.json && echo "app-config used"; fi'
