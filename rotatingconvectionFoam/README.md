# rotatingconvectionFoam

![rotatingconvectionFoam](https://img.shields.io/badge/OpenFOAM-v2012-brightgreen.svg)
[![DOI](https://img.shields.io/badge/DOI-10.1063/5.0233789-yellow.svg)](https://doi.org/10.1063/5.0233789)

This folder provides the OpenFOAM solver for simulating thermal convection in a rotating fluid annulus.

## Key Features

* This solver is based on the **buoyantBoussinesqPimpleFoam**.
* Coriolis and centrifugal forces are implemented in the solver.
* The rotational rate of the fluid annulus is specified as **av_omega** in *transportProperties*.

## How to cite

Please reference the following paper when using this solver:

Ippei Oshima, Yoji Kawamura, Synchronization phenomenon of temperature oscillation in rotating fluid annulus and optimal waveforms of external forcing, Chaos **35**, 043116 (2025); [![DOI](https://img.shields.io/badge/DOI-10.1063/5.0233789-yellow.svg)](https://doi.org/10.1063/5.0233789)