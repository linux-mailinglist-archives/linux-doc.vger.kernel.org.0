Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79AC3587C3B
	for <lists+linux-doc@lfdr.de>; Tue,  2 Aug 2022 14:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236940AbiHBMSj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Aug 2022 08:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236934AbiHBMSh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Aug 2022 08:18:37 -0400
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C311E4F64B;
        Tue,  2 Aug 2022 05:18:35 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0VLBjY2m_1659442709;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VLBjY2m_1659442709)
          by smtp.aliyun-inc.com;
          Tue, 02 Aug 2022 20:18:30 +0800
From:   Xianting Tian <xianting.tian@linux.alibaba.com>
To:     paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, anup@brainfault.org, heiko@sntech.de,
        guoren@kernel.org, mick@ics.forth.gr,
        alexandre.ghiti@canonical.com, bhe@redhat.com, vgoyal@redhat.com,
        dyoung@redhat.com, corbet@lwn.net, Conor.Dooley@microchip.com
Cc:     kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        crash-utility@redhat.com, huanyi.xj@alibaba-inc.com,
        heinrich.schuchardt@canonical.com, k-hagio-ab@nec.com,
        hschauhan@nulltrace.org, yixun.lan@gmail.com,
        Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH V5 6/6] RISC-V: Fixup schedule out issue in machine_crash_shutdown()
Date:   Tue,  2 Aug 2022 20:18:18 +0800
Message-Id: <20220802121818.2201268-7-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220802121818.2201268-1-xianting.tian@linux.alibaba.com>
References: <20220802121818.2201268-1-xianting.tian@linux.alibaba.com>
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fixup schedule out issue in machine_crash_shutdown(), which is triggered
by RCU Stall.

[224521.877268] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[224521.883471] rcu: 	0-...0: (3 GPs behind) idle=cfa/0/0x1 softirq=3968793/3968793 fqs=2495
[224521.891742] 	(detected by 2, t=5255 jiffies, g=60855593, q=328)
[224521.897754] Task dump for CPU 0:
[224521.901074] task:swapper/0       state:R  running task     stack:    0 pid:    0 ppid:     0 flags:0x00000008
[224521.911090] Call Trace:
[224521.913638] [<ffffffe000c432de>] __schedule+0x208/0x5ea
[224521.918957] Kernel panic - not syncing: RCU Stall
[224521.923773] bad: scheduling from the idle thread!
[224521.928571] CPU: 2 PID: 0 Comm: swapper/2 Kdump: loaded Tainted: G           O      5.10.113-yocto-standard #1
[224521.938658] Call Trace:
[224521.941200] [<ffffffe00020395c>] walk_stackframe+0x0/0xaa
[224521.946689] [<ffffffe000c34f8e>] show_stack+0x32/0x3e
[224521.951830] [<ffffffe000c39020>] dump_stack_lvl+0x7e/0xa2
[224521.957317] [<ffffffe000c39058>] dump_stack+0x14/0x1c
[224521.962459] [<ffffffe000243884>] dequeue_task_idle+0x2c/0x40
[224521.968207] [<ffffffe000c434f4>] __schedule+0x41e/0x5ea
[224521.973520] [<ffffffe000c43826>] schedule+0x34/0xe4
[224521.978487] [<ffffffe000c46cae>] schedule_timeout+0xc6/0x170
[224521.984234] [<ffffffe000c4491e>] wait_for_completion+0x98/0xf2
[224521.990157] [<ffffffe00026d9e2>] __wait_rcu_gp+0x148/0x14a
[224521.995733] [<ffffffe0002761c4>] synchronize_rcu+0x5c/0x66
[224522.001307] [<ffffffe00026f1a6>] rcu_sync_enter+0x54/0xe6
[224522.006795] [<ffffffe00025a436>] percpu_down_write+0x32/0x11c
[224522.012629] [<ffffffe000c4266a>] _cpu_down+0x92/0x21a
[224522.017771] [<ffffffe000219a0a>] smp_shutdown_nonboot_cpus+0x90/0x118
[224522.024299] [<ffffffe00020701e>] machine_crash_shutdown+0x30/0x4a
[224522.030483] [<ffffffe00029a3f8>] __crash_kexec+0x62/0xa6
[224522.035884] [<ffffffe000c3515e>] panic+0xfa/0x2b6
[224522.040678] [<ffffffe0002772be>] rcu_sched_clock_irq+0xc26/0xcb8
[224522.046774] [<ffffffe00027fc7a>] update_process_times+0x62/0x8a
[224522.052785] [<ffffffe00028d522>] tick_sched_timer+0x9e/0x102
[224522.058533] [<ffffffe000280c3a>] __hrtimer_run_queues+0x16a/0x318
[224522.064716] [<ffffffe0002812ec>] hrtimer_interrupt+0xd4/0x228
[224522.070551] [<ffffffe0009a69b6>] riscv_timer_interrupt+0x3c/0x48
[224522.076646] [<ffffffe000268f8c>] handle_percpu_devid_irq+0xb0/0x24c
[224522.083004] [<ffffffe00026428e>] __handle_domain_irq+0xa8/0x122
[224522.089014] [<ffffffe00062f954>] riscv_intc_irq+0x38/0x60
[224522.094501] [<ffffffe000201bd4>] ret_from_exception+0x0/0xc
[224522.100161] [<ffffffe000c42146>] rcu_eqs_enter.constprop.0+0x8c/0xb8

With the patch, it can enter crash system when RCU Stall occur.

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
 arch/riscv/kernel/machine_kexec.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 86d1b5f9dfb5..ee79e6839b86 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -138,19 +138,37 @@ void machine_shutdown(void)
 #endif
 }
 
+/* Override the weak function in kernel/panic.c */
+void crash_smp_send_stop(void)
+{
+	static int cpus_stopped;
+
+	/*
+	 * This function can be called twice in panic path, but obviously
+	 * we execute this only once.
+	 */
+	if (cpus_stopped)
+		return;
+
+	smp_send_stop();
+	cpus_stopped = 1;
+}
+
 /*
  * machine_crash_shutdown - Prepare to kexec after a kernel crash
  *
  * This function is called by crash_kexec just before machine_kexec
- * below and its goal is similar to machine_shutdown, but in case of
- * a kernel crash. Since we don't handle such cases yet, this function
- * is empty.
+ * and its goal is to shutdown non-crashing cpus and save registers.
  */
 void
 machine_crash_shutdown(struct pt_regs *regs)
 {
+	local_irq_disable();
+
+	/* shutdown non-crashing cpus */
+	crash_smp_send_stop();
+
 	crash_save_cpu(regs, smp_processor_id());
-	machine_shutdown();
 	pr_info("Starting crashdump kernel...\n");
 }
 
-- 
2.17.1

