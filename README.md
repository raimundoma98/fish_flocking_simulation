# Fish Flocking Simulation
Flocking simulation of fishes implemented in C++ using Raylib

# Optimizations implemented
- Data oriented design (DoD): boid properties are defined as structs of arrays (SoA), instead of arrays of structs (AoS). This improves data locality and CPU cache efficiency.