{ pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  virtualisation.libvirtd.qemu = {
    ovmf.enable = true;
    swtpm.enable = true;
    vhostUserPackages = with pkgs; [ virtiofsd ];
  };

  environment.systemPackages = with pkgs; [
    qemu
    virtiofsd
    swtpm
  ];
}
