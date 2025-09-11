# (Open-Source) PCIe Endpoint Controller (WORK IN PROGESS)

This repository provides an open-source PCIe 1.0 Endpoint Controller implemented in SystemVerilog RTL.  
The project is intended to serve as a research and educational platform for high-speed interconnect design, as well as a practical solution for FPGA-based PCIe endpoint integration.

---

## Features
- PCIe 1.0 Endpoint Controller written in synthesizable RTL.
- Implements key layers of the PCIe stack:
  - PIPE interface for PHY connectivity.
  - Data Link Layer with sequencing, LCRC, ACK/NAK, and retry logic.
  - Transaction Layer Packet (TLP) handling.
- Example implementations of high-speed interconnect design patterns:
  - Scramblers
  - CRCs
  - Flow Control
- Designed for integration with open-source FPGA toolchains.
- Provides an educational example of PCIe design for teaching and research.
- Lightweight FPGA resource utilization (validated on Xilinx ZCU102).

---

## Repository Structure
```
├── src/ # Synthesizable RTL source code
├── tb/ # Individual level testbenches and cocotb-based verification
├── verif/ #PyUVM based top-level pipe-based constrained ramdom verification 
├── docs/ # Documentation and design notes
├── examples/ # Example reference designs and integration scripts
├── scripts/ # Build and synthesis scripts
└── README.md # Project overview (this file)
```



## Getting Started

### Prerequisites
- [FuseSoC](https://github.com/olofk/fusesoc) installed and configured.
- Cocotb and Python for simulation-based verification.
- [Verilator] (https://github.com/verilator/verilator) installed and configured.
- FPGA development environment (Xilinx Vivado,openXC7, or Intel Quartus) if synthesizing.
- Git for version control.

### Cloning the Repository
```bash
git clone https://github.com/isomoye-msu/pcie_datalink_layer.git
cd pcie_datalink_layer

git submodule init && git submodule update
```

### Install prereqs with pip

```
  pip install setuptools>=64
  pip install wheel --user
  pip install edalize --user
  pip install fusesoc>=2.4.4 --user
  pip install -r requirements.txt --user
```

### Registering with FuseSoC

```
fusesoc library add pcie-endpoint-controller ./
```

### Running Simulation


### Pipe Simulation with Verilator
Run the cocotb-based testbench via FuseSoC:

```fusesoc run --target=sim fusesoc:pcie:phy_core:1.0.0```


### GTP/GTH Simulation with Vivado

``` fusesoc run --target=synth fusesoc:pcie:pcie_kc705:1.0.0```

## Documentation

Detailed documentation can be found in the docs/ folder.
It includes:

System Overview

PIPE Interface description

Data Link Layer architecture

Resource utilization summary

Performance evaluation


##  Research and Educational Contributions

This work contributes to the open-source hardware ecosystem by, providing the first open-source PCIe endpoint controller targeting research and education.
Enabling experiments with high-speed interconnect design in RTL. Demonstrating integration of cocotb and Python for modern hardware verification. Supporting RISC-V and open hardware communities where PCIe remains a missing peripheral.


License

This project is licensed under the MIT License. See the LICENSE file for details.
