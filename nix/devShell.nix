{
  mkShell,
  zig,
}:

mkShell {
  nativeBuildInputs = [
    zig
  ];
}
