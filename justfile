flake := justfile_directory()
rebuild := if os() == "macos" { "sudo darwin-rebuild" } else { "nixos-rebuild" }

[private]
default:
    @just --list --unsorted


[group('build')]
[macos] # Only avaliable for macos
provision:
    sudo nix run github:nix-darwin/nix-darwin \
    --extra-experimental-features 'nix-command flakes' \
    -- switch --flake {{ flake }}
    sudo -i nix-env --uninstall nix

[group('build')]
[linux]
setup:
    sudo nixos-rebuild \
    --extra-experimental-features 'nix-command flakes' \
    -- switch --flake {{ flake }}
    sudo -i nix-env --uninstall nix


[group('rebuild')]
[private]
builder goal *args:
    {{ rebuild }} {{ goal }} \
    --flake {{ flake }} \
    {{ args }} \
    |& nom && nvd diff /run/current-system result
    
[group('rebuild')]
switch *args: (builder "switch" args)


[group('dev')]
update *input:
    nix flake update {{ input }} \
    --refresh \\
    --commit-lock-file \
    --commit-lockfile-summary \
    "flake: update {{ if input == "" { "all inputs" } else { input } }}"


[group('utils')]
verify *args:
    nix-store --verify {{ args }}

[group('utils')]
repair: (verify "--check-contents --repair")

[group('utils')]
clean:
    nix-collect-garbage --delete-older-than 3d
    nix store optimise
       
