

echo "STAGE 1: BROWSERS AND PRIVATE KEYS"

echo "STEP 1: from your backup media copy your Github private key to $HOME/.ssh dir"
echo "STEP 2: ssh-add $HOME/.ssh/<github_private_key"
echo "GIT basic config:"
git config --global user.name "Herbert Tamayo"
git config --global user.email "hftamayo@gmail.com"
echo "git config --global core.sshCommand 'ssh -i $HOME/.ssh/<github_private_key'"

echo "STEP 3 web browsers: use your creds to sync bookmarks, plugins and creds: about tabs: use the bookmark tag active_tags"
echo "thus, you should use the list from oneTab"

echo "STEP 4 xpad: copy the files content-xxx and info-xxx to the path .config/xpad"

echo "STEP 5 : Vivaldi browser"

echo "STEP 6: zoom"
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb

