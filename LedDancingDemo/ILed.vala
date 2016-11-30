namespace LedDancingDemo
{
    public interface ILed : Object {
        public abstract bool red { get; set;}
        public abstract bool green { get; set;}
        public abstract bool blue { get; set;}
        public abstract LedState state { get; set;}
    }
}
