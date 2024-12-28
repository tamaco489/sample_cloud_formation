STACK_NAME=altair-network-stack
TEMPLATE_FILE=file://01_create_network.yaml
REGION=ap-northeast-1
PROFILE=miyabiii_terraform

create:
	aws cloudformation create-stack \
		--stack-name $(STACK_NAME) \
		--region $(REGION) \
		--profile $(PROFILE) \
		--template-body $(TEMPLATE_FILE) \
		--on-failure DELETE | jq .

describe:
	aws cloudformation describe-stacks \
		--stack-name $(STACK_NAME) \
		--region $(REGION) \
		--profile $(PROFILE) | jq .

delete:
	aws cloudformation delete-stack \
		--stack-name $(STACK_NAME) \
		--region $(REGION) \
		--profile $(PROFILE) | jq .
