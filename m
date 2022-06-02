Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3CBF53B821
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jun 2022 13:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbiFBLuP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 Jun 2022 07:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233588AbiFBLuO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Jun 2022 07:50:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 461B117077;
        Thu,  2 Jun 2022 04:50:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C56FC616B7;
        Thu,  2 Jun 2022 11:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B27EC3411D;
        Thu,  2 Jun 2022 11:50:06 +0000 (UTC)
From:   Huacai Chen <chenhuacai@loongson.cn>
To:     Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@gmail.com>,
        Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V14 00/24] arch: Add basic LoongArch support
Date:   Thu,  2 Jun 2022 19:51:17 +0800
Message-Id: <20220602115141.3962749-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

LoongArch is a new RISC ISA, which is a bit like MIPS or RISC-V.
LoongArch includes a reduced 32-bit version (LA32R), a standard 32-bit
version (LA32S) and a 64-bit version (LA64). LoongArch use ACPI as its
boot protocol LoongArch-specific interrupt controllers (similar to APIC)
are already added in the next revision of ACPI Specification (current
revision is 6.4).

This patchset is adding basic LoongArch support in mainline kernel, we
can see a complete snapshot here:
https://github.com/loongson/linux/tree/loongarch-next
https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/log/?h=loongarch-next

Cross-compile tool chain to build kernel:
https://github.com/loongson/build-tools/releases/download/2021.12.21/loongarch64-clfs-2022-03-03-cross-tools-gcc-glibc.tar.xz

A CLFS-based Linux distro:
https://github.com/loongson/build-tools/releases/download/2021.12.21/loongarch64-clfs-system-2022-03-03.tar.bz2

Open-source tool chain which is under review (Binutils and Gcc are already upstream):
https://github.com/loongson/binutils-gdb/tree/upstream_v3.1
https://github.com/loongson/gcc/tree/loongarch_upstream_v6.3
https://github.com/loongson/glibc/tree/loongarch_2_35_dev_v2.2

Loongson and LoongArch documentations:
https://github.com/loongson/LoongArch-Documentation

LoongArch-specific interrupt controllers:
https://mantis.uefi.org/mantis/view.php?id=2203
https://mantis.uefi.org/mantis/view.php?id=2313

V1 -> V2:
1, Add documentation patches;
2, Restore copyright statements;
3, Split the big header patch;
4, Cleanup signal-related headers;
5, Cleanup incomplete 32-bit support;
6, Move the major PCI work to drivers/pci;
7, Rework Loongson64 platform support;
8, Rework lpj and __udelay()/__ndelay();
9, Rework page table layout config options;
10, Rework syscall/exception/interrupt with generic entry framework;
11, Simplify the VDSO/VSYSCALL implementation;
12, Use generic I/O access macros and functions;
13, Remove unaligned access emulation at present;
14, Keep clocksource code in arch since it is the "native clocksource";
15, Some other minor fixes and improvements.

V2 -> V3:
1, Rebased on 5.15-rc1;
2, Cleanup PCI code on V2;
3, Support multiple msi domain;
4, Support cacheable ioremap();
5, Use irq stack for interrupt handling;
6, Adjust struct ucontext and rt_sigframe;
7, Some other minor fixes and improvements.

V3 -> V4:
1, Rebased on 5.15-rc3;
2, Rework SMP support and remove legacy IPI;
3, Rework signal support and remove loongarch_abi;
4, Simplify phys_to_dma() and dma_to_phys();
5, Remove unused sys_mmap2() implementation;
6, Remove unused strncpy_user.S and strnlen_user.S; 
7, Some other minor fixes and improvements.

V4 -> V5:
1, Rebased on 5.15-rc4;
2, Fix a _PAGE_CHG_MASK bug;
3, Fix vdso_base() calculation;
4, Adjust syscall and ptrace code;
5, Use generic bitops implementation;
6, Avoid syscall restart handling in sys_rt_sigreturn();
7, Update commit messages.

V5 -> V6:
1, Rebased on 5.17-rc4;
2, Use GENERIC_IRQ_MIGRATION;
3, Improve sigcontext definition; 
4, Improve numa_default_distance(); 
5, Increse MINSIGSTKSZ and SIGSTKSZ;
6, Restruct pt_regs and user_pt_regs;
7, Fix a corner case of protection_map;
8, Fix some corner cases of system calls;
9, Separate module region and vmalloc region;
10, Rename registers to match official documents.

