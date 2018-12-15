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

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/csehome/ktaebum/Workspace/LogicDesignFinal/Set24.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {2U, 0U};
static int ng5[] = {23, 0};
static int ng6[] = {1, 0};
static int ng7[] = {59, 0};



static void Initial_40_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(40, ng0);

LAB2:    xsi_set_current_line(41, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2496);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(42, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 5, 0LL);
    xsi_set_current_line(43, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2816);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 6, 0LL);
    xsi_set_current_line(44, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 2, 0LL);

LAB1:    return;
}

static void Always_47_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 4296U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 4864);
    *((int *)t2) = 1;
    t3 = (t0 + 4328);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(47, ng0);

LAB5:    xsi_set_current_line(48, ng0);
    t4 = (t0 + 3136);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 2976);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 2, 0LL);
    goto LAB2;

}

static void Always_51_2(char *t0)
{
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;
    char *t38;

LAB0:    t1 = (t0 + 4544U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 4880);
    *((int *)t2) = 1;
    t3 = (t0 + 4576);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(51, ng0);

LAB5:    xsi_set_current_line(52, ng0);
    t4 = (t0 + 1616U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(58, ng0);

LAB10:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 3136);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB11:    t5 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t5, 2);
    if (t13 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng3)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t13 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t13 == 1)
        goto LAB16;

LAB17:
LAB18:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(52, ng0);

LAB9:    xsi_set_current_line(53, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2496);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2816);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 6, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    goto LAB8;

LAB12:    xsi_set_current_line(60, ng0);

LAB19:    xsi_set_current_line(61, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2496);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB20;

LAB21:
LAB22:    goto LAB18;

LAB14:    xsi_set_current_line(70, ng0);

LAB24:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 1776U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB25;

LAB26:    xsi_set_current_line(75, ng0);

LAB29:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 1936U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB30;

LAB31:    xsi_set_current_line(85, ng0);

LAB43:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 2096U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB44;

LAB45:
LAB46:
LAB32:
LAB27:    goto LAB18;

LAB16:    xsi_set_current_line(99, ng0);

LAB57:    xsi_set_current_line(100, ng0);
    t3 = (t0 + 1776U);
    t5 = *((char **)t3);
    t3 = (t5 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB58;

LAB59:    xsi_set_current_line(104, ng0);

LAB62:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 1936U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB63;

LAB64:    xsi_set_current_line(114, ng0);

LAB76:    xsi_set_current_line(115, ng0);
    t2 = (t0 + 2096U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB77;

LAB78:
LAB79:
LAB65:
LAB60:    goto LAB18;

LAB20:    xsi_set_current_line(62, ng0);

LAB23:    xsi_set_current_line(63, ng0);
    t5 = ((char*)((ng3)));
    t11 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 2, 0LL);
    xsi_set_current_line(64, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2816);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 6, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2496);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB22;

LAB25:    xsi_set_current_line(71, ng0);

LAB28:    xsi_set_current_line(72, ng0);
    t11 = ((char*)((ng4)));
    t12 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 2, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2496);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB27;

LAB30:    xsi_set_current_line(76, ng0);

LAB33:    xsi_set_current_line(77, ng0);
    t5 = (t0 + 2656);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng5)));
    memset(t15, 0, 8);
    t16 = (t12 + 4);
    t17 = (t14 + 4);
    t18 = *((unsigned int *)t12);
    t19 = *((unsigned int *)t14);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t16);
    t22 = *((unsigned int *)t17);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t16);
    t26 = *((unsigned int *)t17);
    t27 = (t25 | t26);
    t28 = (~(t27));
    t29 = (t24 & t28);
    if (t29 != 0)
        goto LAB37;

LAB34:    if (t27 != 0)
        goto LAB36;

LAB35:    *((unsigned int *)t15) = 1;

LAB37:    t31 = (t15 + 4);
    t32 = *((unsigned int *)t31);
    t33 = (~(t32));
    t34 = *((unsigned int *)t15);
    t35 = (t34 & t33);
    t36 = (t35 != 0);
    if (t36 > 0)
        goto LAB38;

LAB39:    xsi_set_current_line(81, ng0);

LAB42:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 2656);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng6)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 32, t5, 5, t11, 32);
    t12 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t12, t15, 0, 0, 5, 0LL);

LAB40:    goto LAB32;

LAB36:    t30 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB37;

LAB38:    xsi_set_current_line(77, ng0);

LAB41:    xsi_set_current_line(79, ng0);
    t37 = ((char*)((ng1)));
    t38 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t38, t37, 0, 0, 5, 0LL);
    goto LAB40;

LAB44:    xsi_set_current_line(86, ng0);

LAB47:    xsi_set_current_line(87, ng0);
    t5 = (t0 + 2656);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng1)));
    memset(t15, 0, 8);
    t16 = (t12 + 4);
    t17 = (t14 + 4);
    t18 = *((unsigned int *)t12);
    t19 = *((unsigned int *)t14);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t16);
    t22 = *((unsigned int *)t17);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t16);
    t26 = *((unsigned int *)t17);
    t27 = (t25 | t26);
    t28 = (~(t27));
    t29 = (t24 & t28);
    if (t29 != 0)
        goto LAB51;

