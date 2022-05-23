/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *WORK_P_2188849903;
char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_p_2188849903_init();
    ieee_p_1242562249_init();
    work_a_1991350011_3212880686_init();
    work_a_1350853198_3212880686_init();
    work_a_0832606739_1516540902_init();
    work_a_1483344290_3212880686_init();
    work_a_1208337864_3212880686_init();
    work_a_2263464102_3212880686_init();
    work_a_1154134774_1516540902_init();
    work_a_3248430724_2372691052_init();


    xsi_register_tops("work_a_3248430724_2372691052");

    WORK_P_2188849903 = xsi_get_engine_memory("work_p_2188849903");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");

    return xsi_run_simulation(argc, argv);

}
