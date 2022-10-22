-- Banjo-Tooie Randomizer LUA Script VERSION ALPHA 0.2 
-- By kaptainkohl
-- Credits: Isotarge and authours of bt.lua Scripthawk module for flags and memory addresses, along with some ram methods. Hyperresonace for planing ideas. MumboToken for motavation to build the script with his Spreadsheet Rando.

--How to Use:
-- Load a Banjo-Tooie (USA) rom bizhawk 
-- Open the Lua console.
-- Press open script and select this file.
-- Hover over the file you want to play on the main menu.
-- Select the setting and Seed that you want for the rando. Press Generate.
-- enter your file and begin the rando!

-- On Generate, a Spoiler log will be created and saved in the same folder as the LUA Script. You can look at this to seed where items are and how the logical progreesion occurs.
-- If the scrip crashes, do not worry, just re open it and select the same settings and you can continue where you left off!

jiggies = {
{byte=0x45, bit=0, name="MT: Targitzan", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "Targitzan's Temple", location = {"MT"}, using={} , require={{"Breegull Blaster"}}},
{byte=0x45, bit=1, name="MT: Targitzan's Slightly Sacred Chamber", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "Targitzan's Temple", location = {"MT"}, using={} , require={{"Breegull Blaster"}}},
{byte=0x45, bit=2, name="MT: Kickball", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "MT Main Area", location = {"MT"}, using={} , require={{"Stonie","Mumbo MT"}}},
{byte=0x45, bit=3, name="MT: Bovina", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "MT Main Area", location = {"MT"}, using={} , require={{"Egg Aim"},{"Bill Drill","Airborne Egg Aiming"}}},
{byte=0x45, bit=4, name="MT: Treasure Chamber", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "MT Main Area", location = {"MT"}, using={} , require={{"Egg Aim","Grip Grab"},{"Egg Aim","Mumbo MT"},{"Egg Aim","Bill Drill"}}},
{byte=0x45, bit=5, name="MT: Jade Snake Grove: Golden Goliath", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "MT JSG", location = {"MT"}, using={} , require={{"Mumbo MT"}}},
{byte=0x45, bit=6, name="MT: Prison Compound Quicksand", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "MT PC", location = {"MT"}, using={} , require={{"Grip Grab","Mumbo MT"},{"Grip Grab","Grenade Eggs"}}},
{byte=0x45, bit=7, name="MT: Pillars", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "MT", location = {"MT PC"}, using={} , require={{"Bill Drill","Mumbo MT"},{"Bill Drill","Grenade Eggs"},{"Clockwork Kazooie Eggs","Egg Aim"}}},
{byte=0x46, bit=0, name="MT: Top of Temple", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "MT Main Area", location = {}, using={} , require={{}}},
{byte=0x46, bit=1, name="MT: Ssslumber", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "MT", location = {"MT JSG"}, using={} , require={{"Mumbo MT"}}},
{byte=0x46, bit=2, name="GGM: Old King Coal", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GGM Caves", location = {"GGM"}, using={} , require={{"Mumbo GGM"}}},
{byte=0x46, bit=3, name="GGM: Canary Mary Race", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GGM Main Area", location = {"GGM"}, using={} , require={{"Detonator"}}},
{byte=0x46, bit=4, name="GGM: Generator Cavern", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GGM Caves", location = {"GGM"}, using={} , require={{}}},
{byte=0x46, bit=5, name="GGM: Waterfall Cavern", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GGM Caves", location = {"GGM"}, using={} , require={{}}},
{byte=0x46, bit=6, name="GGM: Ordnance Storage", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GGM Main Area", location = {"GGM"}, using={} , require={{"Breegull Blaster","Beak Bayonet","Bill Drill"},{"Breegull Blaster","Beak Bayonet","Detonator"}}},
{byte=0x46, bit=7, name="GGM: Dilberta", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GGM Main Area", location = {"GGM"}, using={} , require={{"Bill Drill","Mumbo MT"},{"Bill Drill","Grenade Eggs"},{"Bill Drill","Clockwork Kazooie Eggs"}}},
{byte=0x47, bit=0, name="GGM: Crushing Shed", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GGM Main Area", location = {"GGM"}, using={} , require={{"Mumbo GGM"}}},
{byte=0x47, bit=1, name="GGM: Waterfall", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GGM Main Area", location = {"GGM"}, using={} , require={{"Springy Step Shoes"},{"Clockwork Kazooie Eggs","Egg Aim"}}},
{byte=0x47, bit=2, name="GGM: Power Hut Basement", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GGM Caves", location = {"GGM"}, using={} , require={{"Bill Drill"},{"Detonator"}}},
{byte=0x47, bit=3, name="GGM: Flooded Caves", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GGM Caves", location = {"GGM"}, using={} , require={{}}},
{byte=0x47, bit=4, name="WW: Hoop Hurry", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "WW Western Zone", location = {"WW"}, using={} , require={{"Egg Aim","Split Up","Grenade Eggs"},{"Egg Aim","Split Up","Clockwork Kazooie Eggs"}}},
{byte=0x47, bit=5, name="WW: Dodgems", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "WW Space Zone", location = {"WW"}, using={} , require={{"Van","Mumbo WW"}}},
{byte=0x47, bit=6, name="WW: Mr. Patch", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "WW Main Area", location = {"WW"}, using={} , require={{"Egg Aim","Airborne Egg Aiming","Grenade Eggs"}}},
{byte=0x47, bit=7, name="WW: Saucer of Peril", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "WW Space Zone", location = {"WW"}, using={} , require={{"Van","WW Mumbo","Detonator","Grip Grab"}}},
{byte=0x48, bit=0, name="WW: Balloon Burst", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "WW Western Zone", location = {"WW"}, using={} , require={{"Egg Aim","Airborne Egg Aiming","Split Up","Grenade Eggs"},{"Egg Aim","Airborne Egg Aiming","Split Up","Clockwork Kazooie Eggs"}}},
{byte=0x48, bit=1, name="WW: Dive of Death", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "WW Main Area", location = {"WW"}, using={} , require={{}}},
{byte=0x48, bit=2, name="WW: Mrs. Boggy", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "WW Main Area", location = {"WW"}, using={} , require={{"Split Up","Van","Taxi Pack"}}},
{byte=0x48, bit=3, name="WW: Star Spinner", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "WW Space Zone", location = {"WW"}, using={} , require={{"Van","Mumbo WW"}}},
{byte=0x48, bit=4, name="WW: The Inferno", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "WW Inferno", location = {"WW"}, using={} , require={{"Van"}}},
{byte=0x48, bit=5, name="WW: Cactus of Strength", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "WW Western", location = {"WW"}, using={} , require={{"Bill Drill","Grenade Eggs"}}},
{byte=0x48, bit=6, name="JRL: Mini-Sub Challenge", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "JRL Deep Sea", location = {"JRL"}, using={} , require={{"Sub"}}},
{byte=0x48, bit=7, name="JRL: Tiptup", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "JRL Town", location = {"JRL"}, using={} , require={{"Split Up","Hatch"}}},
{byte=0x49, bit=0, name="JRL: Chris P. Bacon", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "JRL Atlantis", location = {"JRL"}, using={} , require={{"Sub-Aqua Egg Aiming"},{"Sub","Egg Aim"}}},
{byte=0x49, bit=1, name="JRL: Piglet's Pool", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "JRL Town", location = {"JRL","HFP","CCL"}, using={} , require={{"Grenade Eggs"},{"Bill Drill"},{"Clockwork Kazooie Eggs"}}},
{byte=0x49, bit=2, name="JRL: Smuggler's Cavern", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "JRL Town", location = {"JRL"}, using={} , require={{"Glide","Split Up"},{"Clockwork Kazooie Eggs","Egg Aim"}}},
{byte=0x49, bit=3, name="JRL: Merry Maggie Malpass", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "JRL Town", location = {"JRL"}, using={} , require={{"Sub-Aqua Egg Aiming"}}},
{byte=0x49, bit=4, name="JRL: Lord Woo Fak Fak", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "JRL Deep Sea", location = {"JRL"}, using={} , require={{"Sub-Aqua Egg Aiming","Grenade Eggs","Sub"},{"Sub-Aqua Egg Aiming","Grenade Eggs","Mumbo JRL"}}},
{byte=0x49, bit=5, name="JRL: Seemee", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "JRL Atlantis", location = {"JRL"}, using={} , require={{"Talon Torpedo"}}},
{byte=0x49, bit=6, name="JRL: Pawno's", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "JRL Town", location = {"JRL"}, using={} , require={{}}},
{byte=0x49, bit=7, name="JRL: UFO", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "JRL Town", location = {"JRL"}, using={} , require={{"Talon Torpedo","Ice Eggs"}}},
{byte=0x4A, bit=0, name="TDL: Under Terry's Nest", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "TDL Top", location = {"TDL"}, using={} , require={{"Springy Step Shoes","Grenade Eggs"},{"Springy Step Shoes","Bill Drill"}}},
{byte=0x4A, bit=1, name="TDL: Dippy", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "TDL From CCL", location = {"CCL"}, using={} , require={{"Talon Torpedo"}}},
{byte=0x4A, bit=2, name="TDL: Scrotty", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "TDL Main Area", location = {"TDL","WW",}, using={} , require={{"Split Up","Taxi Pack","Mumbo TDL","Mumbo IoH","Mumbo GGM","Bill Drill","Grenade Eggs","Grip Grab"}}},
{byte=0x4A, bit=3, name="TDL: Terry Defeated", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "TDL Top", location = {"TDL"}, using={} , require={{"Springy Step Shoes","Egg Aim"}}},
{byte=0x4A, bit=4, name="TDL: Oogle Boogle Tribe", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "TDL Caves", location = {"TDL"}, using={} , require={{"Grip Grab","Bill Drill","Trex","Mumbo TDL","Fire Eggs"},{"Grip Grab","Bill Drill","Trex","Mumbo TDL","Dragon"}}},
{byte=0x4A, bit=5, name="TDL: Chompa's Belly", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "TDL Caves", location = {"TDL"}, using={} , require={{"Breegull Blaster"}}},
{byte=0x4A, bit=6, name="TDL: Terry's Babies Hatched", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "TDL Top", location = {"TDL"}, using={} , require={{"Split Up","Springy Step Shoes","Taxi Pack","Hatch"}}},
{byte=0x4A, bit=7, name="TDL: Stomping Plains", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "TDL Top", location = {"TDL"}, using={} , require={{"Springy Step Shoes"}}},
{byte=0x4B, bit=0, name="TDL: Rocknut Tribe", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "TDL Main Area", location = {"TDL"}, using={} , require={{"Egg Aim","Clockwork Kazooie Eggs"}}},
{byte=0x4B, bit=1, name="TDL: Code of the Dinosaurs", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "TDL Main Area", location = {"TDL"}, using={} , require={{"Trex"}}},
{byte=0x4B, bit=2, name="GI: Waste Disposal Underwater", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GI Toxic Waste", location = {"GI"}, using={} , require={{"Bill Drill","Washer","Claw Clamber Boots","Taxi Pack","Pack Whack","Mumbo GI","Fire Eggs","Shack Pack","Split Up"},{"Bill Drill","Washer","Claw Clamber Boots","Taxi Pack","Pack Whack","Mumbo GI","Grenade Eggs","Shack Pack","Split Up"}}},
{byte=0x4B, bit=3, name="GI: Weldar", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GI Washer", location = {"GI"}, using={} , require={{"Bill Drill","Washer","Claw Clamber Boots","Taxi Pack","Pack Whack","Mumbo GI","Fire Eggs","Split Up"},{"Bill Drill","Washer","Claw Clamber Boots","Taxi Pack","Pack Whack","Mumbo GI","Grenade Eggs","Split Up"}}},
{byte=0x4B, bit=4, name="GI: Clinker's Cavern", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GI Top Floors", location = {"GI"}, using={} , require={{"Breegull Blaster","Claw Clamber Boots","Mumbo GI"}}},
{byte=0x4B, bit=5, name="GI: Laundry", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GI Washer", location = {"GI"}, using={} , require={{"Bill Drill","Washer","Claw Clamber Boots"}}},
{byte=0x4B, bit=6, name="GI: Floor 5", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GI Top Floors", location = {"GI"}, using={} , require={{"Claw Clamber Boots"}}},
{byte=0x4B, bit=7, name="GI: Quality Control", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GI Top Floors", location = {"GI"}, using={} , require={{"Claw Clamber Boots","Grenade Eggs"}}},
{byte=0x4C, bit=0, name="GI: Floor 1 Guarded", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GI Floor 1", location = {"GI"}, using={} , require={{"Egg Aim","Claw Clamber Boots"}}},
{byte=0x4C, bit=1, name="GI: Trash Compactor", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GI Floor 1", location = {"GI"}, using={} , require={{"Split Up","Pack Whack"}}},
{byte=0x4C, bit=2, name="GI: Packing Room", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GI Top Floors", location = {"GI"}, using={} , require={{"Claw Clamber Boots","Taxi Pack","Pack Whack","Split Up"}}},
{byte=0x4C, bit=3, name="GI: Waste Disposal Box", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "GI Toxic Waste", location = {"GI"}, using={} , require={{"Taxi Pack","Pack Whack","Split Up"}}},
{byte=0x4C, bit=4, name="HFP: Dragon Brothers Defeated", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "HFP Top", location = {"HFP"}, using={} , require={{"Fire Eggs","Ice Eggs","Claw Clamber Boots"}}},
{byte=0x4C, bit=5, name="HFP: Inside the Volcano", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "HFP Fire", location = {"HFP"}, using={} , require={{}}},
{byte=0x4C, bit=6, name="HFP: Sabreman", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "HFP Fire", location = {"HFP"}, using={} , require={{"Taxi Pack","Fire Eggs","Mumbo HFP","Split Up"}}},
{byte=0x4C, bit=7, name="HFP: Boggy", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "HFP Ice", location = {"HFP"}, using={} , require={{"Shack Pack","Split Up"}}},
{byte=0x4D, bit=0, name="HFP: Icy Side Train Station", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "HFP Ice", location = {"HFP"}, using={} , require={{"Snowball","Grenade Eggs","GGM Mumbo"}}},
{byte=0x4D, bit=1, name="HFP: Oil Drill", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "HFP Ice", location = {"HFP"}, using={} , require={{"Shack Pack","Snowball","Split Up"}}},
{byte=0x4D, bit=2, name="HFP: Stomping Plains Connection", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "HFP Ice", location = {"TDL"}, using={} , require={{"Split Up","Snooze Pack"}}},
{byte=0x4D, bit=3, name="HFP: Kickball", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "HFP Fire", location = {"HFP"}, using={} , require={{"Stonie","MT Mumbo"}}},
{byte=0x4D, bit=4, name="HFP: Alien", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "HFP Ice", location = {"HFP","JRL"}, using={} , require={{"Bill Drill","Hatch","Mumbo HFP","Talon Torpedo","Ice Eggs","Split Up"}}},
{byte=0x4D, bit=5, name="HFP: Lava Waterfall", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "HFP Fire", location = {"HFP"}, using={} , require={{"Split Up","Grip Grab"}}},
{byte=0x4D, bit=6, name="CCL: Mingy Jongo", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "CCL Outside", location = {"CCL"}, using={} , require={{}}},
{byte=0x4D, bit=7, name="CCL: Mr. Fit", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "CCL Outside", location = {"CCL"}, using={} , require={{"Bill Drill","Springy Step Shoes","Hatch","Sack Pack","Mumbo CCL","Split Up"}}},
{byte=0x4E, bit=0, name="CCL: Pot o' Gold", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "CCL Outside", location = {"CCL"}, using={} , require={{"Egg Aim","Fire Eggs","Grenade Eggs","Ice Eggs"}}},
{byte=0x4E, bit=1, name="CCL: Canary Mary", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "CCL Outside", location = {"CCL"}, using={} , require={{"Detonator"}}},
{byte=0x4E, bit=2, name="CCL: Zubba's Nest", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "CCL Bee", location = {"CCL"}, using={} , require={{"Bee"}}},
{byte=0x4E, bit=3, name="CCL: Eyeballus Jiggium Plant", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "CCL Bee", location = {"CCL"}, using={} , require={{"Bee"}}},
{byte=0x4E, bit=4, name="CCL: Cheese Wedge", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "CCL Outside", location = {"CCL"}, using={} , require={{"Hatch","Pack Whack","Sack Pack","Mumbo CCL","Split Up"}}},
{byte=0x4E, bit=5, name="CCL: Trash Can", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "CCL Outside", location = {"CCL"}, using={} , require={{"Split Up","Egg Aim"},{"Split Up","Wing Whack"}}},
{byte=0x4E, bit=6, name="CCL: Superstash", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "CCL Inside", location = {"CCL"}, using={} , require={{"Clockwork Kazooie Eggs"}}},
{byte=0x4E, bit=7, name="CCL: Jelly Castle", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "CCL Outside", location = {"CCL"}, using={} , require={{"Shack Pack","Split Up"}}},
{byte=0x50, bit=1, name="IoH: King Jingaling Intro", type="Jiggy", sphere=-1, item={name ="nothing"}, level = "Starting Item", location = {}, using={} , require={{}}}

};

families = {
    {byte=0x4F, bit=0, name="IoH: White Jinjo Family", type="Family", col=0, sphere=-1, item={name ="nothing"}, level = "White Jinjos", location = {"MT"}, using={} , require={{}}},
    {byte=0x4F, bit=1, name="IoH: Orange Jinjo Family", type="Family", col=1, sphere=-1, item={name ="nothing"}, level = "Orange Jinjos", location = {"MT"}, using={} , require={{}}},
    {byte=0x4F, bit=2, name="IoH: Yellow Jinjo Family", type="Family", col=2, sphere=-1, item={name ="nothing"}, level = "Yellow Jinjos", location = {"GGM","WW"}, using={} , require={{}}},
    {byte=0x4F, bit=3, name="IoH: Brown Jinjo Family", type="Family", col=3, sphere=-1, item={name ="nothing"}, level = "Brown Jinjos", location = {"WW","JRL","TDL"}, using={} , require={{}}},
    {byte=0x4F, bit=4, name="IoH: Green Jinjo Family", type="Family", col=4, sphere=-1, item={name ="nothing"}, level = "Green Jinjos", location = {"GGM","WW","JRL"}, using={} , require={{}}},
    {byte=0x4F, bit=5, name="IoH: Red Jinjo Family", type="Family", col=5, sphere=-1, item={name ="nothing"}, level = "Red Jinjos", location = {"JRL","TDL","GI","CCL"}, using={} , require={{}}},
    {byte=0x4F, bit=6, name="IoH: Blue Jinjo Family", type="Family", col=6, sphere=-1, item={name ="nothing"}, level = "Blue Jinjos", location = {"GGM","JRL","WW","TDL","GI","HFP","CCL"}, using={} , require={{}}},
    {byte=0x4F, bit=7, name="IoH: Purple Jinjo Family", type="Family", col=7, sphere=-1, item={name ="nothing"}, level = "Purple Jinjos", location = {"MT","GI","HFP","CCL"}, using={} , require={{}}},
    {byte=0x50, bit=0, name="IoH: Black Jinjo Family", type="Family", col=8, sphere=-1, item={name ="nothing"}, level = "Black Jinjos", location = {"MT","TDL","GI","HFP","CCL"}, using={} , require={{}}},
};

jinjos = {
    {name="MT Jade Snake Grove",color=-1, location = {"MT"}, sphere=-1,require={{"Mumbo MT"}}}, 
    {name="MT Kickball Stadium Roof",color=-1, location = {"MT"}, sphere=-1,require={{"Mumbo MT"},{"Bill Drill"}}},
    {name="MT Temple",color=-1, location = {"MT"}, sphere=-1,require={{"Breegull Blaster"}}},
    {name="MT Pool",color=-1, location = {"MT"}, sphere=-1,require={{}}},
    {name="MT Bridge",color=-1, location = {"MT"}, sphere=-1,require={{}}},
    {name="GGM JRL Pipe",color=-1, location = {"GGM"}, sphere=-1,require={{"Talon Torpedo","Sub-Aqua Egg Aiming","Ice Eggs"}}},
    {name="GGM Jail Cell",color=-1, location = {"GGM"}, sphere=-1,require={{"Detonator"}}},
    {name="GGM Toxic Gas Cave",color=-1, location = {"GGM"}, sphere=-1,require={{}}},
    {name="GGM Under Boulder",color=-1, location = {"GGM"}, sphere=-1,require={{"Bill Drill"},{"Detonator"}}},
    {name="GGM Minecart Rails",color=-1, location = {"GGM"}, sphere=-1,require={{}}},
    {name="WW Big Top Tent",color=-1, location = {"WW"}, sphere=-1,require={{}}},
    {name="WW Cave of Horrors",color=-1, location = {"WW"}, sphere=-1,require={{"Grenade Eggs"}}},
    {name="WW Area 51",color=-1, location = {"WW"}, sphere=-1,require={{"Van"}}},
    {name="WW Dodgems Dome Top",color=-1, location = {"WW"}, sphere=-1,require={{}}},
    {name="WW Near Cactus of Strength",color=-1, location = {"WW"}, sphere=-1,require={{"Grip Grab"}}},
    {name="JRL Pool Cove",color=-1, location = {"JRL"}, sphere=-1,require={{}}},
    {name="JRL Blubbers",color=-1, location = {"JRL"}, sphere=-1,require={{}}},
    {name="JRL Big Fish",color=-1, location = {"JRL"}, sphere=-1,require={{"Sub-Aqua Egg Aiming"}}},
    {name="JRL Seaweed Santhum",color=-1, location = {"JRL"}, sphere=-1,require={{}}},
    {name="JRL Jinjo Chest",color=-1, location = {"JRL"}, sphere=-1,require={{"Sub-Aqua Egg Aiming","Grenade Eggs"},{"Sub"},{"Talon Torpedo"}}},
    {name="TDL Caged Underwater",color=-1, location = {"TDL"}, sphere=-1,require={{"Talon Torpedo"}}},
    {name="TDL Near Entrance",color=-1, location = {"TDL"}, sphere=-1,require={{"Grenade Eggs"}}},
    {name="TDL Caged Near Unga",color=-1, location = {"TDL"}, sphere=-1,require={{"Clockwork Kazooie Eggs"}}},
    {name="TDL Trex Switch",color=-1, location = {"TDL"}, sphere=-1,require={{"Trex","Mumbo TDL"}}},
    {name="TDL Stompadon",color=-1, location = {"TDL"}, sphere=-1,require={{"Split Up"}}},
    {name="GI Floor 5",color=-1, location = {"GI"}, sphere=-1,require={{"Claw Clamber Boots"}}},
    {name="GI Floor 2 Ledge",color=-1, location = {"GI"}, sphere=-1,require={{"Claw Clamber Boots","Leg Spring"}}},
    {name="GI JRL Pipe",color=-1, location = {"GI"}, sphere=-1,require={{"Talon Torpedo","Sub-Aqua Egg Aiming","Ice Eggs"}}},
    {name="GI Floor 3",color=-1, location = {"GI"}, sphere=-1,require={{"Claw Clamber Boots","Grenade Eggs","Egg Aim"},{"Claw Clamber Boots","Grenade Eggs","Airborne Egg Aiming"},{"Claw Clamber Boots","Leg Spring","Glide"}}},
    {name="GI Window",color=-1, location = {"GI"}, sphere=-1,require={{"Split Up","Claw Clamber Boots"}}},
    {name="HFP Lava Waterfall",color=-1, location = {"HFP"}, sphere=-1,require={{}}},
    {name="HFP Lava Pool",color=-1, location = {"HFP"}, sphere=-1,require={{"Split Up","Shack Pack"}}},
    {name="HFP Icy Tunnel",color=-1, location = {"HFP"}, sphere=-1,require={{"Snowball"}}},
    {name="HFP Icicle Grotto",color=-1, location = {"HFP"}, sphere=-1,require={{"Split Up","Shack Pack"}}},
    {name="HFP Inside the Ice Cube",color=-1, location = {"HFP"}, sphere=-1,require={{"Fire Eggs"},{"Grenade Eggs"},{"Dragon"},{"Mumbo HFP"}}},
    {name="CCL Trash Can",color=-1, location = {"CCL"}, sphere=-1,require={{"Split Up","Shack Pack"},{"Split Up","Leg Spring"}}},
    {name="CCL Cheese Wedge",color=-1, location = {"CCL"}, sphere=-1,require={{}}},
    {name="CCL Central Cavern",color=-1, location = {"CCL"}, sphere=-1,require={{"Split Up"},{"Bee"}}},
    {name="CCL Minjy",color=-1, location = {"CCL"}, sphere=-1,require={{}}},
    {name="CCL Wumbas Wigwam",color=-1, location = {"CCL"}, sphere=-1,require={{}}},
    {name="IOH Wooden Hollow",color=-1, location = {"MT"}, sphere=-1,require={{}}},
    {name="IOH Wasteland",color=-1, location = {"TDL"}, sphere=-1,require={{"Talon Torpedo"}}},
    {name="IOH Cliff Top",color=-1, location = {"JRL"}, sphere=-1,require={{"Split Up","Claw Clamber Boots"}}},
    {name="IOH Plataeu",color=-1, location = {"GGM"}, sphere=-1,require={{"Bill Drill"}}},
    {name="SM Waterfall",color=-1, location = {"MT"}, sphere=-1,require={{"Talon Torpedo"}}}
};

locations ={
    {name="MT", requires={}},
    {name="GGM", requires={}},
    {name="WW", requires={}},
    {name="JRL", requires={}},
    {name="TDL", requires={}},
    {name="GI", requires={"Springy Step Shoes","Mumbo GGM"}},
    {name="HFP", requires={}},
    {name="CCL", requires={}}

};

transformations ={
    {byte=0x15, bit=6,  model=0x61D, name="Stonie", used = 0, type="Wumba"},
    {byte=0x15, bit=7, model=0x623, name="Detonator", used = 0, type="Wumba"},
    {byte=0x16, bit=0, model=0x624, name="Van", used = 0, type="Wumba"},
    {byte=0x16, bit=1, model=0x626, name="Sub", used = 0, type="Wumba"},
    {byte=0x16, bit=2, model=0x609, name="Trex", used = 0, type="Wumba"},
    {byte=0x16, bit=3, model=0x60C, name="Washer", used = 0, type="Wumba"},
    {byte=0x16, bit=4, model=0x60B, name="Snowball", used = 0, type="Wumba"},
    {byte=0x16, bit=5, model=0x613, name="Bee", used = 0, type="Wumba"},
    {byte=0x16, bit=6, model=0x62E, name="Dragon", used = 0, type="Wumba"}
};
mumbos = {
    {byte=0x6A, bit=7, model=0x7E0, name="Mumbo MT", type="Mumbo", used = 0},
    {byte=0x6B, bit=0, model=0x7D8, name="Mumbo GGM", type="Mumbo", used = 0},
    {byte=0x6B, bit=1, model=0x7D9, name="Mumbo WW", type="Mumbo", used = 0},
    {byte=0x6B, bit=2, model=0x7DB, name="Mumbo JRL", type="Mumbo", used = 0},
    {byte=0x6B, bit=3, model=0x7DC, name="Mumbo TDL", type="Mumbo", used = 0},
    {byte=0x6B, bit=4, model=0x7DA, name="Mumbo HFP", type="Mumbo", used = 0},
    {byte=0x6B, bit=5, model=0x7DD, name="Mumbo CCL", type="Mumbo", used = 0},
    {byte=0x6B, bit=6, model=0x7DF, name="Mumbo IoH", type="Mumbo", used = 0},
    {byte=0x6B, bit=7, model=0x7DE, name="Mumbo GI", type="Mumbo", used = 0}
};



abilities ={
{byte=0x1B, bit=1, name="Grip Grab", type="Ability", model=0x7D6, level=0x086A20, index=0, used = 0},
{byte=0x1B, bit=2, name="Breegull Blaster", type="Ability", model=0x7D6, level=0x086A20, index=1, used = 0},
{byte=0x1B, bit=3, name="Egg Aim", type="Ability", model=0x7D6, level=0x086A20, index=2, used = 0},
{byte=0x1B, bit=6, name="Bill Drill", type="Ability", model=0x7D6, used = 0},
{byte=0x1B, bit=7, name="Beak Bayonet", type="Ability", model=0x7D6, used = 0},
{byte=0x1C, bit=0, name="Airborne Egg Aiming", type="Ability", model=0x7D6, used = 0}, 
{byte=0x1C, bit=1, name="Split Up", type="Ability", model=0x7D6, used = 0}, 
{byte=0x1C, bit=2, name="Wing Whack", type="Ability", model=0x7D6, used = 0},
{byte=0x1C, bit=3, name="Talon Torpedo", type="Ability", model=0x7D6, used = 0}, 
{byte=0x1C, bit=4, name="Sub-Aqua Egg Aiming", type="Ability", model=0x7D6, used = 0}, 
{byte=0x1C, bit=6, name="Shack Pack", type="Ability", model=0x7D6, used = 0},
{byte=0x1C, bit=7, name="Glide", type="Ability", model=0x7D6, used = 0},
{byte=0x1D, bit=0, name="Snooze Pack", type="Ability", model=0x7D6, used = 0},
{byte=0x1D, bit=1, name="Leg Spring", type="Ability", model=0x7D6, used = 0},
{byte=0x1D, bit=2, name="Claw Clamber Boots", type="Ability", model=0x832, used = 0},
{byte=0x1D, bit=3, name="Springy Step Shoes", type="Ability", model=0x7AA, used = 0},
{byte=0x1D, bit=4, name="Taxi Pack", type="Ability", model=0x7D6, used = 0},
{byte=0x1D, bit=5, name="Hatch", type="Ability", model=0x7D6, used = 0},
{byte=0x1D, bit=6, name="Pack Whack", type="Ability", model=0x7D6, used = 0},
{byte=0x1D, bit=7, name="Sack Pack", type="Ability", model=0x7D6, used = 0},
{byte=0x1E, bit=1, name="Fire Eggs", type="Ability", model=0x7D6, used = 0},
{byte=0x1E, bit=2, name="Grenade Eggs", type="Ability", model=0x7D6, used = 0},
{byte=0x1E, bit=4, name="Ice Eggs", type="Ability", model=0x7D6, used = 0}};

cheatos = {
    {byte=0x56, bit=3, name="Cheato Page: MT: Snake Heads", type="Cheato Page", level ="MT Main Area", item={name ="nothing"}, hint ="", sphere =-1, location = {"MT"}, using={},require={{"MT Mumbo"},{"Bill Drill"}}},
	{byte=0x56, bit=4, name="Cheato Page: MT: Prison Compound", type="Cheato Page", level ="MT PC", item={name ="nothing"}, hint ="", sphere =-1, location = {"MT"}, using={},require={{"Grip Grab","Grenade Eggs"},{"Grip Grab","MT Mumbo"}}},
	{byte=0x56, bit=5, name="Cheato Page: MT: Jade Snake Grove", type="Cheato Page", level ="MT JSG", item={name ="nothing"}, hint ="", sphere =-1, location = {"MT"}, using={},require={{"MT Mumbo","Grip Grab"}}},
	{byte=0x56, bit=6, name="Cheato Page: GGM: Canary Mary Race", type="Cheato Page", level ="GGM Main Area", item={name ="nothing"}, hint ="", sphere =-1, location = {"GGM"}, using={},require={{"Detonator"}}},
	{byte=0x56, bit=7, name="Cheato Page: GGM: Level Entrance", type="Cheato Page", level ="GGM Main Area", item={name ="nothing"}, hint ="", sphere =-1, location = {"GGM"}, using={},require={{}}},
	{byte=0x57, bit=0, name="Cheato Page: GGM: Water Storage", type="Cheato Page", level ="GGM Caves", item={name ="nothing"}, hint ="", sphere =-1, location = {"GGM"}, using={},require={{}}},
	{byte=0x57, bit=1, name="Cheato Page: WW: Haunted Cavern", type="Cheato Page", level ="WW Inferno", item={name ="nothing"}, hint ="", sphere =-1, location = {"WW"}, using={},require={{"Grip Grab"}}},
	{byte=0x57, bit=2, name="Cheato Page: WW: The Inferno (Van)", type="Cheato Page", level ="WW Inferno", item={name ="nothing"}, hint ="", sphere =-1, location = {"WW"}, using={},require={{"Van"}}},
	{byte=0x57, bit=3, name="Cheato Page: WW: Saucer of Peril", type="Cheato Page", level ="WW Space Zone", item={name ="nothing"}, hint ="", sphere =-1, location = {"WW"}, using={},require={{"Van","WW Mumbo","Detonator","Grip Grab"}}},
	{byte=0x57, bit=4, name="Cheato Page: JRL: Pawno's", type="Cheato Page", level ="JRL Town", item={name ="nothing"}, hint ="", sphere =-1, location = {"JRL"}, using={},require={{}}},
	{byte=0x57, bit=5, name="Cheato Page: JRL: Seemee", type="Cheato Page", level ="JRL Town", item={name ="nothing"}, hint ="", sphere =-1, location = {"JRL"}, using={},require={{"Talon Torpedo"}}},
	{byte=0x57, bit=6, name="Cheato Page: JRL: Ancient Swimming Baths", type="Cheato Page", level ="JRL Atlantis", item={name ="nothing"}, hint ="", sphere =-1, location = {"JRL"}, using={},require={{"Split Up","Glide"}}},
	{byte=0x57, bit=7, name="Cheato Page: TDL: Dippy's Pool", type="Cheato Page", level ="TDL Main Area", item={name ="nothing"}, hint ="", sphere =-1, location = {"TDL"}, using={},require={{"Talon Torpedo","Springy Step Shoes"}}},
	{byte=0x58, bit=0, name="Cheato Page: TDL: Inside the Mountain", type="Cheato Page", level ="TDL Inside Mountain", item={name ="nothing"}, hint ="", sphere =-1, location = {"TDL"}, using={},require={{"Trex"}}},
	{byte=0x58, bit=1, name="Cheato Page: TDL: Boulder", type="Cheato Page", level ="TDL Main Area", item={name ="nothing"}, hint ="", sphere =-1, location = {"TDL"}, using={},require={{"Grip Grab","Bill Drill"}}},
	{byte=0x58, bit=2, name="Cheato Page: GI: Loggo", type="Cheato Page", level ="GI First Floor", item={name ="nothing"}, hint ="", sphere =-1, location = {"GI"}, using={},require={{"Grenade Eggs"}}},
	{byte=0x58, bit=3, name="Cheato Page: GI: Floor 2", type="Cheato Page", level ="GI Middle Floors", item={name ="nothing"}, hint ="", sphere =-1, location = {"GI"}, using={},require={{"Claw Clamber Boots"}}},
	{byte=0x58, bit=4, name="Cheato Page: GI: Repair Depot", type="Cheato Page", level ="GI Basement", item={name ="nothing"}, hint ="", sphere =-1, location = {"GI"}, using={},require={{"Bill Drill","Washer","Claw Clamber Boots","Taxi Pack","Pack Whack","Mumbo GI"}}},
	{byte=0x58, bit=5, name="Cheato Page: HFP: Lava Side", type="Cheato Page", level ="HFP Lava Side", item={name ="nothing"}, hint ="", sphere =-1, location = {"HFP"}, using={},require={{"Claw Clamber Boots"}}},
	{byte=0x58, bit=6, name="Cheato Page: HFP: Icicle Grotto", type="Cheato Page", level ="HFP Icey Side", item={name ="nothing"}, hint ="", sphere =-1, location = {"HFP"}, using={},require={{"Split Up","Shack Pack"}}},
	{byte=0x58, bit=7, name="Cheato Page: HFP: Icy Side", type="Cheato Page", level ="HFP Icey Side", item={name ="nothing"}, hint ="", sphere =-1, location = {"HFP"}, using={},require={{"Split Up"}}},
	{byte=0x59, bit=0, name="Cheato Page: CCL: Canary Mary", type="Cheato Page", level ="CCL Ouside", item={name ="nothing"}, hint ="", sphere =-1, location = {"CCL"}, using={},require={{"Detonator"}}},
	{byte=0x59, bit=1, name="Cheato Page: CCL: Pot o' Gold", type="Cheato Page", level ="CCL Outside", item={name ="nothing"}, hint ="", sphere =-1, location = {"CCL"}, using={},require={{"Egg Aim","Fire Eggs","Grenade Eggs","Ice Eggs"}}},
	{byte=0x59, bit=2, name="Cheato Page: CCL: Zubbas' Nest", type="Cheato Page", level ="CCL Bee", item={name ="nothing"}, hint ="", sphere =-1, location = {"CCL"}, using={},require={{"Bee"}}},
	{byte=0x59, bit=3, name="Cheato Page: Spiral Mountain", type="Cheato Page", level ="Spiral Mountain", item={name ="nothing"}, hint ="", sphere =-1, location = {"IOH"}, using={},require={{}}},
}
honeycombs = {
    {byte=0x3F, bit=2, name="Honeycomb: MT: Entrance", type="Honeycomb", level ="MT Main Area", item={name ="nothing"}, sphere =-1, location = {"MT"}, using={},require={{"Stonie"}}},
	{byte=0x3F, bit=3, name="Honeycomb: MT: Bovina", type="Honeycomb", level ="MT Main Area", item={name ="nothing"}, sphere =-1, location = {"MT"}, using={},require={{}}},
	{byte=0x3F, bit=4, name="Honeycomb: MT: Treasure Chamber", type="Honeycomb", level ="MT Main Area", item={name ="nothing"}, sphere =-1, location = {"MT"}, using={},require={{"Egg Aim"}}},
	{byte=0x3F, bit=5, name="Honeycomb: GGM: Boulder (Toxic Gas Cave)", type="Honeycomb", level ="GGM Caves", item={name ="nothing"}, sphere =-1, location = {"GGM"}, using={},require={{"Bill Drill"},{"Detonator"}}},
	{byte=0x3F, bit=6, name="Honeycomb: GGM: Boulder", type="Honeycomb", level ="GGM Main Area", item={name ="nothing"}, sphere =-1, location = {"GGM"}, using={},require={{"Bill Drill"},{"Detonator"}}},
	{byte=0x3F, bit=7, name="Honeycomb: GGM: Train Station", type="Honeycomb", level ="GGM Caves", item={name ="nothing"}, sphere =-1, location = {"GGM"}, using={},require={{}}},
	{byte=0x40, bit=0, name="Honeycomb: WW: Space Zone", type="Honeycomb", level ="WW Space Zone", item={name ="nothing"}, sphere =-1, location = {"WW"}, using={},require={{}}},
	{byte=0x40, bit=1, name="Honeycomb: WW: Mumbo's Skull", type="Honeycomb", level ="WW Inferno", item={name ="nothing"}, sphere =-1, location = {"WW"}, using={},require={{"Van"}}},
	{byte=0x40, bit=2, name="Honeycomb: WW: Crazy Castle Area", type="Honeycomb", level ="WW Western", item={name ="nothing"}, sphere =-1, location = {"WW"}, using={},require={{"Grenade Eggs","Egg Aim"}}},
	{byte=0x40, bit=3, name="Honeycomb: JRL: Seemee", type="Honeycomb", level ="JRL Deep", item={name ="nothing"}, sphere =-1, location = {"JRL"}, using={},require={{"Talon Torpedo"}}},
	{byte=0x40, bit=4, name="Honeycomb: JRL: Atlantis", type="Honeycomb", level ="JRL Atlantis", item={name ="nothing"}, sphere =-1, location = {"JRL"}, using={},require={{}}},
	{byte=0x40, bit=5, name="Honeycomb: JRL: Waste Pipe", type="Honeycomb", level ="JRL Town", item={name ="nothing"}, sphere =-1, location = {"JRL"}, using={},require={{"Grip Grab","Bill Drill"},{"Grip Grab","Grenade Eggs"}}},
	{byte=0x40, bit=6, name="Honeycomb: TDL: Central Area", type="Honeycomb", level ="TDL Main Area", item={name ="nothing"}, sphere =-1, location = {"TDL"}, using={},require={{}}},
	{byte=0x40, bit=7, name="Honeycomb: TDL: Styracosaurus Family Cave", type="Honeycomb", level ="TDL Caves", item={name ="nothing"}, sphere =-1, location = {"TDL"}, using={},require={{"Bill Drill"}}},
	{byte=0x41, bit=0, name="Honeycomb: TDL: River Passage", type="Honeycomb", level ="TDL Caves", item={name ="nothing"}, sphere =-1, location = {"TDL"}, using={},require={{}}},
	{byte=0x41, bit=1, name="Honeycomb: GI: Floor 3", type="Honeycomb", level ="GI Middle Floors", item={name ="nothing"}, sphere =-1, location = {"GI"}, using={},require={{"Claw Clamber Boots"}}},
	{byte=0x41, bit=2, name="Honeycomb: GI: Train Station", type="Honeycomb", level ="GI First Floor", item={name ="nothing"}, sphere =-1, location = {"GI"}, using={},require={{}}},
	{byte=0x41, bit=3, name="Honeycomb: GI: Chimney", type="Honeycomb", level ="GI Outside", item={name ="nothing"}, sphere =-1, location = {"GI"}, using={},require={{"Claw Clamber Boots"}}},
	{byte=0x41, bit=4, name="Honeycomb: HFP: Inside the Volcano", type="Honeycomb", level ="HFP Lava Side", item={name ="nothing"}, sphere =-1, location = {"HFP"}, using={},require={{}}},
	{byte=0x41, bit=5, name="Honeycomb: HFP: Train Station", type="Honeycomb", level ="HFP Lava Side", item={name ="nothing"}, sphere =-1, location = {"HFP"}, using={},require={{"Grip Grab"}}},
	{byte=0x41, bit=6, name="Honeycomb: HFP: Lava Side", type="Honeycomb", level ="HFP Lava Side", item={name ="nothing"}, sphere =-1, location = {"HFP"}, using={},require={{"Grip Grab"}}},
	{byte=0x41, bit=7, name="Honeycomb: CCL: Underground", type="Honeycomb", level ="CCL Outside", item={name ="nothing"}, sphere =-1, location = {"CCL"}, using={},require={{"Bill Drill"}}},
	{byte=0x42, bit=0, name="Honeycomb: CCL: Trash Can", type="Honeycomb", level ="CCL Outside", item={name ="nothing"}, sphere =-1, location = {"CCL"}, using={},require={{}}},
	{byte=0x42, bit=1, name="Honeycomb: CCL: Pot o' Gold", type="Honeycomb", level ="CCL Outside", item={name ="nothing"}, sphere =-1, location = {"CCL"}, using={},require={{}}},
	{byte=0x42, bit=2, name="Honeycomb: IoH: Plateau", type="Honeycomb", level ="IOH Plateau", item={name ="nothing"}, sphere =-1, location = {"GGM"}, using={},require={{}}}
};
rewards = {
    {byte=0x08, bit=4, name="(Cheato Page Reward 1)", gave =0, type="CheatoR",sphere =-1,amt=5,item={name ="nothing"}, using={},require={{}}},
    {byte=0x08, bit=5, name="(Cheato Page Reward 2)", gave =0, type="CheatoR",sphere =-1,amt=10,item={name ="nothing"}, using={},require={{}}},
    {byte=0x08, bit=6, name="(Cheato Page Reward 3)", gave =0, type="CheatoR",sphere =-1,amt=15,item={name ="nothing"}, using={},require={{}}},

    {byte=0x98, bit=1, name="(Honeycomb Reward 1)",gave =0, type="Reward",sphere =-1,amt=1,item={name ="nothing"}, using={},require={{}}},
    {byte=0x98, bit=2, name="(Honeycomb Reward 2)",gave =0, type="Reward",sphere =-1,amt=4,item={name ="nothing"}, using={},require={{}}},
    {byte=0x98, bit=3, name="(Honeycomb Reward 3)",gave =0, type="Reward",sphere =-1,amt=9,item={name ="nothing"}, using={},require={{}}},
    {byte=0x98, bit=4, name="(Honeycomb Reward 4)",gave =0, type="Reward",sphere =-1,amt=16,item={name ="nothing"}, using={},require={{}}}
};

hints = {

};

--TODO
-- Honeycomb rewards {X}
-- Remove objects {X}
-- shuffle nests on room enter
-- gui {X}
-- scale randomization towards higher spheres? {X}
-- peftect spheres

--TODO --Bug fixes
-- HC rewards {X}

SEED = 5454;

function dumpRewards() 
    rewards = {};
end

function addTableToJiggies(tbl)
    for i,v in ipairs(tbl) do
        table.insert(jiggies,v);
    end
end

function shuffle(tbl)
    for i = #tbl, 2, -1 do
      local j = math.random(i)
      tbl[i], tbl[j] = tbl[j], tbl[i]
    end
    return tbl
  end

function buildHints()
    --fill hints table with hints for the Seed
        -- 3 hard check breegul blaster, springy, claws 
        for i,v in ipairs(jiggies)  do
            if v.item.name == "Claw Clamber Boots" then
                table.insert(hints,"Claw Clamber Boots are at "..v.name);
                table.insert(hints,"Claw Clamber Boots are at "..v.name);
            end
            if v.item.name == "Springy Step Shoes" then
                table.insert(hints,"Springy Step Shoes are at "..v.name);
                table.insert(hints,"Springy Step Shoes are at "..v.name);
            end
            if v.item.name == "Breegull Blaster" then
                table.insert(hints,"Breegull Blaster are at "..v.name);
                table.insert(hints,"Breegull Blaster are at "..v.name);
            end
        end
       
        --Jamjars master plan
        movesAdded = {"Claw Clamber Boots","Springy Step Shoes","Breegull Blaster"};      
        for i = 1,5,1 do
            move = -1;
            while move == -1 or has_value(movesAdded,move) do
                move = movesNeeded[math.floor(math.random()*table.getn(movesNeeded))+1];
            end
            table.insert(movesAdded,move);
            for i,v in ipairs(jiggies)  do
                if v.item.name == move then
                    table.insert(hints,v.level .." is part of Jamjar's masterplan");
                    table.insert(hints,v.level .." is part of Jamjar's masterplan");
                end
            end
        end

        --Always long hints
            --always hints: Aliens, Mr Fit, Dino Kids , Weldar , black jinjos
    for i,v in ipairs(jiggies)  do
        if v.name == "HFP: Alien" then
            table.insert(hints,v.name .." gives "..v.item.name);
        end
        if v.name == "TDL: Scrotty" then
            table.insert(hints,v.name .." gives "..v.item.name);
        end
        if v.name == "CCL: Mr. Fit" then
            table.insert(hints,v.name .." gives "..v.item.name);
        end
        if v.name == "GI: Weldar" then
            table.insert(hints,v.name .." gives "..v.item.name);
        end
        if v.name == "IoH: Black Jinjo Family" then
            table.insert(hints,v.name .." gives "..v.item.name);
        end
    end

    for i,v in ipairs(hints)  do
        --print(v.name.." > "..v.hint);
        all = all..v.."\n";
    end

end

function buildHints2()
    
    shuffle(cheatos);
    cheato = 1;
    -- 3 hard check breegul blaster, springy, claws 
    for i,v in ipairs(jiggies)  do
        if v.item.name == "Claw Clamber Boots" then
            cheatos[cheato].hint = "Claw Clamber Boots is at "..v.name;
            cheato = cheato + 1;
            cheatos[cheato].hint = "Claw Clamber Boots is at "..v.name;
            cheato = cheato + 1;
        end
        if v.item.name == "Springy Step Shoes" then
            cheatos[cheato].hint = "Springy Step Shoes is at "..v.name;
            cheato = cheato + 1;
            cheatos[cheato].hint = "Springy Step Shoes is at "..v.name;
            cheato = cheato + 1;
        end
        if v.item.name == "Breegull Blaster" then
            cheatos[cheato].hint = "Breegull Blaster is at "..v.name;
            cheato = cheato + 1;
            cheatos[cheato].hint = "Breegull Blaster is at "..v.name;
            cheato = cheato + 1;
        end
    end
    -- 3 sets of 2 Level way hints
    
    
    move = movesNeeded[math.floor(math.random()*table.getn(movesNeeded))+1];
    for i,v in ipairs(jiggies)  do
        if v.item.name == move then
            cheatos[cheato].hint = v.level .." is part of Jamjar's masterplan";
            cheato = cheato + 1;
            cheatos[cheato].hint = v.level .." is part of Jamjar's masterplan";
            cheato = cheato + 1;
        end
    end
    move = movesNeeded[math.floor(math.random()*table.getn(movesNeeded))+1];
    for i,v in ipairs(jiggies)  do
        if v.item.name == move then
            cheatos[cheato].hint = v.level .." is part of Jamjar's masterplan";
            cheato = cheato + 1;
            cheatos[cheato].hint = v.level .." is part of Jamjar's masterplan";
            cheato = cheato + 1;
        end
    end
    move = movesNeeded[math.floor(math.random()*table.getn(movesNeeded))+1];
    for i,v in ipairs(jiggies)  do
        if v.item.name == move then
            cheatos[cheato].hint = v.level .." is part of Jamjar's masterplan";
            cheato = cheato + 1;
            cheatos[cheato].hint = v.level .." is part of Jamjar's masterplan";
            cheato = cheato + 1;
        end
    end
    move = movesNeeded[math.floor(math.random()*table.getn(movesNeeded))+1];
    for i,v in ipairs(jiggies)  do
        if v.item.name == move then
            cheatos[cheato].hint = v.level .." is part of Jamjar's masterplan";
            cheato = cheato + 1;
            cheatos[cheato].hint = v.level .." is part of Jamjar's masterplan";
            cheato = cheato + 1;
        end
    end
    --always hints: Aliens, Mr Fit, Dino Kids , Weldar , black jinjos
    for i,v in ipairs(jiggies)  do
        if v.name == "HFP: Alien" then
            cheatos[cheato].hint = v.name .." gives "..v.item.name;
            cheato = cheato + 1;
            cheatos[cheato].hint = v.name .." gives "..v.item.name;
            cheato = cheato + 1;
        end
        if v.name == "TDL: Scrotty" then
            cheatos[cheato].hint = v.name .." gives "..v.item.name;
            cheato = cheato + 1;
            cheatos[cheato].hint = v.name .." gives "..v.item.name;
            cheato = cheato + 1;
        end
        if v.name == "CCL: Mr. Fit" then
            cheatos[cheato].hint = v.name .." gives "..v.item.name;
            cheato = cheato + 1;
            cheatos[cheato].hint = v.name .." gives "..v.item.name;
            cheato = cheato + 1;
        end
        if v.name == "GI: Weldar" then
            cheatos[cheato].hint = v.name .." gives "..v.item.name;
            cheato = cheato + 1;
            cheatos[cheato].hint = v.name .." gives "..v.item.name;
            cheato = cheato + 1;
        end
        if v.name == "IoH: Black Jinjo Family" then
            cheatos[cheato].hint = v.name .." gives "..v.item.name;
            cheato = cheato + 1;
            cheatos[cheato].hint = v.name .." gives "..v.item.name;
            cheato = cheato + 1;
        end
    end
    --sometimes  3 random things
    move = jiggies[math.floor(math.random()*table.getn(jiggies))+1];
    cheatos[cheato].hint = move.name .." gives "..move.item.name;
    cheato = cheato + 1;




    for i,v in ipairs(cheatos)  do
        --print(v.name.." > "..v.hint);
        all = all..v.name.." > "..v.hint.."\n";
    end
end


--{byte=0x1E, bit=3, name="Clockwork Kazooie Eggs", type="Ability", model=0x7D6, used = 0},


bosses = {"MT: Targitzan","GGM: Old King Coal","WW: Mr. Patch","JRL: Lord Woo Fak Fak","TDL: Terry Defeated","GI: Weldar","HFP: Dragon Brothers Defeated","CCL: Mingy Jongo"};

function setBosses(amt)
    math.randomseed(SEED);
    for i = 1,(8-amt),1 do
        local indexB = math.floor(math.random()*table.getn(bosses))+1;
        table.remove(bosses,indexB);
    end
end

gaveClocks = false;

function giveClockworks() 
    local flags = dereferencePointer(flag_block_pointer);
    local counter = 0;
    for i,v in ipairs(jiggies)  do
        for j,b in ipairs(bosses )  do
            if v.name == b then
                if bit.check(v.byte , v.bit) then
                    counter = counter +1;
                end
            end
        end
    end
    if counter >= table.getn(bosses) and gaveClocks == false then
        gaveClocks = true;
        setFlag(0x1E, 3);
        queueMessage("You obtained Clockwork Kazooie Eggs",300,60,175);
        print("You obtained Clockwork Kazooie Eggs");
    end
end

openedHag1 = false;

function openHag1()
    local flags = dereferencePointer(flag_block_pointer);
    local counter = 0;
    for i,v in ipairs(jiggies)  do
        for j,b in ipairs(bosses )  do
            if v.name == b then
                if bit.check(v.byte , v.bit) then
                    counter = counter +1;
                end
            end
        end
    end
    if counter >= table.getn(bosses)  and openedHag1 == false then
        setFlag(0x6E, 3);
        openedHag1 = true;
    end

end

clocksinLogic = false;
function addClockworksToGen()
    local clocks = {byte=0x1E, bit=3, name="Clockwork Kazooie Eggs", type="Ability", model=0x7D6, used = 0};

    table.insert(abilities,clocks);
    table.insert(movesNeeded,clocks.name);
    clocksinLogic = true;

end

RDRAMBase = 0x80000000;
RDRAMSize = 0x800000;
RAMBase = RDRAMBase;
RAMSize = RDRAMSize;

object_array_pointer = 0x136EE0;
player_pointer = 0x135490;
player_pointer_index = 0x1354DF;
character_state = 0x136F63;
camera_pointer_pointer = 0x127728;

-- Relative to Position object
local x_pos = 0x00;
local y_pos = x_pos + 4;
local z_pos = y_pos + 4;

local grounded_pointer_index = 84 * 4;
local position_pointer_index = 57 * 4;

local slot_base = 0x10;
local slot_size = 0x9C;

function isPointer(value)
	return type(value) == "number" and value >= RDRAMBase and value < RDRAMBase + RDRAMSize;
end

-- Checks whether a value falls within N64 RDRAM
function isRDRAM(value)
	return type(value) == "number" and value >= 0 and value < RDRAMSize;
end

function dereferencePointer(address)
    if type(address) == "number" and address >= 0 and address < (RDRAMSize - 4) then
        address = mainmemory.read_u32_be(address);
        if isPointer(address) then
            return address - RDRAMBase;
        end
    end
end

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function has_Jiggy (tab, name)
    for index, value in ipairs(tab) do
        if value.name == name then
            return false
        end
    end
    return true
end

function printPool()
    for index, value in ipairs(pool) do
        print(value.name.." S: "..value.sphere);
    end
end


currentMoves = {};
pool = {}



function poolTablesTogether()
    --add everything to abilities
    for i,v in ipairs(transformations)  do
        table.insert(abilities,v);
    end
    for i,v in ipairs(mumbos)  do
        table.insert(abilities,v);
    end

    local stuff = {jiggies,cheatos,honeycombs,jinjos}
    -- add location requirements to jiggies
    for q,w in ipairs(stuff)  do
        for i,v in ipairs(w)  do
            for e,r in ipairs(v.require)  do
                for j,b in ipairs(v.location)  do
                    for k,n in ipairs(locations)  do
                        if b == n.name then
                            for l,m in ipairs(n.requires)  do
                                if has_value(r,m) == false then
                                    table.insert(r,m);
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end


function populateSpheres()
    math.randomseed(SEED);
    generate(0);
    for i = 1,table.getn(abilities),1 do
        val = pickMove(i);
        if val == -1 then
            print(i);
            return -1;
        end
    end
    --printPool();
    print("");
    return 1;

end

function pickMove(i)
    -- attempt counter if it takes more than 100 attempts the seed needs to be rerolled
    attempts = 0;



    --pick a random ability that is not choosen, mark it as choosen
    index = math.floor(math.random()*table.getn(abilities))+1;
    --print(abilities[index]);
    --print(index);
    while abilities[index].used ~= 0 do
        index = math.floor(math.random()*table.getn(abilities))+1;       
    end

    -- if index is 4 and there is no split up, add it now!
    if i == 15 and has_value (currentMoves, "Split Up") == false then
        index = 7;
    end
    -- if index is 7 and there is no Talon Torpido, add it now!
    if i == 20 and has_value (currentMoves, "Talon Torpedo") == false then
        index = 9;
    end
    --math.floor(1/(90-i))
    if i > 5 and math.random() < math.floor(1/(50-i)) +0.2 then
        abilities[index].used = 1;
        if attemptRewardAdding(index) then            
            return 1;
        end
    end

    abilities[index].used = 1;

    local sphere = getHighestSphere();
	local poolIndex =-1;
	local added = false;
	--GIVE 30%? chance per sphere from highest to 0 to try and and a check in
    while sphere > 0 do	
        if math.random() < 0.8 then
                --select random from current sphere at random (20 attempts)
                local checks = getChecksFromSphere(s);
                poolIndex = math.floor(math.random()*table.getn(checks))+1;
                while pool[poolIndex].item.name ~= "nothing" do
                    poolIndex = math.floor(math.random()*table.getn(pool))+1;
                    attempts = attempts + 1;
                    if attempts > 100 then
                        return -1;
                    end
                end
                Added = true;	
                sphere = 0;	
                break;
                --print("added higher seed"..pool[poolIndex].name)	;
		end
		sphere = sphere - 1;
	end

	if added == false then
		--select anywhere to add
        -- attempt to place it in pool;
        poolIndex = math.floor(math.random()*table.getn(pool))+1;
        while pool[poolIndex].item.name ~= "nothing" do
            poolIndex = math.floor(math.random()*table.getn(pool))+1;
            attempts = attempts + 1;
            if attempts > 100 then
                return -1;
            end
        end
    end

	--do normal add to pool code here with the index that we found for poolIndex


    pool[poolIndex].item = abilities[index];
    all = all..addWhiteSpace(pool[poolIndex].name).."\t>>>\t"..abilities[index].name.."\n";
    table.insert(currentMoves,abilities[index].name);
    generate(pool[poolIndex].sphere + 1);
    return 1;

end

function getHighestSphere()
	local biggest = -1;
    local i;
    local v;
    for i,v in ipairs(pool) do
            if v.sphere > biggest then
                biggest = v.sphere;
        end
    end	
    return biggest;
end

function getChecksFromSphere(s)
	local checks = {}
    local i;
    local v;
    for i,v in ipairs(pool) do
        if v.sphere == s then
            table.insert(checks,v);
        end
    end	
    return checks;
end

--todo
function generate(current)
    --print("generating");
    local i =0;
    local v = 0;
    for i,v in ipairs(jiggies)  do
        
        for j,b in ipairs(v.require) do
            requires = table.getn(b);
            rCount = 0;
            for k,n in ipairs(currentMoves)  do
                if has_value (b, n) then
                    rCount = rCount + 1;
                end
            end
            if rCount == requires then
                --check if allready in pool
                if v.sphere == -1  then
                    v.sphere = current;
                    v.using = b;
                    table.insert(pool,v);
                end
            end
        end
            
        
        
    end
    
end

spheres = {};
movesNeeded={"Claw Clamber Boots","Springy Step Shoes","Breegull Blaster"};

function findMove()

    for i = 0,25,1  do
        spheres[i] = {};
    end

    --add bosses to the POOL
    for x,b in ipairs(bosses)  do
        if has_Jiggy (pool, b) then
            for i,v in ipairs(jiggies)  do
                if v.name == b then
                    v.sphere = findHighestSphere(v.using)+1;
                    table.insert(pool,v);
                end
            end
        end
    end

    
    for x,b in ipairs(bosses)  do

        for i,v in ipairs(pool)  do
            if v.name == b then
                              
                for j,n in ipairs(v.using)  do
                    if has_value(movesNeeded,n) == false then
                        table.insert(movesNeeded,n);
                    end
                end
                
            end
        end
    end

        --change bosses location now that moves are pooled 
    --add bosses to the POOL
    for x,b in ipairs(bosses)  do
        for i,v in ipairs(jiggies)  do
            if v.name == b then
                v.sphere = findHighestSphere(v.using)+1;
                table.insert(spheres[v.sphere],  ""..addWhiteSpace(v.name).."\t>\t(BOSS PROGRESS)");
            end
        end
    end

    for x,b in ipairs(movesNeeded)  do
        for i,v in ipairs(pool)  do
            if v.item.name == b then
                if v.type=="CheatoR" then
                    addRewardRequirementsToSpheres(cheatos,v.amt)   
                    table.insert(spheres[v.sphere],  ""..addWhiteSpace(v.name).."\t>\t"..b);           
                elseif v.type=="Reward" then
                    addRewardRequirementsToSpheres(honeycombs,v.amt)   
                    table.insert(spheres[v.sphere],  ""..addWhiteSpace(v.name).."\t>\t"..b);           
                elseif v.type=="Family" then
                    addJinjosToSpheres(v.col);
                    table.insert(spheres[v.sphere],  ""..addWhiteSpace(v.name).."\t>\t"..b);
                    for j,n in ipairs(v.using)  do
                        if has_value(movesNeeded,n) == false then
                            table.insert(movesNeeded,n);
                        end
                    end
                else
                    table.insert(spheres[v.sphere],  ""..addWhiteSpace(v.name).."\t>\t"..b);
                    for j,n in ipairs(v.using)  do
                        if has_value(movesNeeded,n) == false then
                            table.insert(movesNeeded,n);
                        end
                    end
                    
                end               
            end
        end
    end

    for i,v in ipairs(spheres)  do
        if table.getn(v) ==0 then
            if clocksinLogic == false then
                spheres[i] = {addWhiteSpace(forms.gettext(bossSelected)) .."\t>\tClockwork Kazooie Eggs"};
            end
            spheres[i] = {addWhiteSpace(forms.gettext(bossSelected)) .."\t>\tHag 1 Entry"};
            break;
        end
    end
    
    --print(currentMoves);



end

function addWhiteSpace(str)
 
    while(string.len(str) < 40) do
        str = str.." ";
    end
    return str;
end


function findHighestSphere(table1)
	--check to see if all moves are in current list
    local i = 0;
    local v =0;
    local j = 0;
    local b =0;
    local count = 0;
	for i,v in ipairs(table1) do
		for j,b in ipairs(currentMoves) do
			if b == v then
				count = count + 1;
            end
		end
	end
   
    --print(count.." "..table.getn(table1) + math.min(1,math.min(1,table.getn(table2))));
	if count < table.getn(table1) then
		return -1;
    end

    if table.getn(table1) == 0 then      
        return 0;
    end

	--search for highest required
    biggest = -1;
    for i,v in ipairs(table1) do		
            for j,b in ipairs(pool) do
                if v == b.item.name then
                    if b.sphere > biggest then
                        biggest = b.sphere;
                    end
                end
            end
        end

	
    return biggest;
end

function addReward(table1,amt)
	local count = 0;
    for i,v in ipairs(table1) do
        local high = 100;
        local pick = {};
        for q,w in ipairs(v.require) do
		    local h = findHighestSphere(w);
            if h < high then
                high = h;
                pick = w;
            end
        end
        v.sphere = high;
		if v.sphere >0 then
			count = count +1;
		end
	end
    --print(count.." "..amt);
	--are there enough for that reward?
	if count >= amt then
		--find highest added
		biggest = -1;
		for i,v in ipairs(table1) do
			if v.sphere> biggest then
				biggest = v.sphere;
            end
		end
        return biggest+1;
    end
	return -1;
end

--called in pickMove when above index 5, a math.floor(1/(90-i)*100)% chance for a reward goal
function attemptRewardAdding(move)
    
	if table.getn(rewards) == 0 then
		return false;
    end
	local index = math.floor(math.random()*table.getn(rewards))+1;
	reward = rewards[index];
	local sphere = -1;
	if reward.type == "Cheato" then       
        sphere = addReward(cheatos,reward.amt);
        
    else
        sphere = addReward(honeycombs,reward.amt);
    end
    if sphere == -1 then
		return false;
    end

    reward.sphere = sphere;
    reward.item = abilities[move];
	table.remove(rewards,index);

	table.insert(pool,reward);
    --all abilities, current moves, generate lines
    all = all..addWhiteSpace(reward.name).."\t>>>\t"..abilities[move].name.."\n";
    table.insert(currentMoves,abilities[move].name);
    generate(sphere + 1);
    return true;
		
end

	


--called in findMove when adding a check to the sphere list
function addRewardRequirementsToSpheres(table1,amt)
	

	--mark all with highest sphere possible of the lowest requirement
    
    for i,v in ipairs(table1) do
        local high = 100;
        local pick = {};
        for q,w in ipairs(v.require) do
		    local h = findHighestSphere(w);
            if h < high then
                high = h;
                pick = w;
            end
        end
        v.sphere = high;
        v.using = pick;
        if high == 100 then
            v.sphere = 0;
        end
    end	


    --at this point only the rewards that are gettable before the last required reward are marked with a sphere.
    --sort table. Find first non -1 index
    table.sort(table1, function (k1, k2) return k1.sphere < k2.sphere end );
    index = 1;
    while table1[index].sphere == -1 do
        index = index +1;
    end
    for i = index, index+amt-1, 1 do
        --chek for dups
        if has_value(spheres[table1[i].sphere+1],table1[i].name) == false then
            table.insert(spheres[table1[i].sphere+1], ""..table1[i].name);
            for j,n in ipairs(table1[i].using)  do
                if has_value(movesNeeded,n) == false then
                    table.insert(movesNeeded,n);
                end
            end
        end
    end
end

colorMap = {"White","Orange","Yellow","Brown","Green","Red","Blue","Purple","Black"};

function addJinjosToSpheres(pat)
    	--mark all with highest sphere possible of the lowest requirement
    
        for i,v in ipairs(jinjos) do
            local high = 100;
            local pick = {};
            for q,w in ipairs(v.require) do
                local h = findHighestSphere(w);
                if h < high then
                    high = h;
                    pick = w;
                end
            end
            v.sphere = high;
            v.using = pick;
            if high == 100 then
                v.sphere = 0;
            end
        end

        for i,v in ipairs(jinjos) do
            if v.color == pat then
                table.insert(spheres[v.sphere+1], colorMap[pat+1].." Jinjo: "..v.name);
            end
        end
end



flag_block_cache = {};
local flag_block_size = 0xB0;
flag_block_pointer = 0x12C770;
--12C7B6

--D012C7C9 0004
--8012C78B 0007


function setFlag(byte, _bit)
		local flags = dereferencePointer(flag_block_pointer);
		if isRDRAM(flags) then
			local currentValue = mainmemory.readbyte(flags + byte);
			mainmemory.writebyte(flags + byte, bit.set(currentValue, _bit));
		end
end
function clearFlag(byte, _bit)
		local flags = dereferencePointer(flag_block_pointer);
		if isRDRAM(flags) then
			local currentValue = mainmemory.readbyte(flags + byte);
			mainmemory.writebyte(flags + byte, bit.clear(currentValue, _bit));
		end
end

function checkFlag(byte, _bit)
    local flags = dereferencePointer(flag_block_pointer);
    if isRDRAM(flags) then
        local currentValue = mainmemory.readbyte(flags + byte);
        return bit.check(currentValue, _bit);
    end
    return false;
end

function setRNGOutcome(event, outcome_value)
	local data = getEventData(event);
	if data.name ~= nil then
		local rng_outcome_value = outcome_value;
		for i = #data.flags, 1, -1 do
			local next_flag_state = rng_outcome_value % 2;
			if next_flag_state == 1 then
				setFlag(data.flags[i].byte,data.flags[i].bit);
			else
				clearFlag(data.flags[i].byte,data.flags[i].bit);
			end
			rng_outcome_value = rng_outcome_value - next_flag_state;
			rng_outcome_value = rng_outcome_value / 2;
		end
	end
	return "Invalid RNG Event"
end

function checkSet()
    local flags = dereferencePointer(flag_block_pointer);
	if isRDRAM(flags) then
		local flagBlock = mainmemory.readbyterange(flags, flag_block_size);

        for i,v in ipairs(pool)  do
            currentValue = flagBlock[v.byte];
            previousValue = flag_block_cache[v.byte];
            currentBit = v.bit;
            if currentValue ~= previousValue   then
                if v.type == "Reward" then
                    local val = 0;
                    if bit.check(currentValue, 2) then
                        val = val + 1;
                    end
                    if bit.check(currentValue, 3) then
                        val = val + 2;
                    end
                    if bit.check(currentValue, 4) then
                        val = val + 4;
                    end
                    for j,b in ipairs(pool) do
                        if b.type == "Reward" and val >= b.bit and b.gave ==0 then
                            b.gave = 1;
                            if b.item.name ~= "nothing" then
                                setFlag(b.item.byte, b.item.bit);
                                print("You obtained "..b.item.name);
                                queueMessage("You obtained "..b.item.name,300,60,175);
                                queueTEXT("You obtained "..b.item.name)
                            end   

                        end
                    end
                    flag_block_cache = flagBlock;
                else
                    isSet = bit.check(currentValue, currentBit);
                    wasSet = bit.check(previousValue, currentBit);
                    if isSet and not wasSet then
                        --set corasoding move.
                        --clearFlag(currentValue, _bit)
                        
                        --print(mainmemory.read_u32_be(flags + 0x18).." "..mainmemory.read_u32_be(flags + 0x1C));
                        
                            if v.item.name ~= "nothing" then
                                setFlag(v.item.byte, v.item.bit);
                                print("You obtained "..v.item.name);
                                queueMessage("You obtained "..v.item.name,300,60,175);
                                queueTEXT("You obtained "..v.item.name)
                            end
                        flag_block_cache = flagBlock;
                    end
                end
            end
        end
    end
    if clocksinLogic == false then
        giveClockworks();
    end
end

function RESETSet()
    local flags = dereferencePointer(flag_block_pointer);
    
	if isRDRAM(flags) then
		local flagBlock = mainmemory.readbyterange(flags, flag_block_size);

        for i,v in ipairs(pool)  do
            currentValue = flagBlock[v.byte];
            currentBit = v.bit;
            isSet = bit.check(currentValue, currentBit);
            if v.type == "Reward" then
                local val = 0;
                if bit.check(currentValue, 2) then
                    val = val + 1;
                end
                if bit.check(currentValue, 3) then
                    val = val + 2;
                end
                if bit.check(currentValue, 4) then
                    val = val + 4;
                end
                --print(v.name.." "..val)
                if val >= currentBit then
                    if v.item.name ~= "nothing" then
                        setFlag(v.item.byte, v.item.bit);
                        print("You obtained "..v.item.name);
                        queueMessage("You obtained "..v.item.name,60,60,175);
                    end                       
                end

            else
                if isSet then
                    if v.item.name ~= "nothing" then
                        setFlag(v.item.byte, v.item.bit);
                        print("You obtained "..v.item.name);
                        queueMessage("You obtained "..v.item.name,60,60,175);
                    end
                    
                else
                    if v.item.name ~= "nothing" then
                        clearFlag(v.item.byte, v.item.bit);
                    end
                end
            end
        end
        flag_block_cache = flagBlock;     
    end
    
    
    if clocksinLogic == false then
        clearFlag(0x1E, 3);
        giveClockworks();
    end
end

flag_block_pointer = 0x12C770;

-- 8112C770 8029
-- D0290059 0004
-- 8029001B 00FF


rng_elements = {
	{
		name = "Jinjo Colours",
		flags = {
			{byte=0x6A, bit=1},
			{byte=0x6A, bit=2},
			{byte=0x6A, bit=3},
			{byte=0x6A, bit=4},
			{byte=0x6A, bit=5},
			{byte=0x6A, bit=6},
		},
		value_type = "value_to_outcome",
		
	}
};

patterns = {
    -- [32] = {7,5,5,8,5,3,8,6,8,7,8,5,2,1,4,4,3,5,5,0,6,3,8,4,3,8,4,8,7,8,4,1,2,2,6,7,6,7,8,7,6,7,7,6,6},
    -- [33] = {0,1,8,7,1,6,6,4,2,2,2,3,4,3,6,3,4,5,4,4,3,5,6,8,5,5,5,6,7,8,6,8,8,7,7,6,7,8,5,7,7,8,8,8,7},
    -- [34] = {2,4,6,7,0,3,7,8,6,4,7,5,7,2,7,1,1,3,3,6,2,8,5,8,4,3,8,8,6,7,5,4,8,6,6,6,5,8,4,7,7,8,8,5,5},
    -- [35] = {4,8,2,7,3,7,0,8,3,1,7,4,6,1,4,5,8,2,2,7,3,6,6,4,6,8,5,5,4,3,7,7,7,6,7,8,5,5,6,8,8,8,8,6,5}, 
    -- [36] = {5,3,7,6,5,6,6,8,7,4,1,1,8,4,0,6,5,3,7,6,3,5,5,6,7,2,8,3,6,2,4,5,7,4,8,7,2,4,7,7,8,8,8,8,8},
    -- [37] = {7,7,4,6,7,4,3,0,2,8,4,6,7,8,6,3,4,8,2,8,1,6,1,8,8,7,6,8,4,8,2,6,3,8,5,3,6,5,5,7,7,5,5,7,5},
    -- [38] = {0,2,5,2,1,1,6,3,6,3,7,3,7,2,7,6,3,8,7,6,8,7,7,7,7,4,5,5,4,6,5,8,6,4,5,8,8,6,5,8,4,4,8,8,8},
    -- [39] = {2,6,5,5,2,1,7,1,6,0,3,4,7,2,6,5,4,5,3,5,5,4,7,3,6,3,8,8,4,7,7,7,6,8,8,6,4,8,7,6,8,7,8,8,8},
    -- [40] = {4,1,1,5,4,8,4,2,6,3,5,4,7,6,6,6,7,5,2,3,6,2,5,3,3,8,4,6,5,6,5,0,8,7,7,8,7,7,7,7,8,8,8,8,8},
    -- [41] = {5,5,6,4,6,7,1,2,1,5,6,2,5,5,2,0,5,4,3,7,3,8,6,7,8,3,7,3,6,6,6,4,7,7,7,7,4,8,4,8,8,8,8,8,8},
    -- [42] = {7,0,2,4,8,5,8,3,5,8,7,7,4,4,8,4,3,3,3,4,6,8,1,8,1,5,6,5,6,7,6,5,8,2,2,5,8,6,8,6,7,6,7,7,7},
    -- [43] = {0,4,7,3,1,4,5,4,3,2,4,8,7,3,5,8,1,2,3,8,6,4,8,5,8,2,6,6,5,7,8,5,5,7,8,6,7,7,6,8,8,7,7,6,6},
    -- [44] = {2,8,4,3,3,2,2,4,4,7,5,1,1,3,8,4,6,3,7,5,7,6,8,4,5,8,7,5,0,7,5,8,5,6,7,6,6,7,8,6,7,8,8,8,6},
    -- [45] = {4,3,0,2,5,1,8,5,8,2,8,6,2,4,1,7,6,6,8,4,5,4,7,6,5,6,3,6,7,6,3,8,4,3,7,7,5,8,8,5,7,8,8,7,7},
    -- [46] = {5,7,5,2,7,8,5,6,4,6,2,3,3,7,0,4,1,4,7,4,3,6,1,5,7,7,5,7,2,5,8,7,3,4,8,6,6,6,6,8,8,8,8,8,8},
    -- [47] = {7,2,1,2,0,7,3,6,8,4,8,5,1,5,2,6,4,7,3,8,3,5,5,3,4,6,7,5,4,8,5,4,7,8,7,7,6,7,6,6,8,6,8,8,8},
    -- [48] = {0,6,6,1,3,5,7,3,4,7,5,6,4,8,7,8,5,5,4,8,1,2,3,2,3,2,4,7,4,8,8,8,7,7,6,7,5,8,5,7,6,8,8,6,6},
    -- [49] = {2,1,2,1,5,3,6,8,7,8,2,7,7,7,4,3,7,4,5,8,5,6,3,0,8,4,4,4,8,6,6,8,6,3,6,8,5,5,6,5,7,7,7,8,8},
    -- [50] = {3,4,7,0,7,2,3,8,2,2,4,7,1,6,7,5,3,5,7,3,7,5,8,7,5,4,8,6,4,6,1,7,4,8,8,8,8,8,6,8,5,6,5,6,6},
    -- [51] = {5,8,3,0,1,6,6,6,4,1,4,5,6,2,4,2,6,5,4,8,3,7,7,5,2,5,7,3,8,8,5,7,6,4,8,7,6,8,7,3,7,8,7,8,8},
    -- [52] = {7,3,0,8,2,8,7,2,1,3,7,4,3,5,2,1,6,4,6,7,4,6,7,6,6,7,3,5,4,5,4,8,8,8,6,7,8,5,8,7,6,5,8,5,8},
    -- [53] = {0,7,5,8,4,6,4,1,6,5,3,6,4,1,3,8,6,2,7,2,5,5,2,4,4,6,5,3,7,8,3,5,8,7,8,6,7,7,8,8,6,7,8,8,7},
    -- [54] = {2,2,1,8,6,5,1,2,8,6,3,5,4,5,4,7,7,6,0,4,6,4,3,7,7,3,5,5,3,4,8,5,8,7,7,7,6,8,7,6,8,6,8,8,8},
    -- [55] = {3,6,6,7,8,3,7,2,5,3,8,8,7,7,2,2,8,5,6,7,8,5,0,7,6,4,7,7,8,4,1,1,5,8,4,6,6,5,8,4,3,8,4,5,6},
    -- [56] = {5,1,2,7,1,2,5,3,0,7,2,5,8,8,3,5,7,7,3,7,6,8,7,4,8,4,3,8,6,8,5,4,6,8,7,8,6,8,5,7,4,6,4,6,6},
    -- [57] = {7,5,7,6,3,0,2,4,4,1,5,2,4,5,6,1,4,7,5,5,8,3,8,8,8,8,2,6,7,3,7,5,3,8,4,6,7,6,8,8,8,6,7,6,7},
    -- [58] = {0,3,6,5,8,8,4,8,5,8,7,2,6,8,1,1,8,3,8,4,6,2,7,6,6,7,2,4,3,7,7,6,5,3,6,5,4,8,7,8,5,5,7,7,4},
    -- [59] = {2,4,0,5,7,6,5,5,4,2,4,3,7,7,5,6,2,8,8,7,4,6,4,3,1,6,6,6,6,7,3,5,1,3,8,5,7,7,7,8,8,8,8,8,8},
    -- [60] = {3,8,5,5,0,4,3,6,8,4,4,5,3,6,4,8,4,1,8,1,3,5,6,2,8,2,6,8,6,5,8,6,7,2,8,5,8,6,7,7,7,7,7,7,7},
    -- [61] = {5,3,1,5,3,3,0,6,3,7,7,6,6,6,5,1,2,8,8,8,2,5,2,4,8,8,6,5,5,6,4,6,4,8,4,8,4,8,7,7,8,7,7,7,7}, 
    -- [62] = {7,7,6,4,5,1,6,7,7,2,1,3,7,0,4,6,7,7,7,3,6,5,2,6,2,3,5,6,4,3,4,4,8,8,8,6,5,8,8,5,8,8,8,5,8},
    -- [63] = {0,2,2,4,7,3,7,2,6,4,8,3,4,3,7,6,5,5,8,6,6,4,8,3,1,5,5,5,5,1,6,7,4,6,6,7,7,7,8,7,8,8,8,8,8},
    [32] = {7,5,5,8,5,3,8,6,8,7,8,5,2,1,4,4,3,5,5,0,6,3,8,4,3,8,4,8,7,8,4,1,2,2,6,7,6,7,8,7,6,7,7,6,6},
    [33] = {0,6,6,1,3,5,7,3,4,7,5,6,4,8,7,8,5,5,4,8,1,2,3,2,3,2,4,7,4,8,8,8,7,7,6,7,5,8,5,7,6,8,8,6,6},
    [34] = {4,1,1,5,4,8,4,2,6,3,5,4,7,6,6,6,7,5,2,3,6,2,5,3,3,8,4,6,5,6,5,0,8,7,7,8,7,7,7,7,8,8,8,8,8},
    [35] = {5,1,2,7,1,2,5,3,0,7,2,5,8,8,3,5,7,7,3,7,6,8,7,4,8,4,3,8,6,8,5,4,6,8,7,8,6,8,5,7,4,6,4,6,6},
    [36] = {5,3,7,6,5,6,6,8,7,4,1,1,8,4,0,6,5,3,7,6,3,5,5,6,7,2,8,3,6,2,4,5,7,4,8,7,2,4,7,7,8,8,8,8,8},
    [37] = {7,3,0,8,2,8,7,2,1,3,7,4,3,5,2,1,6,4,6,7,4,6,7,6,6,7,3,5,4,5,4,8,8,8,6,7,8,5,8,7,6,5,8,5,8},
    [38] = {2,8,4,3,3,2,2,4,4,7,5,1,1,3,8,4,6,3,7,5,7,6,8,4,5,8,7,5,0,7,5,8,5,6,7,6,6,7,8,6,7,8,8,8,6},
    [39] = {3,8,5,5,0,4,3,6,8,4,4,5,3,6,4,8,4,1,8,1,3,5,6,2,8,2,6,8,6,5,8,6,7,2,8,5,8,6,7,7,7,7,7,7,7},
    [40] = {2,4,6,7,0,3,7,8,6,4,7,5,7,2,7,1,1,3,3,6,2,8,5,8,4,3,8,8,6,7,5,4,8,6,6,6,5,8,4,7,7,8,8,5,5},
    [41] = {3,4,7,0,7,2,3,8,2,2,4,7,1,6,7,5,3,5,7,3,7,5,8,7,5,4,8,6,4,6,1,7,4,8,8,8,8,8,6,8,5,6,5,6,6},
    [42] = {7,0,2,4,8,5,8,3,5,8,7,7,4,4,8,4,3,3,3,4,6,8,1,8,1,5,6,5,6,7,6,5,8,2,2,5,8,6,8,6,7,6,7,7,7},
    [43] = {0,3,6,5,8,8,4,8,5,8,7,2,6,8,1,1,8,3,8,4,6,2,7,6,6,7,2,4,3,7,7,6,5,3,6,5,4,8,7,8,5,5,7,7,4},
    [44] = {0,2,5,2,1,1,6,3,6,3,7,3,7,2,7,6,3,8,7,6,8,7,7,7,7,4,5,5,4,6,5,8,6,4,5,8,8,6,5,8,4,4,8,8,8},
    [45] = {2,2,1,8,6,5,1,2,8,6,3,5,4,5,4,7,7,6,0,4,6,4,3,7,7,3,5,5,3,4,8,5,8,7,7,7,6,8,7,6,8,6,8,8,8},
    [46] = {5,7,5,2,7,8,5,6,4,6,2,3,3,7,0,4,1,4,7,4,3,6,1,5,7,7,5,7,2,5,8,7,3,4,8,6,6,6,6,8,8,8,8,8,8},
    [47] = {7,7,6,4,5,1,6,7,7,2,1,3,7,0,4,6,7,7,7,3,6,5,2,6,2,3,5,6,4,3,4,4,8,8,8,6,5,8,8,5,8,8,8,5,8},
    [48] = {0,1,8,7,1,6,6,4,2,2,2,3,4,3,6,3,4,5,4,4,3,5,6,8,5,5,5,6,7,8,6,8,8,7,7,6,7,8,5,7,7,8,8,8,7},
    [49] = {2,1,2,1,5,3,6,8,7,8,2,7,7,7,4,3,7,4,5,8,5,6,3,0,8,4,4,4,8,6,6,8,6,3,6,8,5,5,6,5,7,7,7,8,8},
    [50] = {5,5,6,4,6,7,1,2,1,5,6,2,5,5,2,0,5,4,3,7,3,8,6,7,8,3,7,3,6,6,6,4,7,7,7,7,4,8,4,8,8,8,8,8,8},
    [51] = {7,5,7,6,3,0,2,4,4,1,5,2,4,5,6,1,4,7,5,5,8,3,8,8,8,8,2,6,7,3,7,5,3,8,4,6,7,6,8,8,8,6,7,6,7},
    [52] = {7,7,4,6,7,4,3,0,2,8,4,6,7,8,6,3,4,8,2,8,1,6,1,8,8,7,6,8,4,8,2,6,3,8,5,3,6,5,5,7,7,5,5,7,5},
    [53] = {0,7,5,8,4,6,4,1,6,5,3,6,4,1,3,8,6,2,7,2,5,5,2,4,4,6,5,3,7,8,3,5,8,7,8,6,7,7,8,8,6,7,8,8,7},
    [54] = {4,3,0,2,5,1,8,5,8,2,8,6,2,4,1,7,6,6,8,4,5,4,7,6,5,6,3,6,7,6,3,8,4,3,7,7,5,8,8,5,7,8,8,7,7},
    [55] = {5,3,1,5,3,3,0,6,3,7,7,6,6,6,5,1,2,8,8,8,2,5,2,4,8,8,6,5,5,6,4,6,4,8,4,8,4,8,7,7,8,7,7,7,7},
    [56] = {4,8,2,7,3,7,0,8,3,1,7,4,6,1,4,5,8,2,2,7,3,6,6,4,6,8,5,5,4,3,7,7,7,6,7,8,5,5,6,8,8,8,8,6,5},
    [57] = {5,8,3,0,1,6,6,6,4,1,4,5,6,2,4,2,6,5,4,8,3,7,7,5,2,5,7,3,8,8,5,7,6,4,8,7,6,8,7,3,7,8,7,8,8},
    [58] = {0,4,7,3,1,4,5,4,3,2,4,8,7,3,5,8,1,2,3,8,6,4,8,5,8,2,6,6,5,7,8,5,5,7,8,6,7,7,6,8,8,7,7,6,6},
    [59] = {2,4,0,5,7,6,5,5,4,2,4,3,7,7,5,6,2,8,8,7,4,6,4,3,1,6,6,6,6,7,3,5,1,3,8,5,7,7,7,8,8,8,8,8,8},
    [60] = {2,6,5,5,2,1,7,1,6,0,3,4,7,2,6,5,4,5,3,5,5,4,7,3,6,3,8,8,4,7,7,7,6,8,8,6,4,8,7,6,8,7,8,8,8},
    [61] = {3,6,6,7,8,3,7,2,5,3,8,8,7,7,2,2,8,5,6,7,8,5,0,7,6,4,7,7,8,4,1,1,5,8,4,6,6,5,8,4,3,8,4,5,6},
    [62] = {7,2,1,2,0,7,3,6,8,4,8,5,1,5,2,6,4,7,3,8,3,5,5,3,4,6,7,5,4,8,5,4,7,8,7,7,6,7,6,6,8,6,8,8,8},
    [63] = {0,2,2,4,7,3,7,2,6,4,8,3,4,3,7,6,5,5,8,6,6,4,8,3,1,5,5,5,5,1,6,7,4,6,6,7,7,7,8,7,8,8,8,8,8},
};

models = {
    [0x0] = "Trigger";
    [0x766] = "Glowbo",
    [0x610] = "Jiggy", 
    [0x612] = "Empty Honeycomb",    
    [0x7D7] = "Silo", -- Jamjars
    [0xFFFF] = "Player Model",
    [0x7F3] = "Cheato Page",
    [0x7A2] = "Signpost",
    [0x618] = "Red Feather",
    [0x6EF] = "Nest (Feathers)",
    [0x6EA] = "Nest (Eggs)",
    [0x6EC] = "Nest (Note)",
    [0x6ED] = "Nest (Treble Clef)"

}

function firstTimeTexts()
    setFlag(0x61,4);-- name="FT Silo Text", type="FTT"},
    setFlag(0x62,7);-- name="Roysten Help Me Text", type="FTT"},
    setFlag(0x63,6);-- name="Humba Wumba: Big T. Rex FTT", type="FTT"},
    setFlag(0x63,7);-- name="Humba Wumba: Stony FTT", type="FTT"},
    setFlag(0x64,0);-- name="Humba Wumba: Detonator FTT", type="FTT"},
    setFlag(0x64,1);-- name="Humba Wumba: Van FTT", type="FTT"},
    setFlag(0x64,2);-- name="Humba Wumba: Submarine FTT", type="FTT"},
    setFlag(0x64,3);-- name="Humba Wumba: Baby T. Rex FTT", type="FTT"},
    setFlag(0x64,4);-- name="Humba Wumba: Washing Machine FTT", type="FTT"},
    setFlag(0x64,5);-- name="Humba Wumba: Snowball FTT", type="FTT"},
    setFlag(0x64,6);-- name="Humba Wumba: Bee FTT", type="FTT"},
    setFlag(0x64,7);-- name="Humba Wumba: Dragon Kazooie FTT", type="FTT"},
    setFlag(0x67,7);-- name="Jiggywiggy Temple Is Over There CS Seen", type="FTT"},
    setFlag(0x78,6);-- name="First Warp Available", type="FTT"},
    setFlag(0x99,4);-- name="First Time Split Up Pad Text", nomap=true, type="FTT"},
    setFlag(0x99,5);-- name="First Time Split Up Text", nomap=true, type="FTT"},
    setFlag(0x00,1);-- name="First Time Note Collection", nomap=true, type="FTT"},
    setFlag(0x00,2);-- name="First Time Glowbo Collection", nomap=true, type="FTT"},
    setFlag(0x00,3);-- name="First Time Egg Collection", nomap=true, type="FTT"},
    setFlag(0x00,4);-- name="First Time Red Feather Collection", nomap=true, type="FTT"},
    setFlag(0x00,5);-- name="First Time Gold Feather Collection", nomap=true, type="FTT"},
    setFlag(0x00,6);-- name="First Time Treble Clef Collection", nomap=true, type="FTT"},
    setFlag(0x00,7);-- name="First Time Health Collection", nomap=true, type="FTT"},
    setFlag(0x01,5);-- name="First Time Jinjo Collection", nomap=true, type="FTT"},
    setFlag(0x02,2);-- name="Signpost FTT", nomap=true, type="FTT"},
    setFlag(0x07,7);-- name="First Time Cheato Page", type="FTT"},
    setFlag(0x0C,7);--name="Humba Wumba FTT", type="FTT"},
    

