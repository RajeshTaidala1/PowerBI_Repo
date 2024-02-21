# Variables
$workspaceId = "YOUR_WORKSPACE_ID"
$accessToken = "YOUR_ACCESS_TOKEN"
$gitRepoUrl = https://github.com/yourusername/yourrepository.git
$localRepoPath = "C:\path\to\local\repo"
$reportFilesPath = "C:\path\to\local\repo\reports" # Assuming reports are in a specific folder
 
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
