#!/bin/bash





#  ______________________________________________________________________________________________________
# /_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/
#
# VARIABLES OBLIGATORIAS
pwd=$(pwd)
REMOTE_DRUPAL_DIR_PROD='changethis'
REMOTE_USER_PROD='changethis'
REMOTE_GROUP_PROD='changethis'
REMOTE_APACHE_USER_PROD='changethis'
REMOTE_APACHE_GROUP_PROD='changethis'

REMOTE_DRUPAL_DIR_STAGE='changethis'
REMOTE_USER_STAGE='changethis'
REMOTE_GROUP_STAGE='changethis'
REMOTE_APACHE_USER_STAGE='changethis'
REMOTE_APACHE_GROUP_STAGE='changethis'



#  ______________________________________________________________________________________________________
# /_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/_____/



clear



  echo ''
  echo ''

if [[ -f "sites/default/settings.php" ]]; then

  echo '===> Se ha encontrado una instalación drupal'
  echo ''
  if [[ ${pwd} = ${REMOTE_DRUPAL_DIR_PROD} ]]; then

    echo "======> ENTORNO REMOTO PROD ${pwd} <======"
    echo ''
    USER=${REMOTE_USER_PROD}
    GROUP=${REMOTE_GROUP_PROD}
    AUSER=${REMOTE_APACHE_USER_PROD}
    AGROUP=${REMOTE_APACHE_GROUP_PROD}
    DRUPAL_DIR=${REMOTE_DRUPAL_DIR_PROD}
  elif [[ ${pwd} = ${REMOTE_DRUPAL_DIR_STAGE} ]]; then

    echo "======> ENTORNO REMOTO STAGE ${pwd} <======"
    echo ''
    USER=${REMOTE_USER_STAGE}
    GROUP=${REMOTE_GROUP_STAGE}
    AUSER=${REMOTE_APACHE_USER_STAGE}
    AGROUP=${REMOTE_APACHE_GROUP_STAGE}
    DRUPAL_DIR=${REMOTE_DRUPAL_DIR_STAGE}
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
