{ pkgs, ... }:

let
  statsConfig = {
    db = "Aequitas";
    user = "hesprs";
  };
in
{
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    ensureDatabases = [ statsConfig.db ];
    ensureUsers = [
      {
        name = "${statsConfig.user}";
        ensurePermissions = {
          "${statsConfig.db}.*" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
