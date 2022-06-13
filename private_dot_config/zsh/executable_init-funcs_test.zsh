#! /bin/zsh -y
#

source funcs.zsh

function oneTimeSetUp() {
  if_is_installed brew
}

function testListsIfIsInstalled() {
  assertEquals 1 $installed_programs[(Ie)brew] 
}

function tearDown() {
  # unset $INSTALLED_brew
}

SHUNIT_PARENT=$0
. shunit2
