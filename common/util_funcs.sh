# 建议不要在模块安装过程中改动下列函数

# $1:prop_text
add_sysprop()
{
  echo "$1" >> $MODPATH/system.prop
}

# $1:path/to/file
add_sysprop_file()
{
  cat "$1" >> $MODPATH/system.prop
  echo -e "\n" >> $MODPATH/system.prop
}

# $1:path/to/file
add_service_sh()
{
  LATESTARTSERVICE=true
  cp "$1" $MODPATH/service_$MOD.sh
  chmod 0755 $MODPATH/service_$MOD.sh
}

# $1:path/to/file
add_postfsdata_sh()
{
  POSTFSDATA=true
  cp "$1" $MODPATH/post-fs-data_$MOD.sh
  chmod 0755 $MODPATH/post-fs-data_$MOD.sh
}

# $1:str
trim()
{
  local trimmed="$*"
  trimmed="${trimmed%% }"
  trimmed="${trimmed## }"
  echo "$trimmed"
}

# $1:ID of mod
check_mod_install()
{
  if [ "`echo $MODS_SELECTED_YES | egrep \($1\)`" != "" ]; then
      echo -n "yes"
      return 0
  elif [ "`echo $MODS_SELECTED_NO | egrep \($1\)`" != "" ]; then
      echo -n "no"
      return 0
  fi
  echo -n "unknown"
}
