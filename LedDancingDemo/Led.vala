using GLib;

namespace LedDancingDemo
{
    public class Led : ILed, Object {

        IGpio gi;
        int red_gpio;
        int green_gpio;
        int blue_gpio;

        public bool red {
            public get { return gi.read(red_gpio); }
            public set { gi.write(red_gpio, value); }
        }

        public bool green {
            public get { return gi.read(green_gpio); }
            public set { gi.write(green_gpio, value); }
        }

        public bool blue {
            public get { return gi.read(blue_gpio); }
            public set { gi.write(blue_gpio, value); }
        }

        public LedState state {
            public get { return LedState (red, green, blue); }
            public set {
                red = value.red;
                green = value.green;
                blue = value.blue;
            }
        }

        public Led (int gpio_red, int gpio_green, int gpio_blue, IGpio gpio)
        {
            gi = gpio;
            red_gpio = gpio_red;
            green_gpio = gpio_green;
            blue_gpio = gpio_blue;
        }
    }
}
