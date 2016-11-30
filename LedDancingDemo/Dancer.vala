using GLib;

namespace LedDancingDemo
{
    public class Dancer {
        /* Led dancing example */
        Led led;
        LedState[] states;

        int position = 0;
        bool dancing = true;
        TimeoutSource time;

        void dance_once ()
        {
            led.state = states[position];
            position += 1;
            position %= states.length;
        }

        public Dancer (MainLoop loop, Led led, LedState[] states, int period_milliseconds = 500)
        {
            this.led = led;
            this.states = states;
            this.time = new TimeoutSource (period_milliseconds);

            time.set_callback (() => {
                dance_once ();
                return dancing ? true : false;
            });

            time.attach (loop.get_context ());
        }

        ~Dancer()
        {
            dancing = false;
        }
    }
}
