# ManuverTrails v0.6.0

Dynamic maneuver trails and wingtip vortices for Kerbal Space Program 1.12.x.

This is a fully renamed build of Wingtip Vortex v0.6.0. The GameData folder,
DLL, .NET assembly, KSP addon class, runtime object names, and log prefix are
all named `ManuverTrails`; it is not merely a renamed ZIP.

## Features

- Responds to G-force, airspeed, altitude, atmospheric density, lighting, and
  aircraft size.
- Uses smooth `TrailRenderer` wakes at lower speed and altitude.
- Uses curved `LineRenderer` wakes at high speed and altitude.
- Detects rear lifting surfaces and forward canards automatically.
- Supports multi-part and canted wing geometry.
- Maintains smooth renderer crossfades and frame-spike protection.
- Has no dependencies and does not modify craft or save data.

## Installation

1. Exit KSP.
2. Delete `GameData/WingtipVortex` if it is installed.
3. Copy the `ManuverTrails` folder into `GameData`.

The final path must be:

`GameData/ManuverTrails/Plugins/ManuverTrails.dll`

Do not install WingtipVortex and ManuverTrails together. They contain the same
effect logic and would create duplicate trails.

## Uninstall

Delete `GameData/ManuverTrails`.

MIT license. Original work copyright 2026 PogKai.
