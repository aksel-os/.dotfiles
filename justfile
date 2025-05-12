[group('utils')]
verify *args:
    nix-store --verify {{ args }}

[group('utils')]
repair: (verify "--check-contents --repair")

[group('utils')]
clean:
    nix-collect-garbage --delete-older-than 3d
    nix store optimise
       
