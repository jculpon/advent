GAME_DIRS=erasure audcclusion

help:
	@echo 'Usage:'
	@echo '    BUILD COMMANDS'
	@echo '    make help       - show this message'
	@echo '    make all        - build all components'
	@echo
	@echo '    TESTING COMMANDS'
	@echo '    make test       - run tests for all components'
	@echo '    make lint       - run code analysis on all components'

.PHONY: subdirs $(GAME_DIRS)
subdirs: $(GAME_DIRS)

all: subdirs
	@echo "Building $(GAME_DIRS)..."
	make all -C subdirs
	@echo "...complete!"

test:
	@echo 'Not implemented!'

lint:
	@echo 'Not implemented!'

.PHONY: help test lint all
