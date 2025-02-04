SHELL := /usr/bin/env bash

# HOW TO EXECUTE

# Executing Terraform PLAN
#	$ make tf-plan-eks env=<env> region=<region> account=<account> subenv=<subenv>

# Executing Terraform APPLY
#   $ make tf-apply-eks env=<env> region=<region> account=<account> subenv=<subenv>

# Executing Terraform DESTROY
#	$ make tf-destroy-eks env=<env> region=<region> account=<account> subenv=<subenv>

# Example for running the dev config in preprod ->  live/preprod/eu-west-1/application/dev/base.tfvars
#  $ make tf-plan-eks env=preprod region=eu-west-1 account=application subenv=dev

# Example for running the dev config in preprod ->  live/preprod/eu-west-1/gaming/test/base.tfvars
#  $make tf-plan-eks env=preprod region=eu-west-1 account=gaming subenv=test


all-test: clean tf-plan-eks

.PHONY: clean
clean:
	rm -rf .terraform

.PHONY: tf-plan-eks
tf-plan-eks:
	export AWS_REGION=${region} && terraform init -backend-config ./live/${env}/${region}/${account}/${subenv}/backend.conf -reconfigure source && terraform validate && terraform plan -var-file ./live/${env}/${region}/${account}/${subenv}/base.tfvars source

.PHONY: tf-apply-eks
tf-apply-eks:
	export AWS_REGION=${region} && terraform init -backend-config ./live/${env}/${region}/${account}/${subenv}/backend.conf -reconfigure source && terraform validate && terraform apply -var-file ./live/${env}/${region}/${account}/${subenv}/base.tfvars -auto-approve source

.PHONY: tf-destroy-eks
tf-destroy-eks:
	export AWS_REGION=${region} && terraform init -backend-config ./live/${env}/${region}/${account}/${subenv}/backend.conf -reconfigure source && terraform validate && terraform destroy -var-file ./live/${env}/${region}/${account}/${subenv}/base.tfvars -auto-approve source
