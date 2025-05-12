flake := justfile_directory()
rebuild := if os() == "macos" { "darwin-rebuild" } else { "nixos-rebuild" }

[private]
default:
    @just --list # --unsorted

[group('rebuild')]
[private]
builder goal *args:
    nh {{ if os() == "macos" { "darwin" } else { "os" } }} {{ goal }} --hostname $(hostname) {{ args }}

[group('rebuild')]
switch *args: (builder "switch" args)

[group('rebuild')]
[macos] # Only avaliable for macos
provision host:
    nix run github:nix-darwin/nix-darwin -- switch --flake {{ flake }}#$(hostname)
    sudo -i nix-env --uninstall nix


[group('dev')]
update *input:
    nix flake update {{ input }} \
    --refresh \\
    --commit-lock-file \
    --commit-lockfile-summary \
    "chore: update {{ if input == "" { "all inputs" } else { input } }}"

[group('utils')]
verify *args:
    nix-store --verify {{ args }}

[group('utils')]
repair: (verify "--check-contents --repair")

[group('utils')]
clean:
    nix-collect-garbage --delete-older-than 3d
    nix store optimise
       