V6 -> V7:
1, Rebased on 5.17-rc6;
2, Refactor do_page_fault();
3, Adjust memblock initialization;
4, Use -mstrict-align to build kernel;
5, Reimplement elf_read_implies_exec() as other archs;
6, Some other minor fixes and improvements.

V7 -> V8:
1, Rebased on 5.17-rc8;
2, Remove useless abidefs.h;
3, Remove useless HAVE_ARCH_NODEDATA_EXTENSION;
4, Fix and simplify uaccess.h;
5, Fix bugs after pt_regs restruction;
6, Use generic copy_from_user_page()/copy_to_user_page();
7, Some other minor fixes and improvements.

V8 -> V9:
1, Rebased on 5.18-rc4;
2, Fix 4-level page tables;
3, Always use 16KB kernel stack;
4, Add efistub and zboot support;
5, Remove useless HAVE_FUTEX_CMPXCHG;
6, Optimize module machanism for size;
7, Define copy_user_page() to avoid build errors;
8, Some other minor fixes and improvements.

V9 -> V10:
1, Rebased on 5.18-rc6;
2, Use generic efi stub;
3, Use generic string library;
4, Use generic ticket spinlock;
5, Use more meaningful macro naming;
6, Remove the zboot patch;
7, Fix commit message and documentations;
8, Some other minor fixes and improvements.

V10 -> V11:
1, Rebased on asm-generic tree;
2, Fix fpreg macros definition;
3, Fix ELF ABI macros definition;
4, Fix magic number definition in efi header;
5, Remove unneeded swab.h, bitfield.h and rtc.c;
6, Remove __ARCH_WANT_NEW_STAT (glibc need update);
7, Improve documents as WANG Xuerui suggested;
8, Some other minor fixes and improvements.

V11 -> V12:
1, Rebased on mainline;
2, Remove ACPI, PCI and IRQCHIP dependency;
3, Remove unneeded register_gop_device();
4, Fix show_code() and __arch_get_hw_counter();
5, Add a MAINTAINERS entry;
6, Rewrite documents as WANG Xuerui suggested;
7, Some other small adjustment.

V12 -> V13:
1, Remove kernel_version string in efistub;
2, Remove the boardinfo knob in /sys/firmware/efi;
3, Improve documents as Bagas Sanjaya suggested.

V13 -> V14:
1, Add some missing Cc;
2, Add a comment for EFI_RT_VIRTUAL_LIMIT definition.
 
