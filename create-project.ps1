# AWS DevOps Production Project Structure Creator

Write-Host ""
Write-Host "Creating AWS DevOps Project Structure..."
Write-Host ""

# Root folders
$folders = @(
"architecture",
"bootstrap",

"terraform-infra",
"terraform-infra\modules",

"terraform-infra\modules\vpc",
"terraform-infra\modules\security-groups",
"terraform-infra\modules\ec2",
"terraform-infra\modules\iam",
"terraform-infra\modules\alb",
"terraform-infra\modules\autoscaling",
"terraform-infra\modules\cloudwatch",
"terraform-infra\modules\route53",

"ansible",

"docker",

"jenkins",

"app",

"scripts",

"docs"
)


foreach ($folder in $folders)
{
    New-Item -ItemType Directory -Force -Path $folder | Out-Null
}


# Root files

$rootFiles = @(
"README.md",
".gitignore",
"LICENSE"
)


foreach ($file in $rootFiles)
{
    New-Item -ItemType File -Force -Path $file | Out-Null
}


# Terraform files

$terraformFiles = @(
"main.tf",
"variables.tf",
"outputs.tf",
"provider.tf",
"versions.tf",
"terraform.tfvars",
"backend.tf"
)


foreach ($file in $terraformFiles)
{
    New-Item -ItemType File -Force -Path "terraform-infra\$file" | Out-Null
}


# Terraform modules files

$modules=@(
"vpc",
"security-groups",
"ec2",
"iam",
"alb",
"autoscaling",
"cloudwatch",
"route53"
)


foreach ($module in $modules)
{

    foreach($file in @(
    "main.tf",
    "variables.tf",
    "outputs.tf",
    "versions.tf",
    "README.md"
    ))
    {

        New-Item `
        -ItemType File `
        -Force `
        -Path "terraform-infra\modules\$module\$file" | Out-Null

    }

}


# Bootstrap folder

foreach ($file in $terraformFiles)
{
    New-Item -ItemType File -Force -Path "bootstrap\$file" | Out-Null
}


# Documentation

$docs=@(
"Terraform.md",
"AWS-Networking.md",
"Troubleshooting.md",
"Interview-QA.md"
)


foreach($file in $docs)
{
    New-Item -ItemType File -Force -Path "docs\$file" | Out-Null
}


Write-Host ""
Write-Host "===================================="
Write-Host " AWS DevOps Project Created "
Write-Host " Successfully "
Write-Host "===================================="