


"""
Python Wrapper for the pcie_config_reg register model

This code was generated from the PeakRDL-python package version 1.2.0

"""


from enum import unique
from typing import Iterator
from typing import Optional
from typing import Union
from typing import Type
from typing import overload
from typing import Literal
from typing import Any
from typing import NoReturn
from typing import AsyncGenerator

import warnings



from contextlib import asynccontextmanager

from ..lib import Node, Base
from ..lib import UDPStruct

from ..lib  import AddressMapArray, RegFileArray
from ..lib import AsyncMemory, AsyncMemoryArray
from ..lib import AsyncAddressMap
from ..lib import AsyncRegFile
from ..lib  import AsyncAddressMapArray
from ..lib  import AsyncRegFileArray
from ..lib import MemoryAsyncReadOnly, MemoryAsyncWriteOnly, MemoryAsyncReadWrite
from ..lib import MemoryAsyncReadOnlyArray, MemoryAsyncWriteOnlyArray, MemoryAsyncReadWriteArray
from ..lib import AsyncReg, AsyncRegArray
from ..lib import RegAsyncReadOnly, RegAsyncWriteOnly, RegAsyncReadWrite
from ..lib import RegAsyncReadOnlyArray, RegAsyncWriteOnlyArray, RegAsyncReadWriteArray
from ..lib import FieldAsyncReadOnly, FieldAsyncWriteOnly, FieldAsyncReadWrite, Field

from ..lib import ReadableAsyncRegister, WritableAsyncRegister
from ..lib import ReadableAsyncMemory, WritableAsyncMemory
from ..lib import ReadableAsyncRegisterArray, WriteableAsyncRegisterArray
from ..lib import FieldSizeProps, FieldMiscProps


from ..lib import SystemRDLEnum, SystemRDLEnumEntry



from ..lib import AsyncCallbackSet, AsyncCallbackSetLegacy



















# regfile, register and field definitions
    
    
    
class pcie_config_reg_extended_capabilities_ext_cap_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>exended capabilities</p>                                        |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "exended capabilities"
    
    

    
    
class pcie_config_reg_extended_capabilities_cls(RegAsyncReadOnly):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      extended capabilities                                              |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__ext_cap']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,ReadableAsyncMemory]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__ext_cap:pcie_config_reg_extended_capabilities_ext_cap_cls = pcie_config_reg_extended_capabilities_ext_cap_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=32,
                lsb=0,
                msb=31,
                low=0,
                high=31),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.ext_cap',
            inst_name='ext_cap',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.ext_cap
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def ext_cap(self) -> pcie_config_reg_extended_capabilities_ext_cap_cls:
        """
        Property to access ext_cap field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>exended capabilities</p>                                        |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__ext_cap

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'ext_cap':'ext_cap',
            }

    
    
    
    
    
    
                
    def get_child_by_system_rdl_name(self, name: Any) -> pcie_config_reg_extended_capabilities_ext_cap_cls:
        return super().get_child_by_system_rdl_name(name)
                
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "extended capabilities"
    
    

    
    
    
class pcie_config_reg_lane_eq_ctrl_register_upstream_rx_preset_hint_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Upstream Port Receiver Preset Hint</p>                          |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Upstream Port Receiver Preset Hint"
    
    

    
    
    
class pcie_config_reg_lane_eq_ctrl_register_upstream_tx_preset_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Upstream Port Transmitter Preset</p>                            |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Upstream Port Transmitter Preset"
    
    

    
    
    
class pcie_config_reg_lane_eq_ctrl_register_downstream_rx_preset_hint_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Downstream Port Receiver Preset Hint</p>                        |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Downstream Port Receiver Preset Hint"
    
    

    
    
    
class pcie_config_reg_lane_eq_ctrl_register_downstream_tx_preset_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Downstream Port Transmitter Preset</p>                          |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Downstream Port Transmitter Preset"
    
    

    
    
class pcie_config_reg_lane_eq_ctrl_register_cls(RegAsyncReadWrite):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Lane Equalization Control Register (Offset 0Ch)                    |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__downstream_tx_preset', '__downstream_rx_preset_hint', '__upstream_tx_preset', '__upstream_rx_preset_hint']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,MemoryAsyncReadWrite]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__downstream_tx_preset:pcie_config_reg_lane_eq_ctrl_register_downstream_tx_preset_cls = pcie_config_reg_lane_eq_ctrl_register_downstream_tx_preset_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=4,
                lsb=0,
                msb=3,
                low=0,
                high=3),
            misc_props=FieldMiscProps(
                default=15,
                is_volatile=True),
            logger_handle=logger_handle+'.downstream_tx_preset',
            inst_name='downstream_tx_preset',
            field_type=int)
        self.__downstream_rx_preset_hint:pcie_config_reg_lane_eq_ctrl_register_downstream_rx_preset_hint_cls = pcie_config_reg_lane_eq_ctrl_register_downstream_rx_preset_hint_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=3,
                lsb=4,
                msb=6,
                low=4,
                high=6),
            misc_props=FieldMiscProps(
                default=7,
                is_volatile=True),
            logger_handle=logger_handle+'.downstream_rx_preset_hint',
            inst_name='downstream_rx_preset_hint',
            field_type=int)
        self.__upstream_tx_preset:pcie_config_reg_lane_eq_ctrl_register_upstream_tx_preset_cls = pcie_config_reg_lane_eq_ctrl_register_upstream_tx_preset_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=4,
                lsb=8,
                msb=11,
                low=8,
                high=11),
            misc_props=FieldMiscProps(
                default=15,
                is_volatile=True),
            logger_handle=logger_handle+'.upstream_tx_preset',
            inst_name='upstream_tx_preset',
            field_type=int)
        self.__upstream_rx_preset_hint:pcie_config_reg_lane_eq_ctrl_register_upstream_rx_preset_hint_cls = pcie_config_reg_lane_eq_ctrl_register_upstream_rx_preset_hint_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=3,
                lsb=12,
                msb=14,
                low=12,
                high=14),
            misc_props=FieldMiscProps(
                default=7,
                is_volatile=True),
            logger_handle=logger_handle+'.upstream_rx_preset_hint',
            inst_name='upstream_rx_preset_hint',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.downstream_tx_preset
        yield self.downstream_rx_preset_hint
        yield self.upstream_tx_preset
        yield self.upstream_rx_preset_hint
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def downstream_tx_preset(self) -> pcie_config_reg_lane_eq_ctrl_register_downstream_tx_preset_cls:
        """
        Property to access downstream_tx_preset field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Downstream Port Transmitter Preset</p>                          |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__downstream_tx_preset
    @property
    def downstream_rx_preset_hint(self) -> pcie_config_reg_lane_eq_ctrl_register_downstream_rx_preset_hint_cls:
        """
        Property to access downstream_rx_preset_hint field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Downstream Port Receiver Preset Hint</p>                        |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__downstream_rx_preset_hint
    @property
    def upstream_tx_preset(self) -> pcie_config_reg_lane_eq_ctrl_register_upstream_tx_preset_cls:
        """
        Property to access upstream_tx_preset field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Upstream Port Transmitter Preset</p>                            |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__upstream_tx_preset
    @property
    def upstream_rx_preset_hint(self) -> pcie_config_reg_lane_eq_ctrl_register_upstream_rx_preset_hint_cls:
        """
        Property to access upstream_rx_preset_hint field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Upstream Port Receiver Preset Hint</p>                          |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__upstream_rx_preset_hint

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'downstream_tx_preset':'downstream_tx_preset','downstream_rx_preset_hint':'downstream_rx_preset_hint','upstream_tx_preset':'upstream_tx_preset','upstream_rx_preset_hint':'upstream_rx_preset_hint',
            }

    
    
    
    
    
    
    # nodes:4
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["downstream_tx_preset"]) -> pcie_config_reg_lane_eq_ctrl_register_downstream_tx_preset_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["downstream_rx_preset_hint"]) -> pcie_config_reg_lane_eq_ctrl_register_downstream_rx_preset_hint_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["upstream_tx_preset"]) -> pcie_config_reg_lane_eq_ctrl_register_upstream_tx_preset_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["upstream_rx_preset_hint"]) -> pcie_config_reg_lane_eq_ctrl_register_upstream_rx_preset_hint_cls: ...
                

    @overload
    def get_child_by_system_rdl_name(self, name: str) -> Union[pcie_config_reg_lane_eq_ctrl_register_downstream_tx_preset_cls, pcie_config_reg_lane_eq_ctrl_register_downstream_rx_preset_hint_cls, pcie_config_reg_lane_eq_ctrl_register_upstream_tx_preset_cls, pcie_config_reg_lane_eq_ctrl_register_upstream_rx_preset_hint_cls, ]: ...

    def get_child_by_system_rdl_name(self, name: Any) -> Any:
        return super().get_child_by_system_rdl_name(name)
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Lane Equalization Control Register (Offset 0Ch)"
    
    

    
    
    
class pcie_config_reg_lane_error_status_register_lane_error_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Perform Equalization</p>                                        |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Perform Equalization"
    
    

    
    
class pcie_config_reg_lane_error_status_register_cls(RegAsyncReadWrite):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Lane Error Status Register (Offset 08h)                            |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__lane_error']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,MemoryAsyncReadWrite]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__lane_error:pcie_config_reg_lane_error_status_register_lane_error_cls = pcie_config_reg_lane_error_status_register_lane_error_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=5,
                lsb=0,
                msb=4,
                low=0,
                high=4),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=True),
            logger_handle=logger_handle+'.lane_error',
            inst_name='lane_error',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.lane_error
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def lane_error(self) -> pcie_config_reg_lane_error_status_register_lane_error_cls:
        """
        Property to access lane_error field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Perform Equalization</p>                                        |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__lane_error

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'lane_error':'lane_error',
            }

    
    
    
    
    
    
                
    def get_child_by_system_rdl_name(self, name: Any) -> pcie_config_reg_lane_error_status_register_lane_error_cls:
        return super().get_child_by_system_rdl_name(name)
                
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Lane Error Status Register (Offset 08h)"
    
    

    
    
    
class pcie_config_reg_link_control_3_register_link_eq_req_intr_en_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_link_control_3_register_perform_equalization_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Perform Equalization</p>                                        |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Perform Equalization"
    
    

    
    
