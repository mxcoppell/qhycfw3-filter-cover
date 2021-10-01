//
//  User customizable data
//
cfw_model                   = 2;        //  !!! Please set your CFW model here !!!
                                        //
                                        //   0 - QHYCFW3-S-SR 7x31mm
                                        //   1 - QHYCFW3-S-SR 6x36mm
                                        //   2 - QHYCFW3-S-US 7x31mm
                                        //   3 - QHYCFW3-S-US 6x36mm
                                        //   4 - QHYCFW3-M-SR 8x31mm
                                        //   5 - QHYCFW3-M-SR 7x36mm
                                        //   6 - QHYCFW3-M-SR 5x50mm
                                        //   7 - QHYCFW3-M-US 8x31mm
                                        //   8 - QHYCFW3-M-US 7x36mm
                                        //   9 - QHYCFW3-M-US 5x50mm
                                        //  10 - QHYCFW3-L    7x50mm
                                        //  11 - QHYCFW3-XL   9x50mm


use_filter_slot_separators  = false;    //  Pre-cut into individual filter covers
                                        //      true - cut | false - don't cut

use_screw_cap_sinks         = false;    //  Use sinks for screw caps, 
                                        //      true - use | false - don't use
                                        
cover_slot_shrink_diameter  = 0.45;     //  Diameter shink size for cover slot from QHY slot diameter


//
//  QHY Filter Wheel Dataset
//
cfw_dataset = 
[   //  number of filters, QHY filter slot diameter, CFW center to filter center distance
    [ 7, 31.75, 37.00 ],
    [ 6, 36.20, 37.00 ],
    [ 7, 31.75, 37.00 ],
    [ 6, 36.20, 37.00 ],
    [ 8, 31.80, 45.00 ],
    [ 7, 36.20, 45.00 ],
    [ 5, 51.30, 45.00 ],
    [ 8, 31.80, 45.00 ],
    [ 7, 36.20, 45.00 ],
    [ 5, 51.30, 45.00 ],
    [ 7, 51.30, /*** There is no data from QHY diagram, this is calculated value ***/59.78 ],    
    [ 9, 51.30, 80.00 ]
];
    
number_of_filters          = cfw_dataset[cfw_model][0];
cfw_filter_slot_diameter   = cfw_dataset[cfw_model][1];
cfw_center_to_slot_center  = cfw_dataset[cfw_model][2];

//  -----------------------------------------------------

// QHY design data
qhy_f_radius = cfw_filter_slot_diameter / 2;
qhy_f_screw_pad_radius = 5 / 2;
qhy_f_screw_sink = 1.5 - 0.2;
qhy_f_screw_center_radius = qhy_f_radius + 2;
qhy_f_screw_radius = 2 / 2 + 0.2; // M2 screw hole
qhy_f_rise_thickness = 1;

// individual filter mask
f_radius = qhy_f_radius - cover_slot_shrink_diameter / 2;
f_slot_cover_size = 1;
f_slot_wall_thickness = 2;

f_slot_base_radius = f_radius + f_slot_wall_thickness;
f_slot_window_radius = f_radius - f_slot_cover_size;

// filter coverage depth from top
f_slot_cover_depth = 0.6;
f_slot_window_thickness = 1;
f_slot_base_thickness = f_slot_cover_depth + f_slot_window_thickness;

// common variables
extension_thickness = qhy_f_screw_sink + qhy_f_rise_thickness + f_slot_window_thickness-0.3;
rise_against_plate = (qhy_f_rise_thickness + f_slot_window_thickness) - (f_slot_window_thickness + f_slot_cover_depth);

module screw_extension()
{
    translate([0, 0, qhy_f_rise_thickness+f_slot_window_thickness-extension_thickness/2]) {
        difference() {
            union() {
                translate([0, qhy_f_screw_pad_radius-2/2, 0])
                    cube([qhy_f_screw_pad_radius*2, qhy_f_screw_pad_radius*2-2, extension_thickness], center=true);
                cylinder(h=extension_thickness,
                    r=qhy_f_screw_pad_radius, center=true, $fn=32);
            }       
            cylinder(h=extension_thickness,
                r=qhy_f_screw_radius, center=true, $fn=32);

        }
    }
}

module screw_cap_sink()
{
    translate([0, 0, qhy_f_rise_thickness+f_slot_window_thickness-0.5/2]) {
        cylinder(h=0.5, r=qhy_f_screw_pad_radius+0.1, center=true, $fn=32);
    }
}


