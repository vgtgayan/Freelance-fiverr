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
static const char *ng0 = "C:/Users/gayan/Documents/FVR/CPU VHDL/Task3/Instructions_ROM.vhd";
extern char *IEEE_P_1242562249;
extern char *WORK_P_2188849903;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


static void work_a_1483344290_3212880686_p_0(char *t0)
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

LAB0:    xsi_set_current_line(48, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 5692U);
    t4 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t5 = (t4 - 0);
    t6 = (t5 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t4);
    t7 = (16U * t6);
    t8 = (0 + t7);
    t9 = (t2 + t8);
    t10 = (t0 + 3336);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 16U);
    xsi_driver_first_trans_fast_port(t10);

LAB2:    t15 = (t0 + 3240);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1483344290_3212880686_p_1(char *t0)
{
    char t38[16];
    char t40[16];
    char t45[16];
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
    char *t14;
    char *t15;
    char *t16;
    unsigned char t17;
    char *t18;
    int t19;
    char *t20;
    int t21;
    int t22;
    int t23;
    unsigned int t24;
    int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    int t30;
    char *t31;
    int t32;
    int t33;
    int t34;
    int t35;
    unsigned int t36;
    unsigned int t37;
    char *t39;
    char *t41;
    char *t42;
    int t43;
    unsigned int t44;
    char *t46;
    int t47;
    unsigned char t48;
    int t49;
    int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    char *t58;

LAB0:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3256);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(57, ng0);
    t1 = ((WORK_P_2188849903) + 2008U);
    t5 = *((char **)t1);
    t6 = *((int *)t5);
    t7 = (t6 - 1);
    t1 = (t0 + 9869);
    *((int *)t1) = 0;
    t8 = (t0 + 9873);
    *((int *)t8) = t7;
    t9 = 0;
    t10 = t7;

LAB5:    if (t9 <= t10)
        goto LAB6;

LAB8:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 9881);
    t3 = (16U != 16U);
    if (t3 == 1)
        goto LAB15;

LAB16:    t5 = (t0 + 3400);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_delta(t5, 0U, 16U, 0LL);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 9897);
    t3 = (16U != 16U);
    if (t3 == 1)
        goto LAB17;

LAB18:    t5 = (t0 + 3400);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_delta(t5, 16U, 16U, 0LL);
    xsi_set_current_line(77, ng0);
    t1 = (t0 + 9913);
    t3 = (16U != 16U);
    if (t3 == 1)
        goto LAB19;

LAB20:    t5 = (t0 + 3400);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_delta(t5, 32U, 16U, 0LL);
    xsi_set_current_line(78, ng0);
    t1 = (t0 + 9929);
    t3 = (16U != 16U);
    if (t3 == 1)
        goto LAB21;

LAB22:    t5 = (t0 + 3400);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_delta(t5, 48U, 16U, 0LL);
    xsi_set_current_line(79, ng0);
    t1 = (t0 + 9945);
    t3 = (16U != 16U);
    if (t3 == 1)
        goto LAB23;

LAB24:    t5 = (t0 + 3400);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_delta(t5, 64U, 16U, 0LL);
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 9961);
    t3 = (16U != 16U);
    if (t3 == 1)
        goto LAB25;

LAB26:    t5 = (t0 + 3400);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_delta(t5, 3984U, 16U, 0LL);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 9977);
    t3 = (16U != 16U);
    if (t3 == 1)
        goto LAB27;

LAB28:    t5 = (t0 + 3400);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_delta(t5, 4000U, 16U, 0LL);
    xsi_set_current_line(87, ng0);
    t1 = (t0 + 9993);
    t3 = (16U != 16U);
    if (t3 == 1)
        goto LAB29;

LAB30:    t5 = (t0 + 3400);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_delta(t5, 4016U, 16U, 0LL);
    xsi_set_current_line(88, ng0);
    t1 = (t0 + 10009);
    t3 = (16U != 16U);
    if (t3 == 1)
        goto LAB31;

LAB32:    t5 = (t0 + 3400);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_delta(t5, 4032U, 16U, 0LL);
    xsi_set_current_line(89, ng0);
    t1 = (t0 + 10025);
    t3 = (16U != 16U);
    if (t3 == 1)
        goto LAB33;

LAB34:    t5 = (t0 + 3400);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_delta(t5, 4048U, 16U, 0LL);
    xsi_set_current_line(90, ng0);
    t1 = (t0 + 10041);
    t3 = (16U != 16U);
    if (t3 == 1)
        goto LAB35;

