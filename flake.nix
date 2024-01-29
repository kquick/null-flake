{
  description = "A no-op flake useable for nullifying inputs of other flakes";
  # Use this flake by specifying it as an input in place of a specific package
  # (e.g. $ nix build --override-input x github:kquick/null-flake). The primary
  # flake can detect that an input is nullified in this way via an
  # `null-flake.packages.is input` test.
  inputs = {};
  outputs = { self }: {
    packages = {
      x86_64-linux = {};
      is = d: d.packages.x86_64-linux == {};
      aarch64-darwin = {};
    };
  };
}
