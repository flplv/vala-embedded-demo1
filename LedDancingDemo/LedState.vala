namespace LedDancingDemo
{
    [Immutable]
    public struct LedState {
        public bool red;
        public bool green;
        public bool blue;

        public LedState (bool r, bool g, bool b)
        {
            red = r;
            green = g;
            blue = b;
        }
    }
}