LAB36:    t5 = (t0 + 3400);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_delta(t5, 4064U, 16U, 0LL);
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 10057);
    t3 = (16U != 16U);
    if (t3 == 1)
        goto LAB37;

LAB38:    t5 = (t0 + 3400);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_delta(t5, 4080U, 16U, 0LL);
    goto LAB3;

LAB6:    xsi_set_current_line(58, ng0);
    t11 = (t0 + 9877);
    t13 = xsi_get_transient_memory(12U);
    memset(t13, 0, 12U);
    t14 = t13;
    t15 = (t0 + 1032U);
    t16 = *((char **)t15);
    t17 = *((unsigned char *)t16);
    t15 = ((WORK_P_2188849903) + 1408U);
    t18 = *((char **)t15);
    t19 = *((int *)t18);
    t15 = ((WORK_P_2188849903) + 1528U);
    t20 = *((char **)t15);
    t21 = *((int *)t20);
    t22 = (t19 - t21);
    t23 = (t22 - 1);
    if (-1 == 1)
        goto LAB9;

LAB10:    t24 = 0;

LAB11:    t25 = (t24 - 0);
    t26 = (t25 * 1);
    t27 = (1U * t26);
    t15 = (t14 + t27);
    t28 = ((WORK_P_2188849903) + 1408U);
    t29 = *((char **)t28);
    t30 = *((int *)t29);
    t28 = ((WORK_P_2188849903) + 1528U);
    t31 = *((char **)t28);
    t32 = *((int *)t31);
    t33 = (t30 - t32);
    t34 = (t33 - 1);
    t35 = (0 - t34);
    t36 = (t35 * -1);
    t36 = (t36 + 1);
    t37 = (1U * t36);
    memset(t15, t17, t37);
    t39 = ((IEEE_P_2592010699) + 4024);
    t41 = (t40 + 0U);
    t42 = (t41 + 0U);
    *((int *)t42) = 0;
    t42 = (t41 + 4U);
    *((int *)t42) = 3;
    t42 = (t41 + 8U);
    *((int *)t42) = 1;
    t43 = (3 - 0);
    t44 = (t43 * 1);
    t44 = (t44 + 1);
    t42 = (t41 + 12U);
    *((unsigned int *)t42) = t44;
    t42 = (t45 + 0U);
    t46 = (t42 + 0U);
    *((int *)t46) = 0;
    t46 = (t42 + 4U);
    *((int *)t46) = 11;
    t46 = (t42 + 8U);
    *((int *)t46) = 1;
    t47 = (11 - 0);
    t44 = (t47 * 1);
    t44 = (t44 + 1);
    t46 = (t42 + 12U);
    *((unsigned int *)t46) = t44;
    t28 = xsi_base_array_concat(t28, t38, t39, (char)97, t11, t40, (char)97, t13, t45, (char)101);
    t44 = (4U + 12U);
    t48 = (16U != t44);
    if (t48 == 1)
        goto LAB12;

LAB13:    t46 = (t0 + 9869);
    t49 = *((int *)t46);
    t50 = (t49 - 0);
    t51 = (t50 * 1);
    t52 = (16U * t51);
    t53 = (0U + t52);
    t54 = (t0 + 3400);
    t55 = (t54 + 56U);
    t56 = *((char **)t55);
    t57 = (t56 + 56U);
    t58 = *((char **)t57);
    memcpy(t58, t28, 16U);
    xsi_driver_first_trans_delta(t54, t53, 16U, 0LL);

LAB7:    t1 = (t0 + 9869);
    t9 = *((int *)t1);
    t2 = (t0 + 9873);
    t10 = *((int *)t2);
    if (t9 == t10)
        goto LAB8;

LAB14:    t6 = (t9 + 1);
    t9 = t6;
    t5 = (t0 + 9869);
    *((int *)t5) = t9;
    goto LAB5;

LAB9:    t24 = t23;
    goto LAB11;

LAB12:    xsi_size_not_matching(16U, t44, 0);
    goto LAB13;

LAB15:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB16;

LAB17:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB18;

LAB19:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB20;

LAB21:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB22;

LAB23:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB24;

LAB25:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB26;

LAB27:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB28;

LAB29:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB32;

LAB33:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB34;

LAB35:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB36;

LAB37:    xsi_size_not_matching(16U, 16U, 0);
    goto LAB38;

}


extern void work_a_1483344290_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1483344290_3212880686_p_0,(void *)work_a_1483344290_3212880686_p_1};
	xsi_register_didat("work_a_1483344290_3212880686", "isim/tb_top_proccessor_isim_beh.exe.sim/work/a_1483344290_3212880686.didat");
	xsi_register_executes(pe);
}
