{ pkgs, ... }:
let
  # Direnv forces dounload & build of fish shell to test, just skip it
  direnv-no-fish = pkgs.direnv.overrideAttrs (old: {
    nativeCheckInputs = with pkgs; [
      zsh
      writableTmpDirAsHomeHook
      # fish is REMOVED
    ];

    checkPhase = ''
      runHook preCheck
      make test-go test-bash test-zsh
      # SKIP test-fish
      runHook postCheck
    '';
  });

  langs = [
    "cpp"
    "rust"
    "haskell"
    "scheme"
    "python"
  ];
in
{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;

      initContent = ''
        if [ "$(uname)" = "Darwin" ]; then
          . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
        fi

        unset DEVELOPER_DIR

        eval "$(starship init zsh)"
        eval "$(zoxide init zsh)"

        autoload -U compinit
        compinit
      '';

      shellAliases = {
        cd = "z";
        c = "clear";
        cat = "bat";
        ls = "lsd";
        cmk = "cmake -S . -B build -G Ninja && cmake --build build";
      }
      // builtins.listToAttrs (
        map (lang: {
          name = "${lang}-dev";
          value = "nix develop ~/nx#${lang} -c zsh";
        }) langs
      );
    };

    direnv = {
      enable = true;
      package = direnv-no-fish;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
