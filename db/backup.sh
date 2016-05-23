#!/bin/sh

# Script para backup dos bancos de dados

# Formata data para adicionar ao nome dos arquivos
t=`/bin/date +%Y%m%d`
tt=`/bin/date +%H%M%S`

db='feira_development'

# Define o destino dos arquivos
DST="/Users/sandro/Dropbox/pg_bkp"

# Cria o diretório do dia se ele não existir
if [ -d /Users/sandro/Dropbox/pg_bkp ]; then
  cd $DST
else
`mkdir $DST`
fi

# Define permissoes de leitura e gravacao para o diretorio
# `chown -R postgres /opt/data/backup/`
# `chown -R postgres /opt/data/backup/$t`
# `chmod 0777 /opt/data/backup/$t`

file="$DST/$t"-"$tt"-"$db.bkp"

pg_dump $db -Fc -f $file

echo "BackUp to $file"
# Loop para gerar arquivos dump
# for i in `psql -l -U postgres | cut -f 2 -d " " -s`; do
#     if [ $i != template1 -a $i != template0 -a $i != "rows)" -a $i != postgres ]; then
#         su postgres -c "/usr/bin/pg_dump -h localhost -U postgres -c -d -F -f $DST/$t/$i"_"$t"_"$tt.bkp -Z 1 $i";
#     fi
# done
