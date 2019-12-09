
$homepath = (Get-ChildItem Env:\USERPROFILE).Value
$scoopInstallPaht = "$homepath\scoop"

try {
    if (-Not (Test-Path $scoopInstallPaht)) {
        # Install scoop
        Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression
    }

    # Add extras bucket
    scoop bucket add extras
} catch {
    Write-Error $_.Exception.Message
    return
}

$apps = (
        # Utils
        "aria2",
        "curl",
        "7zip",
        "git",
        "busybox",
        "ag",
        "azure-cli",
        "cloc",
        "cmake",
        "make",
        "gcc",
        "kubectl",
        "minikube",
        "open-ssl",
        "paket",
        "yarn",
        "concfg",
        "pshazz",
        "extras/powertoys",

        # Editors
        "vim",
        "extras/emacs",

        # Languages
        "dart",
        "erlang",
        "elixir",
        "go",
        "nodejs-lts",
        "python",
        "racket",
        "rust",
        "sbcl",
        "sqlite"
    )

foreach ($app in $apps) {
    scoop install $app
}

