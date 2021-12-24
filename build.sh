#!/usr/bin/env bash

cd "$(git rev-parse --show-toplevel)"
rm -f shaders/*.spv
rm -f draw
for x in shaders/*.vert shaders/*.frag; do
  out="$(basename $x | sed 's/\./-/g').spv"
  glslc $x -o shaders/$out
done
../Odin/odin build draw.odin -vet -debug -extra-linker-flags:'/home/jim/projects/stb/libstb_image.a'
