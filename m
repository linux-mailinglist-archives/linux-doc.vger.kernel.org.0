Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4812C3A47
	for <lists+linux-doc@lfdr.de>; Wed, 25 Nov 2020 08:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbgKYHqn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 25 Nov 2020 02:46:43 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7734 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728144AbgKYHqn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Nov 2020 02:46:43 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CgtHR6Ln2zkfdh;
        Wed, 25 Nov 2020 15:46:11 +0800 (CST)
Received: from huawei.com (10.174.187.17) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Nov 2020
 15:46:31 +0800
From:   MingWang Li <limingwang@huawei.com>
To:     <xiexiuqi@huawei.com>, <guohanjun@huawei.com>
CC:     <kernel.openeuler@huawei.com>, <kernel@openeuler.org>,
        <zjutyyl@163.com>, <zhang.zhanghailiang@huawei.com>,
        <alex.chen@huawei.com>, <jiangyifei@huawei.com>,
        <dengkai1@huawei.com>, <victor.zhangxiaofeng@huawei.com>,
        Anup Patel <anup.patel@wdc.com>,
        "Jonathan Corbet" <corbet@lwn.net>, <linux-doc@vger.kernel.org>
Subject: [PATCH 24/26] RISC-V: KVM: Document RISC-V specific parts of KVM API
Date:   Wed, 25 Nov 2020 15:44:58 +0800
Message-ID: <20201125074500.20972-25-limingwang@huawei.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20201125074500.20972-1-limingwang@huawei.com>
References: <20201125074500.20972-1-limingwang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.187.17]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Anup Patel <anup.patel@wdc.com>

euleros inclusion
category: feature
bugzilla: NA
CVE: NA

Document RISC-V specific parts of the KVM API, such as:
 - The interrupt numbers passed to the KVM_INTERRUPT ioctl.
 - The states supported by the KVM_{GET,SET}_MP_STATE ioctls.
 - The registers supported by the KVM_{GET,SET}_ONE_REG interface
   and the encoding of those register ids.
 - The exit reason KVM_EXIT_RISCV_SBI for SBI calls forwarded to
   userspace tool.

Link: https://gitee.com/openeuler/kernel/issues/I26X9V
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 Documentation/virt/kvm/api.rst | 193 +++++++++++++++++++++++++++++++--
 1 file changed, 184 insertions(+), 9 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e00a66d72..0cc8130e4 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -513,7 +513,7 @@ translation mode.
 ------------------
 
 :Capability: basic
-:Architectures: x86, ppc, mips
+:Architectures: x86, ppc, mips, riscv
 :Type: vcpu ioctl
 :Parameters: struct kvm_interrupt (in)
 :Returns: 0 on success, negative on failure.
@@ -582,6 +582,23 @@ interrupt number dequeues the interrupt.
 
 This is an asynchronous vcpu ioctl and can be invoked from any thread.
 
+RISC-V:
+^^^^^^^
+
+Queues an external interrupt to be injected into the virutal CPU. This ioctl
+is overloaded with 2 different irq values:
+
+a) KVM_INTERRUPT_SET
+
+   This sets external interrupt for a virtual CPU and it will receive
+   once it is ready.
+
+b) KVM_INTERRUPT_UNSET
+
+   This clears pending external interrupt for a virtual CPU.
+
+This is an asynchronous vcpu ioctl and can be invoked from any thread.
+
 
 4.17 KVM_DEBUG_GUEST
 --------------------
@@ -1364,7 +1381,7 @@ for vm-wide capabilities.
 ---------------------
 
 :Capability: KVM_CAP_MP_STATE
-:Architectures: x86, s390, arm, arm64
+:Architectures: x86, s390, arm, arm64, riscv
 :Type: vcpu ioctl
 :Parameters: struct kvm_mp_state (out)
 :Returns: 0 on success; -1 on error
@@ -1381,7 +1398,8 @@ uniprocessor guests).
 Possible values are:
 
    ==========================    ===============================================
-   KVM_MP_STATE_RUNNABLE         the vcpu is currently running [x86,arm/arm64]
+   KVM_MP_STATE_RUNNABLE         the vcpu is currently running
+                                 [x86,arm/arm64,riscv]
    KVM_MP_STATE_UNINITIALIZED    the vcpu is an application processor (AP)
                                  which has not yet received an INIT signal [x86]
    KVM_MP_STATE_INIT_RECEIVED    the vcpu has received an INIT signal, and is
@@ -1390,7 +1408,7 @@ Possible values are:
                                  is waiting for an interrupt [x86]
    KVM_MP_STATE_SIPI_RECEIVED    the vcpu has just received a SIPI (vector
                                  accessible via KVM_GET_VCPU_EVENTS) [x86]
-   KVM_MP_STATE_STOPPED          the vcpu is stopped [s390,arm/arm64]
+   KVM_MP_STATE_STOPPED          the vcpu is stopped [s390,arm/arm64,riscv]
    KVM_MP_STATE_CHECK_STOP       the vcpu is in a special error state [s390]
    KVM_MP_STATE_OPERATING        the vcpu is operating (running or halted)
                                  [s390]
