#!/usr/bin/env bash

function pause() {
    read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
}

# Préalable
# git remote add origin https://github.com/MFranckFR/STGit-exoJ2
# echo "git init doit déjà avoir été lancé dans ce dossier vide"
# echo "git init"
# echo "git remote add origin https://github.com/NAME/ESPACE"
# pause

# # creation d'un depot git-exos sur GitHub
# # creer les dossiers html
# mkdir -v html css js  # création des dossiers html css js


# # page web index.html
# echo Enregistrement de la page index.html
# cat <<EOL >>html/index.html
# </<!DOCTYPE html>
# <html class="no-js">
# <head>
# <meta charset="utf-8">
# <meta http-equiv="X-UA-Compatible" content="IE=edge">
# <title>Git exercices</title>
# <meta name="description" content="">
# <meta name="viewport" content="width=device-width, initial-scale=1">
# <link rel="stylesheet" href="../css/style.css">
# </head>
# <body>
# <script src="../js/index.js" async defer></script>
# </body>
# </html>
# EOL

# # page js
# echo Enregistrement de js/index.js
# cat <<EOL >>js/index.js
# console.log("js is ready");
# EOL

# # css
# echo Enregistrement de css/style.css
# cat <<EOL >>css/style.css
# body {
# background: blue;
# }
# EOL

# echo "Faire un git status"
# git status
# pause

# echo "Faire un git add *"
# git add *

# echo "Faire un git status"
# git status
# pause

# echo "git commit -m \"Initial commit\""
# git commit -m "Initial commit"
# pause

# echo "Faire un git status"
# git status
# pause

# echo "Faire un git push qui va etre en erreur"
# git push
# pause

# echo git push --set-upstream origin master
# git push --set-upstream origin master
# pause


# echo "Création d'une nouvelle branche"
# echo branch dev
# git branch dev
# echo git branch
# git branch
# pause

# echo "Passage à la branche dev"
# echo git checkout dev
# git checkout dev
# git status
# pause

# echo "Modification du css - Passage du bleu au rouge"
# sed -i 's/background: blue;/background: red;/g' css/style.css
# git status
# pause

# echo "git add css/style.css"
# git add css/style.css
# echo git commit -m "[CSS] Changed the body background color"
# git commit -m "[CSS] Changed the body background color"

# echo 'git push' simple doit être en erreur
# git push
# pause

# echo "On suit l'indication de git pour le push"
# git push --set-upstream origin dev

# pause
# echo "Changement de branche: vers master"
# git checkout master
# echo "Le fond rouge repasse en bleu !"

# echo "Nous allons faire un merge : fusion de la branche dev vers master"
# cat <<EOL
# git checkout master
# git pull
# git merge dev
# EOL
# git checkout master
# git pull
# git merge --rebase dev
# pause

# echo "Step: Passons à un merge conflict"
# echo "Verifions que nous sommes bien dans la branche master"
# cat <<EOL
# git checkout master
# git branch
# EOL
# git checkout master
# git branch
# pause

# echo "Creation d'un fichier readme.md"
# cat <<EOL >>readme.md
# //Instructions goes here...
# EOL

# echo git status
# git status
# pause

# echo "Retour sur le branche dev"
# echo git checkout dev
# git checkout dev
# echo "Création d'une nouvelle branche branchName + déplacement sur cette même branche"
# echo git checkout -b branchName
# git checkout -b branchName
# pause

echo "Ajoutons et commitons readme.md"
echo git add readme.md
git add readme.md
echo git commit -m "Added a readme.md file"
git commit -m "Added a readme.md file"
pause

echo "Regardez maintenant les différences entre la branche master et dev"
echo "git diff master dev"
git diff master dev
pause

echo "Créons deux nouvelles branches branch-a, branch-b"
echo "git branch branch-a && git branch branch-b"
git branch branch-a && git branch branch-b
pause

echo "comparaison de ces deux branches : elles sont identiques"
echo git diff branch-a branch-b
git diff branch-a branch-b
pause

echo "Ou faire pareil en comparant leur log (hash identiques)"
echo "Log: branch-a"
git log --pretty=format:"%h - %an, %ad : %s" branch-a
echo "Log: branch-b"
git log --pretty=format:"%h - %an, %ad : %s" branch-b
pause

echo "Changement de branche: vers branch-a"
echo git checkout branch-a
git checkout branch-a
echo git branch
git branch
pause

echo "Ajouter une ligne au readme.md"
echo "Branch-a instructions" >>readme.md
pause

echo "Ajouter ce changement pour git dans la branch-a (actuelle)"
echo git add readme.md
git add readme.md
echo git commit -m "[Readme] Added branch-a instructions"
git commit -m "[Readme] Added branch-a instructions"
pause

