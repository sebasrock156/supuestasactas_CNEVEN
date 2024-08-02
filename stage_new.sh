# Este script solamente actualiza laa información del repositorio excluyendo los archivos de github.

git add $(git ls-files -o --exclude-standard)
