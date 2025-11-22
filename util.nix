{
  defaultSystems ? [
    "aarch64-linux"  # ARM Linux
    "aarch64-darwin" # Apple Silicon Mac
    "x86_64-darwin"  # Intel Mac
    "x86_64-linux"   # x86 Linux
  ],
}:
let
  inherit defaultSystems;

  # List of all systems defined in nixpkgs
  # Keep in sync with nixpkgs wit the following command:
  # $ nix-instantiate --json --eval --expr "with import <nixpkgs> {}; lib.platforms.all" | jq 'sort' | sed 's!,!!' > allSystems.nix
  allSystems = [
    "aarch64-darwin"
    "aarch64-genode"
    "aarch64-linux"
    "aarch64-netbsd"
    "aarch64-none"
    "aarch64_be-none"
    "arm-none"
    "armv5tel-linux"
    "armv6l-linux"
    "armv6l-netbsd"
    "armv6l-none"
    "armv7a-darwin"
    "armv7a-linux"
    "armv7a-netbsd"
    "armv7l-linux"
    "armv7l-netbsd"
    "avr-none"
    "i686-cygwin"
    "i686-darwin"
    "i686-freebsd13"
    "i686-genode"
    "i686-linux"
    "i686-netbsd"
    "i686-none"
    "i686-openbsd"
    "i686-windows"
    "javascript-ghcjs"
    "m68k-linux"
    "m68k-netbsd"
    "m68k-none"
    "microblaze-linux"
    "microblaze-none"
    "microblazeel-linux"
    "microblazeel-none"
    "mips64el-linux"
    "mipsel-linux"
    "mipsel-netbsd"
    "mmix-mmixware"
    "msp430-none"
    "or1k-none"
    "powerpc-netbsd"
    "powerpc-none"
    "powerpc64-linux"
    "powerpc64le-linux"
    "powerpcle-none"
    "riscv32-linux"
    "riscv32-netbsd"
    "riscv32-none"
    "riscv64-linux"
    "riscv64-netbsd"
    "riscv64-none"
    "rx-none"
    "s390-linux"
    "s390-none"
    "s390x-linux"
    "s390x-none"
    "vc4-none"
    "wasm32-wasi"
    "wasm64-wasi"
    "x86_64-cygwin"
    "x86_64-darwin"
    "x86_64-freebsd13"
    "x86_64-genode"
    "x86_64-linux"
    "x86_64-netbsd"
    "x86_64-none"
    "x86_64-openbsd"
    "x86_64-redox"
    "x86_64-solaris"
    "x86_64-windows"
  ];

  # A map from system to system. It's useful to detect typos.
  #
  # Instead of typing `"x86_64-linux"`, type `flake-utils.lib.system.x86_64-linux`
  # and get an error back if you used a dash instead of an underscore.
  system = builtins.listToAttrs (
    map (system: {
      name = system;
      value = system;
    }) allSystems
  );

  # Applies a merge operation accross systems.
  eachSystemOp =
    op: systems: f:
    builtins.foldl' (op f) { } (
      if !builtins ? currentSystem || builtins.elem builtins.currentSystem systems then
        systems
      else
        # Add the current system if the --impure flag is used.
        systems ++ [ builtins.currentSystem ]
    );

  eachSystem = eachSystemOp (
    # Merge outputs for each system.
    f: attrs: system:
    let
      ret = f system;
    in
    builtins.foldl' (
      attrs: key:
      attrs
      // {
        ${key} = (attrs.${key} or { }) // {
          ${system} = ret.${key};
        };
      }
    ) attrs (builtins.attrNames ret)
  );

  eachDefaultSystem = eachSystem defaultSystems;

  lib = {
    inherit
      allSystems
      defaultSystems
      eachDefaultSystem
      eachSystem
      system
      ;
  };
in
lib