Huacai Chen(24):
 irqchip: Adjust Kconfig for Loongson.
 irqchip/loongson-liointc: Fix build error for LoongArch. 
 Documentation: LoongArch: Add basic documentations.
 Documentation/zh_CN: Add basic LoongArch documentations.
 LoongArch: Add elf-related definitions.
 LoongArch: Add writecombine support for drm.
 LoongArch: Add build infrastructure.
 LoongArch: Add CPU definition headers.
 LoongArch: Add atomic/locking headers.
 LoongArch: Add other common headers.
 LoongArch: Add boot and setup routines.
 LoongArch: Add exception/interrupt handling. 
 LoongArch: Add process management.
 LoongArch: Add memory management.
 LoongArch: Add system call support.
 LoongArch: Add signal handling support.
 LoongArch: Add elf and module support.
 LoongArch: Add misc common routines.
 LoongArch: Add some library functions.
 LoongArch: Add PCI controller support.
 LoongArch: Add VDSO and VSYSCALL support.
 LoongArch: Add multi-processor (SMP) support.
 LoongArch: Add Non-Uniform Memory Access (NUMA) support.
 LoongArch: Add Loongson-3 default config file.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 Documentation/arch.rst                             |    1 +
 Documentation/loongarch/features.rst               |    3 +
 Documentation/loongarch/index.rst                  |   21 +
 Documentation/loongarch/introduction.rst           |  387 +++++
 Documentation/loongarch/irq-chip-model.rst         |  168 +++
 Documentation/translations/zh_CN/index.rst         |    1 +
 .../translations/zh_CN/loongarch/features.rst      |    8 +
 .../translations/zh_CN/loongarch/index.rst         |   26 +
 .../translations/zh_CN/loongarch/introduction.rst  |  351 +++++
 .../zh_CN/loongarch/irq-chip-model.rst             |  167 +++
 MAINTAINERS                                        |   10 +
 arch/loongarch/Kbuild                              |    6 +
 arch/loongarch/Kconfig                             |  447 ++++++
 arch/loongarch/Kconfig.debug                       |    0
 arch/loongarch/Makefile                            |  105 ++
 arch/loongarch/boot/.gitignore                     |    2 +
 arch/loongarch/boot/Makefile                       |   20 +
 arch/loongarch/boot/dts/Makefile                   |    4 +
 arch/loongarch/configs/loongson3_defconfig         |  771 ++++++++++
 arch/loongarch/include/asm/Kbuild                  |   30 +
 arch/loongarch/include/asm/acenv.h                 |   18 +
 arch/loongarch/include/asm/acpi.h                  |   38 +
 arch/loongarch/include/asm/addrspace.h             |  112 ++
 arch/loongarch/include/asm/asm-offsets.h           |    5 +
 arch/loongarch/include/asm/asm-prototypes.h        |    7 +
 arch/loongarch/include/asm/asm.h                   |  191 +++
 arch/loongarch/include/asm/asmmacro.h              |  289 ++++
 arch/loongarch/include/asm/atomic.h                |  362 +++++
 arch/loongarch/include/asm/barrier.h               |  159 ++
 arch/loongarch/include/asm/bitops.h                |   33 +
 arch/loongarch/include/asm/bitrev.h                |   34 +
 arch/loongarch/include/asm/bootinfo.h              |   43 +
 arch/loongarch/include/asm/branch.h                |   21 +
 arch/loongarch/include/asm/bug.h                   |   23 +
 arch/loongarch/include/asm/cache.h                 |   13 +
 arch/loongarch/include/asm/cacheflush.h            |   80 ++
 arch/loongarch/include/asm/cacheops.h              |   37 +
 arch/loongarch/include/asm/clocksource.h           |   12 +
 arch/loongarch/include/asm/cmpxchg.h               |  123 ++
 arch/loongarch/include/asm/compiler.h              |   15 +
 arch/loongarch/include/asm/cpu-features.h          |   73 +
 arch/loongarch/include/asm/cpu-info.h              |  116 ++
 arch/loongarch/include/asm/cpu.h                   |  127 ++
 arch/loongarch/include/asm/cpufeature.h            |   24 +
 arch/loongarch/include/asm/delay.h                 |   26 +
 arch/loongarch/include/asm/dma-direct.h            |   11 +
 arch/loongarch/include/asm/dmi.h                   |   24 +
 arch/loongarch/include/asm/efi.h                   |   41 +
 arch/loongarch/include/asm/elf.h                   |  301 ++++
 arch/loongarch/include/asm/entry-common.h          |   13 +
 arch/loongarch/include/asm/exec.h                  |   10 +
 arch/loongarch/include/asm/fb.h                    |   23 +
 arch/loongarch/include/asm/fixmap.h                |   13 +
 arch/loongarch/include/asm/fpregdef.h              |   53 +
 arch/loongarch/include/asm/fpu.h                   |  129 ++
 arch/loongarch/include/asm/futex.h                 |  108 ++
 arch/loongarch/include/asm/hardirq.h               |   26 +
 arch/loongarch/include/asm/hugetlb.h               |   83 ++
 arch/loongarch/include/asm/hw_irq.h                |   17 +
 arch/loongarch/include/asm/idle.h                  |    9 +
 arch/loongarch/include/asm/inst.h                  |  117 ++
 arch/loongarch/include/asm/io.h                    |  129 ++
 arch/loongarch/include/asm/irq.h                   |  132 ++
 arch/loongarch/include/asm/irq_regs.h              |   27 +
 arch/loongarch/include/asm/irqflags.h              |   78 +
 arch/loongarch/include/asm/kdebug.h                |   23 +
 arch/loongarch/include/asm/linkage.h               |   36 +
 arch/loongarch/include/asm/local.h                 |  138 ++
 arch/loongarch/include/asm/loongarch.h             | 1516 ++++++++++++++++++++
 arch/loongarch/include/asm/loongson.h              |  153 ++
 arch/loongarch/include/asm/mmu.h                   |   16 +
 arch/loongarch/include/asm/mmu_context.h           |  152 ++
 arch/loongarch/include/asm/mmzone.h                |   18 +
 arch/loongarch/include/asm/module.h                |   80 ++
 arch/loongarch/include/asm/module.lds.h            |    7 +
 arch/loongarch/include/asm/numa.h                  |   69 +
 arch/loongarch/include/asm/page.h                  |  115 ++
 arch/loongarch/include/asm/percpu.h                |  214 +++
 arch/loongarch/include/asm/perf_event.h            |   10 +
 arch/loongarch/include/asm/pgalloc.h               |  103 ++
 arch/loongarch/include/asm/pgtable-bits.h          |  131 ++
 arch/loongarch/include/asm/pgtable.h               |  565 ++++++++
 arch/loongarch/include/asm/prefetch.h              |   29 +
 arch/loongarch/include/asm/processor.h             |  209 +++
 arch/loongarch/include/asm/ptrace.h                |  152 ++
 arch/loongarch/include/asm/reboot.h                |   10 +
 arch/loongarch/include/asm/regdef.h                |   41 +
 arch/loongarch/include/asm/seccomp.h               |   20 +
 arch/loongarch/include/asm/serial.h                |   11 +
 arch/loongarch/include/asm/setup.h                 |   21 +
 arch/loongarch/include/asm/shmparam.h              |   12 +
 arch/loongarch/include/asm/smp.h                   |  124 ++
 arch/loongarch/include/asm/sparsemem.h             |   23 +
 arch/loongarch/include/asm/stackframe.h            |  219 +++
 arch/loongarch/include/asm/stacktrace.h            |   74 +
 arch/loongarch/include/asm/string.h                |   12 +
 arch/loongarch/include/asm/switch_to.h             |   37 +
 arch/loongarch/include/asm/syscall.h               |   74 +
 arch/loongarch/include/asm/thread_info.h           |  106 ++
 arch/loongarch/include/asm/time.h                  |   50 +
 arch/loongarch/include/asm/timex.h                 |   33 +
 arch/loongarch/include/asm/tlb.h                   |  180 +++
 arch/loongarch/include/asm/tlbflush.h              |   48 +
 arch/loongarch/include/asm/topology.h              |   41 +
 arch/loongarch/include/asm/types.h                 |   19 +
 arch/loongarch/include/asm/uaccess.h               |  269 ++++
 arch/loongarch/include/asm/unistd.h                |   11 +
 arch/loongarch/include/asm/vdso.h                  |   38 +
 arch/loongarch/include/asm/vdso/clocksource.h      |    8 +
 arch/loongarch/include/asm/vdso/gettimeofday.h     |   99 ++
 arch/loongarch/include/asm/vdso/processor.h        |   14 +
 arch/loongarch/include/asm/vdso/vdso.h             |   30 +
 arch/loongarch/include/asm/vdso/vsyscall.h         |   27 +
 arch/loongarch/include/asm/vermagic.h              |   19 +
 arch/loongarch/include/asm/vmalloc.h               |    4 +
 arch/loongarch/include/uapi/asm/Kbuild             |    2 +
 arch/loongarch/include/uapi/asm/auxvec.h           |   17 +
 arch/loongarch/include/uapi/asm/bitsperlong.h      |    9 +
 arch/loongarch/include/uapi/asm/break.h            |   23 +
 arch/loongarch/include/uapi/asm/byteorder.h        |   13 +
 arch/loongarch/include/uapi/asm/hwcap.h            |   20 +
 arch/loongarch/include/uapi/asm/ptrace.h           |   52 +
 arch/loongarch/include/uapi/asm/reg.h              |   59 +
 arch/loongarch/include/uapi/asm/sigcontext.h       |   44 +
 arch/loongarch/include/uapi/asm/signal.h           |   13 +
 arch/loongarch/include/uapi/asm/ucontext.h         |   35 +
 arch/loongarch/include/uapi/asm/unistd.h           |    5 +
 arch/loongarch/kernel/.gitignore                   |    2 +
 arch/loongarch/kernel/Makefile                     |   25 +
 arch/loongarch/kernel/access-helper.h              |   13 +
 arch/loongarch/kernel/acpi.c                       |  333 +++++
 arch/loongarch/kernel/asm-offsets.c                |  264 ++++
 arch/loongarch/kernel/cacheinfo.c                  |  122 ++
 arch/loongarch/kernel/cpu-probe.c                  |  292 ++++
 arch/loongarch/kernel/dma.c                        |   40 +
 arch/loongarch/kernel/efi-header.S                 |  104 ++
 arch/loongarch/kernel/efi.c                        |  226 +++
 arch/loongarch/kernel/elf.c                        |   30 +
 arch/loongarch/kernel/entry.S                      |   89 ++
 arch/loongarch/kernel/env.c                        |   70 +
 arch/loongarch/kernel/fpu.S                        |  261 ++++
 arch/loongarch/kernel/genex.S                      |   95 ++
 arch/loongarch/kernel/head.S                       |  129 ++
 arch/loongarch/kernel/idle.c                       |   16 +
 arch/loongarch/kernel/image-vars.h                 |   29 +
 arch/loongarch/kernel/inst.c                       |   40 +
 arch/loongarch/kernel/io.c                         |   94 ++
 arch/loongarch/kernel/irq.c                        |   88 ++
 arch/loongarch/kernel/mem.c                        |   64 +
 arch/loongarch/kernel/module-sections.c            |  121 ++
 arch/loongarch/kernel/module.c                     |  375 +++++
 arch/loongarch/kernel/numa.c                       |  466 ++++++
 arch/loongarch/kernel/proc.c                       |  127 ++
 arch/loongarch/kernel/process.c                    |  267 ++++
 arch/loongarch/kernel/ptrace.c                     |  431 ++++++
 arch/loongarch/kernel/reset.c                      |  102 ++
 arch/loongarch/kernel/setup.c                      |  374 +++++
 arch/loongarch/kernel/signal.c                     |  566 ++++++++
 arch/loongarch/kernel/smp.c                        |  751 ++++++++++
 arch/loongarch/kernel/switch.S                     |   35 +
 arch/loongarch/kernel/syscall.c                    |   63 +
 arch/loongarch/kernel/time.c                       |  214 +++
 arch/loongarch/kernel/topology.c                   |   52 +
 arch/loongarch/kernel/traps.c                      |  725 ++++++++++
 arch/loongarch/kernel/vdso.c                       |  138 ++
 arch/loongarch/kernel/vmlinux.lds.S                |  121 ++
 arch/loongarch/lib/Makefile                        |    6 +
 arch/loongarch/lib/clear_user.S                    |   43 +
 arch/loongarch/lib/copy_user.S                     |   47 +
 arch/loongarch/lib/delay.c                         |   43 +
 arch/loongarch/lib/dump_tlb.c                      |  111 ++
 arch/loongarch/mm/Makefile                         |    9 +
 arch/loongarch/mm/cache.c                          |  141 ++
 arch/loongarch/mm/extable.c                        |   22 +
 arch/loongarch/mm/fault.c                          |  261 ++++
 arch/loongarch/mm/hugetlbpage.c                    |   87 ++
 arch/loongarch/mm/init.c                           |  178 +++
 arch/loongarch/mm/ioremap.c                        |   27 +
 arch/loongarch/mm/maccess.c                        |   10 +
 arch/loongarch/mm/mmap.c                           |  125 ++
 arch/loongarch/mm/page.S                           |   84 ++
 arch/loongarch/mm/pgtable.c                        |  130 ++
 arch/loongarch/mm/tlb.c                            |  305 ++++
 arch/loongarch/mm/tlbex.S                          |  546 +++++++
 arch/loongarch/pci/Makefile                        |    7 +
 arch/loongarch/vdso/.gitignore                     |    2 +
 arch/loongarch/vdso/Makefile                       |   96 ++
 arch/loongarch/vdso/elf.S                          |   15 +
 arch/loongarch/vdso/gen_vdso_offsets.sh            |   13 +
 arch/loongarch/vdso/sigreturn.S                    |   24 +
 arch/loongarch/vdso/vdso.S                         |   22 +
 arch/loongarch/vdso/vdso.lds.S                     |   72 +
 arch/loongarch/vdso/vgettimeofday.c                |   25 +
 drivers/firmware/efi/Kconfig                       |    2 +-
 drivers/firmware/efi/libstub/Makefile              |   10 +
 drivers/firmware/efi/libstub/efi-stub-helper.c     |    2 +-
 drivers/firmware/efi/libstub/efi-stub.c            |    2 +-
 drivers/firmware/efi/libstub/loongarch-stub.c      |   88 ++
 drivers/gpu/drm/drm_vm.c                           |    2 +-
 drivers/gpu/drm/ttm/ttm_module.c                   |    2 +-
 drivers/irqchip/Kconfig                            |    6 +-
 drivers/irqchip/irq-loongson-liointc.c             |    6 +-
 include/drm/drm_cache.h                            |    8 +
 include/linux/cpuhotplug.h                         |    1 +
 include/linux/efi.h                                |    1 +
 include/linux/pe.h                                 |    2 +
 include/uapi/linux/audit.h                         |    2 +
 include/uapi/linux/elf-em.h                        |    1 +
 include/uapi/linux/elf.h                           |    5 +
 include/uapi/linux/kexec.h                         |    1 +
 scripts/sorttable.c                                |    5 +
 scripts/subarch.include                            |    2 +-
 tools/include/uapi/asm/bitsperlong.h               |    2 +
 213 files changed, 21500 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/loongarch/features.rst
 create mode 100644 Documentation/loongarch/index.rst
 create mode 100644 Documentation/loongarch/introduction.rst
 create mode 100644 Documentation/loongarch/irq-chip-model.rst
 create mode 100644 Documentation/translations/zh_CN/loongarch/features.rst
 create mode 100644 Documentation/translations/zh_CN/loongarch/index.rst
 create mode 100644 Documentation/translations/zh_CN/loongarch/introduction.rst
 create mode 100644 Documentation/translations/zh_CN/loongarch/irq-chip-model.rst
 create mode 100644 arch/loongarch/Kbuild
 create mode 100644 arch/loongarch/Kconfig
 create mode 100644 arch/loongarch/Kconfig.debug
 create mode 100644 arch/loongarch/Makefile
 create mode 100644 arch/loongarch/boot/.gitignore
 create mode 100644 arch/loongarch/boot/Makefile
 create mode 100644 arch/loongarch/boot/dts/Makefile
 create mode 100644 arch/loongarch/configs/loongson3_defconfig
 create mode 100644 arch/loongarch/include/asm/Kbuild
 create mode 100644 arch/loongarch/include/asm/acenv.h
 create mode 100644 arch/loongarch/include/asm/acpi.h
 create mode 100644 arch/loongarch/include/asm/addrspace.h
 create mode 100644 arch/loongarch/include/asm/asm-offsets.h
 create mode 100644 arch/loongarch/include/asm/asm-prototypes.h
 create mode 100644 arch/loongarch/include/asm/asm.h
 create mode 100644 arch/loongarch/include/asm/asmmacro.h
 create mode 100644 arch/loongarch/include/asm/atomic.h
 create mode 100644 arch/loongarch/include/asm/barrier.h
 create mode 100644 arch/loongarch/include/asm/bitops.h
 create mode 100644 arch/loongarch/include/asm/bitrev.h
 create mode 100644 arch/loongarch/include/asm/bootinfo.h
 create mode 100644 arch/loongarch/include/asm/branch.h
 create mode 100644 arch/loongarch/include/asm/bug.h
 create mode 100644 arch/loongarch/include/asm/cache.h
 create mode 100644 arch/loongarch/include/asm/cacheflush.h
 create mode 100644 arch/loongarch/include/asm/cacheops.h
 create mode 100644 arch/loongarch/include/asm/clocksource.h
 create mode 100644 arch/loongarch/include/asm/cmpxchg.h
 create mode 100644 arch/loongarch/include/asm/compiler.h
 create mode 100644 arch/loongarch/include/asm/cpu-features.h
 create mode 100644 arch/loongarch/include/asm/cpu-info.h
 create mode 100644 arch/loongarch/include/asm/cpu.h
 create mode 100644 arch/loongarch/include/asm/cpufeature.h
 create mode 100644 arch/loongarch/include/asm/delay.h
 create mode 100644 arch/loongarch/include/asm/dma-direct.h
 create mode 100644 arch/loongarch/include/asm/dmi.h
 create mode 100644 arch/loongarch/include/asm/efi.h
 create mode 100644 arch/loongarch/include/asm/elf.h
 create mode 100644 arch/loongarch/include/asm/entry-common.h
 create mode 100644 arch/loongarch/include/asm/exec.h
 create mode 100644 arch/loongarch/include/asm/fb.h
 create mode 100644 arch/loongarch/include/asm/fixmap.h
 create mode 100644 arch/loongarch/include/asm/fpregdef.h
 create mode 100644 arch/loongarch/include/asm/fpu.h
 create mode 100644 arch/loongarch/include/asm/futex.h
 create mode 100644 arch/loongarch/include/asm/hardirq.h
 create mode 100644 arch/loongarch/include/asm/hugetlb.h
 create mode 100644 arch/loongarch/include/asm/hw_irq.h
 create mode 100644 arch/loongarch/include/asm/idle.h
 create mode 100644 arch/loongarch/include/asm/inst.h
 create mode 100644 arch/loongarch/include/asm/io.h
 create mode 100644 arch/loongarch/include/asm/irq.h
 create mode 100644 arch/loongarch/include/asm/irq_regs.h
 create mode 100644 arch/loongarch/include/asm/irqflags.h
 create mode 100644 arch/loongarch/include/asm/kdebug.h
 create mode 100644 arch/loongarch/include/asm/linkage.h
 create mode 100644 arch/loongarch/include/asm/local.h
 create mode 100644 arch/loongarch/include/asm/loongarch.h
 create mode 100644 arch/loongarch/include/asm/loongson.h
 create mode 100644 arch/loongarch/include/asm/mmu.h
 create mode 100644 arch/loongarch/include/asm/mmu_context.h
 create mode 100644 arch/loongarch/include/asm/mmzone.h
 create mode 100644 arch/loongarch/include/asm/module.h
 create mode 100644 arch/loongarch/include/asm/module.lds.h
 create mode 100644 arch/loongarch/include/asm/numa.h
 create mode 100644 arch/loongarch/include/asm/page.h
 create mode 100644 arch/loongarch/include/asm/percpu.h
 create mode 100644 arch/loongarch/include/asm/perf_event.h
 create mode 100644 arch/loongarch/include/asm/pgalloc.h
 create mode 100644 arch/loongarch/include/asm/pgtable-bits.h
 create mode 100644 arch/loongarch/include/asm/pgtable.h
 create mode 100644 arch/loongarch/include/asm/prefetch.h
 create mode 100644 arch/loongarch/include/asm/processor.h
 create mode 100644 arch/loongarch/include/asm/ptrace.h
 create mode 100644 arch/loongarch/include/asm/reboot.h
 create mode 100644 arch/loongarch/include/asm/regdef.h
 create mode 100644 arch/loongarch/include/asm/seccomp.h
 create mode 100644 arch/loongarch/include/asm/serial.h
 create mode 100644 arch/loongarch/include/asm/setup.h
 create mode 100644 arch/loongarch/include/asm/shmparam.h
 create mode 100644 arch/loongarch/include/asm/smp.h
 create mode 100644 arch/loongarch/include/asm/sparsemem.h
 create mode 100644 arch/loongarch/include/asm/stackframe.h
 create mode 100644 arch/loongarch/include/asm/stacktrace.h
 create mode 100644 arch/loongarch/include/asm/string.h
 create mode 100644 arch/loongarch/include/asm/switch_to.h
 create mode 100644 arch/loongarch/include/asm/syscall.h
 create mode 100644 arch/loongarch/include/asm/thread_info.h
 create mode 100644 arch/loongarch/include/asm/time.h
 create mode 100644 arch/loongarch/include/asm/timex.h
 create mode 100644 arch/loongarch/include/asm/tlb.h
 create mode 100644 arch/loongarch/include/asm/tlbflush.h
 create mode 100644 arch/loongarch/include/asm/topology.h
 create mode 100644 arch/loongarch/include/asm/types.h
 create mode 100644 arch/loongarch/include/asm/uaccess.h
 create mode 100644 arch/loongarch/include/asm/unistd.h
 create mode 100644 arch/loongarch/include/asm/vdso.h
 create mode 100644 arch/loongarch/include/asm/vdso/clocksource.h
 create mode 100644 arch/loongarch/include/asm/vdso/gettimeofday.h
 create mode 100644 arch/loongarch/include/asm/vdso/processor.h
 create mode 100644 arch/loongarch/include/asm/vdso/vdso.h
 create mode 100644 arch/loongarch/include/asm/vdso/vsyscall.h
 create mode 100644 arch/loongarch/include/asm/vermagic.h
 create mode 100644 arch/loongarch/include/asm/vmalloc.h
 create mode 100644 arch/loongarch/include/uapi/asm/Kbuild
 create mode 100644 arch/loongarch/include/uapi/asm/auxvec.h
 create mode 100644 arch/loongarch/include/uapi/asm/bitsperlong.h
 create mode 100644 arch/loongarch/include/uapi/asm/break.h
 create mode 100644 arch/loongarch/include/uapi/asm/byteorder.h
 create mode 100644 arch/loongarch/include/uapi/asm/hwcap.h
 create mode 100644 arch/loongarch/include/uapi/asm/ptrace.h
 create mode 100644 arch/loongarch/include/uapi/asm/reg.h
 create mode 100644 arch/loongarch/include/uapi/asm/sigcontext.h
 create mode 100644 arch/loongarch/include/uapi/asm/signal.h
 create mode 100644 arch/loongarch/include/uapi/asm/ucontext.h
 create mode 100644 arch/loongarch/include/uapi/asm/unistd.h
 create mode 100644 arch/loongarch/kernel/.gitignore
 create mode 100644 arch/loongarch/kernel/Makefile
 create mode 100644 arch/loongarch/kernel/access-helper.h
 create mode 100644 arch/loongarch/kernel/acpi.c
 create mode 100644 arch/loongarch/kernel/asm-offsets.c
 create mode 100644 arch/loongarch/kernel/cacheinfo.c
 create mode 100644 arch/loongarch/kernel/cpu-probe.c
 create mode 100644 arch/loongarch/kernel/dma.c
 create mode 100644 arch/loongarch/kernel/efi-header.S
 create mode 100644 arch/loongarch/kernel/efi.c
 create mode 100644 arch/loongarch/kernel/elf.c
 create mode 100644 arch/loongarch/kernel/entry.S
 create mode 100644 arch/loongarch/kernel/env.c
 create mode 100644 arch/loongarch/kernel/fpu.S
 create mode 100644 arch/loongarch/kernel/genex.S
 create mode 100644 arch/loongarch/kernel/head.S
 create mode 100644 arch/loongarch/kernel/idle.c
 create mode 100644 arch/loongarch/kernel/image-vars.h
 create mode 100644 arch/loongarch/kernel/inst.c
 create mode 100644 arch/loongarch/kernel/io.c
 create mode 100644 arch/loongarch/kernel/irq.c
 create mode 100644 arch/loongarch/kernel/mem.c
 create mode 100644 arch/loongarch/kernel/module-sections.c
 create mode 100644 arch/loongarch/kernel/module.c
 create mode 100644 arch/loongarch/kernel/numa.c
 create mode 100644 arch/loongarch/kernel/proc.c
 create mode 100644 arch/loongarch/kernel/process.c
 create mode 100644 arch/loongarch/kernel/ptrace.c
 create mode 100644 arch/loongarch/kernel/reset.c
 create mode 100644 arch/loongarch/kernel/setup.c
 create mode 100644 arch/loongarch/kernel/signal.c
 create mode 100644 arch/loongarch/kernel/smp.c
 create mode 100644 arch/loongarch/kernel/switch.S
 create mode 100644 arch/loongarch/kernel/syscall.c
 create mode 100644 arch/loongarch/kernel/time.c
 create mode 100644 arch/loongarch/kernel/topology.c
 create mode 100644 arch/loongarch/kernel/traps.c
 create mode 100644 arch/loongarch/kernel/vdso.c
 create mode 100644 arch/loongarch/kernel/vmlinux.lds.S
 create mode 100644 arch/loongarch/lib/Makefile
 create mode 100644 arch/loongarch/lib/clear_user.S
 create mode 100644 arch/loongarch/lib/copy_user.S
 create mode 100644 arch/loongarch/lib/delay.c
 create mode 100644 arch/loongarch/lib/dump_tlb.c
 create mode 100644 arch/loongarch/mm/Makefile
 create mode 100644 arch/loongarch/mm/cache.c
 create mode 100644 arch/loongarch/mm/extable.c
 create mode 100644 arch/loongarch/mm/fault.c
 create mode 100644 arch/loongarch/mm/hugetlbpage.c
 create mode 100644 arch/loongarch/mm/init.c
 create mode 100644 arch/loongarch/mm/ioremap.c
 create mode 100644 arch/loongarch/mm/maccess.c
 create mode 100644 arch/loongarch/mm/mmap.c
 create mode 100644 arch/loongarch/mm/page.S
 create mode 100644 arch/loongarch/mm/pgtable.c
 create mode 100644 arch/loongarch/mm/tlb.c
 create mode 100644 arch/loongarch/mm/tlbex.S
 create mode 100644 arch/loongarch/pci/Makefile
 create mode 100644 arch/loongarch/vdso/.gitignore
 create mode 100644 arch/loongarch/vdso/Makefile
 create mode 100644 arch/loongarch/vdso/elf.S
 create mode 100755 arch/loongarch/vdso/gen_vdso_offsets.sh
 create mode 100644 arch/loongarch/vdso/sigreturn.S
 create mode 100644 arch/loongarch/vdso/vdso.S
 create mode 100644 arch/loongarch/vdso/vdso.lds.S
 create mode 100644 arch/loongarch/vdso/vgettimeofday.c
 create mode 100644 drivers/firmware/efi/libstub/loongarch-stub.c
--
2.27.0

