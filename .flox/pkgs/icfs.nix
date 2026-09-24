{ runCommand, catalogs }:
let
  dep_python312Packages_llfuse = catalogs.brantley.python312Packages.llfuse;
  dep_python312Packages_pytoml = catalogs.brantley.python312Packages.pytoml;
in
runCommand "icfs-1" { pname = "icfs"; version = "1"; inputs = [ dep_python312Packages_llfuse dep_python312Packages_pytoml ]; } ''
  sleep 8
  mkdir -p "$out/share"
  printf '%s\n' "icfs" > "$out/share/name"
  for i in $inputs; do printf '%s\n' "$i"; done > "$out/share/inputs"
''
