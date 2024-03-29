#include "mc8wiring.h"

/* 3374 characters in 199 strings, table occupying 796 bytes */
char *labels[] = {
  "Positive to wings and bonnet",
  "Left turn",
  "Right turn",
  "Negative group c",
  "Brake light",
  "Offside sidelight",
  "Nearside sidelight",
  "Rear foglamp",
  "Positive to central console",
  "Engine bay temperature",
  "Steering sensor",
  "Negative group b",
  "Accelerator pedal sensor",
  "Brake pedal sensor",
  "Clutch pedal sensor",
  "Unused",
  "Nearside full beam",
  "Nearside dip beam",
  "Positive to motor",
  "Positive to nearside panel",
  "Offside full beam",
  "Offside dip beam",
  "",
  "Positive to steering column",
  "Positive to offside panel",
  "Positive to dashboard",
  "Full beam to fusebox",
  "Sidelight to fusebox",
  "Left turn to fusebox",
  "Right turn to fusebox",
  "Dip beam to fusebox",
  "Ignition",
  "-",
  "Maintenance light warning",
  "Diff lock",
  "Negative group B",
  "Engine temperature",
  "Oil pressure warning",
  "Winch clutch",
  "Offside sidelight (monitor)",
  "Brake warning",
  "Offside full beam (monitor)",
  "Hazards",
  "Rear foglamp (monitor)",
  "Rev counter",
  "Oil pressure",
  "Driver'S mirror heater",
  "Wash",
  "Negative group A",
  "Glow plugs",
  "Horn",
  "Start from key",
  "Wiper park",
  "Fast wiper",
  "Slow wiper",
  "Front foglamp",
  "Offside lower spotlight",
  "Speaker",
  "Underbonnet worklamp",
  "Nearside lower spotlight",
  "Winch light",
  "Reverse (from gearbox)",
  "Diff lock (from gearbox)",
  "Rear wash (pending?)",
  "Charge from alternator",
  "Windscreen",
  "Broken",
  "Alternator exciter",
  "Diesel ignition",
  "Diesel start",
  "Manoeuvring cameras",
  "Parcel shelf light",
  "Heater fan slow",
  "Heater fan fast",
  "Fanlight demist",
  "Navigator'S mirror heater",
  "Intermittent wiper (relay)",
  "Electric ignition",
  "Rear wiper",
  "Rear wash",
  "Unallocated wire 1",
  "Start from key",
  "Electric start",
  "Unswitched positive",
  "Charging current",
  "Current draw",
  "Battery voltage sense",
  "Fuel gauge",
  "Rear demist control",
  "Reverse",
  "Loading light control",
  "Brake light (CURRENTLY HAS OUTER SPOTS?)",
  "Left turn (to relay)",
  "Beacon (new)",
  "Negative group C",
  "Offside sidelight (tail)",
  "Fuel warning",
  "Rear wash (move to ?BODY4?))",
  "Beacon (pending)",
  "Nearside sidelight (tail)",
  "Choke",
  "Low fuel",
  "Full beam",
  "Rear fog",
  "Sidelight (monitor)",
  "Negative",
  "Indicators",
  "Parking brake",
  "Battery/Charge warning",
  "Seatbelt",
  "Right turn (in from switch)",
  "Sidelight",
  "Right turn (out)",
  "Positive",
  "Inner spotlights",
  "Outer spotlights",
  "Searchlight",
  "Roofrack socket",
  "B pillar power",
  "Upper rear foglamp",
  "Passenger light",
  "Wheelarches",
  "Starboard marine",
  "Rear corner lights",
  "Roofrack light from relay",
  "Unlock back door",
  "Beacon",
  "Lock back door",
  "Nooks and crannies",
  "Alarm switch",
  "B pillar socket power",
  "Small charger power",
  "Tent positive supply",
  "Eberspächer (from tent)",
  "Roofrack light control from tent",
  "Searchlight (from tent)",
  "Eberspacher out",
  "Ladder light (from tent)",
  "Aux positive",
  "Left turn (out)",
  "Ladder light",
  "Unknown wire!",
  "Auxiliary positive",
  "12v from switch",
  "Lighting inside tent cover",
  "Intercom",
  "Tent light (to cathode on light?)",
  "Camera power",
  "Sidelight (tail)",
  "Solar panel 1",
  "Solar panel 2",
  "Tent power from fuse to switch",
  "Middle loadspace light",
  "Tent power from switch to tent",
  "Front loadspace light",
  "Loadspace spotlight",
  "Rear loadspace lights",
  "Passenger light control",
  "Front loadspace light control",
  "Middle loadspace light control",
  "Rear loadspace light control",
  "Wiper",
  "Loading (to switch; upcoming only)",
  "Loading (from switch; not in upcoming)",
  "Demist",
  "Loading monitor",
  "Demist monitor",
  "Earth",
  "Reverse monitor",
  "Brake monitor",
  "Fog monitor",
  "Wiper monitor",
  "Yellow",
  "Blue",
  "White",
  "Green",
  "Brown",
  "Red",
  "Black",
  "Grey?",
  "Fuel warning (NOT YET CONNECTED)",
  "Ignition (later, aux power)",
  "Sidelight monitor",
  "Power to external socket",
  "Negative signal to front",
  "Negative signal to tent",
  "Negative power",
  "Positive to regulator",
  "Signal to front",
  "Signal to tent",
  "9v positive",
  "White",
  "Black",
  "Brown",
  "Red",
  "Yellow",
  "Green",
  "Blue",
  "Pink",
  NULL
};

