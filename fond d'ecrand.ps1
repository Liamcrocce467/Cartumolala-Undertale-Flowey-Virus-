Add-Type @"
using System;
using System.Runtime.InteropServices;

public class WallpaperChanger
{
    [DllImport("user32.dll", CharSet = CharSet.Unicode)]
    public static extern int SystemParametersInfo(
        int uAction,
        int uParam,
        string lpvParam,
        int fuWinIni);
}
"@

# =========================================================
# RÉGLAGES
# =========================================================

$Intervalle = 1

# Dossier Images
$images = [Environment]::GetFolderPath("MyPictures")

$extensions = @(
    "*.jpg",
    "*.jpeg",
    "*.png",
    "*.bmp",
    "*.webp"
)

# Récupérer les images
$files = foreach ($extension in $extensions) {
    Get-ChildItem `
        -Path $images `
        -Filter $extension `
        -File `
        -ErrorAction SilentlyContinue
}

if (-not $files) {
    Write-Host "Aucune image trouvee dans le dossier Images."
    pause
    exit
}

# =========================================================
# BOUCLE
# =========================================================

while ($true) {

    # Choisir une image au hasard
    $wallpaper = $files | Get-Random

    # Changer le fond
    [WallpaperChanger]::SystemParametersInfo(
        20,
        0,
        $wallpaper.FullName,
        3
    )

    Write-Host "Fond : $($wallpaper.Name)"

    # Attendre 1 seconde
    Start-Sleep -Seconds $Intervalle
}