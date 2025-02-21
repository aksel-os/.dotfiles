# This is a concept for a module i plan on calling trainer
# it will controll my nix with commands like this, and hopefully more

.PHONY: home
home:
	nix run home-manager -- switch --flake .#${TRAINER_USER_PROFILE} --show-trace

.PHONY: home-news
home-news:
	home-manager news --flake .#${TRAINER_USER_PROFILE}

.PHONY: clean-home
clean-home:
	nix-collect-garbage -d
