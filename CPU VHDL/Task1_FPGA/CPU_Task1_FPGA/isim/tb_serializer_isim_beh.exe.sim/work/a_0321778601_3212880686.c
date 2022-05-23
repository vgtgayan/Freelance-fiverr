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
static const char *ng0 = "C:/Users/gayan/Documents/FVR/CPU VHDL/Task1_FPGA/my_genpulse.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_3499444699;

char *ieee_p_3499444699_sub_2213602152_3536714472(char *, char *, int , int );
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0321778601_3212880686_p_0(char *t0)
{
    char t15[16];
    char t25[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    int t16;
    int t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t26;
    unsigned int t27;

LAB0:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 4048);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(44, ng0);
    t1 = xsi_get_transient_memory(17U);
    memset(t1, 0, 17U);
    t5 = t1;
    memset(t5, (unsigned char)2, 17U);
    t6 = (t0 + 4160);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 17U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 1352U);
    t6 = *((char **)t2);
    t13 = *((unsigned char *)t6);
    t14 = (t13 == (unsigned char)3);
    if (t14 != 0)
        goto LAB10;

LAB12:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 1832U);
    t7 = *((char **)t2);
    t2 = (t0 + 6532U);
    t16 = (100000 - 1);
    t8 = (t0 + 2248U);
    t9 = *((char **)t8);
    t17 = *((int *)t9);
    t8 = ieee_p_3499444699_sub_2213602152_3536714472(IEEE_P_3499444699, t15, t16, t17);
    t18 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t7, t2, t8, t15);
    if (t18 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 6532U);
    t5 = (t0 + 2248U);
    t6 = *((char **)t5);
    t16 = *((int *)t6);
    t5 = ieee_p_3499444699_sub_2213602152_3536714472(IEEE_P_3499444699, t25, 1, t16);
    t7 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t15, t2, t1, t5, t25);
    t8 = (t15 + 12U);
    t26 = *((unsigned int *)t8);
    t27 = (1U * t26);
    t3 = (17U != t27);
    if (t3 == 1)
        goto LAB16;

LAB17:    t9 = (t0 + 4160);
    t10 = (t9 + 56U);
    t19 = *((char **)t10);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t7, 17U);
    xsi_driver_first_trans_fast(t9);

LAB14:    goto LAB11;

LAB13:    xsi_set_current_line(48, ng0);
    t10 = xsi_get_transient_memory(17U);
    memset(t10, 0, 17U);
    t19 = t10;
    memset(t19, (unsigned char)2, 17U);
    t20 = (t0 + 4160);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t10, 17U);
    xsi_driver_first_trans_fast(t20);
    goto LAB14;

LAB16:    xsi_size_not_matching(17U, t27, 0);
    goto LAB17;

}

static void work_a_0321778601_3212880686_p_1(char *t0)
{
    char t3[16];
    char *t1;
    char *t2;
    int t4;
    char *t5;
    char *t6;
    int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 6532U);
    t4 = (100000 - 1);
    t5 = (t0 + 2248U);
    t6 = *((char **)t5);
    t7 = *((int *)t6);
    t5 = ieee_p_3499444699_sub_2213602152_3536714472(IEEE_P_3499444699, t3, t4, t7);
    t8 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t3);
    if (t8 != 0)
        goto LAB3;

LAB4:
LAB5:    t14 = (t0 + 4224);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t14);

LAB2:    t19 = (t0 + 4064);
    *((int *)t19) = 1;

LAB1:    return;
LAB3:    t9 = (t0 + 4224);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t9);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_0321778601_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(57, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 4288);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 17U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4080);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0321778601_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0321778601_3212880686_p_0,(void *)work_a_0321778601_3212880686_p_1,(void *)work_a_0321778601_3212880686_p_2};
	xsi_register_didat("work_a_0321778601_3212880686", "isim/tb_serializer_isim_beh.exe.sim/work/a_0321778601_3212880686.didat");
	xsi_register_executes(pe);
}
