# QHYCFW3 Filter Mask 3D Models

![QHYCFW3S-US 7x31mm with Separators and Sunkened Screw Caps](https://user-images.githubusercontent.com/24981822/134816844-0df083ad-7779-49d9-8e51-ca694955b816.png)

All, the OpenSCAD script is designed/implemented for generating 3D printable models for QHYCFW3 filter wheel filter masks to make installing unmounted filters much easier. User could change the following parameter (please check with official QHYCCD CFW3 filter wheel drawings: https://www.qhyccd.com/qhycfw3/). The filter covers make filter installation to QHYCFW3 very easy - It helps to center the filters, avoid light leaks and secures the installation. It's a much better solution than the factory M.2 screws + M.2 washers. 

Please note, this design is for unmounted filters with thickness of 3mm. - For example, Chroma/Astrodon unmounted 31mm filters, unmounted 50mm round filters and Antlia unmounted 50mm round filters. If the filter thickness is 2mm or below, this solution is not feasible.

# Supported CFW3 Models

Currently, the following CFW3 filter wheels are supported. The square filter version is not available in current version.

- _QHYCFW3-S-SR 7x31mm_
- _QHYCFW3-S-SR 6x36mm_
- _QHYCFW3-S-US 7x31mm_
- _QHYCFW3-S-US 6x36mm_
- _QHYCFW3-M-SR 8x31mm_
- _QHYCFW3-M-SR 7x36mm_
- _QHYCFW3-M-SR 5x50mm_
- _QHYCFW3-M-US 8x31mm_
- _QHYCFW3-M-US 7x36mm_
- _QHYCFW3-M-US 5x50mm_
- _QHYCFW3-L    7x50mm_
- _QHYCFW3-XL   9x50mm_

# Filter Cover Styles

There are 4 styles with combinations of separators and sunkened screw caps. With separator, the user could easily snap the printout into individual filter covers. The sunkened screw caps requires better 3D printers. The printer I use from the local library can't really handle it well. So I just use the version without sunkened screw caps. 

![4 Mask Cover Styles](https://github.com/mxcoppell/qhycfw3-filter-cover/blob/main/image/4-filter-cover-styles.jpeg?raw=true)

# Pre-rendered STL Download

Pre-rendered STL files could be downloaded from the following table:
```
  S - Separators
SSC - Sunkened Screw Caps
```

| Filter Model  | No S / No SSC | No S / Yes SSC | Yes S / No SSC | Yes S / Yes SSC |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| QHYCFW3-S-SR 7x31mm  | [download](https://github.com/mxcoppell/qhycfw3-filter-cover/blob/main/stl/%230%20%3D%20QHYCFW3-S-SR-7x31mm-no-separator-no-sunk-screw-cap.stl)  | [download](https://github.com/mxcoppell/qhycfw3-filter-cover/blob/main/stl/%230%20%3D%20QHYCFW3-S-SR-7x31mm-no-separator-yes-sunk-screw-cap.stl)  | [download](https://github.com/mxcoppell/qhycfw3-filter-cover/blob/main/stl/%230%20%3D%20QHYCFW3-S-SR-7x31mm-yes-separator-no-sunk-screw-cap.stl)  | [download](https://github.com/mxcoppell/qhycfw3-filter-cover/blob/main/stl/%230%20%3D%20QHYCFW3-S-SR-7x31mm-yes-separator-yes-sunk-screw-cap.stl)  |
| QHYCFW3-S-SR 6x36mm  | [download]()  | [download]()  | [download]()  | [download]()  |
| QHYCFW3-S-US 7x31mm  | [download]()  | [download]()  | [download]()  | [download]()  |
| QHYCFW3-S-US 6x36mm  | [download]()  | [download]()  | [download]()  | [download]()  |
| QHYCFW3-M-SR 8x31mm  | [download]()  | [download]()  | [download]()  | [download]()  |
| QHYCFW3-M-SR 7x36mm  | [download]()  | [download]()  | [download]()  | [download]()  |
| QHYCFW3-M-SR 5x50mm  | [download]()  | [download]()  | [download]()  | [download]()  |
| QHYCFW3-M-US 8x31mm  | [download]()  | [download]()  | [download]()  | [download]()  |
| QHYCFW3-M-US 7x36mm  | [download]()  | [download]()  | [download]()  | [download]()  |
| QHYCFW3-M-US 5x50mm  | [download]()  | [download]()  | [download]()  | [download]()  |
| QHYCFW3-L    7x50mm  | [download]()  | [download]()  | [download]()  | [download]()  |
| QHYCFW3-XL   9x50mm  | [download]()  | [download]()  | [download]()  | [download]()  |

# Customization

You could also download the OpenSCAD code ([qhycfw3-filter-cover.scad](https://github.com/mxcoppell/qhycfw3-filter-cover/blob/main/openscad/qhycfw3-filter-cover.scad))to do your own customization. 

The following parameters could be adjusted. (Of course you could change other part of the code to do bug fixes or design modifications.)

```
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
```

It is suggested to use nozzle size <= 0.35, layer 0.1mm when printing the models. When printing, please make sure the following side is facing up (against the the printer bed). 

![Side to face up during printing](https://github.com/mxcoppell/qhycfw3-filter-cover/blob/main/image/print-orientation.jpeg)


# License

GPL - https://www.gnu.org/licenses/gpl-3.0.en.html
