peakrdl regblock src/pcie_cfg/pcie_config.rdl -o src/pcie_cfg --cpuif axi4-lite-flat
peakrdl python   src/pcie_cfg/pcie_config.rdl -o src/pcie_cfg --async
peakrdl c-header src/pcie_cfg/pcie_config.rdl -o src/pcie_cfg/pcie_cfg.h
peakrdl markdown src/pcie_cfg/pcie_config.rdl -o src/pcie_cfg/pcie_cfg.md
