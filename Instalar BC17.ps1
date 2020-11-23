install-module bccontainerhelper –force
Set-ExecutionPolicy Unrestricted 
Import-Module BcContainerHelper

$containerName = 'bc17esp'
$credential = Get-Credential -Message 'Using UserPassword authentication. Please enter credentials for the container.'
$auth = 'UserPassword'
$artifactUrl = Get-BCArtifactUrl -storageAccount bcpublicpreview -country es -select Latest -type Sandbox
New-BcContainer -accept_eula `
    -containerName $containerName `
    -credential $credential `
    -auth $auth `
    -artifactUrl $artifactUrl `
    -multitenant:$false `
    -assignPremiumPlan `
    -memoryLimit 8G `
    -vsixFile (Get-LatestAlLanguageExtensionUrl) `
    -updateHosts `
    -includeTestToolkit