@@ -1402,8 +1420,8 @@ On x86, this ioctl is only useful after KVM_CREATE_IRQCHIP. Without an
 in-kernel irqchip, the multiprocessing state must be maintained by userspace on
 these architectures.
 
-For arm/arm64:
-^^^^^^^^^^^^^^
+For arm/arm64/riscv:
+^^^^^^^^^^^^^^^^^^^^
 
 The only states that are valid are KVM_MP_STATE_STOPPED and
 KVM_MP_STATE_RUNNABLE which reflect if the vcpu is paused or not.
@@ -1412,7 +1430,7 @@ KVM_MP_STATE_RUNNABLE which reflect if the vcpu is paused or not.
 ---------------------
 
 :Capability: KVM_CAP_MP_STATE
-:Architectures: x86, s390, arm, arm64
+:Architectures: x86, s390, arm, arm64, riscv
 :Type: vcpu ioctl
 :Parameters: struct kvm_mp_state (in)
 :Returns: 0 on success; -1 on error
@@ -1424,8 +1442,8 @@ On x86, this ioctl is only useful after KVM_CREATE_IRQCHIP. Without an
 in-kernel irqchip, the multiprocessing state must be maintained by userspace on
 these architectures.
 
-For arm/arm64:
-^^^^^^^^^^^^^^
+For arm/arm64/riscv:
+^^^^^^^^^^^^^^^^^^^^
 
 The only states that are valid are KVM_MP_STATE_STOPPED and
 KVM_MP_STATE_RUNNABLE which reflect if the vcpu should be paused or not.
@@ -2539,6 +2557,144 @@ following id bit patterns::
 
   0x7020 0000 0003 02 <0:3> <reg:5>
 