end

function setGlobalFlag(byte, globalBit)
	if type(byte) == "number" and type(globalBit) == "number" and globalBit >= 0 and globalBit < 8 then
		local flags = 0x12C780;
		if isRDRAM(flags) then
			local currentValue = mainmemory.readbyte(flags + byte);
			mainmemory.writebyte(flags + byte, bit.set(currentValue, globalBit));
		end
	end
end

function clearGlobalFlag(byte, globalBit)
	if type(byte) == "number" and type(globalBit) == "number" and globalBit >= 0 and globalBit < 8 then
		local flags = 0x12C780;
		if isRDRAM(flags) then
			local currentValue = mainmemory.readbyte(flags + byte);
			mainmemory.writebyte(flags + byte, bit.clear(currentValue, globalBit));
		end
	end
end

function getNumSlots()
	local objectArray = dereferencePointer(object_array_pointer);
	if isRDRAM(objectArray) then
		local firstObject = dereferencePointer(objectArray + 0x04);
		local lastObject = dereferencePointer(objectArray + 0x08);
		if isRDRAM(firstObject) and isRDRAM(lastObject) then
			return math.floor((lastObject - firstObject) / slot_size) + 1;
		end
	end
	return 0;
end

function getSlotBase(index)
	--if index < 0 or index > getNumSlots() then
	--	print("Warning: OOB call to getSlotBase() with index"..index);
	--end
	return slot_base + index * slot_size;
