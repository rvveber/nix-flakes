{
  description = "Basic Development Nix Shell - run with 'nix develop'";

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
		echo "hello world!"
	'';

      };	
  };
}