LAB48:    if (t27 != 0)
        goto LAB50;

LAB49:    *((unsigned int *)t15) = 1;

LAB51:    t31 = (t15 + 4);
    t32 = *((unsigned int *)t31);
    t33 = (~(t32));
    t34 = *((unsigned int *)t15);
    t35 = (t34 & t33);
    t36 = (t35 != 0);
    if (t36 > 0)
        goto LAB52;

LAB53:    xsi_set_current_line(91, ng0);

LAB56:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2656);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng6)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_minus(t15, 32, t5, 5, t11, 32);
    t12 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t12, t15, 0, 0, 5, 0LL);

LAB54:    goto LAB46;

LAB50:    t30 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB51;

LAB52:    xsi_set_current_line(87, ng0);

LAB55:    xsi_set_current_line(89, ng0);
    t37 = ((char*)((ng5)));
    t38 = (t0 + 2656);
    xsi_vlogvar_wait_assign_value(t38, t37, 0, 0, 5, 0LL);
    goto LAB54;

LAB58:    xsi_set_current_line(100, ng0);

LAB61:    xsi_set_current_line(101, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 3136);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 2, 0LL);
    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 2496);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB60;

LAB63:    xsi_set_current_line(105, ng0);

LAB66:    xsi_set_current_line(106, ng0);
    t5 = (t0 + 2816);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng7)));
    memset(t15, 0, 8);
    t16 = (t12 + 4);
    t17 = (t14 + 4);
    t18 = *((unsigned int *)t12);
    t19 = *((unsigned int *)t14);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t16);
    t22 = *((unsigned int *)t17);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t16);
    t26 = *((unsigned int *)t17);
    t27 = (t25 | t26);
    t28 = (~(t27));
    t29 = (t24 & t28);
    if (t29 != 0)
        goto LAB70;

LAB67:    if (t27 != 0)
        goto LAB69;

LAB68:    *((unsigned int *)t15) = 1;

LAB70:    t31 = (t15 + 4);
    t32 = *((unsigned int *)t31);
    t33 = (~(t32));
    t34 = *((unsigned int *)t15);
    t35 = (t34 & t33);
    t36 = (t35 != 0);
    if (t36 > 0)
        goto LAB71;

LAB72:    xsi_set_current_line(110, ng0);

LAB75:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 2816);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng6)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 32, t5, 6, t11, 32);
    t12 = (t0 + 2816);
    xsi_vlogvar_wait_assign_value(t12, t15, 0, 0, 6, 0LL);

LAB73:    goto LAB65;

LAB69:    t30 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB70;

LAB71:    xsi_set_current_line(106, ng0);

LAB74:    xsi_set_current_line(108, ng0);
    t37 = ((char*)((ng1)));
    t38 = (t0 + 2816);
    xsi_vlogvar_wait_assign_value(t38, t37, 0, 0, 6, 0LL);
    goto LAB73;

LAB77:    xsi_set_current_line(115, ng0);

LAB80:    xsi_set_current_line(116, ng0);
    t5 = (t0 + 2816);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t14 = ((char*)((ng1)));
    memset(t15, 0, 8);
    t16 = (t12 + 4);
    t17 = (t14 + 4);
    t18 = *((unsigned int *)t12);
    t19 = *((unsigned int *)t14);
    t20 = (t18 ^ t19);
    t21 = *((unsigned int *)t16);
    t22 = *((unsigned int *)t17);
    t23 = (t21 ^ t22);
    t24 = (t20 | t23);
    t25 = *((unsigned int *)t16);
    t26 = *((unsigned int *)t17);
    t27 = (t25 | t26);
    t28 = (~(t27));
    t29 = (t24 & t28);
    if (t29 != 0)
        goto LAB84;

LAB81:    if (t27 != 0)
        goto LAB83;

LAB82:    *((unsigned int *)t15) = 1;

LAB84:    t31 = (t15 + 4);
    t32 = *((unsigned int *)t31);
    t33 = (~(t32));
    t34 = *((unsigned int *)t15);
    t35 = (t34 & t33);
    t36 = (t35 != 0);
    if (t36 > 0)
        goto LAB85;

LAB86:    xsi_set_current_line(119, ng0);

LAB89:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 2816);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng6)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_minus(t15, 32, t5, 6, t11, 32);
    t12 = (t0 + 2816);
    xsi_vlogvar_wait_assign_value(t12, t15, 0, 0, 6, 0LL);

LAB87:    goto LAB79;

LAB83:    t30 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB84;

LAB85:    xsi_set_current_line(116, ng0);

LAB88:    xsi_set_current_line(117, ng0);
    t37 = ((char*)((ng7)));
    t38 = (t0 + 2816);
    xsi_vlogvar_wait_assign_value(t38, t37, 0, 0, 6, 0LL);
    goto LAB87;

}


extern void work_m_07621548695470613754_0613899538_init()
{
	static char *pe[] = {(void *)Initial_40_0,(void *)Always_47_1,(void *)Always_51_2};
	xsi_register_didat("work_m_07621548695470613754_0613899538", "isim/Set24Test_isim_beh.exe.sim/work/m_07621548695470613754_0613899538.didat");
	xsi_register_executes(pe);
}
