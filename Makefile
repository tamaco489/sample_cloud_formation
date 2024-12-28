STACK_NAME=sample-aws-stack
TEMPLATE_FILE=01_create_network.yaml
REGION=ap-northeast-1
PROFILE=miyabiii_terraform

create:
	aws cloudformation create-stack \
			--stack-name sample-aws-stack \
			--template-body file://01_create_network.yaml \
			--region ap-northeast-1 \
			--profile miyabiii_terraform \
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