class pcie_config_reg_link_control_3_register_cls(RegAsyncReadWrite):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Link Control 3 Register (Offset 04h)                               |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__perform_equalization', '__link_eq_req_intr_en']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,MemoryAsyncReadWrite]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__perform_equalization:pcie_config_reg_link_control_3_register_perform_equalization_cls = pcie_config_reg_link_control_3_register_perform_equalization_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=0,
                msb=0,
                low=0,
                high=0),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.perform_equalization',
            inst_name='perform_equalization',
            field_type=int)
        self.__link_eq_req_intr_en:pcie_config_reg_link_control_3_register_link_eq_req_intr_en_cls = pcie_config_reg_link_control_3_register_link_eq_req_intr_en_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=1,
                msb=1,
                low=1,
                high=1),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.link_eq_req_intr_en',
            inst_name='link_eq_req_intr_en',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.perform_equalization
        yield self.link_eq_req_intr_en
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def perform_equalization(self) -> pcie_config_reg_link_control_3_register_perform_equalization_cls:
        """
        Property to access perform_equalization field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Perform Equalization</p>                                        |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__perform_equalization
    @property
    def link_eq_req_intr_en(self) -> pcie_config_reg_link_control_3_register_link_eq_req_intr_en_cls:
        """
        Property to access link_eq_req_intr_en field of the register

        
        """
        return self.__link_eq_req_intr_en

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'perform_equalization':'perform_equalization','link_eq_req_intr_en':'link_eq_req_intr_en',
            }

    
    
    
    
    
    
    # nodes:2
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["perform_equalization"]) -> pcie_config_reg_link_control_3_register_perform_equalization_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["link_eq_req_intr_en"]) -> pcie_config_reg_link_control_3_register_link_eq_req_intr_en_cls: ...
                

    @overload
    def get_child_by_system_rdl_name(self, name: str) -> Union[pcie_config_reg_link_control_3_register_perform_equalization_cls, pcie_config_reg_link_control_3_register_link_eq_req_intr_en_cls, ]: ...

    def get_child_by_system_rdl_name(self, name: Any) -> Any:
        return super().get_child_by_system_rdl_name(name)
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Link Control 3 Register (Offset 04h) "
    
    

    
    
    
class pcie_config_reg_capabilities_power_na_pointer_RsvdP_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_capabilities_power_na_pointer_Undefined_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_capabilities_power_na_pointer_interrupt_msg_number_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_capabilities_power_na_pointer_slot_implemented_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_capabilities_power_na_pointer_device_port_type_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_capabilities_power_na_pointer_capability_version_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_capabilities_power_na_pointer_next_cap_ptr_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>next capability pointer</p>                                     |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "next capability pointer"
    
    

    
    
    
class pcie_config_reg_capabilities_power_na_pointer_capabilities_id_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Capabilities id</p>                                             |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Capabilities id"
    
    

    
    
class pcie_config_reg_capabilities_power_na_pointer_cls(RegAsyncReadOnly):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      PCI Express Capabilities Register                                  |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__capabilities_id', '__next_cap_ptr', '__capability_version', '__device_port_type', '__slot_implemented', '__interrupt_msg_number', '__Undefined', '__RsvdP']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,ReadableAsyncMemory]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__capabilities_id:pcie_config_reg_capabilities_power_na_pointer_capabilities_id_cls = pcie_config_reg_capabilities_power_na_pointer_capabilities_id_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=0,
                msb=7,
                low=0,
                high=7),
            misc_props=FieldMiscProps(
                default=16,
                is_volatile=False),
            logger_handle=logger_handle+'.capabilities_id',
            inst_name='capabilities_id',
            field_type=int)
        self.__next_cap_ptr:pcie_config_reg_capabilities_power_na_pointer_next_cap_ptr_cls = pcie_config_reg_capabilities_power_na_pointer_next_cap_ptr_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=8,
                msb=15,
                low=8,
                high=15),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.next_cap_ptr',
            inst_name='next_cap_ptr',
            field_type=int)
        self.__capability_version:pcie_config_reg_capabilities_power_na_pointer_capability_version_cls = pcie_config_reg_capabilities_power_na_pointer_capability_version_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=4,
                lsb=16,
                msb=19,
                low=16,
                high=19),
            misc_props=FieldMiscProps(
                default=2,
                is_volatile=False),
            logger_handle=logger_handle+'.capability_version',
            inst_name='capability_version',
            field_type=int)
        self.__device_port_type:pcie_config_reg_capabilities_power_na_pointer_device_port_type_cls = pcie_config_reg_capabilities_power_na_pointer_device_port_type_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=4,
                lsb=20,
                msb=23,
                low=20,
                high=23),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.device_port_type',
            inst_name='device_port_type',
            field_type=int)
        self.__slot_implemented:pcie_config_reg_capabilities_power_na_pointer_slot_implemented_cls = pcie_config_reg_capabilities_power_na_pointer_slot_implemented_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=24,
                msb=24,
                low=24,
                high=24),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.slot_implemented',
            inst_name='slot_implemented',
            field_type=int)
        self.__interrupt_msg_number:pcie_config_reg_capabilities_power_na_pointer_interrupt_msg_number_cls = pcie_config_reg_capabilities_power_na_pointer_interrupt_msg_number_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=5,
                lsb=25,
                msb=29,
                low=25,
                high=29),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.interrupt_msg_number',
            inst_name='interrupt_msg_number',
            field_type=int)
        self.__Undefined:pcie_config_reg_capabilities_power_na_pointer_Undefined_cls = pcie_config_reg_capabilities_power_na_pointer_Undefined_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=30,
                msb=30,
                low=30,
                high=30),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.Undefined',
            inst_name='Undefined',
            field_type=int)
        self.__RsvdP:pcie_config_reg_capabilities_power_na_pointer_RsvdP_cls = pcie_config_reg_capabilities_power_na_pointer_RsvdP_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=31,
                msb=31,
                low=31,
                high=31),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.RsvdP',
            inst_name='RsvdP',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.capabilities_id
        yield self.next_cap_ptr
        yield self.capability_version
        yield self.device_port_type
        yield self.slot_implemented
        yield self.interrupt_msg_number
        yield self.Undefined
        yield self.RsvdP
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def capabilities_id(self) -> pcie_config_reg_capabilities_power_na_pointer_capabilities_id_cls:
        """
        Property to access capabilities_id field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Capabilities id</p>                                             |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__capabilities_id
    @property
    def next_cap_ptr(self) -> pcie_config_reg_capabilities_power_na_pointer_next_cap_ptr_cls:
        """
        Property to access next_cap_ptr field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>next capability pointer</p>                                     |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__next_cap_ptr
    @property
    def capability_version(self) -> pcie_config_reg_capabilities_power_na_pointer_capability_version_cls:
        """
        Property to access capability_version field of the register

        
        """
        return self.__capability_version
    @property
    def device_port_type(self) -> pcie_config_reg_capabilities_power_na_pointer_device_port_type_cls:
        """
        Property to access device_port_type field of the register

        
        """
        return self.__device_port_type
    @property
    def slot_implemented(self) -> pcie_config_reg_capabilities_power_na_pointer_slot_implemented_cls:
        """
        Property to access slot_implemented field of the register

        
        """
        return self.__slot_implemented
    @property
    def interrupt_msg_number(self) -> pcie_config_reg_capabilities_power_na_pointer_interrupt_msg_number_cls:
        """
        Property to access interrupt_msg_number field of the register

        
        """
        return self.__interrupt_msg_number
    @property
    def Undefined(self) -> pcie_config_reg_capabilities_power_na_pointer_Undefined_cls:
        """
        Property to access Undefined field of the register

        
        """
        return self.__Undefined
    @property
    def RsvdP(self) -> pcie_config_reg_capabilities_power_na_pointer_RsvdP_cls:
        """
        Property to access RsvdP field of the register

        
        """
        return self.__RsvdP

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'capabilities_id':'capabilities_id','next_cap_ptr':'next_cap_ptr','capability_version':'capability_version','device_port_type':'device_port_type','slot_implemented':'slot_implemented','interrupt_msg_number':'interrupt_msg_number','Undefined':'Undefined','RsvdP':'RsvdP',
            }

    
    
    
    
    
    
    # nodes:8
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["capabilities_id"]) -> pcie_config_reg_capabilities_power_na_pointer_capabilities_id_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["next_cap_ptr"]) -> pcie_config_reg_capabilities_power_na_pointer_next_cap_ptr_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["capability_version"]) -> pcie_config_reg_capabilities_power_na_pointer_capability_version_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["device_port_type"]) -> pcie_config_reg_capabilities_power_na_pointer_device_port_type_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["slot_implemented"]) -> pcie_config_reg_capabilities_power_na_pointer_slot_implemented_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["interrupt_msg_number"]) -> pcie_config_reg_capabilities_power_na_pointer_interrupt_msg_number_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["Undefined"]) -> pcie_config_reg_capabilities_power_na_pointer_Undefined_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["RsvdP"]) -> pcie_config_reg_capabilities_power_na_pointer_RsvdP_cls: ...
                

    @overload
    def get_child_by_system_rdl_name(self, name: str) -> Union[pcie_config_reg_capabilities_power_na_pointer_capabilities_id_cls, pcie_config_reg_capabilities_power_na_pointer_next_cap_ptr_cls, pcie_config_reg_capabilities_power_na_pointer_capability_version_cls, pcie_config_reg_capabilities_power_na_pointer_device_port_type_cls, pcie_config_reg_capabilities_power_na_pointer_slot_implemented_cls, pcie_config_reg_capabilities_power_na_pointer_interrupt_msg_number_cls, pcie_config_reg_capabilities_power_na_pointer_Undefined_cls, pcie_config_reg_capabilities_power_na_pointer_RsvdP_cls, ]: ...

    def get_child_by_system_rdl_name(self, name: Any) -> Any:
        return super().get_child_by_system_rdl_name(name)
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "PCI Express Capabilities Register "
    
    

    
    
    
class pcie_config_reg_power_management_pointer_data_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_power_management_pointer_bus_pwr_clk_ctrl_en_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_power_management_pointer_b2_b3_support_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_power_management_pointer_pme_status_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_power_management_pointer_data_scale_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_power_management_pointer_data_select_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_power_management_pointer_pme_enable_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_power_management_pointer_power_state_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
class pcie_config_reg_power_management_pointer_cls(RegAsyncReadWrite):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      power management                                                   |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__power_state', '__pme_enable', '__data_select', '__data_scale', '__pme_status', '__b2_b3_support', '__bus_pwr_clk_ctrl_en', '__data']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,MemoryAsyncReadWrite]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__power_state:pcie_config_reg_power_management_pointer_power_state_cls = pcie_config_reg_power_management_pointer_power_state_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=2,
                lsb=0,
                msb=1,
                low=0,
                high=1),
            misc_props=FieldMiscProps(
                default=None,
                is_volatile=False),
            logger_handle=logger_handle+'.power_state',
            inst_name='power_state',
            field_type=int)
        self.__pme_enable:pcie_config_reg_power_management_pointer_pme_enable_cls = pcie_config_reg_power_management_pointer_pme_enable_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=3,
                msb=3,
                low=3,
                high=3),
            misc_props=FieldMiscProps(
                default=None,
                is_volatile=False),
            logger_handle=logger_handle+'.pme_enable',
            inst_name='pme_enable',
            field_type=int)
        self.__data_select:pcie_config_reg_power_management_pointer_data_select_cls = pcie_config_reg_power_management_pointer_data_select_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=4,
                lsb=9,
                msb=12,
                low=9,
                high=12),
            misc_props=FieldMiscProps(
                default=None,
                is_volatile=False),
            logger_handle=logger_handle+'.data_select',
            inst_name='data_select',
            field_type=int)
        self.__data_scale:pcie_config_reg_power_management_pointer_data_scale_cls = pcie_config_reg_power_management_pointer_data_scale_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=2,
                lsb=13,
                msb=14,
                low=13,
                high=14),
            misc_props=FieldMiscProps(
                default=None,
                is_volatile=False),
            logger_handle=logger_handle+'.data_scale',
            inst_name='data_scale',
            field_type=int)
        self.__pme_status:pcie_config_reg_power_management_pointer_pme_status_cls = pcie_config_reg_power_management_pointer_pme_status_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=15,
                msb=15,
                low=15,
                high=15),
            misc_props=FieldMiscProps(
                default=None,
                is_volatile=False),
            logger_handle=logger_handle+'.pme_status',
            inst_name='pme_status',
            field_type=int)
        self.__b2_b3_support:pcie_config_reg_power_management_pointer_b2_b3_support_cls = pcie_config_reg_power_management_pointer_b2_b3_support_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=22,
                msb=22,
                low=22,
                high=22),
            misc_props=FieldMiscProps(
                default=None,
                is_volatile=False),
            logger_handle=logger_handle+'.b2_b3_support',
            inst_name='b2_b3_support',
            field_type=int)
        self.__bus_pwr_clk_ctrl_en:pcie_config_reg_power_management_pointer_bus_pwr_clk_ctrl_en_cls = pcie_config_reg_power_management_pointer_bus_pwr_clk_ctrl_en_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=23,
                msb=23,
                low=23,
                high=23),
            misc_props=FieldMiscProps(
                default=None,
                is_volatile=False),
            logger_handle=logger_handle+'.bus_pwr_clk_ctrl_en',
            inst_name='bus_pwr_clk_ctrl_en',
            field_type=int)
        self.__data:pcie_config_reg_power_management_pointer_data_cls = pcie_config_reg_power_management_pointer_data_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=24,
                msb=31,
                low=24,
                high=31),
            misc_props=FieldMiscProps(
                default=None,
                is_volatile=False),
            logger_handle=logger_handle+'.data',
            inst_name='data',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.power_state
        yield self.pme_enable
        yield self.data_select
        yield self.data_scale
        yield self.pme_status
        yield self.b2_b3_support
        yield self.bus_pwr_clk_ctrl_en
        yield self.data
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def power_state(self) -> pcie_config_reg_power_management_pointer_power_state_cls:
        """
        Property to access power_state field of the register

        
        """
        return self.__power_state
    @property
    def pme_enable(self) -> pcie_config_reg_power_management_pointer_pme_enable_cls:
        """
        Property to access pme_enable field of the register

        
        """
        return self.__pme_enable
    @property
    def data_select(self) -> pcie_config_reg_power_management_pointer_data_select_cls:
        """
        Property to access data_select field of the register

        
        """
        return self.__data_select
    @property
    def data_scale(self) -> pcie_config_reg_power_management_pointer_data_scale_cls:
        """
        Property to access data_scale field of the register

        
        """
        return self.__data_scale
    @property
    def pme_status(self) -> pcie_config_reg_power_management_pointer_pme_status_cls:
        """
        Property to access pme_status field of the register

        
        """
        return self.__pme_status
    @property
    def b2_b3_support(self) -> pcie_config_reg_power_management_pointer_b2_b3_support_cls:
        """
        Property to access b2_b3_support field of the register

        
        """
        return self.__b2_b3_support
    @property
    def bus_pwr_clk_ctrl_en(self) -> pcie_config_reg_power_management_pointer_bus_pwr_clk_ctrl_en_cls:
        """
        Property to access bus_pwr_clk_ctrl_en field of the register

        
        """
        return self.__bus_pwr_clk_ctrl_en
    @property
    def data(self) -> pcie_config_reg_power_management_pointer_data_cls:
        """
        Property to access data field of the register

        
        """
        return self.__data

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'power_state':'power_state','pme_enable':'pme_enable','data_select':'data_select','data_scale':'data_scale','pme_status':'pme_status','b2_b3_support':'b2_b3_support','bus_pwr_clk_ctrl_en':'bus_pwr_clk_ctrl_en','data':'data',
            }

    
    
    
    
    
    
    # nodes:8
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["power_state"]) -> pcie_config_reg_power_management_pointer_power_state_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["pme_enable"]) -> pcie_config_reg_power_management_pointer_pme_enable_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["data_select"]) -> pcie_config_reg_power_management_pointer_data_select_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["data_scale"]) -> pcie_config_reg_power_management_pointer_data_scale_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["pme_status"]) -> pcie_config_reg_power_management_pointer_pme_status_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["b2_b3_support"]) -> pcie_config_reg_power_management_pointer_b2_b3_support_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["bus_pwr_clk_ctrl_en"]) -> pcie_config_reg_power_management_pointer_bus_pwr_clk_ctrl_en_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["data"]) -> pcie_config_reg_power_management_pointer_data_cls: ...
                

    @overload
    def get_child_by_system_rdl_name(self, name: str) -> Union[pcie_config_reg_power_management_pointer_power_state_cls, pcie_config_reg_power_management_pointer_pme_enable_cls, pcie_config_reg_power_management_pointer_data_select_cls, pcie_config_reg_power_management_pointer_data_scale_cls, pcie_config_reg_power_management_pointer_pme_status_cls, pcie_config_reg_power_management_pointer_b2_b3_support_cls, pcie_config_reg_power_management_pointer_bus_pwr_clk_ctrl_en_cls, pcie_config_reg_power_management_pointer_data_cls, ]: ...

    def get_child_by_system_rdl_name(self, name: Any) -> Any:
        return super().get_child_by_system_rdl_name(name)
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "power management"
    
    

    
    
    
class pcie_config_reg_capabilities_power_mngt_pointer_pme_support_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_capabilities_power_mngt_pointer_d2_support_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_capabilities_power_mngt_pointer_d1_support_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_capabilities_power_mngt_pointer_aux_current_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_capabilities_power_mngt_pointer_dev_spec_init_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_capabilities_power_mngt_pointer_pme_clock_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_capabilities_power_mngt_pointer_version_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    
    """

    __slots__ : list[str] = []

    

    
    

    
    

    
    
    
