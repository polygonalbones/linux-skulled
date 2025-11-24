# SPDX-License-Identifier: GPL-2.0
{
  mkShell,
  zig,
}:

mkShell {
  nativeBuildInputs = [
    zig
  ];
}
