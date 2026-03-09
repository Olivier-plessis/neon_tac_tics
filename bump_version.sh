#!/usr/bin/env bash

# Fonction d'aide pour afficher l'utilisation du script
helpFunction() {
   echo ""
   echo "Usage: $0 -v versionType"
   echo -e "\tversionType: major, minor, patch ou build"
   echo "Exemple: $0 -v minor"
   exit 1 # Quitte le script après avoir affiché l'aide
}

# --- Traitement des arguments ---
versionType=""
while getopts "v:" opt; do
   case "$opt" in
      v ) versionType="$OPTARG" ;;
      ? ) helpFunction ;; # Affiche l'aide si un paramètre inconnu est passé
   esac
done

# Vérifie si le type de version est renseigné
if [ -z "$versionType" ]; then
   echo "Erreur: Le type de version (-v) est manquant."
   helpFunction
fi

# Vérifie que le type de version est valide
if [[ ! "$versionType" =~ ^(major|minor|patch|build)$ ]]; then
   echo "Erreur: Le type de version '$versionType' est invalide."
   echo "Les types valides sont: major, minor, patch, build."
   helpFunction
fi

# --- Extraction de la version actuelle ---
PUBSPEC_PATH="pubspec.yaml" # Chemin vers pubspec.yaml

# Vérifie si le fichier pubspec.yaml existe
if [ ! -f "$PUBSPEC_PATH" ]; then
    echo "Erreur: Le fichier pubspec.yaml n'a pas été trouvé à l'emplacement spécifié: $PUBSPEC_PATH"
    exit 1
fi

current_version_line=$(grep 'version:' "$PUBSPEC_PATH")

if [ -z "$current_version_line" ]; then
    echo "Erreur: La ligne 'version:' n'a pas été trouvée dans $PUBSPEC_PATH."
    exit 1
fi

# Extrait la version complète (ex: 1.3.10+20260218)
current_version=$(echo "$current_version_line" | sed 's/version: //g' | tr -d '[:space:]')

# Sépare le numéro de version (1.3.10) et le numéro de build (20260218)
version_number=$(echo "$current_version" | cut -d'+' -f1)
build_number=$(echo "$current_version" | cut -d'+' -f2)

# Sépare les composants de la version (major, minor, patch)
major=$(echo "$version_number" | cut -d'.' -f1)
minor=$(echo "$version_number" | cut -d'.' -f2)
patch=$(echo "$version_number" | cut -d'.' -f3)

# --- Calcul du nouveau numéro de version et de build ---

new_major=$major
new_minor=$minor
new_patch=$patch
new_build=""

if [ "$versionType" == "major" ]; then
   new_major=$((major + 1))
   new_minor=0
   new_patch=0
elif [ "$versionType" == "minor" ]; then
   new_minor=$((minor + 1))
   new_patch=0
elif [ "$versionType" == "patch" ]; then
   new_patch=$((patch + 1))
fi

# Génération du nouveau numéro de build au format AAAAMMJJHHMMSS (plus lisible et unique)
# Ou utiliser un simple incrément si vous préférez un numéro séquentiel
# Pour un build number basé sur la date et l'heure:
new_build=$(date +%Y%m%d%H%M%S)

# Pour un build number incrémental (si vous le stockez quelque part ou le calculez différemment)
# Si vous voulez incrémenter le build number existant, il faut s'assurer qu'il est numérique.
# new_build=$((build_number + 1)) # Ceci est une option, mais demande une gestion plus fine

# Assemble la nouvelle version complète
new_full_version="${new_major}.${new_minor}.${new_patch}+${new_build}"

echo "Ancienne version: $current_version"
echo "Nouvelle version: $new_full_version"

# --- Mise à jour du fichier pubspec.yaml ---

# Utilisation de `sed` pour la mise à jour (compatible GNU sed et BSD sed avec différentes syntaxes)
# On préfère 'gsed' pour Linux/macOS si installé via Homebrew pour être sûr
# Si gsed n'est pas disponible, un sed standard peut être utilisé mais peut nécessiter des ajustements
if command -v gsed &> /dev/null; then
    sed_cmd="gsed"
else
    sed_cmd="sed"
fi

echo "Mise à jour de $PUBSPEC_PATH avec la nouvelle version..."
# Le 's' est pour substituer, le premier '/' est le séparateur, 'version:' est le motif à chercher,
# 'version: $new_full_version' est le remplacement, et 'g' pour remplacer toutes les occurrences (au cas où).
"$sed_cmd" -i "s/^version: .*/version: $new_full_version/" "$PUBSPEC_PATH"

# Vérifie si la modification a réussi (facultatif mais recommandé)
if ! grep -q "version: $new_full_version" "$PUBSPEC_PATH"; then
    echo "Erreur: La mise à jour de la version dans pubspec.yaml a échoué."
    exit 1
fi

echo "La version a été mise à jour dans $PUBSPEC_PATH."

# --- Opérations Git ---

# S'assurer que les changements sont prêts à être committés
echo "Ajout des modifications Git..."
git add "$PUBSPEC_PATH" # N'ajoute que le fichier modifié

# Vérifie s'il y a des modifications à committer avant de créer le commit
if git diff --cached --quiet; then
    echo "Aucune modification à committer pour pubspec.yaml."
else
    echo "Création du commit Git..."
    git commit -m "ci: Bump $versionType version from $current_version to $new_full_version"
    echo "Pousser le commit vers l'origine..."
    git push

    # Création et push du tag
    new_tag="v$new_full_version"
    echo "Création du tag Git: $new_tag"
    git tag "$new_tag"

    echo "Pousser le tag vers l'origine..."
    git push origin "$new_tag"
fi

echo "Script terminé avec succès."