end

function getObjectModel1Pointers()
	local pointers = {};
	local objectArray = dereferencePointer(object_array_pointer);
	if isRDRAM(objectArray) then
		local num_slots = getNumSlots();
		for i = 0, num_slots - 1 do
			table.insert(pointers, objectArray + getSlotBase(i)); 
		end
	end
	return pointers;
end

function getAnimationType(model1Base)
	local objectIDPointer = dereferencePointer(model1Base + 0x00);
	if isRDRAM(objectIDPointer) then
		local modelIndex = mainmemory.read_u16_be(objectIDPointer + 0x14);
		return models[modelIndex] or modelIndex;
	end
	return "Unknown";
end

function getPlayerObject()
	local playerPointerIndex = mainmemory.readbyte(player_pointer_index);
	return dereferencePointer(player_pointer + 4 * playerPointerIndex);
end

function getPlayerSubObject(index)
	local player = getPlayerObject();
	if isRDRAM(player) then
		return dereferencePointer(player + index);
	end
end

function getXPosition()
	local positionObject = getPlayerSubObject(position_pointer_index);
	if isRDRAM(positionObject) then
		return mainmemory.readfloat(positionObject + x_pos, true);
	end
	return 0;
end

function getYPosition()
	local positionObject = getPlayerSubObject(position_pointer_index);
	if isRDRAM(positionObject) then
		return mainmemory.readfloat(positionObject + y_pos, true);
	end
	return 0;
