using GLib;

namespace LedDancingDemo
{
    public interface IGpio : Object  {
        public abstract bool read (int gpio);
        public abstract void write (int gpio, bool value);
    }
}
