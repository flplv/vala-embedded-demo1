.PHONY: all
all: LedDancingDemo

FILES = Dancer.vala \
        IGpio.vala \
        ILed.vala \
        Led.vala \
        LedState.vala \
        Main.vala \
        SysfsGpio.vala

clean:
	rm -fv *~ *.o LedDancingDemo $(subst .vala,.c,$(FILES))

%.c:
	valac -C $(FILES) --pkg glib-2.0 --pkg gio-2.0

%.o:%.c
	gcc -o $@ -c $< -Wall `pkg-config --cflags glib-2.0 gio-2.0`

LedDancingDemo: $(subst .vala,.o,$(FILES))
	gcc -o $@  $^ `pkg-config --libs glib-2.0 gio-2.0`
