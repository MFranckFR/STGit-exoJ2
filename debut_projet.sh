#!/usr/bin/env bash

function pause() {
    read -n1 -rsp $'Press any key to continue or Ctrl+C to exit...\n'
}

mkdir html css js  # création des dossiers html css js
echo $_

# page web index.html
echo Enregistrement de la page index.html
cat <<EOL >>html/index.html
</<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Git exercices</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<script src="../js/index.js" async defer></script>
</body>
</html>
EOL

# page js
echo Enregistrement de js/index.js
cat <<EOL >>js/index.js
console.log("js is ready");
EOL

# css
echo Enregistrement de css/style.css
cat <<EOL >>css/style.css
body {
background: blue;
}
EOL
