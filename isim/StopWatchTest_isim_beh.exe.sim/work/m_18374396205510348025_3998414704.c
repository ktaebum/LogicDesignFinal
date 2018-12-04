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
static const char *ng0 = "/home/taebum/Workspace/Final/StopWatch.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {99, 0};
static int ng4[] = {59, 0};



static void Initial_33_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(33, ng0);

LAB2:    xsi_set_current_line(34, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(35, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 6, 0LL);
    xsi_set_current_line(36, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 6, 0LL);
    xsi_set_current_line(37, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 7, 0LL);

LAB1:    return;
}

static void Always_40_1(char *t0)
{
    char t15[8];
    char t25[8];
    char t39[8];
    char t55[8];
    char t63[8];
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
    char *t13;
    char *t14;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    char *t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    char *t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    char *t97;
    char *t98;

LAB0:    t1 = (t0 + 3408U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 3728);
    *((int *)t2) = 1;
    t3 = (t0 + 3440);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(40, ng0);

LAB5:    xsi_set_current_line(41, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(44, ng0);

LAB10:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(52, ng0);

LAB19:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t15, 0, 8);
    t11 = (t4 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB21;

LAB20:    t12 = (t5 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB21;

LAB24:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB22;

LAB23:    t14 = (t15 + 4);
    t6 = *((unsigned int *)t14);
    t7 = (~(t6));
    t8 = *((unsigned int *)t15);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB25;

LAB26:    xsi_set_current_line(56, ng0);

LAB29:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t15, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t11);
    t20 = *((unsigned int *)t12);
    t21 = (t19 | t20);
    t27 = (~(t21));
    t28 = (t18 & t27);
    if (t28 != 0)
        goto LAB31;

LAB30:    if (t21 != 0)
        goto LAB32;

LAB33:    memset(t25, 0, 8);
    t14 = (t15 + 4);
    t29 = *((unsigned int *)t14);
    t30 = (~(t29));
    t31 = *((unsigned int *)t15);
    t32 = (t31 & t30);
    t33 = (t32 & 1U);
    if (t33 != 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t14) != 0)
        goto LAB36;

LAB37:    t22 = (t25 + 4);
    t34 = *((unsigned int *)t25);
    t35 = (!(t34));
    t36 = *((unsigned int *)t22);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB38;

LAB39:    memcpy(t63, t25, 8);

LAB40:    t91 = (t63 + 4);
    t92 = *((unsigned int *)t91);
    t93 = (~(t92));
    t94 = *((unsigned int *)t63);
    t95 = (t94 & t93);
    t96 = (t95 != 0);
    if (t96 > 0)
        goto LAB52;

LAB53:    xsi_set_current_line(70, ng0);

LAB74:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 32, t4, 1, t5, 32);
    t11 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t11, t15, 0, 0, 1, 0LL);

LAB54:
LAB27:
LAB13:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(41, ng0);

LAB9:    xsi_set_current_line(42, ng0);
    t11 = (t0 + 2248);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = ((char*)((ng2)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 32, t13, 1, t14, 32);
    t16 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 1, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(45, ng0);

LAB14:    xsi_set_current_line(46, ng0);
    t11 = (t0 + 1368U);
    t12 = *((char **)t11);
    t11 = (t12 + 4);
    t17 = *((unsigned int *)t11);
    t18 = (~(t17));
    t19 = *((unsigned int *)t12);
    t20 = (t19 & t18);
    t21 = (t20 != 0);
    if (t21 > 0)
        goto LAB15;

LAB16:
LAB17:    goto LAB13;

LAB15:    xsi_set_current_line(46, ng0);

LAB18:    xsi_set_current_line(47, ng0);
    t13 = ((char*)((ng1)));
    t14 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t14, t13, 0, 0, 6, 0LL);
    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 6, 0LL);
    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 7, 0LL);
    goto LAB17;

LAB21:    t13 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB23;

LAB22:    *((unsigned int *)t15) = 1;
    goto LAB23;

LAB25:    xsi_set_current_line(53, ng0);