class pcie_config_reg_capabilities_power_mngt_pointer_next_cap_ptr_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>next capability pointer</p>                                     |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "next capability pointer"
    
    

    
    
    
class pcie_config_reg_capabilities_power_mngt_pointer_capabilities_id_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Capabilities id</p>                                             |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Capabilities id"
    
    

    
    
class pcie_config_reg_capabilities_power_mngt_pointer_cls(RegAsyncReadWrite):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      capabilities pointer                                               |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__capabilities_id', '__next_cap_ptr', '__version', '__pme_clock', '__dev_spec_init', '__aux_current', '__d1_support', '__d2_support', '__pme_support']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,MemoryAsyncReadWrite]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__capabilities_id:pcie_config_reg_capabilities_power_mngt_pointer_capabilities_id_cls = pcie_config_reg_capabilities_power_mngt_pointer_capabilities_id_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=0,
                msb=7,
                low=0,
                high=7),
            misc_props=FieldMiscProps(
                default=1,
                is_volatile=False),
            logger_handle=logger_handle+'.capabilities_id',
            inst_name='capabilities_id',
            field_type=int)
        self.__next_cap_ptr:pcie_config_reg_capabilities_power_mngt_pointer_next_cap_ptr_cls = pcie_config_reg_capabilities_power_mngt_pointer_next_cap_ptr_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=8,
                msb=15,
                low=8,
                high=15),
            misc_props=FieldMiscProps(
                default=72,
                is_volatile=False),
            logger_handle=logger_handle+'.next_cap_ptr',
            inst_name='next_cap_ptr',
            field_type=int)
        self.__version:pcie_config_reg_capabilities_power_mngt_pointer_version_cls = pcie_config_reg_capabilities_power_mngt_pointer_version_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=3,
                lsb=16,
                msb=18,
                low=16,
                high=18),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.version',
            inst_name='version',
            field_type=int)
        self.__pme_clock:pcie_config_reg_capabilities_power_mngt_pointer_pme_clock_cls = pcie_config_reg_capabilities_power_mngt_pointer_pme_clock_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=19,
                msb=19,
                low=19,
                high=19),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.pme_clock',
            inst_name='pme_clock',
            field_type=int)
        self.__dev_spec_init:pcie_config_reg_capabilities_power_mngt_pointer_dev_spec_init_cls = pcie_config_reg_capabilities_power_mngt_pointer_dev_spec_init_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=21,
                msb=21,
                low=21,
                high=21),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.dev_spec_init',
            inst_name='dev_spec_init',
            field_type=int)
        self.__aux_current:pcie_config_reg_capabilities_power_mngt_pointer_aux_current_cls = pcie_config_reg_capabilities_power_mngt_pointer_aux_current_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=3,
                lsb=22,
                msb=24,
                low=22,
                high=24),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.aux_current',
            inst_name='aux_current',
            field_type=int)
        self.__d1_support:pcie_config_reg_capabilities_power_mngt_pointer_d1_support_cls = pcie_config_reg_capabilities_power_mngt_pointer_d1_support_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=25,
                msb=25,
                low=25,
                high=25),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.d1_support',
            inst_name='d1_support',
            field_type=int)
        self.__d2_support:pcie_config_reg_capabilities_power_mngt_pointer_d2_support_cls = pcie_config_reg_capabilities_power_mngt_pointer_d2_support_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=26,
                msb=26,
                low=26,
                high=26),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.d2_support',
            inst_name='d2_support',
            field_type=int)
        self.__pme_support:pcie_config_reg_capabilities_power_mngt_pointer_pme_support_cls = pcie_config_reg_capabilities_power_mngt_pointer_pme_support_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=5,
                lsb=27,
                msb=31,
                low=27,
                high=31),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.pme_support',
            inst_name='pme_support',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.capabilities_id
        yield self.next_cap_ptr
        yield self.version
        yield self.pme_clock
        yield self.dev_spec_init
        yield self.aux_current
        yield self.d1_support
        yield self.d2_support
        yield self.pme_support
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def capabilities_id(self) -> pcie_config_reg_capabilities_power_mngt_pointer_capabilities_id_cls:
        """
        Property to access capabilities_id field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Capabilities id</p>                                             |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__capabilities_id
    @property
    def next_cap_ptr(self) -> pcie_config_reg_capabilities_power_mngt_pointer_next_cap_ptr_cls:
        """
        Property to access next_cap_ptr field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>next capability pointer</p>                                     |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__next_cap_ptr
    @property
    def version(self) -> pcie_config_reg_capabilities_power_mngt_pointer_version_cls:
        """
        Property to access version field of the register

        
        """
        return self.__version
    @property
    def pme_clock(self) -> pcie_config_reg_capabilities_power_mngt_pointer_pme_clock_cls:
        """
        Property to access pme_clock field of the register

        
        """
        return self.__pme_clock
    @property
    def dev_spec_init(self) -> pcie_config_reg_capabilities_power_mngt_pointer_dev_spec_init_cls:
        """
        Property to access dev_spec_init field of the register

        
        """
        return self.__dev_spec_init
    @property
    def aux_current(self) -> pcie_config_reg_capabilities_power_mngt_pointer_aux_current_cls:
        """
        Property to access aux_current field of the register

        
        """
        return self.__aux_current
    @property
    def d1_support(self) -> pcie_config_reg_capabilities_power_mngt_pointer_d1_support_cls:
        """
        Property to access d1_support field of the register

        
        """
        return self.__d1_support
    @property
    def d2_support(self) -> pcie_config_reg_capabilities_power_mngt_pointer_d2_support_cls:
        """
        Property to access d2_support field of the register

        
        """
        return self.__d2_support
    @property
    def pme_support(self) -> pcie_config_reg_capabilities_power_mngt_pointer_pme_support_cls:
        """
        Property to access pme_support field of the register

        
        """
        return self.__pme_support

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'capabilities_id':'capabilities_id','next_cap_ptr':'next_cap_ptr','version':'version','pme_clock':'pme_clock','dev_spec_init':'dev_spec_init','aux_current':'aux_current','d1_support':'d1_support','d2_support':'d2_support','pme_support':'pme_support',
            }

    
    
    
    
    
    
    # nodes:9
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["capabilities_id"]) -> pcie_config_reg_capabilities_power_mngt_pointer_capabilities_id_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["next_cap_ptr"]) -> pcie_config_reg_capabilities_power_mngt_pointer_next_cap_ptr_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["version"]) -> pcie_config_reg_capabilities_power_mngt_pointer_version_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["pme_clock"]) -> pcie_config_reg_capabilities_power_mngt_pointer_pme_clock_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["dev_spec_init"]) -> pcie_config_reg_capabilities_power_mngt_pointer_dev_spec_init_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["aux_current"]) -> pcie_config_reg_capabilities_power_mngt_pointer_aux_current_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["d1_support"]) -> pcie_config_reg_capabilities_power_mngt_pointer_d1_support_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["d2_support"]) -> pcie_config_reg_capabilities_power_mngt_pointer_d2_support_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["pme_support"]) -> pcie_config_reg_capabilities_power_mngt_pointer_pme_support_cls: ...
                

    @overload
    def get_child_by_system_rdl_name(self, name: str) -> Union[pcie_config_reg_capabilities_power_mngt_pointer_capabilities_id_cls, pcie_config_reg_capabilities_power_mngt_pointer_next_cap_ptr_cls, pcie_config_reg_capabilities_power_mngt_pointer_version_cls, pcie_config_reg_capabilities_power_mngt_pointer_pme_clock_cls, pcie_config_reg_capabilities_power_mngt_pointer_dev_spec_init_cls, pcie_config_reg_capabilities_power_mngt_pointer_aux_current_cls, pcie_config_reg_capabilities_power_mngt_pointer_d1_support_cls, pcie_config_reg_capabilities_power_mngt_pointer_d2_support_cls, pcie_config_reg_capabilities_power_mngt_pointer_pme_support_cls, ]: ...

    def get_child_by_system_rdl_name(self, name: Any) -> Any:
        return super().get_child_by_system_rdl_name(name)
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "capabilities pointer"
    
    

    
    
    
class pcie_config_reg_byte_offset_3C_max_lat_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Max Lat</p>                                                     |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Max Lat"
    
    

    
    
    
class pcie_config_reg_byte_offset_3C_min_gnt_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Min Gnt</p>                                                     |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Min Gnt"
    
    

    
    
    
class pcie_config_reg_byte_offset_3C_interrupt_pin_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Interrupt Pin Register</p>                                      |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Interrupt Pin Register"
    
    

    
    
    
class pcie_config_reg_byte_offset_3C_interrupt_line_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Interrupt Line Register</p>                                     |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Interrupt Line Register"
    
    

    
    
class pcie_config_reg_byte_offset_3C_cls(RegAsyncReadWrite):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Byte Offset 3C                                                     |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__interrupt_line', '__interrupt_pin', '__min_gnt', '__max_lat']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,MemoryAsyncReadWrite]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__interrupt_line:pcie_config_reg_byte_offset_3C_interrupt_line_cls = pcie_config_reg_byte_offset_3C_interrupt_line_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=0,
                msb=7,
                low=0,
                high=7),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=True),
            logger_handle=logger_handle+'.interrupt_line',
            inst_name='interrupt_line',
            field_type=int)
        self.__interrupt_pin:pcie_config_reg_byte_offset_3C_interrupt_pin_cls = pcie_config_reg_byte_offset_3C_interrupt_pin_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=8,
                msb=15,
                low=8,
                high=15),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=True),
            logger_handle=logger_handle+'.interrupt_pin',
            inst_name='interrupt_pin',
            field_type=int)
        self.__min_gnt:pcie_config_reg_byte_offset_3C_min_gnt_cls = pcie_config_reg_byte_offset_3C_min_gnt_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=16,
                msb=23,
                low=16,
                high=23),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.min_gnt',
            inst_name='min_gnt',
            field_type=int)
        self.__max_lat:pcie_config_reg_byte_offset_3C_max_lat_cls = pcie_config_reg_byte_offset_3C_max_lat_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=24,
                msb=31,
                low=24,
                high=31),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.max_lat',
            inst_name='max_lat',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.interrupt_line
        yield self.interrupt_pin
        yield self.min_gnt
        yield self.max_lat
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def interrupt_line(self) -> pcie_config_reg_byte_offset_3C_interrupt_line_cls:
        """
        Property to access interrupt_line field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Interrupt Line Register</p>                                     |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__interrupt_line
    @property
    def interrupt_pin(self) -> pcie_config_reg_byte_offset_3C_interrupt_pin_cls:
        """
        Property to access interrupt_pin field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Interrupt Pin Register</p>                                      |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__interrupt_pin
    @property
    def min_gnt(self) -> pcie_config_reg_byte_offset_3C_min_gnt_cls:
        """
        Property to access min_gnt field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Min Gnt</p>                                                     |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__min_gnt
    @property
    def max_lat(self) -> pcie_config_reg_byte_offset_3C_max_lat_cls:
        """
        Property to access max_lat field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Max Lat</p>                                                     |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__max_lat

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'interrupt_line':'interrupt_line','interrupt_pin':'interrupt_pin','min_gnt':'min_gnt','max_lat':'max_lat',
            }

    
    
    
    
    
    
    # nodes:4
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["interrupt_line"]) -> pcie_config_reg_byte_offset_3C_interrupt_line_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["interrupt_pin"]) -> pcie_config_reg_byte_offset_3C_interrupt_pin_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["min_gnt"]) -> pcie_config_reg_byte_offset_3C_min_gnt_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["max_lat"]) -> pcie_config_reg_byte_offset_3C_max_lat_cls: ...
                

    @overload
    def get_child_by_system_rdl_name(self, name: str) -> Union[pcie_config_reg_byte_offset_3C_interrupt_line_cls, pcie_config_reg_byte_offset_3C_interrupt_pin_cls, pcie_config_reg_byte_offset_3C_min_gnt_cls, pcie_config_reg_byte_offset_3C_max_lat_cls, ]: ...

    def get_child_by_system_rdl_name(self, name: Any) -> Any:
        return super().get_child_by_system_rdl_name(name)
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Byte Offset 3C"
    
    

    
    
    
class pcie_config_reg_capabilities_pointer_capabilities_ptr_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>capabilities_pointer</p>                                        |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "capabilities_pointer"
    
    

    
    
