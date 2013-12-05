GITHUB_BRANCH=gh-pages
LAST_COMMIT=`git log -1 --oneline`

help:
	@echo 'Usage:'
	@echo '    make help       - show this message'
	@echo '    make prereqs    - install prerequisites required to build'
	@echo '    make publish    - build exported site in publish/'
	@echo '    make github     - upload the site to GitHub Pages'

prereqs:
	pip install -r pip-requirements.txt

github: publish
	ghp-import -b $(GITHUB_BRANCH) -m "Publishing github pages from $(LAST_COMMIT)" $(PUBLISH_DIR)
	git push origin $(GITHUB_BRANCH)

.PHONY: help github publish prereqs
