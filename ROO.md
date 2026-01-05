# QHYCFW3 Filter Mask Project

> [!IMPORTANT]
> **Agent Instructions:** All agents MUST read this [`ROO.md`](ROO.md) file first before starting any work on the project.

This project provides an OpenSCAD script and pre-rendered STL files for creating 3D-printable filter masks for **QHYCFW3 filter wheels**.

## 1. Purpose and Target Hardware

The goal of this project is to simplify the installation of unmounted filters, improve centering, prevent light leaks, and secure filters more effectively than factory M.2 screws and washers.

- **Target Hardware:** Supports QHYCFW3 models S-SR, S-US, M-SR, M-US, L, and XL (round filters only; square filters are not supported).
- **Filter Compatibility:** Optimized for unmounted filters with a **3mm thickness** (e.g., Chroma, Astrodon, Antlia). It is not suitable for filters 2mm thick or thinner.

## 2. OpenSCAD Model Structure

The model is parametric and organized into functional modules within [`openscad/qhycfw3-filter-cover.scad`](openscad/qhycfw3-filter-cover.scad).

### Key Parameters

- `cfw_model`: Selects the specific CFW model (0–11) from a predefined dataset.
- `use_filter_slot_separators`: Boolean to include thin cuts for snapping the print into individual covers.
- `use_screw_cap_sinks`: Boolean to enable recessed screw head slots (requires high-precision printing).
- `cover_slot_shrink_diameter`: Adjusts the fit tolerance (default `0.45mm`).

### Core Modules

- `single_filter_slot()`: The primary building block, combining the filter base, screw extensions, and holes.
- `three_screw_*`: Helper modules that distribute screw features (extensions, holes, sinks) in a 120-degree pattern.
- `filter_separators()`: Generates radial cutouts to separate the masks.
- `filter_slots()` / `copy_filter_slot()`: Handles the circular arrangement of multiple masks based on the selected CFW model's geometry.

## 3. Development and Contribution Guidelines

- **Customization:** Users are encouraged to modify the OpenSCAD script for bug fixes or design improvements.
- **Printing Recommendations:**
  - **Nozzle size:** <= 0.4mm.
  - **Layer height:** 0.1mm.
  - **Material:** ABS or PETG (must be flexible and safe for glass).
  - **Orientation:** Specific "face up" orientation is required for successful printing (see [`image/print-orientation.jpeg`](image/print-orientation.jpeg)).

## 4. Environment Information

- **GitHub CLI:** The GitHub CLI (`gh`) is authenticated and ready for use in interactions with GitHub projects.

## 5. License

This project is distributed under the **GPL-3.0 License**.
