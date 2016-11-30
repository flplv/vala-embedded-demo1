using GLib;

namespace LedDancingDemo
{
    public class SysfsGpio : IGpio, Object {

        const string path_prefix = "/sys/class/gpio/";

        public bool read (int gpio)
        {
            string gpio_name = "gpio" + gpio.to_string();
            return fs_read(gpio_name)[0] == '1';
        }

        public void write (int gpio, bool value)
        {
            string gpio_name = "gpio" + gpio.to_string();
             fs_write(gpio_name, value ? "1" : "0");
        }

        static void fs_write (string gpio, string value)
        {
            string path = path_prefix + gpio;
            try {
                var file = File.new_for_path (path);
                var dos = new DataOutputStream (file.create (FileCreateFlags.REPLACE_DESTINATION));
                dos.put_string (value);

            } catch (Error e) {
                    stderr.printf ("%s\n", e.message);
                    return;
            }
        }

        static string fs_read (string gpio)
        {
            string path = path_prefix + gpio;

            var file = File.new_for_path (path);

            if (!file.query_exists ()) {
                stderr.printf ("File '%s' doesn't exist.\n", file.get_path ());
                return "0";
            }

            try {
                var dis = new DataInputStream (file.read ());
                string line = dis.read_line (null);
                if (line != null) return line;
            } catch (Error e) {
                error ("%s", e.message);
            }

            return "0";
        }
    }
}