module screw_hole()
{
    translate([0, 0, qhy_f_rise_thickness+f_slot_window_thickness-extension_thickness/2]) {
        cylinder(h=extension_thickness, r=qhy_f_screw_radius, center=true, $fn=32);
    }
}

module three_screw_extensions()
{
//    union() {
        for (i = [0, 1, 2] ) {
            translate([sin(i * 120 - 60) * qhy_f_screw_center_radius, 
                       cos(i * 120 - 60) * qhy_f_screw_center_radius, 
                       0])
                rotate([0, 0, (i * 240 - 120) % 360])
                    children();
        }
//    }
}

module three_screw_cap_sinks()
{
    if (use_screw_cap_sinks == true) {
//        union() {
            for (i = [0, 1, 2] ) {
                translate([sin(i * 120 - 60) * qhy_f_screw_center_radius, 
                           cos(i * 120 - 60) * qhy_f_screw_center_radius, 
                           0])
                    children();
            }
        }
//    }
}

module three_screw_holes()
{
//    union() {
        for (i = [0, 1, 2] ) {
            translate([sin(i * 120 - 60) * qhy_f_screw_center_radius, 
                       cos(i * 120 - 60) * qhy_f_screw_center_radius, 
                       0])
                children();
        }
//    }
}

module filter_window()
{
    translate([0, 0, f_slot_window_thickness/2 + f_slot_cover_depth + rise_against_plate])
        cylinder(h=f_slot_window_thickness, r=f_slot_window_radius, center=true, $fn=100);
}

module filter_slot()
{
    translate([0, 0, f_slot_cover_depth/2 + rise_against_plate])
        cylinder(h=f_slot_cover_depth, r=f_radius, center=true, $fn=100);
}

module filter_slot_through()
{
    translate([0, 0, qhy_f_rise_thickness - (extension_thickness - f_slot_window_thickness + 1)/2])
        cylinder(h=extension_thickness - f_slot_window_thickness + 1, r=f_radius, center=true, $fn=100);
}

module filter_slot_base()
{
    difference() {
        translate([0, 0, f_slot_base_thickness/2 + rise_against_plate])
            cylinder(h=f_slot_base_thickness, r=f_slot_base_radius, center=true, $fn=100);
        union() {
            filter_window();
            filter_slot();
        }
    }
}

module single_filter_slot()
{
    difference() { // apply screw cap sinks
        difference() { // re-apply slot and window
            difference() { // re-apply screw holes
                union() {
                    filter_slot_base();
                    three_screw_extensions()
                        screw_extension();
                }
                three_screw_holes()
                    screw_hole();
            }
            union() {
                filter_window();
                filter_slot_through();
            }
        }
        three_screw_cap_sinks()
            screw_cap_sink();
    }
 }

//  generate layout for all filters
//
module filter_slots()
{
    difference() {
        difference() {
            // assemble filters
            for (i = [0 : number_of_filters - 1] ) {
                translate([sin(i*360/number_of_filters)*cfw_center_to_slot_center, 
                           cos(i*360/number_of_filters)*cfw_center_to_slot_center, 
                           0])
                    rotate([0, 0, -i*360/number_of_filters]) 
                        single_filter_slot();
            }
            
            // cleaning up filter slots and filter windows
            for (i = [0 : number_of_filters - 1] ) {
                translate([sin(i*360/number_of_filters)*cfw_center_to_slot_center, 
                           cos(i*360/number_of_filters)*cfw_center_to_slot_center, 
                           0]) {
                    union() {
                        filter_window();
                        filter_slot_through();
                    }
                }
            }
        }
        filter_separators();
    }
}

module copy_filter_slot(){
    for (i = [0 : number_of_filters - 1] ) {
        translate([sin(i*360/number_of_filters)*cfw_center_to_slot_center, 
                   cos(i*360/number_of_filters)*cfw_center_to_slot_center, 
                   0]) 
            rotate([0, 0, -i*360/number_of_filters])
                children();
    }
}

module one_filter_slot()
{
    difference() {
        difference() {
            // assemble filters
            single_filter_slot();
            union() {
                filter_window();
                filter_slot_through();
            }
        }
        filter_separators();
    }
}

//  generate filter separators
//
module filter_separators() {
    if (use_filter_slot_separators == true) {
        for (i = [0 : number_of_filters - 1] ) {
            rotate([0, 0, 360/(number_of_filters*2) + i*360/number_of_filters])
                translate([0, 49.9, 0]) 
                    cube([0.2, 100, 30], center=true);
        }
    }
}


//  !!! give me the printable !!!
//render() filter_slots(); 
render() copy_filter_slot() //copy
    one_filter_slot();