+RISC-V registers are mapped using the lower 32 bits. The upper 8 bits of
+that is the register group type.
+
+RISC-V config registers are meant for configuring a Guest VCPU and it has
+the following id bit patterns::
+
+  0x8020 0000 01 <index into the kvm_riscv_config struct:24> (32bit Host)
+  0x8030 0000 01 <index into the kvm_riscv_config struct:24> (64bit Host)
+
+Following are the RISC-V config registers:
+
+======================= ========= =============================================
+    Encoding            Register  Description
+======================= ========= =============================================
+  0x80x0 0000 0100 0000 isa       ISA feature bitmap of Guest VCPU
+======================= ========= =============================================
+
+The isa config register can be read anytime but can only be written before
+a Guest VCPU runs. It will have ISA feature bits matching underlying host
+set by default.
+
+RISC-V core registers represent the general excution state of a Guest VCPU
+and it has the following id bit patterns::
+
+  0x8020 0000 02 <index into the kvm_riscv_core struct:24> (32bit Host)
+  0x8030 0000 02 <index into the kvm_riscv_core struct:24> (64bit Host)
+
+Following are the RISC-V core registers:
+
+======================= ========= =============================================
+    Encoding            Register  Description
+======================= ========= =============================================
+  0x80x0 0000 0200 0000 regs.pc   Program counter
+  0x80x0 0000 0200 0001 regs.ra   Return address
+  0x80x0 0000 0200 0002 regs.sp   Stack pointer
+  0x80x0 0000 0200 0003 regs.gp   Global pointer
+  0x80x0 0000 0200 0004 regs.tp   Task pointer
+  0x80x0 0000 0200 0005 regs.t0   Caller saved register 0
+  0x80x0 0000 0200 0006 regs.t1   Caller saved register 1
+  0x80x0 0000 0200 0007 regs.t2   Caller saved register 2
+  0x80x0 0000 0200 0008 regs.s0   Callee saved register 0
+  0x80x0 0000 0200 0009 regs.s1   Callee saved register 1
+  0x80x0 0000 0200 000a regs.a0   Function argument (or return value) 0
+  0x80x0 0000 0200 000b regs.a1   Function argument (or return value) 1
+  0x80x0 0000 0200 000c regs.a2   Function argument 2
+  0x80x0 0000 0200 000d regs.a3   Function argument 3
+  0x80x0 0000 0200 000e regs.a4   Function argument 4
+  0x80x0 0000 0200 000f regs.a5   Function argument 5
+  0x80x0 0000 0200 0010 regs.a6   Function argument 6
+  0x80x0 0000 0200 0011 regs.a7   Function argument 7
+  0x80x0 0000 0200 0012 regs.s2   Callee saved register 2
+  0x80x0 0000 0200 0013 regs.s3   Callee saved register 3
+  0x80x0 0000 0200 0014 regs.s4   Callee saved register 4
+  0x80x0 0000 0200 0015 regs.s5   Callee saved register 5
+  0x80x0 0000 0200 0016 regs.s6   Callee saved register 6
+  0x80x0 0000 0200 0017 regs.s7   Callee saved register 7
+  0x80x0 0000 0200 0018 regs.s8   Callee saved register 8
+  0x80x0 0000 0200 0019 regs.s9   Callee saved register 9
+  0x80x0 0000 0200 001a regs.s10  Callee saved register 10
+  0x80x0 0000 0200 001b regs.s11  Callee saved register 11
+  0x80x0 0000 0200 001c regs.t3   Caller saved register 3
+  0x80x0 0000 0200 001d regs.t4   Caller saved register 4
+  0x80x0 0000 0200 001e regs.t5   Caller saved register 5
+  0x80x0 0000 0200 001f regs.t6   Caller saved register 6
+  0x80x0 0000 0200 0020 mode      Privilege mode (1 = S-mode or 0 = U-mode)
+======================= ========= =============================================
+
+RISC-V csr registers represent the supervisor mode control/status registers
+of a Guest VCPU and it has the following id bit patterns::
+
+  0x8020 0000 03 <index into the kvm_riscv_csr struct:24> (32bit Host)
+  0x8030 0000 03 <index into the kvm_riscv_csr struct:24> (64bit Host)
+
+Following are the RISC-V csr registers:
+
+======================= ========= =============================================
+    Encoding            Register  Description
+======================= ========= =============================================
+  0x80x0 0000 0300 0000 sstatus   Supervisor status
+  0x80x0 0000 0300 0001 sie       Supervisor interrupt enable
+  0x80x0 0000 0300 0002 stvec     Supervisor trap vector base
+  0x80x0 0000 0300 0003 sscratch  Supervisor scratch register
+  0x80x0 0000 0300 0004 sepc      Supervisor exception program counter
+  0x80x0 0000 0300 0005 scause    Supervisor trap cause
+  0x80x0 0000 0300 0006 stval     Supervisor bad address or instruction
+  0x80x0 0000 0300 0007 sip       Supervisor interrupt pending
+  0x80x0 0000 0300 0008 satp      Supervisor address translation and protection
+======================= ========= =============================================
+
+RISC-V timer registers represent the timer state of a Guest VCPU and it has
+the following id bit patterns::
+
+  0x8030 0000 04 <index into the kvm_riscv_timer struct:24>
+
+Following are the RISC-V timer registers:
+
+======================= ========= =============================================
+    Encoding            Register  Description
+======================= ========= =============================================
+  0x8030 0000 0400 0000 frequency Time base frequency (read-only)
+  0x8030 0000 0400 0001 time      Time value visible to Guest
+  0x8030 0000 0400 0002 compare   Time compare programmed by Guest
+  0x8030 0000 0400 0003 state     Time compare state (1 = ON or 0 = OFF)
+======================= ========= =============================================
+
+RISC-V F-extension registers represent the single precision floating point
+state of a Guest VCPU and it has the following id bit patterns::
+
+  0x8020 0000 05 <index into the __riscv_f_ext_state struct:24>
+
+Following are the RISC-V F-extension registers:
+
+======================= ========= =============================================
+    Encoding            Register  Description
+======================= ========= =============================================
+  0x8020 0000 0500 0000 f[0]      Floating point register 0
+  ...
+  0x8020 0000 0500 001f f[31]     Floating point register 31
+  0x8020 0000 0500 0020 fcsr      Floating point control and status register
+======================= ========= =============================================
+
+RISC-V D-extension registers represent the double precision floating point
+state of a Guest VCPU and it has the following id bit patterns::
+
+  0x8020 0000 06 <index into the __riscv_d_ext_state struct:24> (fcsr)
+  0x8030 0000 06 <index into the __riscv_d_ext_state struct:24> (non-fcsr)
+
+Following are the RISC-V D-extension registers:
+
+======================= ========= =============================================
+    Encoding            Register  Description
+======================= ========= =============================================
+  0x8030 0000 0600 0000 f[0]      Floating point register 0
+  ...
+  0x8030 0000 0600 001f f[31]     Floating point register 31
+  0x8020 0000 0600 0020 fcsr      Floating point control and status register
+======================= ========= =============================================
+
 
 4.69 KVM_GET_ONE_REG
 --------------------
@@ -5303,6 +5459,25 @@ wants to write. Once finished processing the event, user space must continue
 vCPU execution. If the MSR write was unsuccessful, user space also sets the
 "error" field to "1".
 
+::
+
+		/* KVM_EXIT_RISCV_SBI */
+		struct {
+			unsigned long extension_id;
+			unsigned long function_id;
+			unsigned long args[6];
+			unsigned long ret[2];
+		} riscv_sbi;
+If exit reason is KVM_EXIT_RISCV_SBI then it indicates that the VCPU has
+done a SBI call which is not handled by KVM RISC-V kernel module. The details
+of the SBI call are available in 'riscv_sbi' member of kvm_run structure. The
+'extension_id' field of 'riscv_sbi' represents SBI extension ID whereas the
+'function_id' field represents function ID of given SBI extension. The 'args'
+array field of 'riscv_sbi' represents parameters for the SBI call and 'ret'
+array field represents return values. The userspace should update the return
+values of SBI call before resuming the VCPU. For more details on RISC-V SBI
+spec refer, https://github.com/riscv/riscv-sbi-doc.
+
 ::
 
 		/* Fix the size of the union. */
-- 
2.19.1

