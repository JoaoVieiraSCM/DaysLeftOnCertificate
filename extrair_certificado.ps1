$dataAtual = Get-Date

$store = New-Object System.Security.Cryptography.X509Certificates.X509Store("My", "CurrentUser")
$store.Open("ReadOnly")

$certificados = $store.Certificates

if ($certificados.Count -gt 0) {
    foreach ($certificado in $certificados) {
        $dataExpiracao = $certificado.NotAfter
        $diasRestantes = ($dataExpiracao - $dataAtual).Days
        Write-Output $diasRestantes
    }
} else {
    Write-Output "Nenhum certificado encontrado."
}

$store.Close()