LAB28:    xsi_set_current_line(54, ng0);
    t16 = (t0 + 2088);
    t22 = (t16 + 56U);
    t23 = *((char **)t22);
    t24 = ((char*)((ng2)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_add(t25, 32, t23, 7, t24, 32);
    t26 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t26, t25, 0, 0, 7, 0LL);
    goto LAB27;

LAB31:    *((unsigned int *)t15) = 1;
    goto LAB33;

LAB32:    t13 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB33;

LAB34:    *((unsigned int *)t25) = 1;
    goto LAB37;

LAB36:    t16 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB37;

LAB38:    t23 = (t0 + 1928);
    t24 = (t23 + 56U);
    t26 = *((char **)t24);
    t38 = ((char*)((ng4)));
    memset(t39, 0, 8);
    t40 = (t26 + 4);
    t41 = (t38 + 4);
    t42 = *((unsigned int *)t26);
    t43 = *((unsigned int *)t38);
    t44 = (t42 ^ t43);
    t45 = *((unsigned int *)t40);
    t46 = *((unsigned int *)t41);
    t47 = (t45 ^ t46);
    t48 = (t44 | t47);
    t49 = *((unsigned int *)t40);
    t50 = *((unsigned int *)t41);
    t51 = (t49 | t50);
    t52 = (~(t51));
    t53 = (t48 & t52);
    if (t53 != 0)
        goto LAB42;

LAB41:    if (t51 != 0)
        goto LAB43;

LAB44:    memset(t55, 0, 8);
    t56 = (t39 + 4);
    t57 = *((unsigned int *)t56);
    t58 = (~(t57));
    t59 = *((unsigned int *)t39);
    t60 = (t59 & t58);
    t61 = (t60 & 1U);
    if (t61 != 0)
        goto LAB45;

LAB46:    if (*((unsigned int *)t56) != 0)
        goto LAB47;

LAB48:    t64 = *((unsigned int *)t25);
    t65 = *((unsigned int *)t55);
    t66 = (t64 | t65);
    *((unsigned int *)t63) = t66;
    t67 = (t25 + 4);
    t68 = (t55 + 4);
    t69 = (t63 + 4);
    t70 = *((unsigned int *)t67);
    t71 = *((unsigned int *)t68);
    t72 = (t70 | t71);
    *((unsigned int *)t69) = t72;
    t73 = *((unsigned int *)t69);
    t74 = (t73 != 0);
    if (t74 == 1)
        goto LAB49;

LAB50:
LAB51:    goto LAB40;

LAB42:    *((unsigned int *)t39) = 1;
    goto LAB44;

LAB43:    t54 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t54) = 1;
    goto LAB44;

LAB45:    *((unsigned int *)t55) = 1;
    goto LAB48;

LAB47:    t62 = (t55 + 4);
    *((unsigned int *)t55) = 1;
    *((unsigned int *)t62) = 1;
    goto LAB48;

LAB49:    t75 = *((unsigned int *)t63);
    t76 = *((unsigned int *)t69);
    *((unsigned int *)t63) = (t75 | t76);
    t77 = (t25 + 4);
    t78 = (t55 + 4);
    t79 = *((unsigned int *)t77);
    t80 = (~(t79));
    t81 = *((unsigned int *)t25);
    t82 = (t81 & t80);
    t83 = *((unsigned int *)t78);
    t84 = (~(t83));
    t85 = *((unsigned int *)t55);
    t86 = (t85 & t84);
    t87 = (~(t82));
    t88 = (~(t86));
    t89 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t89 & t87);
    t90 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t90 & t88);
    goto LAB51;

LAB52:    xsi_set_current_line(58, ng0);

LAB55:    xsi_set_current_line(59, ng0);
    t97 = ((char*)((ng1)));
    t98 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t98, t97, 0, 0, 7, 0LL);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t15, 0, 8);
    t11 = (t4 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB57;

LAB56:    t12 = (t5 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB57;

LAB60:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB58;

LAB59:    t14 = (t15 + 4);
    t6 = *((unsigned int *)t14);
    t7 = (~(t6));
    t8 = *((unsigned int *)t15);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB61;

LAB62:    xsi_set_current_line(63, ng0);

LAB65:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t15, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t17 = (t9 ^ t10);
    t18 = (t8 | t17);
    t19 = *((unsigned int *)t11);
    t20 = *((unsigned int *)t12);
    t21 = (t19 | t20);
    t27 = (~(t21));
    t28 = (t18 & t27);
    if (t28 != 0)
        goto LAB67;

LAB66:    if (t21 != 0)
        goto LAB68;

LAB69:    t14 = (t15 + 4);
    t29 = *((unsigned int *)t14);
    t30 = (~(t29));
    t31 = *((unsigned int *)t15);
    t32 = (t31 & t30);
    t33 = (t32 != 0);
    if (t33 > 0)
        goto LAB70;

LAB71:
LAB72:
LAB63:    goto LAB54;

LAB57:    t13 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB59;

LAB58:    *((unsigned int *)t15) = 1;
    goto LAB59;

LAB61:    xsi_set_current_line(60, ng0);

LAB64:    xsi_set_current_line(61, ng0);
    t16 = (t0 + 1928);
    t22 = (t16 + 56U);
    t23 = *((char **)t22);
    t24 = ((char*)((ng2)));
    memset(t25, 0, 8);
    xsi_vlog_unsigned_add(t25, 32, t23, 6, t24, 32);
    t26 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t26, t25, 0, 0, 6, 0LL);
    goto LAB63;

LAB67:    *((unsigned int *)t15) = 1;
    goto LAB69;

LAB68:    t13 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB69;

LAB70:    xsi_set_current_line(64, ng0);

LAB73:    xsi_set_current_line(65, ng0);
    t16 = ((char*)((ng1)));
    t22 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t22, t16, 0, 0, 6, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 32, t4, 6, t5, 32);
    t11 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t11, t15, 0, 0, 6, 0LL);
    goto LAB72;

}


extern void work_m_18374396205510348025_3998414704_init()
{
	static char *pe[] = {(void *)Initial_33_0,(void *)Always_40_1};
	xsi_register_didat("work_m_18374396205510348025_3998414704", "isim/StopWatchTest_isim_beh.exe.sim/work/m_18374396205510348025_3998414704.didat");
	xsi_register_executes(pe);
}
