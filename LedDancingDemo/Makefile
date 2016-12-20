.PHONY: all
all: LedDancingDemo

FILES = Dancer.vala \
        IGpio.vala \
        ILed.vala \
        Led.vala \
        LedState.vala \
        Main.vala \
        SysfsGpio.vala

C_FILES = $(subst .vala,.c,$(FILES))

clean:
	@rm -fv *~ *.o LedDancingDemo $(C_FILES)

%.c: %.vala
	@echo "Compiling Vala to C code"
	valac -C $(FILES) --pkg glib-2.0 --pkg gio-2.0

%.o:%.c
	@echo "Compiling $<"
	gcc -o $@ -c $< -Wall -Wno-unused-but-set-variable `pkg-config --cflags glib-2.0 gio-2.0`

LedDancingDemo: $(subst .vala,.o,$(FILES))
	@echo "Linking $@"
	gcc -o $@  $^ `pkg-config --libs glib-2.0 gio-2.0`
