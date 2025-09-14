# greencompute
We want to promote green computing. This project demonstrates how ARM based compute shapes can help reduce the CO2 footprint of an appliction

The project will containb the following

- Terraform script to create a given amount of X64 based and ARm based compute.
- Screenshot of CO2 reporting in the console
- Different programs that consumes CPU, so we can scale the number fo compute instances on the different architectures, to provide compareable throughput
- Test will be available for Java, GraalVm RUST and Python, all basically doing the same¨
- It will based on standard type of benchmakr on INT, Floating point, String and mixed loads

Ambisious,yes, but we are wasting too much electric energy on doing what?

Directories
compute:  terraforms script to spin up required resources, ARM, X64-AMD E6 and X64 Intel shapes
init:     Initial scripts to be run when teh instances are created, download this repo and dependencies for running the benchmark programs
benchmark: Java and Python programs with the various workload tests, links to other benchmarks or descrete programs

