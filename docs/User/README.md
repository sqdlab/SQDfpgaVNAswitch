# User documentation

The general use case is to utilise [SQDToolz](https://github.com/sqdlab/SQDToolz). Nonetheless, here are some notes that may help with debugging.

## USB COM protocol

The protocol is very simple. It can be probed via a serial terminal (e.g. `PuTTY` or `minicom`). Just type the following to set the state:

- `U` - set switch to **J1** (it returns `P` as an acknowledgement)
- `j` - set switch to **J2** (it returns `R` as an acknowledgement)
- `f` - set switch to **J3** (it returns `S` as an acknowledgement)
- `w` - set switch to strobe and coordinate the VNA triggers (it returns `T` as an acknowledgement)
- `Z` - simply returns the state of the switch (`1`, `2`, `3`, `4` for switch modes J1, J2, J3 and strobe respectively)

The serial port settings are:

- 9600 baud
- No parity bit
- No flow control

