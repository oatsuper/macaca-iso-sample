git_version = $$(git branch 2>/dev/null | sed -e '/^[^*]/d'-e's/* \(.*\)/\1/')
npm_bin= $$(npm bin)

install:
		@npm install

all: test
test:
	@echo ""
	@echo "make test-ios             Test sample for iOS"
	@echo "make travis-ios           Travis CI lll"
test-ios:
	macaca doctor
	platform=ios macaca run --verbose -d ./macaca-test/myapp.test.js
travis-ios: install
	${npm_bin}/macaca install ios
	${npm_bin}/macaca doctor
	platform=ios ${npm_bin}/macaca run --verbose -d ./macaca-test/myapp.test.js
jshint:
	@${npm_bin}/jshint .
.PHONY: test
