if ($PSScriptRoot -match '.+?\\bin\\?') {
    $dir = $PSScriptRoot + "\"
}
else {
    $dir = $PSScriptRoot + "\bin\"
}

$copy = $dir + "\copy\BepInEx" 

New-Item -ItemType Directory -Force -Path ($dir + "\out")  
Remove-Item -Force -Path ($dir + "\copy") -Recurse -ErrorAction SilentlyContinue

# AIS -----------------------------------------------------------------------------------------------------------------------------------------
& robocopy ($dir + "\BepInEx\plugins\IllusionFixes\") ($copy + "\plugins\IllusionFixes") "AI_*.*" /R:5 /W:5 

& robocopy ($dir + "\BepInEx\patchers\") ($copy + "\patchers") /R:5 /W:5     

$ver = [System.Diagnostics.FileVersionInfo]::GetVersionInfo((Get-ChildItem -Path ($copy + "\*.dll") -Recurse -Force)[0]).FileVersion.ToString()
Compress-Archive -Path $copy -Force -CompressionLevel "Optimal" -DestinationPath ($dir + "out\" + "IllusionFixes_AIGirl_" + $ver + ".zip")

Remove-Item -Force -Path ($dir + "\copy") -Recurse -ErrorAction SilentlyContinue

# HS2 -----------------------------------------------------------------------------------------------------------------------------------------
& robocopy ($dir + "\BepInEx\plugins\IllusionFixes\") ($copy + "\plugins\IllusionFixes") "HS2_*.*" /R:5 /W:5 

& robocopy ($dir + "\BepInEx\patchers\") ($copy + "\patchers") /R:5 /W:5        
# Get rid of incompatible patchers
Remove-Item -Force -Path ($copy + "\patchers\AI_*")  

$ver = [System.Diagnostics.FileVersionInfo]::GetVersionInfo((Get-ChildItem -Path ($copy + "\*.dll") -Recurse -Force)[0]).FileVersion.ToString()
Compress-Archive -Path $copy -Force -CompressionLevel "Optimal" -DestinationPath ($dir + "out\" + "IllusionFixes_HoneySelect2_" + $ver + ".zip")

Remove-Item -Force -Path ($dir + "\copy") -Recurse

# EC ------------------------------------------------------------------------------------------------------------------------------------------
& robocopy ($dir + "\BepInEx\plugins\IllusionFixes\") ($copy + "\plugins\IllusionFixes") "EC_*.*" /R:5 /W:5     

& robocopy ($dir + "\BepInEx\patchers\") ($copy + "\patchers") /R:5 /W:5     
# Get rid of incompatible patchers
Remove-Item -Force -Path ($copy + "\patchers\AI_*")

$ver = [System.Diagnostics.FileVersionInfo]::GetVersionInfo((Get-ChildItem -Path ($copy + "\*.dll") -Recurse -Force)[0]).FileVersion.ToString()
Compress-Archive -Path $copy -Force -CompressionLevel "Optimal" -DestinationPath ($dir + "out\" + "IllusionFixes_EmotionCreators_" + $ver + ".zip")

Remove-Item -Force -Path ($dir + "\copy") -Recurse

# KK ------------------------------------------------------------------------------------------------------------------------------------------
& robocopy ($dir + "\BepInEx\plugins\IllusionFixes\") ($copy + "\plugins\IllusionFixes") "KK_*.*" /R:5 /W:5     
& robocopy ($dir + "\BepInEx\plugins\IllusionFixes\") ($copy + "\plugins\IllusionFixes") "KKP_*.*" /R:5 /W:5     

$ver = [System.Diagnostics.FileVersionInfo]::GetVersionInfo((Get-ChildItem -Path ($copy + "\*.dll") -Recurse -Force)[0]).FileVersion.ToString()
Compress-Archive -Path $copy -Force -CompressionLevel "Optimal" -DestinationPath ($dir + "out\" + "IllusionFixes_Koikatsu_" + $ver + ".zip")

Remove-Item -Force -Path ($dir + "\copy") -Recurse

# HS ------------------------------------------------------------------------------------------------------------------------------------------
& robocopy ($dir + "\BepInEx\plugins\IllusionFixes\") ($copy + "\plugins\IllusionFixes") "HS_*.*" /R:5 /W:5     

$ver = [System.Diagnostics.FileVersionInfo]::GetVersionInfo((Get-ChildItem -Path ($copy + "\*.dll") -Recurse -Force)[0]).FileVersion.ToString()
Compress-Archive -Path $copy -Force -CompressionLevel "Optimal" -DestinationPath ($dir + "out\" + "IllusionFixes_HoneySelect_" + $ver + ".zip")

Remove-Item -Force -Path ($dir + "\copy") -Recurse

# PH ------------------------------------------------------------------------------------------------------------------------------------------
& robocopy ($dir + "\BepInEx\plugins\IllusionFixes\") ($copy + "\plugins\IllusionFixes") "PH_*.*" /R:5 /W:5     

$ver = [System.Diagnostics.FileVersionInfo]::GetVersionInfo((Get-ChildItem -Path ($copy + "\*.dll") -Recurse -Force)[0]).FileVersion.ToString()
Compress-Archive -Path $copy -Force -CompressionLevel "Optimal" -DestinationPath ($dir + "out\" + "IllusionFixes_PlayHome_" + $ver + ".zip")

Remove-Item -Force -Path ($dir + "\copy") -Recurse

# KKS -----------------------------------------------------------------------------------------------------------------------------------------
& robocopy ($dir + "\BepInEx\plugins\IllusionFixes\") ($copy + "\plugins\IllusionFixes") "KKS_*.*" /R:5 /W:5     

$ver = [System.Diagnostics.FileVersionInfo]::GetVersionInfo((Get-ChildItem -Path ($copy + "\*.dll") -Recurse -Force)[0]).FileVersion.ToString()
Compress-Archive -Path $copy -Force -CompressionLevel "Optimal" -DestinationPath ($dir + "out\" + "IllusionFixes_KoikatsuSunshine_" + $ver + ".zip")

Remove-Item -Force -Path ($dir + "\copy") -Recurse
