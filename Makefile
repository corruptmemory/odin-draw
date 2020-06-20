
.PHONY: build clean

build: draw

shaders/vert.spv: shaders/shader.vert
	glslc shaders/shader.vert -o shaders/vert.spv

shaders/frag.spv: shaders/shader.frag
	glslc shaders/shader.frag -o shaders/frag.spv

draw: draw.odin
	odin build draw.odin -vet -collection:shared=./external

run: shaders/vert.spv shaders/frag.spv
	odin run draw.odin -vet -collection:shared=./external

clean:
	rm -f *.spv
	rm draw
	rm -f odin-draw.ll odin-draw.o odin-draw.bc
