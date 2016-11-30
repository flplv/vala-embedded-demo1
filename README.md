# Dancing Demo Project #

This is a Vala demo project that access /sys/class/gpioXX to set and reset Leds.
In the file Main.vala, line 24, you can configure the GPIOs used.

## Dependencies ##
sudo apt-get install valac


## Build ##
cd LedDancingDemo
valac --pkg glib-2.0 --pkg gio-2.0 Dancer.vala ILed.vala LedState.vala Led.vala IGpio.vala SysfsGpio.vala Main.vala -o DancingDemo


## Run ##
./DancingDemo
