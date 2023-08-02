let
    rust_overlay = import (builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz");
    pkgs = import <nixpkgs> { overlays = [ rust_overlay ]; };
    rust_version = "1.61.0";
    rust = pkgs.rust-bin.stable.${rust_version}.default.override {
        targets = [ "x86_64-unknown-linux-musl" ];
    };
    tex = pkgs.texlive.combine {
        inherit (pkgs.texlive) scheme-medium titlesec;
    };
    cross_aarch64_none_elf = import <nixpkgs> {
        crossSystem = { config = "aarch64-none-elf"; };
    };
    cross_riscv64_none_elf = import <nixpkgs> {
        crossSystem = { config = "riscv64-none-elf"; };
    };
in
  pkgs.mkShell {
    buildInputs = with pkgs.buildPackages; [
        qemu
        gnumake
        dtc
        expect
        python39
        git
        gcc
        rust
        gmp.out
        pandoc
        tex
        cmake
        cross_riscv64_none_elf.buildPackages.gcc10
        cross_aarch64_none_elf.buildPackages.gcc10
        ninja
        libxml2
    ];
    shellHook = ''
        export PYOXIDIZER_SYSTEM_RUST=1
    '';
}

