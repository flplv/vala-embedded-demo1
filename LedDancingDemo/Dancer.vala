using GLib;

namespace LedDancingDemo
{
    public class Dancer {
        /* Led dancing example */
        Led led;
        LedState[] states;
        
        int position = 0;
        bool dancing = true;
        TimeoutSource time = new TimeoutSource (500);

        void dance_once ()
        {
            led.state = states[position];
            position += 1;
            position %= states.length;
        }

        public Dancer (MainLoop loop, Led led, LedState[] states)
        {
            this.led = led;
            this.states = states;

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