end



function getZPosition()
	local positionObject = getPlayerSubObject(position_pointer_index);
	if isRDRAM(positionObject) then
		return mainmemory.readfloat(positionObject + z_pos, true);
	end
	return 0;
end

function getAnimationValue()
	local animationPointer = getPlayerSubObject(0x1A0);
	if isRDRAM(animationPointer) then
		return mainmemory.read_u16_be(animationPointer + 0x34);
	end
	return 0;
end

function isPhysicsFrame()
	local frameTimerValue = mainmemory.read_s32_be(0x079138);
	return frameTimerValue <= 0 and not emu.islagged();
end


-- {{x,y,hint}, ..}
signPositions = {};

siloPositions = {};
destroyFrames =0;

function setObjectAnimationValue(model1Base,model)
    local objectIDPointer = dereferencePointer(model1Base + 0x00);
	if isRDRAM(objectIDPointer) then
		local modelIndex = mainmemory.write_u16_be(objectIDPointer + 0x14,model);
	end
end


jiggyFlags = {};
spawnTrigger = {stored=false,x=0,y=0,z=0};
function searchAndDestroy()
    if isPhysicsFrame() and destroyFrames >= 50 then
        objectArray = dereferencePointer(object_array_pointer);
        numSlots = getNumSlots();
        
        list = getObjectModel1Pointers();
        for i = 1, numSlots , 1 do 	
            
            currentSlotBase = objectArray + getSlotBase(i - 1);
            name = getAnimationType(currentSlotBase);
            v = currentSlotBase;

            if "Glowbo" == name then
                mainmemory.writefloat(v + 0x04, -9999.0, true); --x
                mainmemory.writefloat(v + 0x0C, -9999.0, true); --z
                mainmemory.writefloat(v + 0x08, -9999.0, true); --y
            end
            if "Silo" == name then
                if has_value(siloPositions, mainmemory.readfloat(v + 0x04,  true)) == false then
                    table.insert(siloPositions,mainmemory.readfloat(v + 0x04,  true));
                end
                mainmemory.writefloat(v + 0x04, -9999.0, true); --x
                mainmemory.writefloat(v + 0x0C, -9999.0, true); --z
                mainmemory.writefloat(v + 0x08, -9999.0, true); --y
                
            end

            if "Trigger" == name and has_value(siloPositions, mainmemory.readfloat(v + 0x04,  true)) then
                mainmemory.writefloat(v + 0x08, -9999.0, true); --y
                
            end

            if "Signpost" == name then
                
                local xpos = mainmemory.readfloat(v + 0x04,  true);
                local zpos = mainmemory.readfloat(v + 0x0C,  true);
                local found = false;
                for i,v in ipairs(signPositions)  do
                    if v[1] == xpos and v[2] ==zpos then
                        found = true;
                    end
                end
                if found == false then
                    -- hash coords
                    local hint = mainmemory.read_u16_be(v+0x2A);--hints[((math.floor((math.min(math.abs(xpos),math.abs(zpos))/math.max(math.abs(xpos),math.abs(zpos)))* table.getn(hints))+1)*31)%table.getn(hints) + 1];
                    --print("added "..hint)
                    table.insert(signPositions,{xpos,zpos,hint})
                end
                --setObjectAnimationValue(v,0x61F);
                --mainmemory.write_u16_be(v+0x8C,0x13);
                

            end

            --0x7D6 -- 0x665 --0x854?
            if "Jiggy" == name or "Empty Honeycomb" == name or "Cheato Page" == name then

                --check for flag set  --0x44 bits past 0x45 - 1  -- devide num by 8 to get byte then the remainder is the bit; 
                local add = 0;
                local bitNum = 0;
                if "Jiggy" == name then
                    add = mainmemory.readfloat(v+0x50,true) - 1;
                    bitNum = add%8;
                    add = math.floor(add/8) + 0x45;
                end
                if "Empty Honeycomb" == name then
                    add = mainmemory.readfloat(v+0x50,true) - 1 + 2;
                    bitNum = add%8;
                    add = math.floor(add/8) + 0x3F;
                end
                if "Cheato Page" == name then
                    add = mainmemory.readfloat(v+0x50,true) - 1 + 3;
                    bitNum = add%8;
                    add = math.floor(add/8) + 0x56;
                end
                --loop jiggies table
                for o,p in ipairs(jiggies)  do
                    if p.byte == add and p.bit ==  bitNum then
                        if p.item.name ~= "nothing" then
                                setObjectAnimationValue(v,p.item.model); --p.item.model
                                mainmemory.writefloat(v+0x38,0.5,true) -- scale it
                                --rotate it?
                                -- spawnTrigger.x = mainmemory.readfloat(v + 0x04,  true);
                                -- spawnTrigger.y = mainmemory.readfloat(v + 0x08,  true);
                                -- spawnTrigger.z = mainmemory.readfloat(v + 0x0c,  true);
                                -- spawnTrigger.stored =true;

                                if p.item.type == "Mumbo" then
                                    --print("rotate");
                                    mainmemory.writefloat(v+0x44,270,true);
                                end
                                
                                
                        end
                    end
                end
                --print(mainmemory.read_u32_be(dereferencePointer(v+0x10)));

               -- setObjectAnimationValue(v,0x7D6); --2148030624  --0858A0
                
                --print(dereferencePointer(mainmemory.read_u32_be(dereferencePointer(v+0x10)))); 24076 hc id
            end

            -- if "Nest (Treble Clef)" == name and  spawnTrigger.stored then
            --     --setObjectAnimationValue(v,0x0);
            --     mainmemory.write_u32_be(dereferencePointer(v+0x10),0x80086A20);
            --     mainmemory.writefloat(v+0x54,0,true);
            --     mainmemory.writefloat(v + 0x04, spawnTrigger.x, true); --x
            --     mainmemory.writefloat(v + 0x0C, spawnTrigger.z, true); --z
            --     mainmemory.writefloat(v + 0x08, spawnTrigger.y, true); --y
            --     spawnTrigger.stored =false;
            --     print("changed");
            -- end
            -- if movePrev > 100  and PrevCount then
            --     mainmemory.writefloat(getPlayerSubObject(position_pointer_index) +0x04,prevPos.x, true);
            --     mainmemory.writefloat(getPlayerSubObject(position_pointer_index) +0x08,prevPos.y, true);
            --     mainmemory.writefloat(getPlayerSubObject(position_pointer_index) +0x0C,prevPos.z, true);
            --     movePrev = 0;
            --     PrevCount = false;
            --     print("moving back");
            -- end
            -- if PrevCount then
            --     movePrev = movePrev + 1;
            -- end

            
            -- if "Nest (Feathers)" == name and moveFeathers then
            --     prevPos.x = getXPosition();
            --     prevPos.y = getYPosition();
            --     prevPos.z = getZPosition();
            --     mainmemory.writefloat(getPlayerSubObject(position_pointer_index) +0x04,mainmemory.readfloat(v + 0x04,true), true);
            --     mainmemory.writefloat(getPlayerSubObject(position_pointer_index) +0x08,mainmemory.readfloat(v + 0x08,true), true);
            --     mainmemory.writefloat(getPlayerSubObject(position_pointer_index) +0x0C,mainmemory.readfloat(v + 0x0C,true), true);
            --     print("moving to feathers "..mainmemory.readfloat(v + 0x04,true).." "..mainmemory.readfloat(v + 0x0C,true));
            --     --setObjectAnimationValue(v,0x7D6);         
            --     moveFeathers = false;
            --     PrevCount = true;
            -- end


                
                
                
                    -- for i = 0, 90 ,1 do
                    --     if (jiggyFlags[i+1]) then
                    --         setFlag(0x45 + (math.floor(i/8)) , i%8);
                    --     else
                    --         clearFlag(0x45 + (math.floor(i/8)) , i%8);
                    --     end
                    -- end


        end
        destroyFrames = 0;
    end
    destroyFrames = destroyFrames + 1;
