STACK_NAME=altair-infrastructure-stack
TEMPLATE_FILE=file://infrastructure.yaml
REGION=ap-northeast-1
PROFILE=miyabiii_terraform
AMI_ID=ami-0ab02459752898a60
KEY_NAME=altair-key
PUBLIC_IP=13.231.8.65

.PHONY: chmod-altair-key to-access
chmod-altair-key:
	chmod 400 ./$(KEY_NAME).pem && ls -lh $(KEY_NAME).pem

to-access:
	ssh -i ./$(KEY_NAME).pem ec2-user@$(PUBLIC_IP)

.PHONY: create-stack describe-stack delete-stack
create-stack:
	aws cloudformation create-stack \
		--stack-name $(STACK_NAME) \
		--region $(REGION) \
		--profile $(PROFILE) \
		--template-body $(TEMPLATE_FILE) \
		--parameters ParameterKey=KeyName,ParameterValue=$(KEY_NAME) \
								ParameterKey=ImageId,ParameterValue=$(AMI_ID) \
		--on-failure DELETE | jq .

describe-stack:
	aws cloudformation describe-stacks \
		--stack-name $(STACK_NAME) \
		--region $(REGION) \
		--profile $(PROFILE) | jq .

delete-stack:
	aws cloudformation delete-stack \
		--stack-name $(STACK_NAME) \
		--region $(REGION) \
		--profile $(PROFILE) | jq .
