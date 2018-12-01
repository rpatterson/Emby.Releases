# Automate building and uploading an apt repository from releases

.PHONY: upload
upload:
	../github-apt-repos/.venv/bin/python -m pdb \
		../github-apt-repos/.venv/bin/github-apt-repos \
		--deb-dir=apt \
		--gpg-pub-key=rpatterson-Emby.Releases.pub.key \
		--github-token=$$(cat .token) \
		--github-apt-repo=rpatterson/Emby.Releases
	../github-apt-repos/.venv/bin/python -m pdb \
		../github-apt-repos/.venv/bin/github-apt-repos \
		--deb-dir=apt/beta \
		--gpg-pub-key=rpatterson-Emby.Releases.pub.key \
		--github-token=$$(cat .token) \
		--github-apt-repo=rpatterson/Emby.Releases \
		--github-prerelease --github-release-prefix=beta
