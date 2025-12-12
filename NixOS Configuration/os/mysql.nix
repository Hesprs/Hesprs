{ pkgs, ... }:

{
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    ensureDatabases = [ "db" ];  # optional: auto-create databases
    ensureUsers = [
      {
        name = "hesprs";
        ensurePermissions = { "db.*" = "ALL PRIVILEGES"; };
      }
    ];
  };
}