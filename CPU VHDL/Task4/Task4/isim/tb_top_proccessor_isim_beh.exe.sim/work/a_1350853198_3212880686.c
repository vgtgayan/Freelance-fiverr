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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/gayan/Documents/FVR/CPU VHDL/Task4/Registers.vhd";
extern char *IEEE_P_1242562249;
extern char *WORK_P_2188849903;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1350853198_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(56, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t1 = (t0 + 7352U);
    t4 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t5 = (t4 - 0);
    t6 = (t5 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, t4);
    t7 = (8U * t6);
    t8 = (0 + t7);
    t9 = (t2 + t8);
    t10 = (t0 + 4560);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 8U);
    xsi_driver_first_trans_fast_port(t10);

LAB2:    t15 = (t0 + 4448);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1350853198_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(57, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 7384U);
    t4 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t5 = (t4 - 0);
    t6 = (t5 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, t4);
    t7 = (8U * t6);
    t8 = (0 + t7);
    t9 = (t2 + t8);
    t10 = (t0 + 4624);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 8U);
    xsi_driver_first_trans_fast_port(t10);

LAB2:    t15 = (t0 + 4464);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1350853198_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    int t6;
    int t7;
    char *t8;
    int t9;
    int t10;
    char *t11;
    char *t12;
    char *t13;
    int t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned char t24;
    unsigned char t25;
    unsigned int t26;
    unsigned int t27;
    unsigned char t28;
    unsigned int t29;
    char *t30;
    int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;

LAB0:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB10;

LAB11:
LAB3:    t1 = (t0 + 4480);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(64, ng0);
    t1 = ((WORK_P_2188849903) + 1888U);
    t5 = *((char **)t1);
    t6 = *((int *)t5);
    t7 = (t6 - 1);
    t1 = (t0 + 7572);
    *((int *)t1) = 0;
    t8 = (t0 + 7576);
    *((int *)t8) = t7;
    t9 = 0;
    t10 = t7;

LAB5:    if (t9 <= t10)
        goto LAB6;

LAB8:    goto LAB3;

LAB6:    xsi_set_current_line(65, ng0);
    t11 = xsi_get_transient_memory(8U);
    memset(t11, 0, 8U);
    t12 = t11;
    memset(t12, (unsigned char)2, 8U);
    t13 = (t0 + 7572);
    t14 = *((int *)t13);
    t15 = (t14 - 0);
    t16 = (t15 * 1);
    t17 = (8U * t16);
    t18 = (0U + t17);
    t19 = (t0 + 4688);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t11, 8U);
    xsi_driver_first_trans_delta(t19, t18, 8U, 0LL);

LAB7:    t1 = (t0 + 7572);
    t9 = *((int *)t1);
    t2 = (t0 + 7576);
    t10 = *((int *)t2);
    if (t9 == t10)
        goto LAB8;

LAB9:    t6 = (t9 + 1);
    t9 = t6;
    t5 = (t0 + 7572);
    *((int *)t5) = t9;
    goto LAB5;

LAB10:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 2312U);
    t5 = *((char **)t2);
    t24 = *((unsigned char *)t5);
    t25 = (t24 == (unsigned char)3);
    if (t25 == 1)
        goto LAB15;

LAB16:    t4 = (unsigned char)0;

LAB17:    if (t4 != 0)
        goto LAB12;

LAB14:
LAB13:    goto LAB3;

LAB12:    xsi_set_current_line(74, ng0);
    t22 = (t0 + 2152U);
    t23 = *((char **)t22);
    t22 = (t0 + 1992U);
    t30 = *((char **)t22);
    t22 = (t0 + 7416U);
    t31 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t30, t22);
    t32 = (t31 - 0);
    t33 = (t32 * 1);
    t34 = (8U * t33);
    t35 = (0U + t34);
    t36 = (t0 + 4688);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t23, 8U);
    xsi_driver_first_trans_delta(t36, t35, 8U, 0LL);
    goto LAB13;

LAB15:    t2 = (t0 + 1992U);
    t8 = *((char **)t2);
    t2 = xsi_get_transient_memory(3U);
    memset(t2, 0, 3U);
    t11 = t2;
    t12 = ((WORK_P_2188849903) + 1648U);
    t13 = *((char **)t12);
    t6 = *((int *)t13);
    t7 = (t6 - 1);
    if (-1 == -1)
        goto LAB18;

LAB19:    t16 = 0;

LAB20:    t9 = (t16 - 2);
    t17 = (t9 * -1);
    t18 = (1U * t17);
    t12 = (t11 + t18);
    t19 = ((WORK_P_2188849903) + 1648U);
    t20 = *((char **)t19);
    t10 = *((int *)t20);
    t14 = (t10 - 1);
    t15 = (0 - t14);
    t26 = (t15 * -1);
    t26 = (t26 + 1);
    t27 = (1U * t26);
    memset(t12, (unsigned char)2, t27);
    t28 = 1;
    if (3U == 3U)
        goto LAB21;

LAB22:    t28 = 0;

LAB23:    t4 = (!(t28));
    goto LAB17;

LAB18:    t16 = t7;
    goto LAB20;

LAB21:    t29 = 0;

LAB24:    if (t29 < 3U)
        goto LAB25;
    else
        goto LAB23;

LAB25:    t19 = (t8 + t29);
    t21 = (t2 + t29);
    if (*((unsigned char *)t19) != *((unsigned char *)t21))
        goto LAB22;

LAB26:    t29 = (t29 + 1);
    goto LAB24;

}


extern void work_a_1350853198_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1350853198_3212880686_p_0,(void *)work_a_1350853198_3212880686_p_1,(void *)work_a_1350853198_3212880686_p_2};
	xsi_register_didat("work_a_1350853198_3212880686", "isim/tb_top_proccessor_isim_beh.exe.sim/work/a_1350853198_3212880686.didat");
	xsi_register_executes(pe);
}
