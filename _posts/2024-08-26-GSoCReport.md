---
layout: post
title:  "GSoC Final Report"
date:   2024-08-26 0:0:0 +0530
---

This serves as the final evaluation report for GSoC 2024.
My project for GSoC 2024 is [STOFS Subsetting Tool](https://summerofcode.withgoogle.com/programs/2024/projects/VxCwfSg0).

## Abstract

Before GSoC 24, subsetting xarray datasets was done using either thalassa or ugrid. This method of subsetting was not uniform and sometimes problematic for Stofs-3d (SCHISM) datasets. This project aimed to develop a standard subsetting tool for both ADCIRC and SCHISM datasets, which would improve data accessibility.

## Contribution

Over the course of this project, I've added support for subsetting STOFS-2D and STOFS-3D datasets, including other dataset formats. I have added example notebooks, example datasets and a comprehensive documentation for the subsetting tool. Towards the end, I've helped in developing a reusable selector for the subsetting tool and testing as well.

For detailed contribution, please refer below.

### Issues
- [Unclosed array](https://github.com/asascience-open/xarray-subset-grid/issues/2)
- [Example notebooks - Add STOFS dataset](https://github.com/asascience-open/xarray-subset-grid/issues/3)
- [Add SCHISM compatibility](https://github.com/asascience-open/xarray-subset-grid/issues/8)
- [Add ADCIRC compatibility](https://github.com/asascience-open/xarray-subset-grid/issues/9)
- [Add documentation build and website](https://github.com/asascience-open/xarray-subset-grid/issues/10)
- [Add contribution guide](https://github.com/asascience-open/xarray-subset-grid/issues/13)
- [Add benchmark examples](https://github.com/asascience-open/xarray-subset-grid/issues/14)
- [We need test datasets / files!](https://github.com/asascience-open/xarray-subset-grid/issues/14)
- [Add examples for subsetting STOFS output](https://github.com/asascience-open/xarray-subset-grid/issues/15)
- [Add examples for subsetting STOFS outputs](https://github.com/asascience-open/xarray-subset-grid/issues/16)
- [Documentation setup](https://github.com/asascience-open/xarray-subset-grid/issues/58)
- [Reuse selector](https://github.com/asascience-open/xarray-subset-grid/issues/59)

### Pull Requests

- Merged - [Fixed unclosed array](https://github.com/asascience-open/xarray-subset-grid/pull/1)
- Closed - [Update xarray version to 2023.10 and add support for Python 3.9](https://github.com/asascience-open/xarray-subset-grid/pull/21)
- Reviewed - [Stofs 2D support](https://github.com/asascience-open/xarray-subset-grid/pull/31)
- Merged - [Add contribution guide, benchmarks and datasets](https://github.com/asascience-open/xarray-subset-grid/pull/56)
- Merged - [Documentation](https://github.com/asascience-open/xarray-subset-grid/pull/56)
- Merged - [add 'anon' parameter and update stofs-2d link](https://github.com/asascience-open/xarray-subset-grid/pull/57)
- Open - [Reuse selector](https://github.com/asascience-open/xarray-subset-grid/pull/60)


## After GSoC

For now, xarray-subset-grid can be installed from souce using `pip`. It could be released as a PyPI package depending on the future maintainer of the project. Providing xarray-subset-grid as a web-api is also one of the goals. The Selector class could be improved further and integrated with fsspec, if needed.
I can help in maintenance of the project for further support and issues.


## Acknowledgement
I want to express my deep gratitude to my mentors - [Atieh](https://github.com/AtiehAlipour-NOAA), [Matt](https://github.com/mpiannucci), [Chris](https://github.com/ChrisBarker-NOAA) and [Soroosh](https://github.com/SorooshMani-NOAA).They all gave me assistance, guidance and inspiration during the past few months.