Add-Type @"
using System;
using System.Runtime.InteropServices;

public class DesktopMover
{
    [DllImport("user32.dll")]
    public static extern IntPtr FindWindow(string a, string b);

    [DllImport("user32.dll")]
    public static extern IntPtr FindWindowEx(
        IntPtr a,
        IntPtr b,
        string c,
        string d
    );

    [DllImport("user32.dll")]
    public static extern IntPtr SendMessage(
        IntPtr hWnd,
        uint msg,
        IntPtr wParam,
        IntPtr lParam
    );

    [DllImport("user32.dll")]
    public static extern int GetSystemMetrics(int nIndex);

    public const uint LVM_FIRST = 0x1000;
    public const uint LVM_GETITEMCOUNT = LVM_FIRST + 4;
    public const uint LVM_SETITEMPOSITION = LVM_FIRST + 15;

    public static IntPtr GetDesktop()
    {
        IntPtr progman = FindWindow(
            "Progman",
            "Program Manager"
        );

        IntPtr defView = FindWindowEx(
            progman,
            IntPtr.Zero,
            "SHELLDLL_DefView",
            null
        );

        if (defView == IntPtr.Zero)
        {
            IntPtr worker = IntPtr.Zero;

            while ((worker = FindWindowEx(
                IntPtr.Zero,
                worker,
                "WorkerW",
                null
            )) != IntPtr.Zero)
            {
                defView = FindWindowEx(
                    worker,
                    IntPtr.Zero,
                    "SHELLDLL_DefView",
                    null
                );

                if (defView != IntPtr.Zero)
                    break;
            }
        }

        if (defView == IntPtr.Zero)
            return IntPtr.Zero;

        return FindWindowEx(
            defView,
            IntPtr.Zero,
            "SysListView32",
            "FolderView"
        );
    }

    public static int GetCount(IntPtr desktop)
    {
        return (int)SendMessage(
            desktop,
            LVM_GETITEMCOUNT,
            IntPtr.Zero,
            IntPtr.Zero
        );
    }

    public static void Move(
        IntPtr desktop,
        int index,
        int x,
        int y
    )
    {
        int position = (y << 16) | (x & 0xFFFF);

        SendMessage(
            desktop,
            LVM_SETITEMPOSITION,
            (IntPtr)index,
            (IntPtr)position
        );
    }

    public static int ScreenWidth()
    {
        return GetSystemMetrics(0);
    }

    public static int ScreenHeight()
    {
        return GetSystemMetrics(1);
    }
}
"@

# =====================================
# RÉGLAGES
# =====================================

$Intervalle = 0.5


# =====================================
# TROUVER LE BUREAU
# =====================================

$desktop = [DesktopMover]::GetDesktop()

if ($desktop -eq [IntPtr]::Zero)
{
    Write-Host "Bureau introuvable."
    pause
    exit
}


# =====================================
# TAILLE DE L'ÉCRAN
# =====================================

$largeur = [DesktopMover]::ScreenWidth()
$hauteur = [DesktopMover]::ScreenHeight()

Write-Host "Résolution détectée : $largeur x $hauteur"


# =====================================
# BOUCLE
# =====================================

while ($true)
{
    $nombre = [DesktopMover]::GetCount($desktop)

    Write-Host "Icônes : $nombre"

    for ($i = 0; $i -lt $nombre; $i++)
    {
        # Position aléatoire sur tout l'écran
        $x = Get-Random -Minimum 0 -Maximum ($largeur - 100)
        $y = Get-Random -Minimum 0 -Maximum ($hauteur - 100)

        [DesktopMover]::Move(
            $desktop,
            $i,
            $x,
            $y
        )
    }

    Start-Sleep -Seconds $Intervalle
}