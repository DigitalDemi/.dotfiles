neofetch
. $env:USERPROFILE\.config\powershell\user_profile.ps1
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
oh-my-posh init pwsh --config ~/.demii.omp.json | Invoke-Expression

Function search-google {
        $query = 'https://www.google.com/search?q='
        $args | % { $query = $query + "$_+" }
        $url = $query.Substring(0, $query.Length - 1)
        start "$url"
}

Set-Alias google search-google