class pcie_config_reg_capabilities_pointer_cls(RegAsyncReadOnly):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      capabilities_pointer                                               |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__capabilities_ptr']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,ReadableAsyncMemory]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__capabilities_ptr:pcie_config_reg_capabilities_pointer_capabilities_ptr_cls = pcie_config_reg_capabilities_pointer_capabilities_ptr_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=0,
                msb=7,
                low=0,
                high=7),
            misc_props=FieldMiscProps(
                default=64,
                is_volatile=False),
            logger_handle=logger_handle+'.capabilities_ptr',
            inst_name='capabilities_ptr',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.capabilities_ptr
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def capabilities_ptr(self) -> pcie_config_reg_capabilities_pointer_capabilities_ptr_cls:
        """
        Property to access capabilities_ptr field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>capabilities_pointer</p>                                        |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__capabilities_ptr

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'capabilities_ptr':'capabilities_ptr',
            }

    
    
    
    
    
    
                
    def get_child_by_system_rdl_name(self, name: Any) -> pcie_config_reg_capabilities_pointer_capabilities_ptr_cls:
        return super().get_child_by_system_rdl_name(name)
                
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "capabilities_pointer"
    
    

    
    
    
class pcie_config_reg_byte_offset_2C_Device_ID_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Subsystem ID</p>                                                |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Subsystem ID"
    
    

    
    
    
class pcie_config_reg_byte_offset_2C_Vendor_ID_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Subsystem Vendor ID</p>                                         |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Subsystem Vendor ID"
    
    

    
    
class pcie_config_reg_byte_offset_2C_cls(RegAsyncReadOnly):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Byte Offset 2C                                                     |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__Vendor_ID', '__Device_ID']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,ReadableAsyncMemory]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__Vendor_ID:pcie_config_reg_byte_offset_2C_Vendor_ID_cls = pcie_config_reg_byte_offset_2C_Vendor_ID_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=16,
                lsb=0,
                msb=15,
                low=0,
                high=15),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.Vendor_ID',
            inst_name='Vendor_ID',
            field_type=int)
        self.__Device_ID:pcie_config_reg_byte_offset_2C_Device_ID_cls = pcie_config_reg_byte_offset_2C_Device_ID_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=16,
                lsb=16,
                msb=31,
                low=16,
                high=31),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.Device_ID',
            inst_name='Device_ID',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.Vendor_ID
        yield self.Device_ID
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def Vendor_ID(self) -> pcie_config_reg_byte_offset_2C_Vendor_ID_cls:
        """
        Property to access Vendor_ID field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Subsystem Vendor ID</p>                                         |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__Vendor_ID
    @property
    def Device_ID(self) -> pcie_config_reg_byte_offset_2C_Device_ID_cls:
        """
        Property to access Device_ID field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Subsystem ID</p>                                                |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__Device_ID

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'Vendor_ID':'Vendor_ID','Device_ID':'Device_ID',
            }

    
    
    
    
    
    
    # nodes:2
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["Vendor_ID"]) -> pcie_config_reg_byte_offset_2C_Vendor_ID_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["Device_ID"]) -> pcie_config_reg_byte_offset_2C_Device_ID_cls: ...
                

    @overload
    def get_child_by_system_rdl_name(self, name: str) -> Union[pcie_config_reg_byte_offset_2C_Vendor_ID_cls, pcie_config_reg_byte_offset_2C_Device_ID_cls, ]: ...

    def get_child_by_system_rdl_name(self, name: Any) -> Any:
        return super().get_child_by_system_rdl_name(name)
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Byte Offset 2C"
    
    

    
    
    
class pcie_config_reg_cardbus_cis_pointer_word_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>word</p>                                                        |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "word"
    
    

    
    
class pcie_config_reg_cardbus_cis_pointer_cls(RegAsyncReadWrite):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Cardbus CIS Pointer                                                |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__word']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,MemoryAsyncReadWrite]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__word:pcie_config_reg_cardbus_cis_pointer_word_cls = pcie_config_reg_cardbus_cis_pointer_word_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=32,
                lsb=0,
                msb=31,
                low=0,
                high=31),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=True),
            logger_handle=logger_handle+'.word',
            inst_name='word',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.word
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def word(self) -> pcie_config_reg_cardbus_cis_pointer_word_cls:
        """
        Property to access word field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>word</p>                                                        |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__word

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'word':'word',
            }

    
    
    
    
    
    
                
    def get_child_by_system_rdl_name(self, name: Any) -> pcie_config_reg_cardbus_cis_pointer_word_cls:
        return super().get_child_by_system_rdl_name(name)
                
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Cardbus CIS Pointer"
    
    

    
    
    
class pcie_config_reg_base_ddress_register_5_BAR_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>BAR</p>                                                         |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "BAR"
    
    

    
    
class pcie_config_reg_base_ddress_register_5_cls(RegAsyncReadWrite):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Base Address Register 5                                            |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__BAR']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,MemoryAsyncReadWrite]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__BAR:pcie_config_reg_base_ddress_register_5_BAR_cls = pcie_config_reg_base_ddress_register_5_BAR_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=32,
                lsb=0,
                msb=31,
                low=0,
                high=31),
            misc_props=FieldMiscProps(
                default=805306368,
                is_volatile=True),
            logger_handle=logger_handle+'.BAR',
            inst_name='BAR',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.BAR
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def BAR(self) -> pcie_config_reg_base_ddress_register_5_BAR_cls:
        """
        Property to access BAR field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>BAR</p>                                                         |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__BAR

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'BAR':'BAR',
            }

    
    
    
    
    
    
                
    def get_child_by_system_rdl_name(self, name: Any) -> pcie_config_reg_base_ddress_register_5_BAR_cls:
        return super().get_child_by_system_rdl_name(name)
                
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Base Address Register 5"
    
    

    
    
    
class pcie_config_reg_base_ddress_register_4_BAR_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>BAR</p>                                                         |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "BAR"
    
    

    
    
class pcie_config_reg_base_ddress_register_4_cls(RegAsyncReadWrite):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Base Address Register 4                                            |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__BAR']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,MemoryAsyncReadWrite]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__BAR:pcie_config_reg_base_ddress_register_4_BAR_cls = pcie_config_reg_base_ddress_register_4_BAR_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=32,
                lsb=0,
                msb=31,
                low=0,
                high=31),
            misc_props=FieldMiscProps(
                default=805306368,
                is_volatile=True),
            logger_handle=logger_handle+'.BAR',
            inst_name='BAR',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.BAR
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def BAR(self) -> pcie_config_reg_base_ddress_register_4_BAR_cls:
        """
        Property to access BAR field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>BAR</p>                                                         |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__BAR

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'BAR':'BAR',
            }

    
    
    
    
    
    
                
    def get_child_by_system_rdl_name(self, name: Any) -> pcie_config_reg_base_ddress_register_4_BAR_cls:
        return super().get_child_by_system_rdl_name(name)
                
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Base Address Register 4"
    
    

    
    
    
class pcie_config_reg_base_ddress_register_3_BAR_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>BAR</p>                                                         |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "BAR"
    
    

    
    
class pcie_config_reg_base_ddress_register_3_cls(RegAsyncReadWrite):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Base Address Register 3                                            |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__BAR']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,MemoryAsyncReadWrite]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__BAR:pcie_config_reg_base_ddress_register_3_BAR_cls = pcie_config_reg_base_ddress_register_3_BAR_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=32,
                lsb=0,
                msb=31,
                low=0,
                high=31),
            misc_props=FieldMiscProps(
                default=553648128,
                is_volatile=True),
            logger_handle=logger_handle+'.BAR',
            inst_name='BAR',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.BAR
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def BAR(self) -> pcie_config_reg_base_ddress_register_3_BAR_cls:
        """
        Property to access BAR field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>BAR</p>                                                         |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__BAR

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'BAR':'BAR',
            }

    
    
    
    
    
    
                
    def get_child_by_system_rdl_name(self, name: Any) -> pcie_config_reg_base_ddress_register_3_BAR_cls:
        return super().get_child_by_system_rdl_name(name)
                
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Base Address Register 3"
    
    

    
    
    
class pcie_config_reg_base_ddress_register_2_BAR_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>BAR</p>                                                         |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "BAR"
    
    

    
    
class pcie_config_reg_base_ddress_register_2_cls(RegAsyncReadWrite):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Base Address Register 2                                            |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__BAR']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,MemoryAsyncReadWrite]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__BAR:pcie_config_reg_base_ddress_register_2_BAR_cls = pcie_config_reg_base_ddress_register_2_BAR_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=32,
                lsb=0,
                msb=31,
                low=0,
                high=31),
            misc_props=FieldMiscProps(
                default=536870912,
                is_volatile=True),
            logger_handle=logger_handle+'.BAR',
            inst_name='BAR',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.BAR
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def BAR(self) -> pcie_config_reg_base_ddress_register_2_BAR_cls:
        """
        Property to access BAR field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>BAR</p>                                                         |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__BAR

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'BAR':'BAR',
            }

    
    
    
    
    
    
                
    def get_child_by_system_rdl_name(self, name: Any) -> pcie_config_reg_base_ddress_register_2_BAR_cls:
        return super().get_child_by_system_rdl_name(name)
                
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Base Address Register 2"
    
    

    
    
    
class pcie_config_reg_base_ddress_register_1_base_adress_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>base address</p>                                                |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "base address"
    
    

    
    
    
class pcie_config_reg_base_ddress_register_1_prefetchable_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>prefetchable</p>                                                |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "prefetchable"
    
    

    
    
    
class pcie_config_reg_base_ddress_register_1_locatable_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Locatable</p>                                                   |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Locatable"
    
    

    
    
    
class pcie_config_reg_base_ddress_register_1_region_type_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Region Type</p>                                                 |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Region Type"
    
    

    
    
class pcie_config_reg_base_ddress_register_1_cls(RegAsyncReadOnly):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Base Address Register 1                                            |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__region_type', '__locatable', '__prefetchable', '__base_adress']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,ReadableAsyncMemory]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__region_type:pcie_config_reg_base_ddress_register_1_region_type_cls = pcie_config_reg_base_ddress_register_1_region_type_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=0,
                msb=0,
                low=0,
                high=0),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.region_type',
            inst_name='region_type',
            field_type=int)
        self.__locatable:pcie_config_reg_base_ddress_register_1_locatable_cls = pcie_config_reg_base_ddress_register_1_locatable_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=2,
                lsb=1,
                msb=2,
                low=1,
                high=2),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.locatable',
            inst_name='locatable',
            field_type=int)
        self.__prefetchable:pcie_config_reg_base_ddress_register_1_prefetchable_cls = pcie_config_reg_base_ddress_register_1_prefetchable_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=3,
                msb=3,
                low=3,
                high=3),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.prefetchable',
            inst_name='prefetchable',
            field_type=int)
        self.__base_adress:pcie_config_reg_base_ddress_register_1_base_adress_cls = pcie_config_reg_base_ddress_register_1_base_adress_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=28,
                lsb=4,
                msb=31,
                low=4,
                high=31),
            misc_props=FieldMiscProps(
                default=268369920,
                is_volatile=False),
            logger_handle=logger_handle+'.base_adress',
            inst_name='base_adress',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.region_type
        yield self.locatable
        yield self.prefetchable
        yield self.base_adress
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def region_type(self) -> pcie_config_reg_base_ddress_register_1_region_type_cls:
        """
        Property to access region_type field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Region Type</p>                                                 |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__region_type
    @property
    def locatable(self) -> pcie_config_reg_base_ddress_register_1_locatable_cls:
        """
        Property to access locatable field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Locatable</p>                                                   |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__locatable
    @property
    def prefetchable(self) -> pcie_config_reg_base_ddress_register_1_prefetchable_cls:
        """
        Property to access prefetchable field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>prefetchable</p>                                                |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__prefetchable
    @property
    def base_adress(self) -> pcie_config_reg_base_ddress_register_1_base_adress_cls:
        """
        Property to access base_adress field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>base address</p>                                                |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__base_adress

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'region_type':'region_type','locatable':'locatable','prefetchable':'prefetchable','base_adress':'base_adress',
            }

    
    
    
    
    
    
    # nodes:4
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["region_type"]) -> pcie_config_reg_base_ddress_register_1_region_type_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["locatable"]) -> pcie_config_reg_base_ddress_register_1_locatable_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["prefetchable"]) -> pcie_config_reg_base_ddress_register_1_prefetchable_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["base_adress"]) -> pcie_config_reg_base_ddress_register_1_base_adress_cls: ...
                

    @overload
    def get_child_by_system_rdl_name(self, name: str) -> Union[pcie_config_reg_base_ddress_register_1_region_type_cls, pcie_config_reg_base_ddress_register_1_locatable_cls, pcie_config_reg_base_ddress_register_1_prefetchable_cls, pcie_config_reg_base_ddress_register_1_base_adress_cls, ]: ...

    def get_child_by_system_rdl_name(self, name: Any) -> Any:
        return super().get_child_by_system_rdl_name(name)
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Base Address Register 1"
    
    

    
    
    
class pcie_config_reg_base_address_register_0_base_adress_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>base address</p>                                                |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "base address"
    
    

    
    
    
class pcie_config_reg_base_address_register_0_prefetchable_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>prefetchable</p>                                                |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "prefetchable"
    
    

    
    
    
class pcie_config_reg_base_address_register_0_locatable_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Locatable</p>                                                   |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Locatable"
    
    

    
    
    
class pcie_config_reg_base_address_register_0_region_type_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Region Type</p>                                                 |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Region Type"
    
    

    
    
