# Variables
$workspaceId = "a0bec0fb-588d-477e-b39f-1eac7103e551"
$accessToken = "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"
$gitRepoUrl = https://github.com/RajeshTaidala1/PowerBI_Repo
$localRepoPath = "C:\Users\rajesht\PowerBI_Repo"
$reportFilesPath = "C:\Users\rajesht\PowerBI_Repo\Reports" # Assuming reports are in a specific folder
 
# Clone the GitHub repository
git clone $gitRepoUrl $localRepoPath
 
# Get list of report files
$reportFiles = Get-ChildItem -Path $reportFilesPath -Filter *.pbix
 
# Iterate through each report file and publish to workspace
foreach ($reportFile in $reportFiles) {
    $reportName = $reportFile.BaseName
    $reportFilePath = $reportFile.FullName
    
    # Publish report to workspace
Invoke-RestMethod -Uri https://api.powerbi.com/v1.0/myorg/groups/$workspaceId/imports?datasetDisplayName=$reportName&nameConflict=CreateOrOverwrite -Method Post -Headers @{
        "Authorization" = "Bearer $accessToken"
    } -InFile $reportFilePath -ContentType "multipart/form-data"
}
