Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

Add-Type @"
using System;
using System.Runtime.InteropServices;

public class ClickThrough {
    [DllImport("user32.dll")]
    public static extern int GetWindowLong(IntPtr hWnd, int nIndex);

    [DllImport("user32.dll")]
    public static extern int SetWindowLong(IntPtr hWnd, int nIndex, int dwNewLong);

    public const int GWL_EXSTYLE = -20;
    public const int WS_EX_TRANSPARENT = 0x20;
    public const int WS_EX_LAYERED = 0x80000;
    public const int WS_EX_TOOLWINDOW = 0x80;
}
"@

# Récupérer la taille de l'écran
$screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds

# Créer la fenêtre
$form = New-Object System.Windows.Forms.Form
$form.FormBorderStyle = 'None'
$form.StartPosition = 'Manual'
$form.Location = New-Object System.Drawing.Point($screen.X, $screen.Y)
$form.Size = New-Object System.Drawing.Size($screen.Width, $screen.Height)
$form.BackColor = [System.Drawing.Color]::White
$form.TopMost = $true
$form.ShowInTaskbar = $false

# IMPORTANT : la fenêtre laisse passer les clics
$style = [ClickThrough]::GetWindowLong(
    $form.Handle,
    [ClickThrough]::GWL_EXSTYLE
)

$style = $style -bor [ClickThrough]::WS_EX_TRANSPARENT
$style = $style -bor [ClickThrough]::WS_EX_LAYERED
$style = $style -bor [ClickThrough]::WS_EX_TOOLWINDOW

[void][ClickThrough]::SetWindowLong(
    $form.Handle,
    [ClickThrough]::GWL_EXSTYLE,
    $style
)

# Afficher le flash
$form.Show()

# Durée du flash : 100 ms
Start-Sleep -Milliseconds 100

# Fermer
$form.Close()
$form.Dispose()