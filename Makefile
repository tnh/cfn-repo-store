.PHONY: clean validate deploy
all: clean validate deploy

export BRANCH_NAME ?= local
export STACK_NAME ?= cfn-repo-store-$(BRANCH_NAME)

clean:
	echo nothing

validate:
	aws cloudformation validate-template --region ap-southeast-2 --template-body file://cloudformation/deploy.yaml

deploy:
	echo nothing
