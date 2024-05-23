{
  description = "Basic Development Nix Shell - run with 'nix develop .#<frontend|backend>'";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
  	system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system};
  in {
    
    devShells.${system}.default = pkgs.mkShell {
    	
	buildInputs = [
		pkgs.neovim
		pkgs.vim
	];
	
	shellHook = ''
		echo "Hello from the default development shell"
	'';

    };

    frontend = pkgs.mkShell {
	
	buildInputs = [
		pkgs.neovim
		pkgs.vim
		pkgs.chromium
	];

	shellHook = ''
		echo "Hello from the 'frontend development' shell"
	'';
    };

    backend = pkgs.mkShell {
	
	buildInputs = [
		pkgs.neovim
		pkgs.vim
		pkgs.lf
	];

	shellHook = ''
		echo "Hello from the 'backend development' shell"
	'';
    };

  };
}