echo "Changez de branche vers branch-b"
echo git checkout branch-b
git checkout branch-b
echo "Ajouter une ligne dans readme.md"
echo "Branch-b instructions" >>readme.md
pause

echo "Ajouter ce changement dans git branch-b(actuelle)"
cat<<EOL
git add readme.md
git commit -m "[Readme] Added branch-b instructions"
EOL

git add readme.md
git commit -m "[Readme] Added branch-b instructions"
pause

echo "Comparons les différences avec git diff"
echo git diff branch-a branch-b
git diff branch-a branch-b
pause

echo "Comparons les logs branch-a/branch-b"
echo "Les deux branches ont en commun le commit concernant l'ajout du readme.md"
echo "Log: branch-a"
git log --pretty=format:"%h - %an, %ad : %s" branch-a
echo "Log: branch-b"
git log --pretty=format:"%h - %an, %ad : %s" branch-b
pause

echo "Allons créer une fausse branche master"
echo "Nous devrions faire ça sur la branche master, mais pour l’exercice nous allons simuler la
branche master par une autre branche."
echo "Changement de branche vers dev"
echo git checkout dev
git checkout dev
pause

echo "Créeons une nouvelle branche 'branch-master' à partir de dev"
echo git checkout -b branch-master
git checkout -b branch-master
echo git branch
git branch
pause

echo "Step: Fusionnons le travail sur notre fausse branche master"
echo "git merge branch-a"
echo git merge branch-a
git merge branch-a
echo "Maintenant la branche branch-master contiendra le travail de branch-a"
pause

echo "Step: Confirmons que la fausse branche master contient le travail de la branche branch-a"
echo "Log: branch-a"
git log --pretty=format:"%h - %an, %ad : %s" branch-a
echo "Log: branch-master"
git log --pretty=format:"%h - %an, %ad : %s" branch-master
pause

echo "ou alors avec git diff branch-a branch-master"
echo "S'il y a aucune différence c'est quelles sont identiques."
echo git diff branch-a branch-master
git diff branch-a branch-master
pause

echo "Step: Merge le conflit ! fusion avec branch-b"
echo "Nous sommes bien sur la branche branch-master"
echo git branch
git branch
pause

git merge branch-b
echo "git prévient du conflit 'CONFLICT..'"
echo "Pour plus d'info: git status"
echo git status
git status
pause

echo "Step: Utilisons un éditeur de texte pour merger le conflit"
echo "Pour corriger le conflit: utilisez un IDE et enlevez les chevrons de git qui indique le conflot ou utilisez la commande git mergetool"
echo git mergetool --tool=SON_OUTILS
echo "Corriger le merge depuis une autre console avec votre outil préféré."
git mergetool --tool=vim
pause

echo "Puis sauvegardez les changements."
echo git add readme.md
git add readme.md
pause

echo "Vérifiez que tout est bon: git status"
echo git status
git status
pause

echo "Confirmons ces modifications"
echo git commit -m "Making peace between branch-a and branch-b"
git commit -m "Making peace between branch-a and branch-b"
pause

echo "Step: Regardons l'historique (de branch-master)"
echo "Log: branch-master"
git log --pretty=format:"%h - %an, %ad : %s" branch-master
echo
pause

echo "Ou entre les autres branches"
cat<<EOL
git diff dev master
git diff branch-master dev
git diff master branch-master
EOL
git diff dev master
git diff branch-master dev
git diff master branch-master
pause

echo "Poussons toutes nos branches sur notre github"
echo git push --all
git push --all
pause

echo "Step: Mergeons notre travail dans la vraie branche master"
echo git checkout master
git checkout master
echo git merge branch-master
git merge branch-master
pause

echo "Step: Regardons l'historique de notre master qui devrait avoir tout :)"
echo "Log: master"
git log --pretty=format:"%h - %an, %ad : %s" master
pause

echo "Vous pouvez également revenir en arrière pour examiner le code d'un commit précédent en référançant sont HASH"
echo "git checkout <HASH>"
read -p "Quel Hash ?:" _hash
git checkout "${_hash}"
pause

echo "Pour enfin revenir en arrière"
echo git checkout master
git checkout master
pause

echo "Vous pouvez supprimer en local les branches dev, branch-a, branch-b, branch-master"
cat<<EOL
git branch -d dev
git branch -d branch-a
git branch -d branch-b
git branch -d branch-master
EOL
git branch -d dev
git branch -d branch-a
git branch -d branch-b
git branch -d branch-master
pause

echo "Puis les supprimer en remote"
echo git push --all
git push --all

echo
echo "Fin du TP"
exit 0