/* 65 connectors occupying 1300 bytes, and 481 bytes of connector names */
connector connectors[] = {
  {"Back Door", {138,164,161,105,22,22,22,22}},
  {"Battery", {31,84,85,35,86,83,15,15}},
  {"Between Rear", {22,1,2,31,22,22,22,22}},
  {"Body", {31,61,62,63,64,38,65,66}},
  {"Bonnet", {56,57,58,59,60,57,48,0}},
  {"Bulkhead Nearside", {25,74,75,47,52,76,53,54}},
  {"Ceiling Nearside A", {22,128,129,22,130,131,22,22}},
  {"Ceiling Nearside B", {132,133,134,113,135,136,137,138}},
  {"Ceiling Nearside C", {22,22,22,141,-1,-1,-1,-1}},
  {"Ceiling Offside A", {118,119,120,121,122,123,124,32}},
  {"Ceiling Offside B", {22,22,22,125,126,22,22,127}},
  {"Console A", {8,31,5,35,68,77,78,79}},
  {"Console B", {70,80,15,15,15,81,69,82}},
  {"Dashboard A", {25,33,34,35,36,37,38,39}},
  {"Dashboard B", {40,41,42,43,44,45,46,31}},
  {"Dashcam", {22,105,142,143,-1,-1,-1,-1}},
  {"Edge A", {27,6,5,30,17,21,26,22}},
  {"Edge B", {22,22,22,22,22,22,22,22}},
  {"Edge C", {22,22,22,22,22,22,22,22}},
  {"Elec Motor", {18,77,82,94,15,68,69,15}},
  {"Engine A", {67,68,69,44,36,45,37,49}},
  {"Engine B", {70,4,40,71,31,65,72,73}},
  {"Front Skt", {0,1,2,3,4,5,6,7}},
  {"Fusebox Nearside", {16,17,6,1,18,0,19,8}},
  {"Fusebox Offside", {20,21,5,2,22,23,24,25}},
  {"Fusebox X", {26,27,28,29,30,31,32,32}},
  {"Gps", {83,31,6,3,15,15,15,15}},
  {"Lamp panel Offside", {106,106,107,40,108,105,37,109}},
  {"Mid Panel A", {138,151,152,105,153,154,155,156}},
  {"Mid Panel B", {157,158,159,160,-1,-1,-1,-1}},
  {"N/S front to N/S mid", {191,192,193,194,195,196,197,198}},
  {"N/S mid to N/S rear", {191,-1,-1,-1,-1,-1,-1,-1}},
  {"Nearside Rear", {31,87,180,79,89,4,99,1}},
  {"Nearside Rear Cover", {181,182,167,168,169,183,-1,-1}},
  {"Nearside Wing", {0,1,6,48,17,16,55,50}},
  {"Offside Rear", {7,88,90,161,89,4,95,2}},
  {"Offside Rear Cover", {138,165,166,167,168,169,170,171}},
  {"Offside Wing", {0,2,5,48,21,20,55,50}},
  {"Pedals", {8,9,10,11,12,13,14,15}},
  {"R Ic", {138,184,185,186,187,188,189,190}},
  {"Rear Arch Offside", {138,1,2,105,95,4,162,163}},
  {"Rear Trailer", {172,173,174,175,176,177,178,179}},
  {"Roof Front Nearside", {105,111,139,113,115,114,116,140}},
  {"Roof Front Offside", {105,111,112,113,114,115,116,117}},
  {"Solar", {105,149,22,150,-1,-1,-1,-1}},
  {"Steering column A", {23,27,47,48,30,26,49,7}},
  {"Steering column B", {50,28,29,31,51,52,53,54}},
  {"Tent Cover", {138,1,2,105,95,4,126,22}},
  {"Tent Lead", {132,133,134,105,135,144,137,145}},
  {"Tent Panel", {132,133,144,105,135,146,137,145}},
  {"Unspecified", {0,1,2,3,4,5,6,7}},
  {"Upper Nearside A", {71,75,74,19,65,6,58,92}},
  {"Upper Nearside B", {72,73,70,59,93,22,22,22}},
  {"Upper Offside A", {87,36,55,88,60,46,89,110}},
  {"Upper Offside B", {90,56,22,4,34,26,83,31}},
  NULL
};
int unspecified_index = 50;
/* 5959 bytes in total */