class pcie_config_reg_base_address_register_0_cls(RegAsyncReadOnly):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Base Address Register 0                                            |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__region_type', '__locatable', '__prefetchable', '__base_adress']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,ReadableAsyncMemory]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__region_type:pcie_config_reg_base_address_register_0_region_type_cls = pcie_config_reg_base_address_register_0_region_type_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=0,
                msb=0,
                low=0,
                high=0),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.region_type',
            inst_name='region_type',
            field_type=int)
        self.__locatable:pcie_config_reg_base_address_register_0_locatable_cls = pcie_config_reg_base_address_register_0_locatable_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=2,
                lsb=1,
                msb=2,
                low=1,
                high=2),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.locatable',
            inst_name='locatable',
            field_type=int)
        self.__prefetchable:pcie_config_reg_base_address_register_0_prefetchable_cls = pcie_config_reg_base_address_register_0_prefetchable_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=3,
                msb=3,
                low=3,
                high=3),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.prefetchable',
            inst_name='prefetchable',
            field_type=int)
        self.__base_adress:pcie_config_reg_base_address_register_0_base_adress_cls = pcie_config_reg_base_address_register_0_base_adress_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=28,
                lsb=4,
                msb=31,
                low=4,
                high=31),
            misc_props=FieldMiscProps(
                default=268369920,
                is_volatile=False),
            logger_handle=logger_handle+'.base_adress',
            inst_name='base_adress',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.region_type
        yield self.locatable
        yield self.prefetchable
        yield self.base_adress
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def region_type(self) -> pcie_config_reg_base_address_register_0_region_type_cls:
        """
        Property to access region_type field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Region Type</p>                                                 |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__region_type
    @property
    def locatable(self) -> pcie_config_reg_base_address_register_0_locatable_cls:
        """
        Property to access locatable field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Locatable</p>                                                   |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__locatable
    @property
    def prefetchable(self) -> pcie_config_reg_base_address_register_0_prefetchable_cls:
        """
        Property to access prefetchable field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>prefetchable</p>                                                |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__prefetchable
    @property
    def base_adress(self) -> pcie_config_reg_base_address_register_0_base_adress_cls:
        """
        Property to access base_adress field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>base address</p>                                                |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__base_adress

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'region_type':'region_type','locatable':'locatable','prefetchable':'prefetchable','base_adress':'base_adress',
            }

    
    
    
    
    
    
    # nodes:4
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["region_type"]) -> pcie_config_reg_base_address_register_0_region_type_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["locatable"]) -> pcie_config_reg_base_address_register_0_locatable_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["prefetchable"]) -> pcie_config_reg_base_address_register_0_prefetchable_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["base_adress"]) -> pcie_config_reg_base_address_register_0_base_adress_cls: ...
                

    @overload
    def get_child_by_system_rdl_name(self, name: str) -> Union[pcie_config_reg_base_address_register_0_region_type_cls, pcie_config_reg_base_address_register_0_locatable_cls, pcie_config_reg_base_address_register_0_prefetchable_cls, pcie_config_reg_base_address_register_0_base_adress_cls, ]: ...

    def get_child_by_system_rdl_name(self, name: Any) -> Any:
        return super().get_child_by_system_rdl_name(name)
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Base Address Register 0"
    
    

    
    
    
class pcie_config_reg_byte_offset_0C_interrupt_pin_register_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Interrupt Pin Register   (Offset 3Dh)</p>                       |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Interrupt Pin Register   (Offset 3Dh)"
    
    

    
    
    
class pcie_config_reg_byte_offset_0C_interrupt_line_register_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Interrupt Line Register  (Offset 3Ch)</p>                       |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Interrupt Line Register  (Offset 3Ch)"
    
    

    
    
    
class pcie_config_reg_byte_offset_0C_latency_timer_register_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Latency Timer Register   (Offset 0Dh)</p>                       |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Latency Timer Register   (Offset 0Dh)"
    
    

    
    
    
class pcie_config_reg_byte_offset_0C_cache_line_size_register_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Cache Line Size Register (Offset 0Ch)</p>                       |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Cache Line Size Register (Offset 0Ch)"
    
    

    
    
class pcie_config_reg_byte_offset_0C_cls(RegAsyncReadWrite):
    """
    Class to represent a register in the register model

    
    """

    __slots__ : list[str] = ['__cache_line_size_register', '__latency_timer_register', '__interrupt_line_register', '__interrupt_pin_register']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,MemoryAsyncReadWrite]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__cache_line_size_register:pcie_config_reg_byte_offset_0C_cache_line_size_register_cls = pcie_config_reg_byte_offset_0C_cache_line_size_register_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=0,
                msb=7,
                low=0,
                high=7),
            misc_props=FieldMiscProps(
                default=None,
                is_volatile=True),
            logger_handle=logger_handle+'.cache_line_size_register',
            inst_name='cache_line_size_register',
            field_type=int)
        self.__latency_timer_register:pcie_config_reg_byte_offset_0C_latency_timer_register_cls = pcie_config_reg_byte_offset_0C_latency_timer_register_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=8,
                msb=15,
                low=8,
                high=15),
            misc_props=FieldMiscProps(
                default=None,
                is_volatile=True),
            logger_handle=logger_handle+'.latency_timer_register',
            inst_name='latency_timer_register',
            field_type=int)
        self.__interrupt_line_register:pcie_config_reg_byte_offset_0C_interrupt_line_register_cls = pcie_config_reg_byte_offset_0C_interrupt_line_register_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=16,
                msb=23,
                low=16,
                high=23),
            misc_props=FieldMiscProps(
                default=None,
                is_volatile=True),
            logger_handle=logger_handle+'.interrupt_line_register',
            inst_name='interrupt_line_register',
            field_type=int)
        self.__interrupt_pin_register:pcie_config_reg_byte_offset_0C_interrupt_pin_register_cls = pcie_config_reg_byte_offset_0C_interrupt_pin_register_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=24,
                msb=31,
                low=24,
                high=31),
            misc_props=FieldMiscProps(
                default=None,
                is_volatile=True),
            logger_handle=logger_handle+'.interrupt_pin_register',
            inst_name='interrupt_pin_register',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.cache_line_size_register
        yield self.latency_timer_register
        yield self.interrupt_line_register
        yield self.interrupt_pin_register
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def cache_line_size_register(self) -> pcie_config_reg_byte_offset_0C_cache_line_size_register_cls:
        """
        Property to access cache_line_size_register field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Cache Line Size Register (Offset 0Ch)</p>                       |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__cache_line_size_register
    @property
    def latency_timer_register(self) -> pcie_config_reg_byte_offset_0C_latency_timer_register_cls:
        """
        Property to access latency_timer_register field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Latency Timer Register   (Offset 0Dh)</p>                       |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__latency_timer_register
    @property
    def interrupt_line_register(self) -> pcie_config_reg_byte_offset_0C_interrupt_line_register_cls:
        """
        Property to access interrupt_line_register field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Interrupt Line Register  (Offset 3Ch)</p>                       |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__interrupt_line_register
    @property
    def interrupt_pin_register(self) -> pcie_config_reg_byte_offset_0C_interrupt_pin_register_cls:
        """
        Property to access interrupt_pin_register field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Interrupt Pin Register   (Offset 3Dh)</p>                       |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__interrupt_pin_register

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'cache_line_size_register':'cache_line_size_register','latency_timer_register':'latency_timer_register','interrupt_line_register':'interrupt_line_register','interrupt_pin_register':'interrupt_pin_register',
            }

    
    
    
    
    
    
    # nodes:4
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["cache_line_size_register"]) -> pcie_config_reg_byte_offset_0C_cache_line_size_register_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["latency_timer_register"]) -> pcie_config_reg_byte_offset_0C_latency_timer_register_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["interrupt_line_register"]) -> pcie_config_reg_byte_offset_0C_interrupt_line_register_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["interrupt_pin_register"]) -> pcie_config_reg_byte_offset_0C_interrupt_pin_register_cls: ...
                

    @overload
    def get_child_by_system_rdl_name(self, name: str) -> Union[pcie_config_reg_byte_offset_0C_cache_line_size_register_cls, pcie_config_reg_byte_offset_0C_latency_timer_register_cls, pcie_config_reg_byte_offset_0C_interrupt_line_register_cls, pcie_config_reg_byte_offset_0C_interrupt_pin_register_cls, ]: ...

    def get_child_by_system_rdl_name(self, name: Any) -> Any:
        return super().get_child_by_system_rdl_name(name)
    


    

    
    

    
    

    
    
    
class pcie_config_reg_byte_offset_08_Class_Code_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Class Code</p>                                                  |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Class Code"
    
    

    
    
    
class pcie_config_reg_byte_offset_08_Revision_ID_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Revision ID</p>                                                 |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Revision ID"
    
    

    
    
class pcie_config_reg_byte_offset_08_cls(RegAsyncReadOnly):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Byte Offset 08                                                     |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__Revision_ID', '__Class_Code']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,ReadableAsyncMemory]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__Revision_ID:pcie_config_reg_byte_offset_08_Revision_ID_cls = pcie_config_reg_byte_offset_08_Revision_ID_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=0,
                msb=7,
                low=0,
                high=7),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.Revision_ID',
            inst_name='Revision_ID',
            field_type=int)
        self.__Class_Code:pcie_config_reg_byte_offset_08_Class_Code_cls = pcie_config_reg_byte_offset_08_Class_Code_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=24,
                lsb=8,
                msb=31,
                low=8,
                high=31),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.Class_Code',
            inst_name='Class_Code',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.Revision_ID
        yield self.Class_Code
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def Revision_ID(self) -> pcie_config_reg_byte_offset_08_Revision_ID_cls:
        """
        Property to access Revision_ID field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Revision ID</p>                                                 |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__Revision_ID
    @property
    def Class_Code(self) -> pcie_config_reg_byte_offset_08_Class_Code_cls:
        """
        Property to access Class_Code field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Class Code</p>                                                  |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__Class_Code

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'Revision_ID':'Revision_ID','Class_Code':'Class_Code',
            }

    
    
    
    
    
    
    # nodes:2
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["Revision_ID"]) -> pcie_config_reg_byte_offset_08_Revision_ID_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["Class_Code"]) -> pcie_config_reg_byte_offset_08_Class_Code_cls: ...
                

    @overload
    def get_child_by_system_rdl_name(self, name: str) -> Union[pcie_config_reg_byte_offset_08_Revision_ID_cls, pcie_config_reg_byte_offset_08_Class_Code_cls, ]: ...

    def get_child_by_system_rdl_name(self, name: Any) -> Any:
        return super().get_child_by_system_rdl_name(name)
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Byte Offset 08"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_detected_parity_error_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>detected_parity_error</p>                                       |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "detected_parity_error"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_signaled_system_error_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>signaled_system_error</p>                                       |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "signaled_system_error"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_received_master_abort_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>received_master_abort</p>                                       |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "received_master_abort"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_received_target_abort_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>received_target_abort</p>                                       |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "received_target_abort"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_signaled_target_abort_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>signaled_target_abort</p>                                       |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "signaled_target_abort"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_devsel_timing_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>devsel_timing</p>                                               |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "devsel_timing"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_master_data_parity_error_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>master_data_parity_error</p>                                    |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "master_data_parity_error"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_fast_b2b_transactions_capable_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>fast_b2b_transactions_capable</p>                               |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "fast_b2b_transactions_capable"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_sixtysix_mhz_capable_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>sixtysix_mhz_capable</p>                                        |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "sixtysix_mhz_capable"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_capabilities_list_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>capabilities_list</p>                                           |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "capabilities_list"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_interrupt_status_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>interrupt_status</p>                                            |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "interrupt_status"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_rsvd_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>unused</p>                                                      |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "unused"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_interrupt_disable_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>interrupt_disable</p>                                           |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "interrupt_disable"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_fast_b2b_transactions_enable_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>fast_b2b_transactions_enable</p>                                |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "fast_b2b_transactions_enable"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_SERR_Enable_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>SERR_Enable</p>                                                 |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "SERR_Enable"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_idsel_step_wait_cycle_control_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>idsel_step_wait_cycle_control</p>                               |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "idsel_step_wait_cycle_control"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_parity_error_response_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>parity_error_response</p>                                       |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "parity_error_response"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_vga_palette_snoop_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>vga_palette_snoop</p>                                           |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "vga_palette_snoop"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_memory_write_invalidate_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>memory_write_invalidate</p>                                     |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "memory_write_invalidate"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_special_cycle_enable_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>special_cycle_enable</p>                                        |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "special_cycle_enable"
    
    

    
    
    
class pcie_config_reg_byte_offset_04_bus_master_enable_cls(FieldAsyncReadWrite):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>bus_master_enable</p>                                           |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "bus_master_enable"
    
    

    
    
