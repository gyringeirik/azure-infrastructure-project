# Utviklingsmiljø

Jeg brukte macOS, Terraform, Azure CLI og Azure-portalen.


## Azure-ressurser

- Ressursgruppe for labprosjektet.
- Azure Storage-konto opprettet med Terraform.

## Verifisering

Jeg sjekket at ressursgruppen og lagringskontoen var synlige i Azure-portalen
og at begge dukket opp i `terraform state list`.

Jeg tildelte Entra-brukeren min rollen Storage Blob Data Contributor på labens lagringskonto og brukte Azure CLI med --auth-mode login. Terraform aktiverte blob-versjonering og soft delete med sju dagers oppbevaring. Jeg lastet opp og slettet en testfil, gjenopprettet den fra en tidligere versjon og bekreftet at innholdet var identisk med originalen.
