# ==========================================================
# Create Ansible Folder Structure
# Project: AWS DevOps Production Project
# ==========================================================

Write-Host ""
Write-Host "Creating Ansible folder structure..."
Write-Host ""

# Create Directories
$folders = @(
    "ansible",
    "ansible\group_vars",
    "ansible\roles",
    "ansible\roles\common",
    "ansible\roles\common\tasks",
    "ansible\roles\docker",
    "ansible\roles\docker\tasks",
    "ansible\roles\nodeapp",
    "ansible\roles\nodeapp\tasks"
)

foreach ($folder in $folders) {

    if (!(Test-Path $folder)) {

        New-Item -ItemType Directory -Path $folder | Out-Null
        Write-Host "[Created] $folder"

    }
    else {

        Write-Host "[Exists ] $folder"

    }

}

# Create Files
$files = @(
    "ansible\ansible.cfg",
    "ansible\inventory",
    "ansible\playbook.yml",
    "ansible\group_vars\all.yml",
    "ansible\roles\common\tasks\main.yml",
    "ansible\roles\docker\tasks\main.yml",
    "ansible\roles\nodeapp\tasks\main.yml",
    "ansible\README.md"
)

foreach ($file in $files) {

    if (!(Test-Path $file)) {

        New-Item -ItemType File -Path $file | Out-Null
        Write-Host "[Created] $file"

    }
    else {

        Write-Host "[Exists ] $file"

    }

}

Write-Host ""
Write-Host "==============================================="
Write-Host " Ansible Folder Structure Created Successfully "
Write-Host "==============================================="