class pcie_config_reg_byte_offset_04_cls(RegAsyncReadWrite):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Byte Offset 04                                                     |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__bus_master_enable', '__special_cycle_enable', '__memory_write_invalidate', '__vga_palette_snoop', '__parity_error_response', '__idsel_step_wait_cycle_control', '__SERR_Enable', '__fast_b2b_transactions_enable', '__interrupt_disable', '__rsvd', '__interrupt_status', '__capabilities_list', '__sixtysix_mhz_capable', '__fast_b2b_transactions_capable', '__master_data_parity_error', '__devsel_timing', '__signaled_target_abort', '__received_target_abort', '__received_master_abort', '__signaled_system_error', '__detected_parity_error']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,MemoryAsyncReadWrite]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__bus_master_enable:pcie_config_reg_byte_offset_04_bus_master_enable_cls = pcie_config_reg_byte_offset_04_bus_master_enable_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=2,
                msb=2,
                low=2,
                high=2),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.bus_master_enable',
            inst_name='bus_master_enable',
            field_type=int)
        self.__special_cycle_enable:pcie_config_reg_byte_offset_04_special_cycle_enable_cls = pcie_config_reg_byte_offset_04_special_cycle_enable_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=3,
                msb=3,
                low=3,
                high=3),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.special_cycle_enable',
            inst_name='special_cycle_enable',
            field_type=int)
        self.__memory_write_invalidate:pcie_config_reg_byte_offset_04_memory_write_invalidate_cls = pcie_config_reg_byte_offset_04_memory_write_invalidate_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=4,
                msb=4,
                low=4,
                high=4),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.memory_write_invalidate',
            inst_name='memory_write_invalidate',
            field_type=int)
        self.__vga_palette_snoop:pcie_config_reg_byte_offset_04_vga_palette_snoop_cls = pcie_config_reg_byte_offset_04_vga_palette_snoop_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=5,
                msb=5,
                low=5,
                high=5),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.vga_palette_snoop',
            inst_name='vga_palette_snoop',
            field_type=int)
        self.__parity_error_response:pcie_config_reg_byte_offset_04_parity_error_response_cls = pcie_config_reg_byte_offset_04_parity_error_response_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=6,
                msb=6,
                low=6,
                high=6),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.parity_error_response',
            inst_name='parity_error_response',
            field_type=int)
        self.__idsel_step_wait_cycle_control:pcie_config_reg_byte_offset_04_idsel_step_wait_cycle_control_cls = pcie_config_reg_byte_offset_04_idsel_step_wait_cycle_control_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=7,
                msb=7,
                low=7,
                high=7),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.idsel_step_wait_cycle_control',
            inst_name='idsel_step_wait_cycle_control',
            field_type=int)
        self.__SERR_Enable:pcie_config_reg_byte_offset_04_SERR_Enable_cls = pcie_config_reg_byte_offset_04_SERR_Enable_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=8,
                msb=8,
                low=8,
                high=8),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.SERR_Enable',
            inst_name='SERR_Enable',
            field_type=int)
        self.__fast_b2b_transactions_enable:pcie_config_reg_byte_offset_04_fast_b2b_transactions_enable_cls = pcie_config_reg_byte_offset_04_fast_b2b_transactions_enable_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=9,
                msb=9,
                low=9,
                high=9),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.fast_b2b_transactions_enable',
            inst_name='fast_b2b_transactions_enable',
            field_type=int)
        self.__interrupt_disable:pcie_config_reg_byte_offset_04_interrupt_disable_cls = pcie_config_reg_byte_offset_04_interrupt_disable_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=10,
                msb=10,
                low=10,
                high=10),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.interrupt_disable',
            inst_name='interrupt_disable',
            field_type=int)
        self.__rsvd:pcie_config_reg_byte_offset_04_rsvd_cls = pcie_config_reg_byte_offset_04_rsvd_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=8,
                lsb=11,
                msb=18,
                low=11,
                high=18),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.rsvd',
            inst_name='rsvd',
            field_type=int)
        self.__interrupt_status:pcie_config_reg_byte_offset_04_interrupt_status_cls = pcie_config_reg_byte_offset_04_interrupt_status_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=19,
                msb=19,
                low=19,
                high=19),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.interrupt_status',
            inst_name='interrupt_status',
            field_type=int)
        self.__capabilities_list:pcie_config_reg_byte_offset_04_capabilities_list_cls = pcie_config_reg_byte_offset_04_capabilities_list_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=20,
                msb=20,
                low=20,
                high=20),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.capabilities_list',
            inst_name='capabilities_list',
            field_type=int)
        self.__sixtysix_mhz_capable:pcie_config_reg_byte_offset_04_sixtysix_mhz_capable_cls = pcie_config_reg_byte_offset_04_sixtysix_mhz_capable_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=21,
                msb=21,
                low=21,
                high=21),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.sixtysix_mhz_capable',
            inst_name='sixtysix_mhz_capable',
            field_type=int)
        self.__fast_b2b_transactions_capable:pcie_config_reg_byte_offset_04_fast_b2b_transactions_capable_cls = pcie_config_reg_byte_offset_04_fast_b2b_transactions_capable_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=23,
                msb=23,
                low=23,
                high=23),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.fast_b2b_transactions_capable',
            inst_name='fast_b2b_transactions_capable',
            field_type=int)
        self.__master_data_parity_error:pcie_config_reg_byte_offset_04_master_data_parity_error_cls = pcie_config_reg_byte_offset_04_master_data_parity_error_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=24,
                msb=24,
                low=24,
                high=24),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.master_data_parity_error',
            inst_name='master_data_parity_error',
            field_type=int)
        self.__devsel_timing:pcie_config_reg_byte_offset_04_devsel_timing_cls = pcie_config_reg_byte_offset_04_devsel_timing_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=2,
                lsb=25,
                msb=26,
                low=25,
                high=26),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.devsel_timing',
            inst_name='devsel_timing',
            field_type=int)
        self.__signaled_target_abort:pcie_config_reg_byte_offset_04_signaled_target_abort_cls = pcie_config_reg_byte_offset_04_signaled_target_abort_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=27,
                msb=27,
                low=27,
                high=27),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.signaled_target_abort',
            inst_name='signaled_target_abort',
            field_type=int)
        self.__received_target_abort:pcie_config_reg_byte_offset_04_received_target_abort_cls = pcie_config_reg_byte_offset_04_received_target_abort_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=28,
                msb=28,
                low=28,
                high=28),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.received_target_abort',
            inst_name='received_target_abort',
            field_type=int)
        self.__received_master_abort:pcie_config_reg_byte_offset_04_received_master_abort_cls = pcie_config_reg_byte_offset_04_received_master_abort_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=29,
                msb=29,
                low=29,
                high=29),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.received_master_abort',
            inst_name='received_master_abort',
            field_type=int)
        self.__signaled_system_error:pcie_config_reg_byte_offset_04_signaled_system_error_cls = pcie_config_reg_byte_offset_04_signaled_system_error_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=30,
                msb=30,
                low=30,
                high=30),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.signaled_system_error',
            inst_name='signaled_system_error',
            field_type=int)
        self.__detected_parity_error:pcie_config_reg_byte_offset_04_detected_parity_error_cls = pcie_config_reg_byte_offset_04_detected_parity_error_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=1,
                lsb=31,
                msb=31,
                low=31,
                high=31),
            misc_props=FieldMiscProps(
                default=0,
                is_volatile=False),
            logger_handle=logger_handle+'.detected_parity_error',
            inst_name='detected_parity_error',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.bus_master_enable
        yield self.special_cycle_enable
        yield self.memory_write_invalidate
        yield self.vga_palette_snoop
        yield self.parity_error_response
        yield self.idsel_step_wait_cycle_control
        yield self.SERR_Enable
        yield self.fast_b2b_transactions_enable
        yield self.interrupt_disable
        yield self.rsvd
        yield self.interrupt_status
        yield self.capabilities_list
        yield self.sixtysix_mhz_capable
        yield self.fast_b2b_transactions_capable
        yield self.master_data_parity_error
        yield self.devsel_timing
        yield self.signaled_target_abort
        yield self.received_target_abort
        yield self.received_master_abort
        yield self.signaled_system_error
        yield self.detected_parity_error
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def bus_master_enable(self) -> pcie_config_reg_byte_offset_04_bus_master_enable_cls:
        """
        Property to access bus_master_enable field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>bus_master_enable</p>                                           |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__bus_master_enable
    @property
    def special_cycle_enable(self) -> pcie_config_reg_byte_offset_04_special_cycle_enable_cls:
        """
        Property to access special_cycle_enable field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>special_cycle_enable</p>                                        |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__special_cycle_enable
    @property
    def memory_write_invalidate(self) -> pcie_config_reg_byte_offset_04_memory_write_invalidate_cls:
        """
        Property to access memory_write_invalidate field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>memory_write_invalidate</p>                                     |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__memory_write_invalidate
    @property
    def vga_palette_snoop(self) -> pcie_config_reg_byte_offset_04_vga_palette_snoop_cls:
        """
        Property to access vga_palette_snoop field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>vga_palette_snoop</p>                                           |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__vga_palette_snoop
    @property
    def parity_error_response(self) -> pcie_config_reg_byte_offset_04_parity_error_response_cls:
        """
        Property to access parity_error_response field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>parity_error_response</p>                                       |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__parity_error_response
    @property
    def idsel_step_wait_cycle_control(self) -> pcie_config_reg_byte_offset_04_idsel_step_wait_cycle_control_cls:
        """
        Property to access idsel_step_wait_cycle_control field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>idsel_step_wait_cycle_control</p>                               |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__idsel_step_wait_cycle_control
    @property
    def SERR_Enable(self) -> pcie_config_reg_byte_offset_04_SERR_Enable_cls:
        """
        Property to access SERR_Enable field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>SERR_Enable</p>                                                 |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__SERR_Enable
    @property
    def fast_b2b_transactions_enable(self) -> pcie_config_reg_byte_offset_04_fast_b2b_transactions_enable_cls:
        """
        Property to access fast_b2b_transactions_enable field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>fast_b2b_transactions_enable</p>                                |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__fast_b2b_transactions_enable
    @property
    def interrupt_disable(self) -> pcie_config_reg_byte_offset_04_interrupt_disable_cls:
        """
        Property to access interrupt_disable field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>interrupt_disable</p>                                           |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__interrupt_disable
    @property
    def rsvd(self) -> pcie_config_reg_byte_offset_04_rsvd_cls:
        """
        Property to access rsvd field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>unused</p>                                                      |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__rsvd
    @property
    def interrupt_status(self) -> pcie_config_reg_byte_offset_04_interrupt_status_cls:
        """
        Property to access interrupt_status field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>interrupt_status</p>                                            |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__interrupt_status
    @property
    def capabilities_list(self) -> pcie_config_reg_byte_offset_04_capabilities_list_cls:
        """
        Property to access capabilities_list field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>capabilities_list</p>                                           |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__capabilities_list
    @property
    def sixtysix_mhz_capable(self) -> pcie_config_reg_byte_offset_04_sixtysix_mhz_capable_cls:
        """
        Property to access sixtysix_mhz_capable field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>sixtysix_mhz_capable</p>                                        |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__sixtysix_mhz_capable
    @property
    def fast_b2b_transactions_capable(self) -> pcie_config_reg_byte_offset_04_fast_b2b_transactions_capable_cls:
        """
        Property to access fast_b2b_transactions_capable field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>fast_b2b_transactions_capable</p>                               |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__fast_b2b_transactions_capable
    @property
    def master_data_parity_error(self) -> pcie_config_reg_byte_offset_04_master_data_parity_error_cls:
        """
        Property to access master_data_parity_error field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>master_data_parity_error</p>                                    |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__master_data_parity_error
    @property
    def devsel_timing(self) -> pcie_config_reg_byte_offset_04_devsel_timing_cls:
        """
        Property to access devsel_timing field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>devsel_timing</p>                                               |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__devsel_timing
    @property
    def signaled_target_abort(self) -> pcie_config_reg_byte_offset_04_signaled_target_abort_cls:
        """
        Property to access signaled_target_abort field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>signaled_target_abort</p>                                       |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__signaled_target_abort
    @property
    def received_target_abort(self) -> pcie_config_reg_byte_offset_04_received_target_abort_cls:
        """
        Property to access received_target_abort field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>received_target_abort</p>                                       |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__received_target_abort
    @property
    def received_master_abort(self) -> pcie_config_reg_byte_offset_04_received_master_abort_cls:
        """
        Property to access received_master_abort field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>received_master_abort</p>                                       |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__received_master_abort
    @property
    def signaled_system_error(self) -> pcie_config_reg_byte_offset_04_signaled_system_error_cls:
        """
        Property to access signaled_system_error field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>signaled_system_error</p>                                       |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__signaled_system_error
    @property
    def detected_parity_error(self) -> pcie_config_reg_byte_offset_04_detected_parity_error_cls:
        """
        Property to access detected_parity_error field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>detected_parity_error</p>                                       |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__detected_parity_error

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'bus_master_enable':'bus_master_enable','special_cycle_enable':'special_cycle_enable','memory_write_invalidate':'memory_write_invalidate','vga_palette_snoop':'vga_palette_snoop','parity_error_response':'parity_error_response','idsel_step_wait_cycle_control':'idsel_step_wait_cycle_control','SERR_Enable':'SERR_Enable','fast_b2b_transactions_enable':'fast_b2b_transactions_enable','interrupt_disable':'interrupt_disable','rsvd':'rsvd','interrupt_status':'interrupt_status','capabilities_list':'capabilities_list','sixtysix_mhz_capable':'sixtysix_mhz_capable','fast_b2b_transactions_capable':'fast_b2b_transactions_capable','master_data_parity_error':'master_data_parity_error','devsel_timing':'devsel_timing','signaled_target_abort':'signaled_target_abort','received_target_abort':'received_target_abort','received_master_abort':'received_master_abort','signaled_system_error':'signaled_system_error','detected_parity_error':'detected_parity_error',
            }

    
    
    
    
    
    
    # nodes:21
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["bus_master_enable"]) -> pcie_config_reg_byte_offset_04_bus_master_enable_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["special_cycle_enable"]) -> pcie_config_reg_byte_offset_04_special_cycle_enable_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["memory_write_invalidate"]) -> pcie_config_reg_byte_offset_04_memory_write_invalidate_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["vga_palette_snoop"]) -> pcie_config_reg_byte_offset_04_vga_palette_snoop_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["parity_error_response"]) -> pcie_config_reg_byte_offset_04_parity_error_response_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["idsel_step_wait_cycle_control"]) -> pcie_config_reg_byte_offset_04_idsel_step_wait_cycle_control_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["SERR_Enable"]) -> pcie_config_reg_byte_offset_04_SERR_Enable_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["fast_b2b_transactions_enable"]) -> pcie_config_reg_byte_offset_04_fast_b2b_transactions_enable_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["interrupt_disable"]) -> pcie_config_reg_byte_offset_04_interrupt_disable_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["rsvd"]) -> pcie_config_reg_byte_offset_04_rsvd_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["interrupt_status"]) -> pcie_config_reg_byte_offset_04_interrupt_status_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["capabilities_list"]) -> pcie_config_reg_byte_offset_04_capabilities_list_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["sixtysix_mhz_capable"]) -> pcie_config_reg_byte_offset_04_sixtysix_mhz_capable_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["fast_b2b_transactions_capable"]) -> pcie_config_reg_byte_offset_04_fast_b2b_transactions_capable_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["master_data_parity_error"]) -> pcie_config_reg_byte_offset_04_master_data_parity_error_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["devsel_timing"]) -> pcie_config_reg_byte_offset_04_devsel_timing_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["signaled_target_abort"]) -> pcie_config_reg_byte_offset_04_signaled_target_abort_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["received_target_abort"]) -> pcie_config_reg_byte_offset_04_received_target_abort_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["received_master_abort"]) -> pcie_config_reg_byte_offset_04_received_master_abort_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["signaled_system_error"]) -> pcie_config_reg_byte_offset_04_signaled_system_error_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["detected_parity_error"]) -> pcie_config_reg_byte_offset_04_detected_parity_error_cls: ...
                

    @overload
    def get_child_by_system_rdl_name(self, name: str) -> Union[pcie_config_reg_byte_offset_04_bus_master_enable_cls, pcie_config_reg_byte_offset_04_special_cycle_enable_cls, pcie_config_reg_byte_offset_04_memory_write_invalidate_cls, pcie_config_reg_byte_offset_04_vga_palette_snoop_cls, pcie_config_reg_byte_offset_04_parity_error_response_cls, pcie_config_reg_byte_offset_04_idsel_step_wait_cycle_control_cls, pcie_config_reg_byte_offset_04_SERR_Enable_cls, pcie_config_reg_byte_offset_04_fast_b2b_transactions_enable_cls, pcie_config_reg_byte_offset_04_interrupt_disable_cls, pcie_config_reg_byte_offset_04_rsvd_cls, pcie_config_reg_byte_offset_04_interrupt_status_cls, pcie_config_reg_byte_offset_04_capabilities_list_cls, pcie_config_reg_byte_offset_04_sixtysix_mhz_capable_cls, pcie_config_reg_byte_offset_04_fast_b2b_transactions_capable_cls, pcie_config_reg_byte_offset_04_master_data_parity_error_cls, pcie_config_reg_byte_offset_04_devsel_timing_cls, pcie_config_reg_byte_offset_04_signaled_target_abort_cls, pcie_config_reg_byte_offset_04_received_target_abort_cls, pcie_config_reg_byte_offset_04_received_master_abort_cls, pcie_config_reg_byte_offset_04_signaled_system_error_cls, pcie_config_reg_byte_offset_04_detected_parity_error_cls, ]: ...

    def get_child_by_system_rdl_name(self, name: Any) -> Any:
        return super().get_child_by_system_rdl_name(name)
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Byte Offset 04"
    
    

    
    
    
class pcie_config_reg_byte_offset_00_Device_ID_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Device ID</p>                                                   |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Device ID"
    
    

    
    
    
class pcie_config_reg_byte_offset_00_Vendor_ID_cls(FieldAsyncReadOnly):
    
    """
    Class to represent a register field in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Description  | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      <p>Vendor ID</p>                                                   |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = []

    

    
    

    @property
    def rdl_desc(self) -> str:
        return "Vendor ID"
    
    

    
    
