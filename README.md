# conky-config

My personal conky configuration files for dark desktop backgrounds.

To use them, download the `conkyrc_\*` files and the associated scripts and put them under `~/.conky.d`. You can run any of those configuration files independently. For example, you can run `conkyrc_clock` using:

`conky -c /path/to/file/conkyrc_clock`


Note that you probably will have to modify a few things in the configuration files and scripts. Notably: 

- `conkyrc_network`: you need to change the name of the interface you wish to monitor (currently enp11s0 and enp13s0). You can find the name of your interfaces using `ifconfig`;
- `conkyrc_monitoring`: you need to change the name of the hard drives you wish to monitor. Most names are standard, however for my setup there is for example a drive mounted on '/mnt/Storage' that will probably be missing on your system;
- `rings_monitoring.lua`: this is the script called by `conkyrc_monitoring` to display ressources (cpu, memory) usage visually. It is setup for a 4 CPU system. If that's not adapted to your system, change it;
- `conkyrc_weather_simple`: you need to change the [ICAO](https://en.wikipedia.org/wiki/International_Civil_Aviation_Organization_airport_code) code corresponding to the city you wish to monitor;

Well deserved credits are due to the original authors of the scripts `paconky` and `rings_monitoring.lua`, which have been modified for use with this conky setup.
