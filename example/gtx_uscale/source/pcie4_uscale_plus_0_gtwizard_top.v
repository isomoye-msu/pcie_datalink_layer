//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2012 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//-----------------------------------------------------------------------------
//
// Project    : UltraScale+ FPGA PCI Express v4.0 Integrated Block
// File       : pcie4_uscale_plus_0_gtwizard_top.v
// Version    : 1.3 
//-----------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//  Design :  PCIe PHY Wrapper 
//  Module :  GT Wizard Top 
//--------------------------------------------------------------------------------------------------

`timescale 1ps / 1ps

//--------------------------------------------------------------------------------------------------
//  GT Wizard Top Module
//--------------------------------------------------------------------------------------------------
(* DowngradeIPIdentifiedWarnings = "yes" *)
module pcie4_uscale_plus_0_gtwizard_top #
(
    parameter         PHY_GT_XCVR = "GTY",
    parameter integer PHY_MAX_SPEED = 3,
    parameter integer PHY_LANE = 1
)
(    
                                                                                                      
    //--------------------------------------------------------------------------
    //  Clock Ports
    //--------------------------------------------------------------------------
    input                               GT_GTREFCLK0,
    input       [PHY_LANE-1:0]          GT_TXUSRCLK,
    input       [PHY_LANE-1:0]          GT_RXUSRCLK,  
    input       [PHY_LANE-1:0]          GT_TXUSRCLK2, 
    input       [PHY_LANE-1:0]          GT_RXUSRCLK2,    
    //--------------------------------------------------------------------------   
    //  IBERT ports 
    //--------------------------------------------------------------------------                   
    input       [PHY_LANE-1:0]          GT_EYESCANRESET,
    input       [(PHY_LANE* 2)-1:0]     GT_RATE,  
    input       [(PHY_LANE* 5)-1:0]     GT_TXDIFFCTRL,
    input       [(PHY_LANE* 5)-1:0]     GT_TXPRECURSOR,  
    input       [(PHY_LANE* 5)-1:0]     GT_TXPOSTCURSOR,      
    input       [PHY_LANE-1:0]          GT_RXLPMEN,

    output      [PHY_LANE-1:0]          GT_PCIERATEGEN3,   
    //--------------------------------------------------------------------------                   
    output      [PHY_LANE-1:0]          GT_RXOUTCLK,        
    output      [PHY_LANE-1:0]          GT_TXOUTCLKFABRIC,
    output      [PHY_LANE-1:0]          GT_RXOUTCLKFABRIC,
    output      [PHY_LANE-1:0]          GT_TXOUTCLKPCS,
    output      [PHY_LANE-1:0]          GT_RXOUTCLKPCS,
    output      [PHY_LANE-1:0]          GT_RXRECCLKOUT,
    //--------------------------------------------------------------------------   
    //  BUFG_GT Controller Ports                                                                        
    //--------------------------------------------------------------------------                   
    output      [PHY_LANE-1:0]          GT_BUFGTCE,       
    output      [(PHY_LANE* 3)-1:0]     GT_BUFGTCEMASK, 
    output      [PHY_LANE-1:0]          GT_BUFGTRESET,
    output      [(PHY_LANE* 3)-1:0]     GT_BUFGTRSTMASK,
    output      [(PHY_LANE* 9)-1:0]     GT_BUFGTDIV,   
    output      [PHY_LANE-1:0]          GT_TXOUTCLK,  
                
    //--------------------------------------------------------------------------
    //  Reset Ports
    //--------------------------------------------------------------------------
    input       [PHY_LANE-1:0]          GT_CPLLPD,    
    input       [PHY_LANE-1:0]          GT_CPLLRESET,

    input       [PHY_LANE-1:0]          GT_TXPROGDIVRESET,  
    input       [PHY_LANE-1:0]          GT_RXPROGDIVRESET,   
    input       [PHY_LANE-1:0]          GT_GTTXRESET,  
    input       [PHY_LANE-1:0]          GT_GTRXRESET,  
    input       [PHY_LANE-1:0]          GT_TXUSERRDY, 
    input       [PHY_LANE-1:0]          GT_RXUSERRDY, 
                                        
    input       [PHY_LANE-1:0]          GT_TXPMARESET,
    input       [PHY_LANE-1:0]          GT_RXPMARESET,
    input       [PHY_LANE-1:0]          GT_TXPCSRESET,
    input       [PHY_LANE-1:0]          GT_RXPCSRESET,
    input       [PHY_LANE-1:0]          GT_RXBUFRESET,
    input       [PHY_LANE-1:0]          GT_RXCDRRESET,
    input       [PHY_LANE-1:0]          GT_RXDFELPMRESET,

    output      [PHY_LANE-1:0]          GT_GTPOWERGOOD, 
    output      [PHY_LANE-1:0]          GT_TXPROGDIVRESETDONE,  
    output      [PHY_LANE-1:0]          GT_TXRESETDONE,   
    output      [PHY_LANE-1:0]          GT_RXRESETDONE,                  
    output      [PHY_LANE-1:0]          GT_TXPMARESETDONE,   
    output      [PHY_LANE-1:0]          GT_RXPMARESETDONE,               
    
    output      [PHY_LANE-1:0]          GT_TXPHALIGNDONE,            
    output      [PHY_LANE-1:0]          GT_TXPHINITDONE,
    output      [PHY_LANE-1:0]          GT_RXCOMMADET,


    //--------------------------------------------------------------------------
    //  Common QPLL Ports
    //--------------------------------------------------------------------------
    input                               GTCOM_QPLLPD,     
    input                               GTCOM_QPLLRESET,

    output      [(PHY_LANE-1)>>2:0]     GTCOM_QPLL0LOCK, 
    output      [(PHY_LANE-1)>>2:0]     GTCOM_QPLL0OUTCLK,
    output      [(PHY_LANE-1)>>2:0]     GTCOM_QPLL0OUTREFCLK, 
    output      [(PHY_LANE-1)>>2:0]     GTCOM_QPLL1LOCK, 
    output      [(PHY_LANE-1)>>2:0]     GTCOM_QPLL1OUTCLK,
    output      [(PHY_LANE-1)>>2:0]     GTCOM_QPLL1OUTREFCLK, 
    
    output      [(PHY_LANE-1)>>2:0]     EXT_QPLL0PD,
    output      [(PHY_LANE-1)>>2:0]     EXT_QPLL0RESET,
    output      [(PHY_LANE-1)>>2:0]     EXT_QPLL1PD,
    output      [(PHY_LANE-1)>>2:0]     EXT_QPLL1RESET,

 

    //----------------------------------------------------------------------------------------------
    //  Common DRP Ports
    //----------------------------------------------------------------------------------------------
    input                                           GTCOM_DRPCLK,
    input       [((((PHY_LANE-1)>>2)+1)*16)-1:0]    GTCOM_DRPADDR,                                       
    input       [   (PHY_LANE-1)>>2          :0]    GTCOM_DRPEN,                                             
    input       [   (PHY_LANE-1)>>2          :0]    GTCOM_DRPWE,     
    input       [((((PHY_LANE-1)>>2)+1)*16)-1:0]    GTCOM_DRPDI,                                      
                                                                         
    output      [   (PHY_LANE-1)>>2          :0]    GTCOM_DRPRDY,    
    output      [((((PHY_LANE-1)>>2)+1)*16)-1:0]    GTCOM_DRPDO,         
    
   input       [((PHY_LANE *  1)-1):0]    GT_DRPCLK,   
   input       [((PHY_LANE *  1)-1):0]    GT_DRPRST,    
   input       [((PHY_LANE * 10)-1):0]    GT_DRPADDR, 
   input       [((PHY_LANE *  1)-1):0]    GT_DRPEN,    
   input       [((PHY_LANE *  1)-1):0]    GT_DRPWE,    
   input       [((PHY_LANE * 16)-1):0]    GT_DRPDI,   
                                           
   output      [((PHY_LANE *  1)-1):0]    GT_DRPRDY,   
   output      [((PHY_LANE * 16)-1):0]    GT_DRPDO,     

    //--------------------------------------------------------------------------
    //  Serial Line Ports
    //--------------------------------------------------------------------------
    input       [PHY_LANE-1:0]          GT_RXN,  
    input       [PHY_LANE-1:0]          GT_RXP,  
    
    output      [PHY_LANE-1:0]          GT_TXP,  
    output      [PHY_LANE-1:0]          GT_TXN,  
    
    //--------------------------------------------------------------------------
    //  TX Data Ports 
    //--------------------------------------------------------------------------
    input       [(PHY_LANE*64)-1:0]     GT_TXDATA,    
    input       [(PHY_LANE* 2)-1:0]     GT_TXDATAK,  
    input       [PHY_LANE-1:0]          GT_TXDATA_VALID,  
    input       [PHY_LANE-1:0]          GT_TXSTART_BLOCK,      
    input       [(PHY_LANE* 2)-1:0]     GT_TXSYNC_HEADER,  
    
    //--------------------------------------------------------------------------
    //  RX Data Ports 
    //--------------------------------------------------------------------------
    output      [(PHY_LANE*64)-1:0]     GT_RXDATA,      
    output      [(PHY_LANE* 2)-1:0]     GT_RXDATAK,        
    output      [PHY_LANE-1:0]          GT_RXDATA_VALID,  
    output      [(PHY_LANE* 2)-1:0]     GT_RXSTART_BLOCK,       
    output      [(PHY_LANE* 2)-1:0]     GT_RXSYNC_HEADER,     
    
    //--------------------------------------------------------------------------
    //  PHY Command Ports
    //--------------------------------------------------------------------------
    input       [PHY_LANE-1:0]          GT_TXDETECTRX,      
    input       [PHY_LANE-1:0]          GT_TXELECIDLE, 
    input       [PHY_LANE-1:0]          GT_TXCOMPLIANCE, 
    input       [PHY_LANE-1:0]          GT_RXPOLARITY,
    input       [(PHY_LANE* 2)-1:0]     GT_POWERDOWN,      
    input       [PHY_LANE-1:0]          GT_TXPISOPD,
      
    //--------------------------------------------------------------------------
    //  PHY Status Ports
    //--------------------------------------------------------------------------
    output      [PHY_LANE-1:0]          GT_RXVALID, 
    output      [PHY_LANE-1:0]          GT_PHYSTATUS,
    output      [PHY_LANE-1:0]          GT_RXELECIDLE,
    output      [(PHY_LANE* 3)-1:0]     GT_RXSTATUS,
      
    //--------------------------------------------------------------------------
    //  TX Equalization Ports 
    //--------------------------------------------------------------------------
    input       [(PHY_LANE* 3)-1:0]     GT_TXMARGIN,  
    input       [(PHY_LANE* 3)-1:0]     GT_TXOUTCLKSEL, 
    input       [PHY_LANE-1:0]          GT_TXSWING,  
    input       [(PHY_LANE* 2)-1:0]     GT_TXDEEMPH, 
    input       [PHY_LANE-1:0]          GT_RXCDRHOLD, 
    
    //--------------------------------------------------------------------------
    //  TX Equalization Ports (Gen3)
    //--------------------------------------------------------------------------
    input       [(PHY_LANE* 7)-1:0]     GT_TXMAINCURSOR,  
    
    //--------------------------------------------------------------------------
    //  PCIe PCS Ports
    //--------------------------------------------------------------------------
    input       [PHY_LANE-1:0]          GT_PCIERSTIDLE,        
    input       [PHY_LANE-1:0]          GT_PCIERSTTXSYNCSTART,  
    input       [PHY_LANE-1:0]          GT_PCIEEQRXEQADAPTDONE, 
    input       [PHY_LANE-1:0]          GT_PCIEUSERRATEDONE,    
             
    output      [PHY_LANE-1:0]          GT_PCIEUSERPHYSTATUSRST,  
    output      [(PHY_LANE* 2)-1:0]     GT_PCIERATEQPLLPD,              
    output      [(PHY_LANE* 2)-1:0]     GT_PCIERATEQPLLRESET,                
    output      [PHY_LANE-1:0]          GT_PCIERATEIDLE,          
    output      [PHY_LANE-1:0]          GT_PCIESYNCTXSYNCDONE,                      
    output      [PHY_LANE-1:0]          GT_PCIEUSERGEN3RDY, 
    output      [PHY_LANE-1:0]          GT_PCIEUSERRATESTART,  
   
    //--------------------------------------------------------------------------
    //  Loopback & PRBS Ports
    //--------------------------------------------------------------------------     
    input       [(PHY_LANE* 3)-1:0]     GT_LOOPBACK,                                                 
    input       [(PHY_LANE* 4)-1:0]     GT_PRBSSEL,  
    input       [PHY_LANE-1:0]          GT_TXPRBSFORCEERR,     
    input       [PHY_LANE-1:0]          GT_TXINHIBIT,     
    input       [PHY_LANE-1:0]          GT_RXPRBSCNTRESET,                                                                                                       

    output      [PHY_LANE-1:0]          GT_RXPRBSERR,                                              
    output      [PHY_LANE-1:0]          GT_RXPRBSLOCKED,  
      
    output      [PHY_LANE-1:0]          GT_RXPHALIGNDONE,  
    output      [PHY_LANE-1:0]          GT_RXDLYSRESETDONE,     
    output      [PHY_LANE-1:0]          GT_TXDLYSRESETDONE,     
    output      [PHY_LANE-1:0]          GT_RXSYNCDONE, 
    output      [PHY_LANE-1:0]          GT_EYESCANDATAERROR,
    output      [(PHY_LANE*16)-1:0]     GT_DMONITOROUT,
    input       [PHY_LANE-1:0]          GT_DMONITORCLK,
    input       [PHY_LANE-1:0]          GT_DMONFIFORESET,
    output      [(PHY_LANE*3)-1:0]      GT_RXBUFSTATUS,
    //--------------------------------------------------------------------------
    //  GT Status Ports
    //--------------------------------------------------------------------------                                                     
    output      [PHY_LANE-1:0]          GT_CPLLLOCK,       
    output      [PHY_LANE-1:0]          GT_RXCDRLOCK,                                                                 
    output      [PHY_LANE-1:0]          GT_RXRATEDONE,  
    output      [PHY_LANE-1:0]          GT_GEN34_EIOS_DET,                                                                 
    
   //--------------------------------------------------------------------------
   //  GT RX RATEMODE
   //--------------------------------------------------------------------------
   input        [PHY_LANE-1:0]          GT_RXRATEMODE, 
   //--------------------------------------------------------------------------
   //  GT RX Termination 
   input        [PHY_LANE-1:0]          GT_RXTERMINATION,
   //--------------------------------------------------------------------------
   //  GT RCALENB 
   //--------------------------------------------------------------------------   
   input                                GTCOM_RCALENB   
);

  wire                qpll0lock_all;    
  wire                qpll1lock_all;    
  wire                txsyncallin_all;



    wire [(PHY_LANE-1)>>2:0] gtrefclk01_in;
    wire [(PHY_LANE-1)>>2:0] gtrefclk00_in;
    wire [((((PHY_LANE-1)>>2)+1)*3)-1:0] pcierateqpll0_in;
    wire [((((PHY_LANE-1)>>2)+1)*3)-1:0] pcierateqpll1_in;
    wire [(PHY_LANE-1)>>2 : 0]   qpll0pd_in;
    wire [(PHY_LANE-1)>>2 : 0]   qpll0reset_in;
    wire [(PHY_LANE-1)>>2 : 0]   qpll1pd_in;
    wire [(PHY_LANE-1)>>2 : 0]   qpll1reset_in;
    wire [(PHY_LANE*2)-1 : 0]    pcierateqpllpd_out;              
    wire [(PHY_LANE*2)-1 : 0]    pcierateqpllreset_out;
    wire [(PHY_LANE-1)>>2 : 0]   rcalenb_in;
    wire [PHY_LANE-1:0] txpisopd_in;
    wire [(PHY_LANE-1)>>2:0]     qpll0lock_out;
    wire [(PHY_LANE-1)>>2:0]     qpll0outclk_out;
    wire [(PHY_LANE-1)>>2:0]     qpll0outrefclk_out;
    wire [(PHY_LANE-1)>>2:0]     qpll1lock_out;
    wire [(PHY_LANE-1)>>2:0]     qpll1outclk_out;
    wire [(PHY_LANE-1)>>2:0]     qpll1outrefclk_out;


    wire [PHY_LANE-1:0] bufgtce_out ;
    wire [(PHY_LANE* 3)-1:0] bufgtcemask_out ;
    wire [(PHY_LANE* 9)-1:0] bufgtdiv_out ;
    wire [PHY_LANE-1:0] bufgtreset_out ;
    wire [(PHY_LANE* 3)-1:0] bufgtrstmask_out ;
    wire [PHY_LANE-1:0] cpllfreqlock_in;
    wire [PHY_LANE-1:0] cplllock_out;  
    wire [PHY_LANE-1:0] cpllpd_in;
    wire [PHY_LANE-1:0] cpllreset_in;
    wire [PHY_LANE-1:0] dmonfiforeset_in ;
    wire [PHY_LANE-1:0] dmonitorclk_in ;
    wire [(PHY_LANE*16)-1:0] dmonitorout_out ;
    wire [PHY_LANE-1:0] eyescanreset_in;
    wire [PHY_LANE-1:0] gtpowergood_out;
    wire [PHY_LANE-1:0] gtrefclk0_in;
    wire [PHY_LANE-1:0] gtrxreset_in ;                                          
    wire [PHY_LANE-1:0] gttxreset_in ;                                          
    wire gtwiz_reset_rx_done_in     ;                                                                                      
    wire gtwiz_reset_tx_done_in     ;                                                
    wire gtwiz_userclk_rx_active_in ;                                                
    wire gtwiz_userclk_tx_active_in ;                                                

    wire [(PHY_LANE* 3)-1:0] loopback_in ;                                               
    wire [PHY_LANE-1:0] pcieeqrxeqadaptdone_in ;                                          
    wire [PHY_LANE-1:0] pcierategen3_out ;  
    wire [PHY_LANE-1:0] pcierateidle_out ;       
    wire [PHY_LANE-1:0] pcierstidle_in ;                                          
    wire [PHY_LANE-1:0] pciersttxsyncstart_in ;                                          
    wire [PHY_LANE-1:0] pciesynctxsyncdone_out ;                      
    wire [PHY_LANE-1:0] pcieusergen3rdy_out ; 
    wire [PHY_LANE-1:0] pcieuserphystatusrst_out;  
    wire [PHY_LANE-1:0] pcieuserratedone_in ;                                          
    wire [PHY_LANE-1:0] pcieuserratestart_out ;  
    wire [PHY_LANE-1:0] phystatus_out ;
    wire [PHY_LANE-1:0] rx8b10ben_in ;                                                          
    wire [PHY_LANE-1:0] rxbufreset_in ;
    wire [(PHY_LANE*3)-1:0] rxbufstatus_out ;
    wire [PHY_LANE-1 : 0] rxbyteisaligned_out ; 
    wire [PHY_LANE-1 : 0] rxbyterealign_out ; 
    wire [PHY_LANE-1:0] rxcdrhold_in ;                                          
    wire [PHY_LANE-1:0] rxcdrlock_out ;                                                          
    wire [PHY_LANE-1:0] rxcdrreset_in ;
    wire [(PHY_LANE * 2)-1 : 0] rxclkcorcnt_out; 
    wire [PHY_LANE-1:0] rxcommadet_out ;
    wire [PHY_LANE-1:0] rxcommadeten_in  ;
    wire [(PHY_LANE*16)-1:0] rxctrl0_out;  
    wire [(PHY_LANE*16)-1:0] rxctrl1_out;  
    wire [(PHY_LANE*8)-1:0] rxctrl2_out;  
    wire [(PHY_LANE*8)-1:0] rxctrl3_out;  
    wire [(PHY_LANE*128)-1:0] rxdata_out;  
    wire [PHY_LANE-1 : 0] rxdfeagchold_in;  
    wire [PHY_LANE-1 : 0] rxdfecfokhold_in; 
    wire [PHY_LANE-1 : 0] rxdfekhhold_in;             
    wire [PHY_LANE-1 : 0] rxdfelfhold_in;   
    wire [PHY_LANE-1:0] rxdfelpmreset_in;
    wire [PHY_LANE-1 : 0] rxdfetap10hold_in;       
    wire [PHY_LANE-1 : 0] rxdfetap11hold_in;       
    wire [PHY_LANE-1 : 0] rxdfetap12hold_in;        
    wire [PHY_LANE-1 : 0] rxdfetap13hold_in;       
    wire [PHY_LANE-1 : 0] rxdfetap14hold_in;       
    wire [PHY_LANE-1 : 0] rxdfetap15hold_in;       
    wire [PHY_LANE-1 : 0] rxdfetap2hold_in;        
    wire [PHY_LANE-1 : 0] rxdfetap3hold_in;        
    wire [PHY_LANE-1 : 0] rxdfetap4hold_in;       
    wire [PHY_LANE-1 : 0] rxdfetap5hold_in;           
    wire [PHY_LANE-1 : 0] rxdfetap6hold_in;       
    wire [PHY_LANE-1 : 0] rxdfetap7hold_in;        
    wire [PHY_LANE-1 : 0] rxdfetap8hold_in;       
    wire [PHY_LANE-1 : 0] rxdfetap9hold_in;       
    wire [PHY_LANE-1 : 0] rxdfeuthold_in;             
    wire [PHY_LANE-1 : 0] rxdfevphold_in;             
    wire [PHY_LANE-1:0] rxdlysresetdone_out ;     
    wire [PHY_LANE-1:0] rxelecidle_out;
    wire [PHY_LANE-1:0] rxlpmen_in;                                                            
    wire [PHY_LANE-1 : 0] rxlpmgchold_in;              
    wire [PHY_LANE-1 : 0] rxlpmhfhold_in;            
    wire [PHY_LANE-1 : 0] rxlpmlfhold_in;              
    wire [PHY_LANE-1 : 0] rxlpmoshold_in;   
    wire [PHY_LANE-1:0] rxmcommaalignen_in;                                                    
    wire [PHY_LANE-1 : 0] rxoshold_in;                  
    wire [PHY_LANE-1 : 0] rxoutclk_out; 
    wire [PHY_LANE-1:0] rxoutclkfabric_out;
    wire [PHY_LANE-1:0] rxoutclkpcs_out;   
    wire [PHY_LANE-1:0] rxpcommaalignen_in;                                                    
    wire [PHY_LANE-1:0] rxpcsreset_in;
    wire [(PHY_LANE* 2)-1:0]rxpd_in ;                                              
    wire [PHY_LANE-1:0] rxphaligndone_out ;
    wire [PHY_LANE-1:0] rxpmareset_in ;
    wire [PHY_LANE-1:0] rxpmaresetdone_out ;           
    wire [PHY_LANE-1:0] rxpolarity_in ;                                          
    wire [PHY_LANE-1:0] rxprbscntreset_in ; 
    wire [PHY_LANE-1:0] rxprbserr_out ;                                        
    wire [PHY_LANE-1:0] rxprbslocked_out ;
    wire [(PHY_LANE* 4)-1:0] rxprbssel_in ;                                               
    wire [PHY_LANE-1:0] rxprogdivreset_in ;                                          
    wire [(PHY_LANE* 3)-1:0] rxrate_in;
    wire [PHY_LANE-1:0] rxratedone_out;
    wire [PHY_LANE-1:0] rxrecclkout_out;   
    wire [PHY_LANE-1:0] rxresetdone_out ;              
    wire [PHY_LANE-1:0] rxslide_in ;                                                
    wire [(PHY_LANE* 3)-1:0] rxstatus_out;
    wire [PHY_LANE-1:0] rxsyncdone_out;
    wire [PHY_LANE-1:0] rxtermination_in;
    wire [PHY_LANE-1:0] rxuserrdy_in;                                          
    wire [PHY_LANE-1:0] rxusrclk2_in;                                          
    wire [PHY_LANE-1:0] rxusrclk_in;                                          
    wire [PHY_LANE-1:0] rxvalid_out;
    wire [PHY_LANE-1:0] tx8b10ben_in;                                                          
    wire [(PHY_LANE*16)-1:0] txctrl0_in;
    wire [(PHY_LANE*16)-1:0] txctrl1_in;
    wire [(PHY_LANE* 8)-1:0] txctrl2_in;
    wire [(PHY_LANE*128)-1:0] txdata_in; 
    wire [(PHY_LANE* 2)-1:0] txdeemph_in ;                                          
    wire [PHY_LANE-1:0] txdetectrx_in ;                                          
    wire [(PHY_LANE*5)-1:0] txdiffctrl_in;
    wire [PHY_LANE-1:0] txdlybypass_in ;                                                
    wire [PHY_LANE-1:0] txdlyen_in ;                                                
    wire [PHY_LANE-1:0] txdlyhold_in ;                                                
    wire [PHY_LANE-1:0] txdlyovrden_in ;                                                
    wire [PHY_LANE-1:0] txdlysreset_in ;                                                
    wire [PHY_LANE-1:0] txdlysresetdone_out ;     
    wire [PHY_LANE-1:0] txdlyupdown_in ;                                                
    wire [PHY_LANE-1:0] txelecidle_in ;                                          
    wire [(PHY_LANE* 7)-1:0] txmaincursor_in ;                                               
    wire [(PHY_LANE* 3)-1:0]txmargin_in ;                                              
    wire [PHY_LANE-1:0] txoutclk_out ;
    wire [PHY_LANE-1:0] txoutclkfabric_out;
    wire [PHY_LANE-1:0] txoutclkpcs_out;   
    wire [(PHY_LANE* 3)-1:0]txoutclksel_in ;                                           
    wire [PHY_LANE-1:0] txpcsreset_in;
    wire [(PHY_LANE* 2)-1:0]txpd_in ;                                              
    wire [PHY_LANE-1:0] txphalign_in ;                                                
    wire [PHY_LANE-1:0] txphaligndone_out;  
    wire [PHY_LANE-1:0] txphalignen_in ;                                                
    wire [PHY_LANE-1:0] txphdlypd_in ;                                                
    wire [PHY_LANE-1:0] txphdlyreset_in ;                                                
    wire [PHY_LANE-1:0] txphdlytstclk_in ;                                                
    wire [PHY_LANE-1:0] txphinit_in ;                                                
    wire [PHY_LANE-1:0] txphinitdone_out ;
    wire [PHY_LANE-1:0] txphovrden_in ;                                                
    wire [PHY_LANE-1:0] txpmareset_in;
    wire [PHY_LANE-1 : 0] txpmaresetdone_out; 
    wire [(PHY_LANE* 5)-1:0] txpostcursor_in ;                                               
    wire [PHY_LANE-1:0] txprbsforceerr_in ;                                          
    wire [(PHY_LANE* 4)-1:0] txprbssel_in ;                                               
    wire [(PHY_LANE* 5)-1:0] txprecursor_in ;                                               
    wire [PHY_LANE-1:0] txprgdivresetdone_out ;  
    wire [PHY_LANE-1:0] txpdelecidlemode_in;
    wire [PHY_LANE-1:0] txprogdivreset_in ;                                          
    wire [(PHY_LANE* 3)-1:0] txrate_in ;
    wire [PHY_LANE-1:0] txresetdone_out ;
    wire [PHY_LANE-1:0] txswing_in ;                                          
    wire [(PHY_LANE-1) : 0] txsyncallin_in; 
    wire [PHY_LANE-1 : 0] txsyncdone_out; 
    wire [(PHY_LANE-1) : 0] txsyncin_in;   
    wire [PHY_LANE-1:0] txsyncmode_in;
    wire [PHY_LANE-1:0] txsyncout_out;  
    wire [PHY_LANE-1:0] txuserrdy_in ;                                          
    wire [PHY_LANE-1:0] txusrclk2_in ;                                          
    wire [PHY_LANE-1:0] txusrclk_in ;                                          

    wire [PHY_LANE-1:0] rxcdrfreqreset_in;
    wire [PHY_LANE-1:0] resetovrd_in;
    wire [PHY_LANE-1:0] rxratemode_in;

    assign rxcdrfreqreset_in = {PHY_LANE{1'b0}};
    assign resetovrd_in = {PHY_LANE{1'b0}};

    wire [PHY_LANE-1:0] qpll0freqlock_in; 
    wire [PHY_LANE-1:0] qpll1freqlock_in; 

    assign qpll0freqlock_in = {PHY_LANE{qpll0lock_all}};
    assign qpll1freqlock_in = {PHY_LANE{qpll1lock_all}};

    wire [(PHY_LANE* 1)-1:0]  drpclk_in;
    wire [(PHY_LANE* 10)-1:0] drpaddr_in;
    wire [(PHY_LANE* 16)-1:0] drpdi_in;
    wire [(PHY_LANE* 1)-1:0]  drpen_in;
    wire [(PHY_LANE* 1)-1:0]  drprst_in;
    wire [(PHY_LANE* 1)-1:0]  drpwe_in;
    wire [(PHY_LANE* 16)-1:0] drpdo_out;
    wire [(PHY_LANE* 1)-1:0]  drprdy_out;


    wire [(PHY_LANE-1)>>2:0]  drpclk_common_in;

    assign drpclk_in = GT_DRPCLK;


    wire [((((PHY_LANE-1)>>2)+1)*16)-1:0] drpaddr_common_in;
    wire [   (PHY_LANE-1)>>2          :0] drpen_common_in;
    wire [   (PHY_LANE-1)>>2          :0] drpwe_common_in;
    wire [((((PHY_LANE-1)>>2)+1)*16)-1:0] drpdi_common_in;
    wire [   (PHY_LANE-1)>>2          :0] drprdy_common_out;
    wire [((((PHY_LANE-1)>>2)+1)*16)-1:0] drpdo_common_out;

genvar m;                                                                                                      

generate for (m=0; m<PHY_LANE; m=m+1)                                                      
                                                                                                    
    begin : drp_sigs 
                                 
    assign drpaddr_in[(10*m)+9:(10*m)] = GT_DRPADDR[(10 * ((PHY_LANE - 1) - m)) + 9 : (10 * ((PHY_LANE - 1) - m))];
    assign drpdi_in[(16*m)+15:(16*m)] = GT_DRPDI[(16 * ((PHY_LANE - 1) - m)) + 15 : (16 * ((PHY_LANE - 1) - m))];
    assign drpen_in[m] = GT_DRPEN[((PHY_LANE-1)-m)];
    assign drpwe_in[m] = GT_DRPWE[((PHY_LANE-1)-m)];
    assign drprst_in[m] = GT_DRPRST[((PHY_LANE-1)-m)];
    assign GT_DRPDO[(16*m)+15:(16*m)] = drpdo_out[(16 * ((PHY_LANE - 1) - m)) + 15 : (16 * ((PHY_LANE - 1) - m))];
    assign GT_DRPRDY[m] = drprdy_out[((PHY_LANE-1)-m)];

    end
endgenerate

   // assign drpaddr_in = GT_DRPADDR;
   // assign drpdi_in = GT_DRPDI;
   // assign drpen_in = GT_DRPEN;
   // assign drpwe_in = GT_DRPWE;
   // assign GT_DRPDO = drpdo_out;
   // assign GT_DRPRDY = drprdy_out;

    assign drpaddr_common_in = GTCOM_DRPADDR;
    assign drpen_common_in = GTCOM_DRPEN;
    assign drpwe_common_in = GTCOM_DRPWE;
    assign drpdi_common_in = GTCOM_DRPDI;
    assign GTCOM_DRPRDY = drprdy_common_out;
    assign GTCOM_DRPDO = drpdo_common_out;

    wire gtwiz_userclk_tx_reset_in;
    wire [(PHY_LANE* 18)-1:0] gtwiz_gthe4_cpll_cal_txoutclk_period_in;
    wire [(PHY_LANE* 18)-1:0] gtwiz_gthe4_cpll_cal_cnt_tol_in;
    wire [(PHY_LANE*  1)-1:0] gtwiz_gthe4_cpll_cal_bufg_ce_in;

    assign gtwiz_gthe4_cpll_cal_txoutclk_period_in = {PHY_LANE{18'd5000}};  
    assign gtwiz_gthe4_cpll_cal_cnt_tol_in         = {PHY_LANE{18'd50}};    

    assign gtwiz_userclk_tx_reset_in                 = bufgtreset_out[0];
    assign gtwiz_gthe4_cpll_cal_bufg_ce_in  = {PHY_LANE{bufgtce_out[0]}};
//-------------------------------------------------------------------------------------------------
//  Internal Signals
//-------------------------------------------------------------------------------------------------- 

    wire [(PHY_LANE* 3)-1:0] rate;
    wire [(PHY_LANE*16)-1:0] pcsrsvdout_out;
    wire [(PHY_LANE*16)-1:0] pcsrsvdin_in;
    wire [((((PHY_LANE-1)>>2)+1)* 5)-1:0] qpllrsvd2_3;
 
    wire [PHY_LANE-1:0]         gthrxn_in ; 
    wire [PHY_LANE-1:0]         gthrxp_in ; 
    wire [PHY_LANE-1:0]         gthtxn_out; 
    wire [PHY_LANE-1:0]         gthtxp_out; 

    wire [PHY_LANE-1:0] eyescandataerror_out;
    wire [PHY_LANE-1:0] txinhibit_in;    // Check                                      

    wire [((((PHY_LANE-1)>>2)+1)* 5)-1:0] qpllrsvd2_in;
    wire [((((PHY_LANE-1)>>2)+1)* 5)-1:0] qpllrsvd3_in;

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    assign qpll0lock_all   = 0;  // CPLL
    assign qpll1lock_all   = 0;  // CPLL
    assign txsyncallin_all = &txphaligndone_out;    
    
    assign gtwiz_userclk_tx_active_in = GT_TXUSERRDY[PHY_LANE-1];                                                
    assign gtwiz_userclk_rx_active_in = GT_RXUSERRDY[PHY_LANE-1];                                                
    assign gtwiz_reset_tx_done_in     = GT_TXRESETDONE[PHY_LANE-1];                                                
    assign gtwiz_reset_rx_done_in     = GT_RXRESETDONE[PHY_LANE-1];                                                                                      
    assign gtrefclk01_in         = ({(((PHY_LANE-1)>>2)+1){GT_GTREFCLK0}});                                                  
    assign gtrefclk00_in         = ({(((PHY_LANE-1)>>2)+1){GT_GTREFCLK0}});   // Check                                               
    assign gtrefclk0_in          = ({PHY_LANE{GT_GTREFCLK0}});                                                    
    assign rx8b10ben_in          = (~pcierategen3_out);                                                
    assign rxmcommaalignen_in    = (~pcierategen3_out);                                                
    assign rxpcommaalignen_in    = (~pcierategen3_out);                                                
    assign tx8b10ben_in          = (~pcierategen3_out);                                                
    assign rxcommadeten_in       = ({PHY_LANE{1'd1}});     // Always 1'd1            
    assign rxslide_in            = ({PHY_LANE{1'd0}});                                                
    assign txdlyen_in            = ({PHY_LANE{1'd0}});                                                
    assign txdlyhold_in          = ({PHY_LANE{1'd0}});                                                
    assign txdlyovrden_in        = ({PHY_LANE{1'd0}});                                                
    assign txdlysreset_in        = ({PHY_LANE{1'd0}});                                                
    assign txdlyupdown_in        = ({PHY_LANE{1'd0}});                                                
    assign txphalign_in          = ({PHY_LANE{1'd0}});                                                
    assign txphalignen_in        = ({PHY_LANE{1'd0}});                                                
 

    assign txphdlypd_in          =  1'b0;
    assign txdlybypass_in        = ({PHY_LANE{1'd0}});                                                
 
 
 
    assign txphdlyreset_in       = ({PHY_LANE{1'd0}});                                                
    assign txphdlytstclk_in      = ({PHY_LANE{1'd0}});                                                
    assign txphinit_in           = ({PHY_LANE{1'd0}});                                                
    assign txphovrden_in         = ({PHY_LANE{1'd0}});                                                
    assign txsyncallin_in        = ({PHY_LANE{txsyncallin_all}}); // From all lanes                         

    assign qpllrsvd2_in          = qpllrsvd2_3;
    assign qpllrsvd3_in          = qpllrsvd2_3;
    assign rxrate_in             = rate;
    assign txrate_in             = rate;
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// GT WIZARD IP
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 // dynamic GT Wizard instance call
   pcie4_uscale_plus_0_gt pcie4_uscale_plus_0_gt_i
  (
   .bufgtce_out(bufgtce_out),
   .bufgtcemask_out(bufgtcemask_out),
   .bufgtdiv_out(bufgtdiv_out),
   .bufgtreset_out(bufgtreset_out),
   .bufgtrstmask_out(bufgtrstmask_out),
   .cpllfreqlock_in(cpllfreqlock_in),
   .cplllock_out(cplllock_out),
   .cpllpd_in(cpllpd_in),
   .cpllreset_in(cpllreset_in),
   .dmonfiforeset_in(dmonfiforeset_in),
   .dmonitorclk_in(dmonitorclk_in),
   .dmonitorout_out(dmonitorout_out),
   .drpaddr_in(drpaddr_in),
   .drpclk_in(drpclk_in),
   .drpdi_in(drpdi_in),
   .drpdo_out(drpdo_out),
   .drpen_in(drpen_in),
   .drprdy_out(drprdy_out),
   .drprst_in(drprst_in),
   .drpwe_in(drpwe_in),
   .eyescanreset_in(eyescanreset_in),
   .gthrxn_in(gthrxn_in),
   .gthrxp_in(gthrxp_in),
   .gthtxn_out(gthtxn_out),
   .gthtxp_out(gthtxp_out),
   .gtpowergood_out(gtpowergood_out),
   .gtrefclk0_in(gtrefclk0_in),
   .gtrxreset_in(gtrxreset_in),
   .gttxreset_in(gttxreset_in),
   .gtwiz_gthe4_cpll_cal_bufg_ce_in(gtwiz_gthe4_cpll_cal_bufg_ce_in),
   .gtwiz_gthe4_cpll_cal_cnt_tol_in(gtwiz_gthe4_cpll_cal_cnt_tol_in),
   .gtwiz_gthe4_cpll_cal_txoutclk_period_in(gtwiz_gthe4_cpll_cal_txoutclk_period_in),
   .gtwiz_reset_rx_done_in(gtwiz_reset_rx_done_in),
   .gtwiz_reset_tx_done_in(gtwiz_reset_tx_done_in),
   .gtwiz_userclk_rx_active_in(gtwiz_userclk_rx_active_in),
   .gtwiz_userclk_tx_active_in(gtwiz_userclk_tx_active_in),
   .gtwiz_userclk_tx_reset_in(gtwiz_userclk_tx_reset_in),
   .loopback_in(loopback_in),
   .pcieeqrxeqadaptdone_in(pcieeqrxeqadaptdone_in),
   .pcierategen3_out(pcierategen3_out),
   .pcierateidle_out(pcierateidle_out),
   .pcierstidle_in(pcierstidle_in),
   .pciersttxsyncstart_in(pciersttxsyncstart_in),
   .pciesynctxsyncdone_out(pciesynctxsyncdone_out),
   .pcieusergen3rdy_out(pcieusergen3rdy_out),
   .pcieuserphystatusrst_out(pcieuserphystatusrst_out),
   .pcieuserratedone_in(pcieuserratedone_in),
   .pcieuserratestart_out(pcieuserratestart_out),
   .phystatus_out(phystatus_out),
   .resetovrd_in(resetovrd_in),
   .rx8b10ben_in(rx8b10ben_in),
   .rxbufreset_in(rxbufreset_in),
   .rxbufstatus_out(rxbufstatus_out),
   .rxbyteisaligned_out(rxbyteisaligned_out),
   .rxbyterealign_out(rxbyterealign_out),
   .rxcdrfreqreset_in(rxcdrfreqreset_in),
   .rxcdrhold_in(rxcdrhold_in),
   .rxcdrlock_out(rxcdrlock_out),
   .rxcdrreset_in(rxcdrreset_in),
   .rxclkcorcnt_out(rxclkcorcnt_out),
   .rxcommadet_out(rxcommadet_out),
   .rxcommadeten_in(rxcommadeten_in),
   .rxctrl0_out(rxctrl0_out),
   .rxctrl1_out(rxctrl1_out),
   .rxctrl2_out(rxctrl2_out),
   .rxctrl3_out(rxctrl3_out),
   .rxdata_out(rxdata_out),
   .rxdfeagchold_in(rxdfeagchold_in),
   .rxdfecfokhold_in(rxdfecfokhold_in),
   .rxdfekhhold_in(rxdfekhhold_in),
   .rxdfelfhold_in(rxdfelfhold_in),
   .rxdfelpmreset_in(rxdfelpmreset_in),
   .rxdfetap10hold_in(rxdfetap10hold_in),
   .rxdfetap11hold_in(rxdfetap11hold_in),
   .rxdfetap12hold_in(rxdfetap12hold_in),
   .rxdfetap13hold_in(rxdfetap13hold_in),
   .rxdfetap14hold_in(rxdfetap14hold_in),
   .rxdfetap15hold_in(rxdfetap15hold_in),
   .rxdfetap2hold_in(rxdfetap2hold_in),
   .rxdfetap3hold_in(rxdfetap3hold_in),
   .rxdfetap4hold_in(rxdfetap4hold_in),
   .rxdfetap5hold_in(rxdfetap5hold_in),
   .rxdfetap6hold_in(rxdfetap6hold_in),
   .rxdfetap7hold_in(rxdfetap7hold_in),
   .rxdfetap8hold_in(rxdfetap8hold_in),
   .rxdfetap9hold_in(rxdfetap9hold_in),
   .rxdfeuthold_in(rxdfeuthold_in),
   .rxdfevphold_in(rxdfevphold_in),
   .rxdlysresetdone_out(rxdlysresetdone_out),
   .rxelecidle_out(rxelecidle_out),
   .rxlpmen_in(rxlpmen_in),
   .rxlpmgchold_in(rxlpmgchold_in),
   .rxlpmhfhold_in(rxlpmhfhold_in),
   .rxlpmlfhold_in(rxlpmlfhold_in),
   .rxlpmoshold_in(rxlpmoshold_in),
   .rxmcommaalignen_in(rxmcommaalignen_in),
   .rxoshold_in(rxoshold_in),
   .rxoutclk_out(rxoutclk_out),
   .rxoutclkfabric_out(rxoutclkfabric_out),
   .rxoutclkpcs_out(rxoutclkpcs_out),
   .rxpcommaalignen_in(rxpcommaalignen_in),
   .rxpcsreset_in(rxpcsreset_in),
   .rxpd_in(rxpd_in),
   .rxphaligndone_out(rxphaligndone_out),
   .rxpmareset_in(rxpmareset_in),
   .rxpmaresetdone_out(rxpmaresetdone_out),
   .rxpolarity_in(rxpolarity_in),
   .rxprbscntreset_in(rxprbscntreset_in),
   .rxprbserr_out(rxprbserr_out),
   .rxprbslocked_out(rxprbslocked_out),
   .rxprbssel_in(rxprbssel_in),
   .rxprogdivreset_in(rxprogdivreset_in),
   .rxrate_in(rxrate_in),
   .rxratedone_out(rxratedone_out),
   .rxratemode_in(rxratemode_in),
   .rxrecclkout_out(rxrecclkout_out),
   .rxresetdone_out(rxresetdone_out),
   .rxslide_in(rxslide_in),
   .rxstatus_out(rxstatus_out),
   .rxsyncdone_out(rxsyncdone_out),
   .rxtermination_in(rxtermination_in),
   .rxuserrdy_in(rxuserrdy_in),
   .rxusrclk2_in(rxusrclk2_in),
   .rxusrclk_in(rxusrclk_in),
   .rxvalid_out(rxvalid_out),
   .tx8b10ben_in(tx8b10ben_in),
   .txctrl0_in(txctrl0_in),
   .txctrl1_in(txctrl1_in),
   .txctrl2_in(txctrl2_in),
   .txdata_in(txdata_in),
   .txdeemph_in(txdeemph_in),
   .txdetectrx_in(txdetectrx_in),
   .txdiffctrl_in(txdiffctrl_in),
   .txdlybypass_in(txdlybypass_in),
   .txdlyen_in(txdlyen_in),
   .txdlyhold_in(txdlyhold_in),
   .txdlyovrden_in(txdlyovrden_in),
   .txdlysreset_in(txdlysreset_in),
   .txdlysresetdone_out(txdlysresetdone_out),
   .txdlyupdown_in(txdlyupdown_in),
   .txelecidle_in(txelecidle_in),
   .txmaincursor_in(txmaincursor_in),
   .txmargin_in(txmargin_in),
   .txoutclk_out(txoutclk_out),
   .txoutclkfabric_out(txoutclkfabric_out),
   .txoutclkpcs_out(txoutclkpcs_out),
   .txoutclksel_in(txoutclksel_in),
   .txpcsreset_in(txpcsreset_in),
   .txpd_in(txpd_in),
   .txpdelecidlemode_in(txpdelecidlemode_in),
   .txphalign_in(txphalign_in),
   .txphaligndone_out(txphaligndone_out),
   .txphalignen_in(txphalignen_in),
   .txphdlypd_in(txphdlypd_in),
   .txphdlyreset_in(txphdlyreset_in),
   .txphdlytstclk_in(txphdlytstclk_in),
   .txphinit_in(txphinit_in),
   .txphinitdone_out(txphinitdone_out),
   .txphovrden_in(txphovrden_in),
   .txpisopd_in(txpisopd_in),
   .txpmareset_in(txpmareset_in),
   .txpmaresetdone_out(txpmaresetdone_out),
   .txpostcursor_in(txpostcursor_in),
   .txprbsforceerr_in(txprbsforceerr_in),
   .txprbssel_in(txprbssel_in),
   .txprecursor_in(txprecursor_in),
   .txprgdivresetdone_out(txprgdivresetdone_out),
   .txprogdivreset_in(txprogdivreset_in),
   .txrate_in(txrate_in),
   .txresetdone_out(txresetdone_out),
   .txswing_in(txswing_in),
   .txsyncallin_in(txsyncallin_in),
   .txsyncdone_out(txsyncdone_out),
   .txsyncin_in(txsyncin_in),
   .txsyncmode_in(txsyncmode_in),
   .txsyncout_out(txsyncout_out),
   .txuserrdy_in(txuserrdy_in),
   .txusrclk2_in(txusrclk2_in),
   .txusrclk_in(txusrclk_in)
  );

//--------------------------------------------------------------------- Mapping ----------------------------------------------------------------------------------------------------------------------------------------------

    assign cpllfreqlock_in  = ({PHY_LANE{cplllock_out[0]}});
    assign txsyncmode_in    = 1'b1; // X0Y7 is the Master. So, txsyncmode_in[0] = 1'b1;
    assign txsyncin_in      = ({PHY_LANE{txsyncout_out[0]}}); // From Master Lane 0 - X0Y7                  
    assign pcsrsvdin_in     = {PHY_LANE{14'd0,cplllock_out[0],qpll1lock_all}};
    assign drpclk_common_in = {GTCOM_DRPCLK};
    assign pcierateqpll0_in = {1'b0,GT_RATE[1:0]};
    assign pcierateqpll1_in = {1'b0,GT_RATE[1:0]};
    assign rate             = {1'd0,GT_RATE[1:0]};

    assign gthrxn_in              = GT_RXN[0];
    assign gthrxp_in              = GT_RXP[0];
    assign GT_TXN                 = gthtxn_out[0];
    assign GT_TXP                 = gthtxp_out[0];
    assign rxratemode_in          = GT_RXRATEMODE[0];
    assign cpllpd_in              = GT_CPLLPD[0];
    assign rxtermination_in           = GT_RXTERMINATION[0];
    assign txpmareset_in              = GT_TXPMARESET[0];
    assign rxpmareset_in              = GT_RXPMARESET[0];
    assign txpcsreset_in              = GT_TXPCSRESET[0];
    assign rxpcsreset_in              = GT_RXPCSRESET[0];
    assign rxbufreset_in              = GT_RXBUFRESET[0];
    assign rxcdrreset_in              = GT_RXCDRRESET[0];
    assign rxdfelpmreset_in           = GT_RXDFELPMRESET[0];
    assign cpllreset_in           = GT_CPLLRESET[0];
    assign eyescanreset_in        = GT_EYESCANRESET[0];
    assign txdiffctrl_in          = GT_TXDIFFCTRL[4:0];
    assign txswing_in             = GT_TXSWING[0];
    assign txusrclk_in            = GT_TXUSRCLK[0];
    assign rxusrclk_in            = GT_RXUSRCLK[0];
    assign txdeemph_in            = GT_TXDEEMPH[1:0];
    assign rxcdrhold_in           = GT_RXCDRHOLD[0];
    assign rxlpmen_in             = GT_RXLPMEN[0];
    assign txusrclk2_in           = GT_TXUSRCLK2[0];
    assign rxusrclk2_in           = GT_RXUSRCLK2[0];
    assign gttxreset_in           = GT_GTTXRESET[0];
    assign gtrxreset_in           = GT_GTRXRESET[0];
    assign txuserrdy_in           = GT_TXUSERRDY[0];
    assign rxuserrdy_in           = GT_RXUSERRDY[0];
    assign txdetectrx_in          = GT_TXDETECTRX[0];
    assign txelecidle_in          = GT_TXELECIDLE[0];
    assign rxpolarity_in          = GT_RXPOLARITY[0];
    assign txprogdivreset_in      = GT_TXPROGDIVRESET[0];
    assign rxprogdivreset_in      = GT_RXPROGDIVRESET[0];
    assign txpisopd_in            = GT_TXPISOPD[0];

    assign dmonitorclk_in         = GT_DMONITORCLK[0];
    assign dmonfiforeset_in       = GT_DMONFIFORESET[0];
    assign GT_DMONITOROUT         = dmonitorout_out[15:0];
    assign GT_TXOUTCLK            = txoutclk_out[0];
    assign GT_RXCOMMADET          = rxcommadet_out[0];
    assign GT_GTPOWERGOOD         = gtpowergood_out[0];
    assign GT_TXRESETDONE         = txresetdone_out[0];
    assign GT_RXRESETDONE         = rxresetdone_out[0];
    assign GT_TXPHINITDONE        = txphinitdone_out[0];
    assign GT_TXPHALIGNDONE       = txphaligndone_out[0];
    assign GT_RXPMARESETDONE      = rxpmaresetdone_out[0];
    assign GT_TXPROGDIVRESETDONE  = txprgdivresetdone_out[0];

    assign GT_RXVALID             = rxvalid_out[0];
    assign GT_RXPRBSERR           = rxprbserr_out[0];
    assign GT_PHYSTATUS           = phystatus_out[0];
    assign GT_RXCDRLOCK           = rxcdrlock_out[0];
    assign pcierstidle_in         = GT_PCIERSTIDLE[0];
    assign GT_RXELECIDLE          = rxelecidle_out[0];
    assign GT_RXSYNCDONE          = rxsyncdone_out[0];
    assign GT_PCIERATEIDLE        = pcierateidle_out[0];
    assign GT_RXPRBSLOCKED        = rxprbslocked_out[0];
    assign GT_PCIERATEGEN3        = pcierategen3_out[0];
    assign GT_RXPHALIGNDONE       = rxphaligndone_out[0];
    assign txprbsforceerr_in      = GT_TXPRBSFORCEERR[0];
    assign txinhibit_in           = GT_TXINHIBIT[0];
    assign rxprbscntreset_in      = GT_RXPRBSCNTRESET[0];
    assign GT_TXDLYSRESETDONE     = txdlysresetdone_out[0];
    assign GT_RXDLYSRESETDONE     = rxdlysresetdone_out[0];
    assign GT_PCIEUSERGEN3RDY     = pcieusergen3rdy_out[0];
    assign pcieuserratedone_in    = GT_PCIEUSERRATEDONE[0];
    assign GT_PCIEUSERRATESTART   = pcieuserratestart_out[0];
    assign GT_EYESCANDATAERROR    = eyescandataerror_out[0];
    assign pciersttxsyncstart_in  = GT_PCIERSTTXSYNCSTART[0];
    assign GT_PCIESYNCTXSYNCDONE  = pciesynctxsyncdone_out[0];
    assign pcieeqrxeqadaptdone_in = GT_PCIEEQRXEQADAPTDONE[0];
    assign GT_PCIEUSERPHYSTATUSRST= pcieuserphystatusrst_out[0];

    assign GT_BUFGTCE             = bufgtce_out[0];
    assign loopback_in            = GT_LOOPBACK[2:0];
    assign txmargin_in            = GT_TXMARGIN[2:0];
    assign txoutclksel_in         = GT_TXOUTCLKSEL[2:0];
    assign GT_RXSTATUS            = rxstatus_out[2:0];
    assign GT_BUFGTRESET          = bufgtreset_out[0];
    assign GT_RXBUFSTATUS         = rxbufstatus_out[2:0];
    assign GT_BUFGTCEMASK         = bufgtcemask_out[2:0];
    assign GT_BUFGTRSTMASK        = bufgtrstmask_out[2:0];

    assign rxpd_in                = GT_POWERDOWN[1:0];
    assign txpd_in                = GT_POWERDOWN[1:0];

    assign rxprbssel_in           = GT_PRBSSEL[3:0];
    assign txprbssel_in           = GT_PRBSSEL[3:0];
    assign txprecursor_in         = GT_TXPRECURSOR[4:0];
    assign txpostcursor_in        = GT_TXPOSTCURSOR[4:0];
    assign txmaincursor_in        = GT_TXMAINCURSOR[6:0];

    assign GT_BUFGTDIV            = bufgtdiv_out[8:0];

    assign txdata_in[127:0]   = {64'd0,GT_TXDATA[63:0]};// Lane - 0 -to X0Y7                                        
                                                                             
    assign txctrl2_in[7:0]     = {6'd0,GT_TXDATAK[1:0]};// Lane - 0 -to X0Y7
   
    assign txctrl0_in[15:0]    = {10'd0,GT_TXSYNC_HEADER[1:0],GT_TXSTART_BLOCK[0],GT_TXDATA_VALID[0],2'd0};// Lane - 0 -to X0Y7                                      
    
    assign txctrl1_in[15:0]    = {15'd0,GT_TXCOMPLIANCE[0]};// Lane - 0 -to X0Y7                            
                                                                                          
    assign GT_RXDATA[63:0]    = rxdata_out[63:0];// Lane - 0 -to X0Y7

    assign GT_RXDATAK[1:0]       = rxctrl0_out[1:0];// Lane - 0 -to X0Y7
    assign GT_RXDATA_VALID[0]    = rxctrl0_out[2];// Lane - 0 -to X0Y7
    assign GT_RXSYNC_HEADER[1:0] = rxctrl0_out[5:4];// Lane - 0 -to X0Y7
    assign GT_RXSTART_BLOCK[1:0] = {rxctrl0_out[6],rxctrl0_out[3]};// Lane - 0 -to X0Y7
    assign GT_GEN34_EIOS_DET     = rxctrl0_out[7]; 

    //----------------------------------------------------------------------------------------------
    //  PHY Quad - Generate one Quad for every four Lanes
    //----------------------------------------------------------------------------------------------
    //  Generate QPLL Powerdown and Reset
    //----------------------------------------------------------------------
    //  * QPLL reset and powerdown for Quad 1 driven by       Master Lane 0
    //  * QPLL reset and powerdown for Quad 2 driven by Local Master Lane 4
    //----------------------------------------------------------------------        
    assign qpll0pd_in[0]    = (GTCOM_QPLLPD    || pcierateqpllpd_out[0]);     // Quad-X0Y1 - 0
    assign qpll0reset_in[0] = (GTCOM_QPLLRESET || pcierateqpllreset_out[0]);  // Quad-X0Y1 - 0

    assign qpll1pd_in[0]    = (GTCOM_QPLLPD    || pcierateqpllpd_out[0]);     // Quad-X0Y1 - 0
    assign qpll1reset_in[0] = (GTCOM_QPLLRESET || pcierateqpllreset_out[0]);  // Quad-X0Y1 - 0
             
    assign qpllrsvd2_3     = {2'd0,1'd1, GT_RATE[1:0]};   // From [TX/RX]RATE port
    assign rcalenb_in[0]   = GTCOM_RCALENB;
    //----------------------------------------------------------------------        
    assign GT_CPLLLOCK          = cplllock_out[0];
    assign GT_PCIERATEQPLLPD    = pcierateqpllpd_out[1:0];
    assign GT_PCIERATEQPLLRESET = pcierateqpllreset_out[1:0];
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    assign GTCOM_QPLL0LOCK      = 0;
    assign GTCOM_QPLL0OUTCLK    = 0;
    assign GTCOM_QPLL0OUTREFCLK = 0;
    assign GTCOM_QPLL1LOCK      = 0;
    assign GTCOM_QPLL1OUTCLK    = 0;
    assign GTCOM_QPLL1OUTREFCLK = 0;

genvar k;                                                                                                      
                                                                                                               
generate for (k=0; k<PHY_LANE; k=k+1)                                                      
                                                                                                    
   begin : new_sigs
                                 
   assign GT_TXOUTCLKFABRIC[k] = txoutclkfabric_out[((PHY_LANE-1)-k)]; 
   assign GT_RXOUTCLKFABRIC[k] = rxoutclkfabric_out[((PHY_LANE-1)-k)]; 
   assign GT_TXOUTCLKPCS[k]    = txoutclkpcs_out[((PHY_LANE-1)-k)]; 
   assign GT_RXOUTCLKPCS[k]    = rxoutclkpcs_out[((PHY_LANE-1)-k)];  
   assign GT_RXRECCLKOUT[k]    = rxrecclkout_out[((PHY_LANE-1)-k)];  
   assign GT_TXPMARESETDONE[k] = txpmaresetdone_out[((PHY_LANE-1)-k)];   
   assign GT_RXRATEDONE[k]     = rxratedone_out[((PHY_LANE-1)-k)];
   assign GT_RXOUTCLK[k]       = rxoutclk_out[((PHY_LANE-1)-k)];
   end
endgenerate

   assign rxdfeagchold_in = rxcdrhold_in;  
   assign rxdfecfokhold_in = rxcdrhold_in; 
   assign rxdfelfhold_in = rxcdrhold_in;   
   assign rxdfekhhold_in = rxcdrhold_in;             
   assign rxdfetap2hold_in = rxcdrhold_in;        
   assign rxdfetap3hold_in = rxcdrhold_in;        
   assign rxdfetap4hold_in = rxcdrhold_in;       
   assign rxdfetap5hold_in = rxcdrhold_in;           
   assign rxdfetap6hold_in = rxcdrhold_in;       
   assign rxdfetap7hold_in = rxcdrhold_in;        
   assign rxdfetap8hold_in = rxcdrhold_in;       
   assign rxdfetap9hold_in = rxcdrhold_in;       
   assign rxdfetap10hold_in = rxcdrhold_in;       
   assign rxdfetap11hold_in = rxcdrhold_in;       
   assign rxdfetap12hold_in = rxcdrhold_in;        
   assign rxdfetap13hold_in = rxcdrhold_in;       
   assign rxdfetap14hold_in = rxcdrhold_in;       
   assign rxdfetap15hold_in = rxcdrhold_in;       
   assign rxdfeuthold_in = rxcdrhold_in;             
   assign rxdfevphold_in = rxcdrhold_in;             
   assign rxoshold_in = rxcdrhold_in;                  
   assign rxlpmgchold_in = rxcdrhold_in;              
   assign rxlpmhfhold_in = rxcdrhold_in;            
   assign rxlpmlfhold_in = rxcdrhold_in;              
   assign rxlpmoshold_in = rxcdrhold_in;  
 
   assign EXT_QPLL0PD     = 'd0;
   assign EXT_QPLL0RESET  = 'd0;
   assign EXT_QPLL1PD     = 'd0; 
   assign EXT_QPLL1RESET  = 'd0;

 assign txpdelecidlemode_in = GT_DRPRST;

endmodule