class pcie_config_reg_byte_offset_00_cls(RegAsyncReadOnly):
    """
    Class to represent a register in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      Byte Offset 00                                                     |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__Vendor_ID', '__Device_ID']

    def __init__(self,
                 address: int,
                 width: int,
                 accesswidth: int,
                 logger_handle: str,
                 inst_name: str,
                 parent: Union[AsyncAddressMap,AsyncRegFile,ReadableAsyncMemory]):

        super().__init__(address=address,
                         width=width,
                         accesswidth=accesswidth,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        # build the field attributes
        
        self.__Vendor_ID:pcie_config_reg_byte_offset_00_Vendor_ID_cls = pcie_config_reg_byte_offset_00_Vendor_ID_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=16,
                lsb=0,
                msb=15,
                low=0,
                high=15),
            misc_props=FieldMiscProps(
                default=4660,
                is_volatile=False),
            logger_handle=logger_handle+'.Vendor_ID',
            inst_name='Vendor_ID',
            field_type=int)
        self.__Device_ID:pcie_config_reg_byte_offset_00_Device_ID_cls = pcie_config_reg_byte_offset_00_Device_ID_cls(
            parent_register=self,
            size_props=FieldSizeProps(
                width=16,
                lsb=16,
                msb=31,
                low=16,
                high=31),
            misc_props=FieldMiscProps(
                default=255,
                is_volatile=False),
            logger_handle=logger_handle+'.Device_ID',
            inst_name='Device_ID',
            field_type=int)

    @property
    def fields(self) -> Iterator[Union[FieldAsyncReadOnly, FieldAsyncWriteOnly,FieldAsyncReadWrite]]:
        """
        generator that produces has all the fields within the register
        """
        yield self.Vendor_ID
        yield self.Device_ID
        
        # Empty generator in case there are no children of this type
        if False: yield


    

    # build the properties for the fields
    
    @property
    def Vendor_ID(self) -> pcie_config_reg_byte_offset_00_Vendor_ID_cls:
        """
        Property to access Vendor_ID field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Vendor ID</p>                                                   |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__Vendor_ID
    @property
    def Device_ID(self) -> pcie_config_reg_byte_offset_00_Device_ID_cls:
        """
        Property to access Device_ID field of the register

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Description  | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      <p>Device ID</p>                                                   |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__Device_ID

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'Vendor_ID':'Vendor_ID','Device_ID':'Device_ID',
            }

    
    
    
    
    
    
    # nodes:2
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["Vendor_ID"]) -> pcie_config_reg_byte_offset_00_Vendor_ID_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["Device_ID"]) -> pcie_config_reg_byte_offset_00_Device_ID_cls: ...
                

    @overload
    def get_child_by_system_rdl_name(self, name: str) -> Union[pcie_config_reg_byte_offset_00_Vendor_ID_cls, pcie_config_reg_byte_offset_00_Device_ID_cls, ]: ...

    def get_child_by_system_rdl_name(self, name: Any) -> Any:
        return super().get_child_by_system_rdl_name(name)
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "Byte Offset 00"
    
    

    
    
class pcie_config_reg_cls(AsyncAddressMap):
    """
    Class to represent a address map in the register model

    +--------------+-------------------------------------------------------------------------+
    | SystemRDL    | Value                                                                   |
    | Field        |                                                                         |
    +==============+=========================================================================+
    | Name         | .. raw:: html                                                           |
    |              |                                                                         |
    |              |      PCIe Configuration                                                 |
    +--------------+-------------------------------------------------------------------------+
    """

    __slots__ : list[str] = ['__byte_offset_00', '__byte_offset_04', '__byte_offset_08', '__byte_offset_0C', '__base_address_register_0', '__base_ddress_register_1', '__base_ddress_register_2', '__base_ddress_register_3', '__base_ddress_register_4', '__base_ddress_register_5', '__cardbus_cis_pointer', '__byte_offset_2C', '__capabilities_pointer', '__byte_offset_3C', '__capabilities_power_mngt_pointer', '__power_management_pointer', '__capabilities_power_na_pointer', '__link_control_3_register', '__lane_error_status_register', '__lane_eq_ctrl_register', '__extended_capabilities']

    def __init__(self, *,
                 address:int=0,
                 logger_handle:str='reg_model.pcie_config_reg',
                 inst_name:str='pcie_config_reg',
                 callbacks: Optional[Union[AsyncCallbackSet, AsyncCallbackSetLegacy]]=None,
                 parent:Optional[AsyncAddressMap]=None):

        if callbacks is not None:
            if not isinstance(callbacks, (AsyncCallbackSet, AsyncCallbackSetLegacy)):
                raise TypeError(f'callbacks should be AsyncCallbackSet, AsyncCallbackSetLegacy got {type(callbacks)}')

        super().__init__(callbacks=callbacks,
                         address=address,
                         logger_handle=logger_handle,
                         inst_name=inst_name,
                         parent=parent)

        
            
        self.__byte_offset_00:pcie_config_reg_byte_offset_00_cls = pcie_config_reg_byte_offset_00_cls(
                                                                     address=self.address+0,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.byte_offset_00',
                                                                     inst_name='byte_offset_00', parent=self)
        
            
        self.__byte_offset_04:pcie_config_reg_byte_offset_04_cls = pcie_config_reg_byte_offset_04_cls(
                                                                     address=self.address+4,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.byte_offset_04',
                                                                     inst_name='byte_offset_04', parent=self)
        
            
        self.__byte_offset_08:pcie_config_reg_byte_offset_08_cls = pcie_config_reg_byte_offset_08_cls(
                                                                     address=self.address+8,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.byte_offset_08',
                                                                     inst_name='byte_offset_08', parent=self)
        
            
        self.__byte_offset_0C:pcie_config_reg_byte_offset_0C_cls = pcie_config_reg_byte_offset_0C_cls(
                                                                     address=self.address+12,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.byte_offset_0C',
                                                                     inst_name='byte_offset_0C', parent=self)
        
            
        self.__base_address_register_0:pcie_config_reg_base_address_register_0_cls = pcie_config_reg_base_address_register_0_cls(
                                                                     address=self.address+16,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.base_address_register_0',
                                                                     inst_name='base_address_register_0', parent=self)
        
            
        self.__base_ddress_register_1:pcie_config_reg_base_ddress_register_1_cls = pcie_config_reg_base_ddress_register_1_cls(
                                                                     address=self.address+20,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.base_ddress_register_1',
                                                                     inst_name='base_ddress_register_1', parent=self)
        
            
        self.__base_ddress_register_2:pcie_config_reg_base_ddress_register_2_cls = pcie_config_reg_base_ddress_register_2_cls(
                                                                     address=self.address+24,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.base_ddress_register_2',
                                                                     inst_name='base_ddress_register_2', parent=self)
        
            
        self.__base_ddress_register_3:pcie_config_reg_base_ddress_register_3_cls = pcie_config_reg_base_ddress_register_3_cls(
                                                                     address=self.address+28,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.base_ddress_register_3',
                                                                     inst_name='base_ddress_register_3', parent=self)
        
            
        self.__base_ddress_register_4:pcie_config_reg_base_ddress_register_4_cls = pcie_config_reg_base_ddress_register_4_cls(
                                                                     address=self.address+32,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.base_ddress_register_4',
                                                                     inst_name='base_ddress_register_4', parent=self)
        
            
        self.__base_ddress_register_5:pcie_config_reg_base_ddress_register_5_cls = pcie_config_reg_base_ddress_register_5_cls(
                                                                     address=self.address+36,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.base_ddress_register_5',
                                                                     inst_name='base_ddress_register_5', parent=self)
        
            
        self.__cardbus_cis_pointer:pcie_config_reg_cardbus_cis_pointer_cls = pcie_config_reg_cardbus_cis_pointer_cls(
                                                                     address=self.address+40,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.cardbus_cis_pointer',
                                                                     inst_name='cardbus_cis_pointer', parent=self)
        
            
        self.__byte_offset_2C:pcie_config_reg_byte_offset_2C_cls = pcie_config_reg_byte_offset_2C_cls(
                                                                     address=self.address+44,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.byte_offset_2C',
                                                                     inst_name='byte_offset_2C', parent=self)
        
            
        self.__capabilities_pointer:pcie_config_reg_capabilities_pointer_cls = pcie_config_reg_capabilities_pointer_cls(
                                                                     address=self.address+52,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.capabilities_pointer',
                                                                     inst_name='capabilities_pointer', parent=self)
        
            
        self.__byte_offset_3C:pcie_config_reg_byte_offset_3C_cls = pcie_config_reg_byte_offset_3C_cls(
                                                                     address=self.address+60,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.byte_offset_3C',
                                                                     inst_name='byte_offset_3C', parent=self)
        
            
        self.__capabilities_power_mngt_pointer:pcie_config_reg_capabilities_power_mngt_pointer_cls = pcie_config_reg_capabilities_power_mngt_pointer_cls(
                                                                     address=self.address+64,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.capabilities_power_mngt_pointer',
                                                                     inst_name='capabilities_power_mngt_pointer', parent=self)
        
            
        self.__power_management_pointer:pcie_config_reg_power_management_pointer_cls = pcie_config_reg_power_management_pointer_cls(
                                                                     address=self.address+68,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.power_management_pointer',
                                                                     inst_name='power_management_pointer', parent=self)
        
            
        self.__capabilities_power_na_pointer:pcie_config_reg_capabilities_power_na_pointer_cls = pcie_config_reg_capabilities_power_na_pointer_cls(
                                                                     address=self.address+72,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.capabilities_power_na_pointer',
                                                                     inst_name='capabilities_power_na_pointer', parent=self)
        
            
        self.__link_control_3_register:pcie_config_reg_link_control_3_register_cls = pcie_config_reg_link_control_3_register_cls(
                                                                     address=self.address+76,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.link_control_3_register',
                                                                     inst_name='link_control_3_register', parent=self)
        
            
        self.__lane_error_status_register:pcie_config_reg_lane_error_status_register_cls = pcie_config_reg_lane_error_status_register_cls(
                                                                     address=self.address+80,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.lane_error_status_register',
                                                                     inst_name='lane_error_status_register', parent=self)
        
            
        self.__lane_eq_ctrl_register:pcie_config_reg_lane_eq_ctrl_register_cls = pcie_config_reg_lane_eq_ctrl_register_cls(
                                                                     address=self.address+84,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.lane_eq_ctrl_register',
                                                                     inst_name='lane_eq_ctrl_register', parent=self)
        
            
        self.__extended_capabilities:pcie_config_reg_extended_capabilities_cls = pcie_config_reg_extended_capabilities_cls(
                                                                     address=self.address+256,
                                                                     accesswidth=32,
                                                                     width=32,
                                                                     logger_handle=logger_handle+'.extended_capabilities',
                                                                     inst_name='extended_capabilities', parent=self)
        

    @property
    def size(self) -> int:
        return 260
    @property
    def byte_offset_00(self) -> pcie_config_reg_byte_offset_00_cls:
        """
        Property to access byte_offset_00 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Byte Offset 00                                                     |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__byte_offset_00
        
    @property
    def byte_offset_04(self) -> pcie_config_reg_byte_offset_04_cls:
        """
        Property to access byte_offset_04 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Byte Offset 04                                                     |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__byte_offset_04
        
    @property
    def byte_offset_08(self) -> pcie_config_reg_byte_offset_08_cls:
        """
        Property to access byte_offset_08 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Byte Offset 08                                                     |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__byte_offset_08
        
    @property
    def byte_offset_0C(self) -> pcie_config_reg_byte_offset_0C_cls:
        """
        Property to access byte_offset_0C 

        
        """
        return self.__byte_offset_0C
        
    @property
    def base_address_register_0(self) -> pcie_config_reg_base_address_register_0_cls:
        """
        Property to access base_address_register_0 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Base Address Register 0                                            |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__base_address_register_0
        
    @property
    def base_ddress_register_1(self) -> pcie_config_reg_base_ddress_register_1_cls:
        """
        Property to access base_ddress_register_1 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Base Address Register 1                                            |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__base_ddress_register_1
        
    @property
    def base_ddress_register_2(self) -> pcie_config_reg_base_ddress_register_2_cls:
        """
        Property to access base_ddress_register_2 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Base Address Register 2                                            |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__base_ddress_register_2
        
    @property
    def base_ddress_register_3(self) -> pcie_config_reg_base_ddress_register_3_cls:
        """
        Property to access base_ddress_register_3 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Base Address Register 3                                            |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__base_ddress_register_3
        
    @property
    def base_ddress_register_4(self) -> pcie_config_reg_base_ddress_register_4_cls:
        """
        Property to access base_ddress_register_4 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Base Address Register 4                                            |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__base_ddress_register_4
        
    @property
    def base_ddress_register_5(self) -> pcie_config_reg_base_ddress_register_5_cls:
        """
        Property to access base_ddress_register_5 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Base Address Register 5                                            |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__base_ddress_register_5
        
    @property
    def cardbus_cis_pointer(self) -> pcie_config_reg_cardbus_cis_pointer_cls:
        """
        Property to access cardbus_cis_pointer 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Cardbus CIS Pointer                                                |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__cardbus_cis_pointer
        
    @property
    def byte_offset_2C(self) -> pcie_config_reg_byte_offset_2C_cls:
        """
        Property to access byte_offset_2C 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Byte Offset 2C                                                     |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__byte_offset_2C
        
    @property
    def capabilities_pointer(self) -> pcie_config_reg_capabilities_pointer_cls:
        """
        Property to access capabilities_pointer 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      capabilities_pointer                                               |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__capabilities_pointer
        
    @property
    def byte_offset_3C(self) -> pcie_config_reg_byte_offset_3C_cls:
        """
        Property to access byte_offset_3C 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Byte Offset 3C                                                     |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__byte_offset_3C
        
    @property
    def capabilities_power_mngt_pointer(self) -> pcie_config_reg_capabilities_power_mngt_pointer_cls:
        """
        Property to access capabilities_power_mngt_pointer 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      capabilities pointer                                               |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__capabilities_power_mngt_pointer
        
    @property
    def power_management_pointer(self) -> pcie_config_reg_power_management_pointer_cls:
        """
        Property to access power_management_pointer 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      power management                                                   |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__power_management_pointer
        
    @property
    def capabilities_power_na_pointer(self) -> pcie_config_reg_capabilities_power_na_pointer_cls:
        """
        Property to access capabilities_power_na_pointer 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      PCI Express Capabilities Register                                  |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__capabilities_power_na_pointer
        
    @property
    def link_control_3_register(self) -> pcie_config_reg_link_control_3_register_cls:
        """
        Property to access link_control_3_register 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Link Control 3 Register (Offset 04h)                               |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__link_control_3_register
        
    @property
    def lane_error_status_register(self) -> pcie_config_reg_lane_error_status_register_cls:
        """
        Property to access lane_error_status_register 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Lane Error Status Register (Offset 08h)                            |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__lane_error_status_register
        
    @property
    def lane_eq_ctrl_register(self) -> pcie_config_reg_lane_eq_ctrl_register_cls:
        """
        Property to access lane_eq_ctrl_register 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      Lane Equalization Control Register (Offset 0Ch)                    |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__lane_eq_ctrl_register
        
    @property
    def extended_capabilities(self) -> pcie_config_reg_extended_capabilities_cls:
        """
        Property to access extended_capabilities 

        +--------------+-------------------------------------------------------------------------+
        | SystemRDL    | Value                                                                   |
        | Field        |                                                                         |
        +==============+=========================================================================+
        | Name         | .. raw:: html                                                           |
        |              |                                                                         |
        |              |      extended capabilities                                              |
        +--------------+-------------------------------------------------------------------------+
        """
        return self.__extended_capabilities
        

    
    @property
    def systemrdl_python_child_name_map(self) -> dict[str, str]:
        """
        In some cases systemRDL names need to be converted make them python safe, this dictionary
        is used to map the original systemRDL names to the names of the python attributes of this
        class

        Returns: dictionary whose key is the systemRDL names and value it the property name
        """
        return {'byte_offset_00':'byte_offset_00','byte_offset_04':'byte_offset_04','byte_offset_08':'byte_offset_08','byte_offset_0C':'byte_offset_0C','base_address_register_0':'base_address_register_0','base_ddress_register_1':'base_ddress_register_1','base_ddress_register_2':'base_ddress_register_2','base_ddress_register_3':'base_ddress_register_3','base_ddress_register_4':'base_ddress_register_4','base_ddress_register_5':'base_ddress_register_5','cardbus_cis_pointer':'cardbus_cis_pointer','byte_offset_2C':'byte_offset_2C','capabilities_pointer':'capabilities_pointer','byte_offset_3C':'byte_offset_3C','capabilities_power_mngt_pointer':'capabilities_power_mngt_pointer','power_management_pointer':'power_management_pointer','capabilities_power_na_pointer':'capabilities_power_na_pointer','link_control_3_register':'link_control_3_register','lane_error_status_register':'lane_error_status_register','lane_eq_ctrl_register':'lane_eq_ctrl_register','extended_capabilities':'extended_capabilities',
            }

    
    
    
    
    
    
    # nodes:21
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["byte_offset_00"]) -> pcie_config_reg_byte_offset_00_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["byte_offset_04"]) -> pcie_config_reg_byte_offset_04_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["byte_offset_08"]) -> pcie_config_reg_byte_offset_08_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["byte_offset_0C"]) -> pcie_config_reg_byte_offset_0C_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["base_address_register_0"]) -> pcie_config_reg_base_address_register_0_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["base_ddress_register_1"]) -> pcie_config_reg_base_ddress_register_1_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["base_ddress_register_2"]) -> pcie_config_reg_base_ddress_register_2_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["base_ddress_register_3"]) -> pcie_config_reg_base_ddress_register_3_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["base_ddress_register_4"]) -> pcie_config_reg_base_ddress_register_4_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["base_ddress_register_5"]) -> pcie_config_reg_base_ddress_register_5_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["cardbus_cis_pointer"]) -> pcie_config_reg_cardbus_cis_pointer_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["byte_offset_2C"]) -> pcie_config_reg_byte_offset_2C_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["capabilities_pointer"]) -> pcie_config_reg_capabilities_pointer_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["byte_offset_3C"]) -> pcie_config_reg_byte_offset_3C_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["capabilities_power_mngt_pointer"]) -> pcie_config_reg_capabilities_power_mngt_pointer_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["power_management_pointer"]) -> pcie_config_reg_power_management_pointer_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["capabilities_power_na_pointer"]) -> pcie_config_reg_capabilities_power_na_pointer_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["link_control_3_register"]) -> pcie_config_reg_link_control_3_register_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["lane_error_status_register"]) -> pcie_config_reg_lane_error_status_register_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["lane_eq_ctrl_register"]) -> pcie_config_reg_lane_eq_ctrl_register_cls: ...
                
                
    @overload
    def get_child_by_system_rdl_name(self, name: Literal["extended_capabilities"]) -> pcie_config_reg_extended_capabilities_cls: ...
                

    @overload
    def get_child_by_system_rdl_name(self, name: str) -> Union[pcie_config_reg_byte_offset_00_cls, pcie_config_reg_byte_offset_04_cls, pcie_config_reg_byte_offset_08_cls, pcie_config_reg_byte_offset_0C_cls, pcie_config_reg_base_address_register_0_cls, pcie_config_reg_base_ddress_register_1_cls, pcie_config_reg_base_ddress_register_2_cls, pcie_config_reg_base_ddress_register_3_cls, pcie_config_reg_base_ddress_register_4_cls, pcie_config_reg_base_ddress_register_5_cls, pcie_config_reg_cardbus_cis_pointer_cls, pcie_config_reg_byte_offset_2C_cls, pcie_config_reg_capabilities_pointer_cls, pcie_config_reg_byte_offset_3C_cls, pcie_config_reg_capabilities_power_mngt_pointer_cls, pcie_config_reg_power_management_pointer_cls, pcie_config_reg_capabilities_power_na_pointer_cls, pcie_config_reg_link_control_3_register_cls, pcie_config_reg_lane_error_status_register_cls, pcie_config_reg_lane_eq_ctrl_register_cls, pcie_config_reg_extended_capabilities_cls, ]: ...

    def get_child_by_system_rdl_name(self, name: Any) -> Any:
        return super().get_child_by_system_rdl_name(name)
    


    

    
    

    @property
    def rdl_name(self) -> str:
        return "PCIe Configuration"
    

    
    def get_registers(self, unroll:bool=False) -> Iterator[Union[AsyncReg, AsyncRegArray]]:
        """
        generator that produces all the registers of this node
        """
        
                    
        yield self.byte_offset_00
        
                    
        yield self.byte_offset_04
        
                    
        yield self.byte_offset_08
        
                    
        yield self.byte_offset_0C
        
                    
        yield self.base_address_register_0
        
                    
        yield self.base_ddress_register_1
        
                    
        yield self.base_ddress_register_2
        
                    
        yield self.base_ddress_register_3
        
                    
        yield self.base_ddress_register_4
        
                    
        yield self.base_ddress_register_5
        
                    
        yield self.cardbus_cis_pointer
        
                    
        yield self.byte_offset_2C
        
                    
        yield self.capabilities_pointer
        
                    
        yield self.byte_offset_3C
        
                    
        yield self.capabilities_power_mngt_pointer
        
                    
        yield self.power_management_pointer
        
                    
        yield self.capabilities_power_na_pointer
        
                    
        yield self.link_control_3_register
        
                    
        yield self.lane_error_status_register
        
                    
        yield self.lane_eq_ctrl_register
        
                    
        yield self.extended_capabilities
        

        # Empty generator in case there are no children of this type
        if False: yield
    
    
    def get_sections(self, unroll:bool=False) -> Iterator[Union[AsyncAddressMap, AsyncRegFile, AsyncAddressMapArray, AsyncRegFileArray]]:
        """
        generator that produces all the AsyncAddressMap, AsyncRegFile, AsyncAddressMapArray, AsyncRegFileArray children of this node
        """
        

        # Empty generator in case there are no children of this type
        if False: yield
    
    def get_memories(self, unroll:bool=False) -> Iterator[Union[AsyncMemory, AsyncMemoryArray]]:
        """
        generator that produces all the AsyncMemory, AsyncMemoryArray children of this node
        """
        

        # Empty generator in case there are no children of this type
        if False: yield
    
    



