# Dancing Demo Project #

This is a Vala demo project that access /sys/class/gpioXX to set and reset Leds.
In the file Main.vala, line 24, you can configure the GPIOs used.

## Dependencies ##
To build and run:
    sudo apt-get install valac

To run only, without building on embedded Linux:
    sudo apt-get install libglib2.0-0

## Build ##
cd LedDancingDemo
make

## Cross Build ##
Read the Makefile to see how gcc is used and adapt it to your toolchain.

## Run ##
./LedDancingDemo
