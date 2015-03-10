GITHUB_BRANCH=gh-pages
PUBLISH_DIR='./publish'
LAST_COMMIT=`git log -1 --oneline`

help:
	@echo 'Usage:'
	@echo '    BUILD COMMANDS'
	@echo '    make help       - show this message'
	@echo '    make prereqs    - install prerequisites required to build'
	@echo
	@echo '    TESTING COMMANDS'
	@echo '    make test       - run tests for all components'
	@echo '    make lint       - run code analysis on all components'
	@echo
	@echo '    PUBLISHING COMMANDS'
	@echo '    make publish    - build exported site in publish/'
	@echo '    make github     - upload the site to GitHub Pages'

prereqs:
	pip install -r pip-requirements.txt


test:
	@echo 'Not implemented!'

lint:
	@echo 'Not implemented!'

publish: 
	@echo 'Only processing raw html currently...'

github: publish
	ghp-import -b $(GITHUB_BRANCH) -m "Publishing github pages from $(LAST_COMMIT)" $(PUBLISH_DIR)
	git push origin $(GITHUB_BRANCH)

.PHONY: help github publish prereqs test lint
