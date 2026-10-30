#!/usr//bin/env bash
set -eou pipefail

echo "::group::Terraform initialization"
terraform init -backend=false
echo "::endgroup::"

echo "::add-mask::${AWS_ACCESS_KEY_ID:-LINUXTIPSSTRIGUSGIRUS}"

if terraform validate -no-color; then
    echo "::notice::Terraform validation succeeded"
    echo "tf_result=success" >> "$GITHUB_OUTPUT"
else
    echo "::error file=ec2.tf,line=1,col=1::Terraform validation failed"
    echo "tf_result=failure" >> "$GITHUB_OUTPUT"
    exit 1
fi

echo "::warning::Remember to run 'terraform fmt -check' in a step diferent" 


