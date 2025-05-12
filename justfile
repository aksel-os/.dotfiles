[private]
default:
    @just --list --unsorted

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
       
