{ inputs, pkgs, ... }:

let
  # hyprland-pkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};

  # Add ROCm symlink join
  rocmEnv = pkgs.symlinkJoin {
    name = "rocm-combined";
    paths = with pkgs.rocmPackages; [
      rocblas
      hipblas
      clr
    ];
  };
in
{
  hardware = {
    graphics = {
      enable = true;
      # package = pkgs.mesa;
      extraPackages = with pkgs; [
        libvdpau-va-gl
        vaapiVdpau
        mesa
        mesa.opencl
      ];
    };
  
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  # HIP workaround: Symlink ROCm libraries to /opt/rocm
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  ];
}
