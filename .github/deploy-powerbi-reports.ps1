# Variables
$workspaceId = "a0bec0fb-588d-477e-b39f-1eac7103e551"
$reportFilesPath = "C:\Users\rajesht\PowerBI_Repo\Reports" # Assuming reports are in a specific folder
 
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
