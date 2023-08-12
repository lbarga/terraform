#!/bin/sh

set -e

cd "${0%/*}" || return

echo "----------------------------------------"
echo "Creating an optimized production React App build..."
cd ../website || return
npm ci
npm run build
echo "----------------------------------------"
cd ../terraform || return
echo "Formatting terraform files"
echo "terraform fmt -recursive"
terraform fmt -recursive
echo "----------------------------------------"
echo "terraform init"
terraform init
echo "----------------------------------------"
echo "Validating terraform files"
echo "terraform validate"
terraform validate
echo "----------------------------------------"
echo "Planning..."
echo "terraform out=plan.tfout"
terraform plan -out="plan.tfout"
echo "----------------------------------------"
echo "Applying..."
echo "terraform apply plan.tfout"
terraform apply plan.tfout
echo "----------------------------------------"
echo "Cleaning up plan file"
echo "rm -rf plan.tfout"
rm -rf plan.tfout
echo "----------------------------------------"