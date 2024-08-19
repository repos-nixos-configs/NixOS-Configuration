{ inputs
, lib
, config
, username
, ...
}:

with lib;

let
  cfg = config.module.impermanence;  
in {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  options = {
    module.impermanence.enable = mkEnableOption "Enables home impermanence";
  };

  config = mkIf cfg.enable {
    home.persistence = {
      "/persist/home/${username}" = {
        allowOther = true;

        directories = [
          "Code"
          "Desktop"
          "Downloads"
          "Documents"
          "go"
          "Music"
          "Pictures"
          "Public"
          "Templates"
          "Videos"
          "VirtualBox VMs"
          "Trash"
          "Sync"
          ".ansible_inventory"
          ".docker"
          ".emacs.d"
          ".flutter-devtools"
          ".kube"
          ".m2"
          ".mozilla"
          ".thunderbird"
          ".obsidian"
          ".openvpn"
          ".password-store"
          ".themes"
          ".terraform.d"
          ".yandex"
          ".ollama"
          ".config/google-chrome"
          ".config/sops"
          ".config/vesktop"
          ".config/sops-nix"
          ".config/obsidian"
          ".config/Code"
          ".config/dconf"
          ".config/htop"
          ".config/nvim"
          ".config/syncthing"
          ".config/pulse"
          ".local/share/zoxide"
          ".local/share/fish"
          ".local/share/nix"
          ".local/share/fonts"
          ".local/share/containers"
          ".local/share/Trash"
          ".local/share/TelegramDesktop"
          ".local/share/keyrings"
          ".local/share/nvim"
          ".local/state"
          ".vscode"
          ".pki"
          ".ssh"
          ".gnupg"
          # ".wireguard_configs"
        ];

        files = [
          ".bash_history"
          ".bash_logout"
          ".flutter"
          ".face"
          ".face.icon"
          ".zsh_history"
          ".cache/cliphist/db"
        ];
      };
    };
  };
}
