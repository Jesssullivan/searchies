# searchies
*hard AF searxng infra for uwu tinies*

### Bits probably not worth mentioning:
- infra agnostic, this is tofu stuff and ansible FTW
- Serves directly over tor network *and* a reverse proxies via seperate caddy node (laced with dreamhost dns!) via tailscale
- Full on redisdb for future bot swatting rigor
- All rocky 9sies
- firm, yet squishy firewall rules
- tailscale serve used for intra-node proxy action
- httpd vhost used for tor
- clones from jesssullivan/searxng


### What it doesn't have:
- No docker, no moocows
- no moomoo barn or dedicated ingress solution
- anon graphana
- needs cd pipeline for banging!  uppies!  uppies!  


**On darwin controllers, you'll need dees:**
```shell
# on mac:
brew install doctl opentofu
```

### Controller setup:
- Be certain your ansible controller (probably this computer) is on your tailnet.
- Authenticate yourself with tailcale and your vps.  This is a tofu project, the infrastructure provider could be you and your basement cluster, openstack, DO, hetzner etc, it doesn't really matter.


```
# if you are using DO:
# to get the ID of your ssh key with DO, you'll want to do this:
# doctl -t <dop_v1>_your_DO_API_KEY> compute ssh-key list
```

**Setup local env:**
```shell
sudo chmod +x scripts/setup_venv.sh
./scripts/setup_venv.sh && source searchies_venv/bin/activate
```

**Provision and deploy everything**
```shell
ansible-playbook -i inventory_dev -K deploy-searchies.yml
```
