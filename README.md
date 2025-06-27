# Per Tenant Extension Template
## How to use this template
* Edit file app.json;
    * Generate a new GUID for app.json using the recomended Extension "guid" for VSC.
    * Set a name for your project
    * Set version information
    * Set valid object range
    * Set other settings if needed
* Edit file .vscode/launch.json
    * Set a name for your project
* Edit file AppSourceCop.json
    * Modify suffix, from PTE to PTEA or PTEB etc.. (if you have multiple apps on the same customer)
* Edit the powershell-code in this filed to match your requirements;
    * powershell-script your contain a name for your container
    * a valid path to a license file
    * Set a valid path to the artifacts (or remove if not used).

* Create a new Docker using the revised ps-script
* Download Symbols
* Start to code AL


## Docker Script to create a new Environment

```powershell
Update-Module bccontainerhelper 

$artifactUrl=Get-BCArtifactUrl -type Sandbox -select Latest -country se
$navcredential = New-Object System.Management.Automation.PSCredential -argumentList "admin", (ConvertTo-SecureString -String "admin123" -AsPlainText -Force)
New-BCContainer -containerName <Insert name here> -artifactUrl $artifactUrl -Credential $navcredential -accept_eula -accept_outdated -assignPremiumPlan -auth NavUserPassword -includeAL -updateHosts -isolation hyperv -dns 8.8.8.8

Publish-BcContainerApp -containerName <Insert name here> -appFile "<Insert Path to projectfile here>\artifacts\example.app" -skipVerification -sync -install -scope Tenant
#Remove-BcContainer <Insert name here>
```
