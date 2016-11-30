using GLib;

namespace LedDancingDemo
{
    int main (string[] args)
    {
        var loop = new MainLoop();

        LedState[] states = new LedState[] {
            LedState(true , true , true ),
            LedState(false, true , true ),
            LedState(true , false, true ),
            LedState(true , true , false),
            LedState(true , true , true ),
            LedState(false, false, false),
            LedState(true , true , true ),
            LedState(false, false, false),
            LedState(true , true , true ),
            LedState(false, false, false),
            LedState(true , true , true ),
            LedState(false, false, false)
        };

        var led = new Led(10, 11, 12, new SysfsGpio());

        var dancer = new Dancer (loop, led, states);

        loop.run();
        return 0;
    }
}
