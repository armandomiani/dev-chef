#!/bin/bash

ALL_RECIPES=(
  "apache2::webserver"
)

function reload_scripts() {
  source scripts.sh
}

function build() {
  docker build -t dev-chef container-chat/
}

function delete_all() {
  docker rm -f `docker ps -aq`
}

function recipes() {
  echo ${ALL_RECIPES[@]} | sed 's/\s/,/g'
}

function run_container () {
  DRY_RUN="$1"
  RECIPES="$(recipes)"

  echo "Starting container... "
  echo "Recipes: ${RECIPES}"

  docker run -ti \
    -v "$(pwd)/cookbooks:/cookbooks" \
    -e "COOKBOOKS=${RECIPES}" \
    -e "DRY=${DRY_RUN}" dev-chef
}

function run() {
  run_container "0"
}

function dryrun() {
  run_container "1"
}
