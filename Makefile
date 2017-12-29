.PHONY: clean validate deploy
all: clean validate deploy

export BUILDKITE_BRANCH ?= local
export STACK_NAME ?= cfn-repo-store-$(BUILDKITE_BRANCH)

clean:
	echo nothing

validate:
	aws cloudformation validate-template --region ap-southeast-2 --template-body file://cloudformation/deploy.yaml

deploy:
	scripts/create_or_update_stack.sh $(STACK_NAME) cloudformation/deploy.yaml cloudformation/params.json