if __name__ == '__main__':
    # dummy functions to demonstrate the class
    async def read_addr_space(addr: int, width: int, accesswidth: int) -> int:
        """
        Callback to simulate the operation of the package, everytime the read is called, it will
        request the user input the value to be read back.

        Args:
            addr: Address to write to
            width: Width of the register in bits
            accesswidth: Minimum access width of the register in bits

        Returns:
            value inputted by the used
        """
        assert isinstance(addr, int)
        assert isinstance(width, int)
        assert isinstance(accesswidth, int)
        return int(input('value to read from address:0x%X'%addr))

    async def write_addr_space(addr: int, width: int, accesswidth: int, data: int) -> None:
        """
        Callback to simulate the operation of the package, everytime the read is called, it will
        request the user input the value to be read back.

        Args:
            addr: Address to write to
            width: Width of the register in bits
            accesswidth: Minimum access width of the register in bits
            data: value to be written to the register

        Returns:
            None
        """
        assert isinstance(addr, int)
        assert isinstance(width, int)
        assert isinstance(accesswidth, int)
        assert isinstance(data, int)
        print('write data:0x%X to address:0x%X'%(data, addr))

    # create an instance of the class
    pcie_config_reg = pcie_config_reg_cls(callbacks = AsyncCallbackSet(read_callback=read_addr_space,
                                                                                                     write_callback=write_addr_space))