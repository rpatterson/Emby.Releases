# Automate building and uploading an apt repository from releases

ifeq ($(DEBUG),true)
	PYTHON_ARGS = -m pdb
endif

.PHONY: upload
upload:
	../github-apt-repos/.venv/bin/python $(PYTHON_ARGS) \
		../github-apt-repos/.venv/bin/github-apt-repos \
		--deb-dir=apt \
		--gpg-pub-key=rpatterson-Emby.Releases.pub.key \
		--github-token=$$(cat ~/.github.token) \
		--github-apt-repo=rpatterson/Emby.Releases
	../github-apt-repos/.venv/bin/python $(PYTHON_ARGS) \
		../github-apt-repos/.venv/bin/github-apt-repos \
		--deb-dir=apt/beta \
		--gpg-pub-key=rpatterson-Emby.Releases.pub.key \
		--github-token=$$(cat ~/.github.token) \
		--github-apt-repo=rpatterson/Emby.Releases \
		--github-prerelease --github-release-prefix=beta
