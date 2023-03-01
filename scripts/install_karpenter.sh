#!/usr/bin/env bash

# change to your AWS profile
export AWS_PROFILE="eficode-academy"
export AWS_ACCOUNT_ID="$(aws sts get-caller-identity --query 'Account' --output text)"

# change as appropriate
export CLUSTER_NAME="zh-demo-k8s-cluster"
export AWS_DEFAULT_REGION="eu-west-1"
export KARPENTER_VERSION=v0.24.0

export CLUSTER_ENDPOINT="$(aws eks describe-cluster --name ${CLUSTER_NAME} --query "cluster.endpoint" --output text)"
export KARPENTER_IAM_ROLE_ARN="arn:aws:iam::${AWS_ACCOUNT_ID}:role/zh-demo-karpenter-autoscaler"

echo "$CLUSTER_ENDPOINT" $KARPENTER_IAM_ROLE_ARN

helm upgrade --install karpenter-cluster-autoscaler \
	oci://public.ecr.aws/karpenter/karpenter \
	--version ${KARPENTER_VERSION} \
	--namespace karpenter --create-namespace \
	--set serviceAccount.annotations."eks\.amazonaws\.com/role-arn"=${KARPENTER_IAM_ROLE_ARN} \
	--set settings.aws.clusterName=${CLUSTER_NAME} \
	--set settings.aws.clusterEndpoint="${CLUSTER_ENDPOINT}" \
	--set settings.aws.defaultInstanceProfile=zh-demo-karpenter-node \
	--wait
