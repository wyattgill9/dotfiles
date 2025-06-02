{ pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  virtualisation.libvirtd.qemu = {
    ovmf = {
      enable = true;
    };
    swtpm.enable = true;
  };

  environment.systemPackages = with pkgs; [
    qemu
    # virtiofsd
    swtpm
    # spice-gtk
  ];
}

