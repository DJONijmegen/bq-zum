STLS =  $(patsubst %.scad,%.stl,$(wildcard zum-kit*.scad))
STLS += $(patsubst %.scad,%.stl,$(wildcard zum-extension*.scad))


all: $(STLS)

# explicit wildcard expansion suppresses errors when no files are found
include $(wildcard *.deps)

%.stl: %.scad
	openscad -m make -o $@ -d $@.deps $<


# vim: set sw=8 sts=0 noet:
