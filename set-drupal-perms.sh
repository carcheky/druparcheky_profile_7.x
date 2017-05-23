#!/bin/bash





#  ______________________________________________________________________________________________________
# /_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/
#
# VARIABLES OBLIGATORIAS
pwd=$(pwd)
LOCAL_DRUPAL_DIR='/Applications/MAMP/htdocs/druparcheky'
REMOTE_DRUPAL_DIR='/var/www/vhosts/druparcheky/subdomains/druparcheky/druparcheky'
REMOTE_DRUPAL_PRIVATEDIR='/var/www/vhosts/druparcheky/subdomains/druparcheky/private_php'

LOCAL_USER='changethis'
LOCAL_GROUP='changethis'
LOCAL_APACHE_USER='changethis'
LOCAL_APACHE_GROUP='changethis'

REMOTE_USER='changethis'
REMOTE_GROUP='changethis'
REMOTE_APACHE_USER='changethis'
REMOTE_APACHE_GROUP='changethis'

#  ______________________________________________________________________________________________________
# /_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/



clear



  echo ''
  echo ''

if [[ -f "sites/default/settings.php" ]]; then

  echo '===> Se ha encontrado una instalación drupal'
  echo ''
  if [[ ${pwd} = ${LOCAL_DRUPAL_DIR} ]]; then

    echo "======> ENTORNO LOCAL ${pwd} <======"
    echo ''
    USER=${LOCAL_USER}
    GROUP=${LOCAL_GROUP}
    AUSER=${LOCAL_APACHE_USER}
    AGROUP=${LOCAL_APACHE_GROUP}
    DRUPAL_DIR=${LOCAL_DRUPAL_DIR}
  elif [[ ${pwd} = ${REMOTE_DRUPAL_DIR} ]]; then

    echo "======> ENTORNO REMOTO ${pwd} <======"
    echo ''
    USER=${REMOTE_USER}
    GROUP=${REMOTE_GROUP}
    AUSER=${REMOTE_APACHE_USER}
    AGROUP=${REMOTE_APACHE_GROUP}
    DRUPAL_DIR=${REMOTE_DRUPAL_DIR}
  else
    echo ''
    echo "======> la ruta está mal, ahora mismo estás en"
    echo "======> ${pwd}"
    echo "======> mejor, configura este archivo antes"
    echo ''
    exit
  fi
elif [[ ! -f "sites/default/settings.php" ]]; then
  echo '===> Debes estar en la raiz de una instalación drupal para aplicar permisos'
  exit
fi

if [[ ${USER} == 'changethis' ]]; then
  echo ''
  echo "======> no has puesto la información de usuario"
  echo "======> mejor, configura este archivo antes"
  echo ''
  exit
fi

echo "=========> Se aplicarán los siguientes permisos: "
echo "============> USER: ${USER}"
echo "============> GROUP: ${GROUP}"
echo "============> APACHE USER: ${AUSER}"
echo "============> APACHE GROUP: ${AGROUP}"
echo "============> DRUPAL DIR: ${DRUPAL_DIR}"
echo ''
echo ''


if [[ -f "sites/default/settings.php" ]]; then

# Core modules/themes directories: rwxr-x---
# Core modules/themes files: rw-r-----
# Hosted sites modules/themes directories: rwxr-x---
# Hosted sites modules/themes files: rw-r-----
# Hosted sites "files" directory: rwxrwx---
# Hosted sites files under "files" directories: rw-rw----
# Hosted sites subdirectories under "files" directories: rwxrwx---

  chmod -R 777 ${DRUPAL_DIR}

  sleep 1
  echo "===============> Ejecutando 1:: Set user ${USER}:${GROUP}"
    chown -R ${USER}:${GROUP} .

  sleep 1
  echo "===============> Ejecutando 2:: Set apache user ${AUSER}:${AGROUP}"
    chown -R ${AUSER}:${AGROUP} ./sites/default/files
    chown -R ${AUSER}:${AGROUP} ../private_php

  sleep 1
  echo "===============> Ejecutando 3:: All files: rwxr--r--"
    chmod -R u=rw,g=r,o=r ${DRUPAL_DIR}

  sleep 1
  echo "===============> Ejecutando 4:: All directories: rwxr-xr-x "
    find ${DRUPAL_DIR} -type d -exec chmod u=rwx,g=rx,o=rx '{}' \;

  echo "===============> Ejecutando 5:: chmod 555 /sites/default"
    chmod 555 ${DRUPAL_DIR}/sites/default

  echo "===============> Ejecutando 6:: chmod settings.php"
    find ${DRUPAL_DIR} -type f -name settings.php -exec chmod u=r,g=r,o=r '{}' \;

  echo "===============> Ejecutando 7:: chmod default.settings.php"
    find ${DRUPAL_DIR} -type f -name default.settings.php -exec chmod u=r,g=r,o=r '{}' \;

  for x in ${DRUPAL_DIR}/sites/*/files; do
    sleep 1
    echo "===============> Ejecutando 8:: Hosted sites files directory: rwxrwx---"
      chmod u=rwx,g=rwx,o=r ${x}
    sleep 1
    echo "===============> Ejecutando 9:: Hosted sites subdirectories under files directories: rwxrwx---"
      find ${x} -type d -exec chmod u=rwx,g=rwx,o= '{}' \;
    sleep 1
    echo "===============> Ejecutando 10:: Hosted sites files under files directories: rw-rw----"
      find ${x} -type f -exec chmod u=rw,g=rw,o= '{}' \;
  done
fi


chmod u+x ${DRUPAL_DIR}/set-drupal-perms.sh
drush cc all