end
prevPos = {x=0,y=0,z=0};
movePrev = 0;
PrevCount = false;
signCoolDown = 0;

function signPostTalk(bol)
    --[0x75] = "Locked", -- Signpost  thinking value 0x50 or 80
    if  bol and signCoolDown >=500 then
        signCoolDown=0;
        local xpos = getXPosition();
        local zpos = getZPosition();
    
        local distance =1000;
    
        for i,v in ipairs(signPositions)  do
            if math.sqrt( (v[1] - xpos) * (v[1] - xpos) +(v[2] - zpos) * (v[2] - zpos))< 200 then
                print(v[3]);
                queueMessage(v[3],500,50,20);
            end
        end
    end
    if signCoolDown < 500 then
        signCoolDown = signCoolDown +1;
    end
end

function signPostHints(bol)
    local text_address = dereferencePointer(0x127600);
    if text_address and bol then
        --edit the message 
        local text = "";
        local xpos = getXPosition();
        local zpos = getZPosition();
    
        local distance =1000;
        for i,v in ipairs(signPositions)  do
            if math.sqrt( (v[1] - xpos) * (v[1] - xpos) +(v[2] - zpos) * (v[2] - zpos))< 200 then
                text = string.upper(hints[v[3]%(table.getn(hints) - 1) + 1]);               
            end
        end
        
        local i = 0;
        for i = 1, #text do
            local c = text:sub(i,i)
            mainmemory.write_u8(text_address + 0x9 + i  ,string.byte(c));
        end
        mainmemory.write_u8(text_address + 0x9 + #text+1,0);
        mainmemory.write_u8(text_address + 0x9 + #text +2,0);
    end
    previousPointer = 0;
end



function MenuChange(bol)
    local text_address = dereferencePointer(0x12B8DC);
    if text_address and bol and text_address~=previousPointer then
        --edit the message 
        local text = "CUSTOM TEXT WOAH TYPE 1";
        local xpos = getXPosition();
        local zpos = getZPosition();
    
        
        local i = 0;
        for i = 1, #text do
            local c = text:sub(i,i)
            mainmemory.write_u8(text_address  +0x34+ i  ,string.byte(c));
        end
        mainmemory.write_u8(text_address  +0x34+ #text+1,0);
        mainmemory.write_u8(text_address  +0x34+ #text+2,0);
    end
    previousPointer = text_address;
end

messageQueue = {};
messageLength = 0;
currentMessage = "";
moveFeathers = false;
cx = 0;
cy = 0;
function queueMessage(mess,time,x,y)
    table.insert(messageQueue,{mess,time,x,y});
end
function queueTEXT(mess)
    --table.insert(messageQueue,mess);
end

messageActive = false;

function featherQueue()
    local text_address = dereferencePointer(0x127600);
    if text_address == nil then
        text_address = 0;
    end
    --print(table.getn(messageQueue).." "..text_address);
    if table.getn(messageQueue) > 0 and text_address == 0 then
        currentMessage = table.remove(messageQueue,1); -- poll queue
        clearFlag(0x00,4); -- clear first feathers
        moveFeathers = true;
        messageActive = false;
        --print("cleared flag");
        --teleport feaethers to banjo. wait till feathers is there to progress
    elseif  text_address > 0 and messageActive == false then
        --write message in text
        local text = currentMessage;
        text = string.upper(text);

        local i = 0;
        for i = 1, #text do
            local c = text:sub(i,i)
            mainmemory.write_u8(text_address + 0x5 + i  ,string.byte(c));
        end
        mainmemory.write_u8(text_address + 0x5 + #text+1,0);
        mainmemory.write_u8(text_address + 0x5 + #text+2,0);

        --print("writing "..text);
        messageActive = true;
    elseif  messageActive and text_address == 0 then

            messageActive = false;

    end

    
end

--queueMessage("tester",300,60,175);

function messageBox()
    if messageLength == 0 then 
        
        --if there are messages on the queue display them
        if table.getn(messageQueue) > 0 then
            currentMessage = table.remove(messageQueue,1); -- poll queue
            messageLength = currentMessage[2];
            cx = currentMessage[3];
            cy = currentMessage[4];
            currentMessage = currentMessage[1];
        end
    
    end
   
    if messageLength > 0 then 
        messageLength = messageLength -1;
        local mess = currentMessage;
        if  string.len(currentMessage) >28 then
            mess = string.sub(currentMessage,0,28).."\n"..string.sub(currentMessage,29);
        end
        
        gui.drawString(cx,cy,mess); --,nil,nil,nil,nil,nil,"center"v
    end

end

function bossesMessage()
    gui.drawString(70,60,"Bosses To Defeat");
    local offset = 15;
    for i,v in ipairs(bosses)  do
        for j,b in ipairs(jiggies)  do
            if (v == b.name) then
                local check = "";
                if checkFlag(b.byte,b.bit) then
                    check = "X";
                end
                gui.drawString(70,65+offset,v.."("..check..")");
                offset = offset+15;
            end
        end
    end

end

function moveMessage()
    gui.drawString(10,10,"Abilities",nil,nil,10);
    gui.drawString(250,10,"Mumbos",nil,nil,10);
    gui.drawString(150,10,"Transfomations",nil,nil,10);
    local offset = 15;
    local offset2 = 15;
    local offset3 = 15;
    for i,v in ipairs(abilities)  do
        if checkFlag(v.byte,v.bit) then
            if v.type == "Ability" then
                gui.drawString(10,10+offset,v.name,nil,nil,10);
                offset = offset+10;
            end
            if v.type == "Mumbo" then
                gui.drawString(250,10+offset2,v.name,nil,nil,10);
                offset2 = offset2+10;
            end
            if v.type == "Wumba" then
                gui.drawString(150,10+offset3,v.name,nil,nil,10);
                offset3 = offset3+10;
            end
        end
    end


end

function getEventData(event)
	local data = {};
	for i = 1, #rng_elements do
		if event == rng_elements[i].name then
			data = rng_elements[i];
		end
	end
	return data
end

function buildCheatos()
    all = all.."\n";
    for i,v in ipairs(cheatos)  do
        all = all..v.name.." Sphere "..v.sphere.."\n";
    end
end

function combineLists(t1,t2)
    local list = {};
    for w,q in ipairs(t1) do 
        table.insert(list,q);
    end
    for w,q in ipairs(t2) do 
        table.insert(list,q);
    end
    return list;
end

function perm(l1,l2)
    temp ={}
    for o,v in ipairs(l1) do 
        for p,b in ipairs(l2) do
            table.insert(temp,combineLists(v,b));
        end
    end
    return temp;
end

function printALL(t)
    for q,w in ipairs(t) do
        print(w);
    end
end

failedLogic = false;

local function startRando()
    SEED = tonumber(forms.gettext(box),10);
    forms.setlocation(button,500,500);
    setBosses(tonumber(string.sub(forms.gettext(bossSelected),0,1)));
    poolTablesTogether();
    print("Rando Seed: "..SEED);
    print("Generating "..tonumber(string.sub(forms.gettext(bossSelected),0,1)).." Bosses");

    all = "---------Seed Info---------\n\n";
    all = all.."Seed: "..SEED.."\n";

    --dump rewards?
    if forms.ischecked(noRewards) == false then
        dumpRewards();
        print("No Honey B and Cheato Rewards");
        all = all.."No Honey B and Cheato Rewards".."\n";
    else
        print("Adding Honey B and Cheato Rewards");
        all = all.."Adding Honey B and Cheato Rewards".."\n";
    end


    --addCheatos to pool?
    if forms.ischecked(addCheatos)  then
        addTableToJiggies(cheatos);
        print("Adding Cheato Pages to Pool");
        all = all.."Adding Cheato Pages to Pool".."\n";
    end   

    if forms.ischecked(addHoney)  then
        addTableToJiggies(honeycombs);
        print("Adding HoneyCombs to Pool");
        all = all.."Adding HoneyCombs to Pool".."\n";
    end

    if forms.ischecked(jinjoRandom)  then
        patternNum = math.floor(math.random()*32) +32;
        print("Jinjos are Randomized. Pattern: "..(patternNum-32));
        all = all.."Jinjos are Randomized. Pattern: "..(patternNum-32).."\n";
    end

    if forms.ischecked(addClockworks)  then
        addClockworksToGen();
        print("Clockworks have been added to Ability Pool");
        all = all.."Adding Clockworks to Pool".."\n";
    end

    

    --set jinjo pattern
    --check if rando or set
    
    --set colors
    for i,v in ipairs(patterns[patternNum]) do
        jinjos[i].color = v; 
    end
    -- populate family with requirements
    for i,v in ipairs(families) do
        for j,b in ipairs(jinjos) do
            if (b.color+1 == i) then
                v.require = perm(v.require,b.require);

            end
        end
    end
    --add families to jiggy pool;
    for i,v in ipairs(families) do    
        table.insert(jiggies,v);
    end
    -- Generate Logic!
    all = all.."\n\n---------Item Pool---------\n\n";
    local val =populateSpheres();

    if val == -1 then
        print("seed failed");
        failedLogic = true;
        return false;
    end

    local flags = dereferencePointer(flag_block_pointer);
    flag_block_cache = mainmemory.readbyterange(flags, flag_block_size);

    findMove();
    all = all.."\n\n---------Sphere Progression---------\n\n";
    for i = 0, table.getn(spheres),1 do
        if table.getn(spheres[i]) >0 then
            all = all.."Sphere "..i.."\n";
        
            for j,b in ipairs(spheres[i]) do
                all = all..b.."\n";
            end
            all = all.."\n";
        end
    end

    all = all.."\n\n---------SignPost Hints---------\n\n";
    buildHints();

    all = all.."\n\n---------Required Bosses---------\n\n";
    print("");
    print("Bosses for this Seed are: ");
    for x,b in ipairs(bosses)  do
        print(b)
        all = all..b.."\n";
    end



    --buildCheatos();

    file = io.open("Spoiler Log - "..SEED..".txt", "w")	;
    io.output(file);

    io.write(all);
    io.close(file);

    --set important rando flags

    setFlag(0x79,0);--byte=0x79, bit=0 0x82 > 3
    setFlag(0x82,3);

    --set JWS
    --setFlag(0x04, 4);
    setFlag(0x6D, 2);
    setFlag(0x6D, 3);
    setFlag(0x6D, 4);
    setFlag(0x6D, 5);
    setFlag(0x6D, 6);
    setFlag(0x6D, 7);
    setFlag(0x6E, 0);
    setFlag(0x6E, 1);
    setFlag(0x6E, 2);
    setFlag(0x6E, 3);
    --set CK warps
    setFlag(0x75, 4);
    setFlag(0x75, 5);

    RESETSet();

    print("");

    randoRunning = true;
end


--Startup code

local hash = "AF1A89E12B638B8D82CC4C085C8E01D4CBA03FB3";

if hash ~= gameinfo.getromhash() then
    print("This LUA Script can only run on a Banjo-Tooie (USA) Rom");
    return false;
end


randoRunning = false;
flagsSet = false;
patternNum =48;


bossAmount = {"8 Bosses","7 Bosses","6 Bosses","5 Bosses","4 Bosses","3 Bosses","2 Bosses","1 Bosses","0 Bosses"};
bossSelected = "4 Bosses";

local handle = forms.newform(600, 300, "RANDO");
bossSelected  = forms.dropdown(handle, bossAmount,5,25);

forms.settext(bossSelected,"4 Bosses");
box = forms.textbox(handle, ""..math.floor(math.random()*10000), 100, 10,nil,5,2);

noRewards = forms.checkbox(handle, " >>> ", 5, 50);
addCheatos = forms.checkbox(handle, " >>> ", 5, 75);
addHoney = forms.checkbox(handle, " >>> ", 5, 100);
jinjoRandom = forms.checkbox(handle, " >>> ", 5, 125);
addClockworks = forms.checkbox(handle, " >>> ", 5, 150);

local labels = forms.pictureBox(handle, 0, 0, 600, 200);
forms.drawText(labels,120,0,"Seed for the Randomizer",nil,nil,18);
forms.drawText(labels,120,25,"Amount of Bosses Required to Open Hag 1",nil,nil,18);
forms.drawText(labels,120,50,"Adds HoneyComb/Cheato Rewards",nil,nil,18);
forms.drawText(labels,120,75,"Adds Cheato Pages as Ability Locations",nil,nil,18);
forms.drawText(labels,120,100,"Adds HoneyCombs as Ability Locations",nil,nil,18);
forms.drawText(labels,120,125,"Randomizes the Jinjo Pattern",nil,nil,18);
forms.drawText(labels,120,150,"Randomize Clockworks instead of at X Bosses",nil,nil,18);

button = forms.button(handle, "Generate Seed",startRando,10,200);

displayTextStage= 0;



while true do
    if failedLogic then
        return false;
    end
    if randoRunning then
        checkSet();
        if checkFlag(0x5E,0) and flagsSet == false then
            firstTimeTexts();
            setFlag(0x78, 2);
            setFlag(0x79,0);--byte=0x79, bit=0 0x82 > 3
            setFlag(0x82,3);
            --set JWS
            --setFlag(0x04, 4);
            --open levels

            setFlag(0x6D, 2);
            setFlag(0x6D, 3);
            setFlag(0x6D, 4);
            setFlag(0x6D, 5);
            setFlag(0x6D, 6);
            setFlag(0x6D, 7);
            setFlag(0x6E, 0);
            setFlag(0x6E, 1);
            setFlag(0x6E, 2);
            setFlag(0x6E, 3);
            --set CK warps
            setFlag(0x75, 4);
            setFlag(0x75, 5);
            --set silos 
            setFlag(0x60,6);
            setFlag(0x60,7);
            flagsSet = true;
            
        end
        setRNGOutcome("Jinjo Colours", patternNum);
        openHag1();
        --print("loop");
        --First time checks
       
        searchAndDestroy();
        

        local inputs = joypad.get();
        if inputs["P1 DPad U"] then
            bossesMessage();
        end
        if inputs["P1 DPad D"] then
            moveMessage();
        end
        signPostHints(inputs["P1 B"]);
      

    end

    messageBox();
    --featherQueue();


    emu.yield();
end


