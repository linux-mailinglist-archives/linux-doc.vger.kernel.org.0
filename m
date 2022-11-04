Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71FE16190E1
	for <lists+linux-doc@lfdr.de>; Fri,  4 Nov 2022 07:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbiKDGVP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 4 Nov 2022 02:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiKDGVO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Nov 2022 02:21:14 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA002A277
        for <linux-doc@vger.kernel.org>; Thu,  3 Nov 2022 23:21:12 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso4781925wma.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Nov 2022 23:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=65lTdNqrP8u73l0y8SmF+Y01vsRJT7JcdsWBrKR/ZE0=;
        b=gjNprhE9BWQEQqlbsclp1Tfj9PVvIB+S3jhNIO835EV5qbLoBsqNy7LNAMUWHKiN0t
         XxS4PRmxrDg2TAm3zyVuDHtAmBivy52j81Sc1BpfvoyUCS8h+8jetKGCaw7SRdrleKmy
         KT/kYO0QdVJQP/ku7dy2xyN7nYbVC8R4NDyEhhlPtQoIrKcVnJvQ/l/NI6chguuNa1Xz
         INDvCSqM/M5apato2zhRSgUuoe0/UJARPb+z19JIGTTr/oO+viwkkT5UZVDdCy9j+12e
         CSYPao44S4JL2aIG0AE9wr8DyiqHf1BreMMKbcb+b1EkSEHZ/1eMlWZJ8WsupG0NANyu
         23kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65lTdNqrP8u73l0y8SmF+Y01vsRJT7JcdsWBrKR/ZE0=;
        b=8KuO5/cKUbeWqximcbxTCl2y+VMKNE8HSV8QOBYQytxkzMfEgjF1SeJrYVWqQJG5Qa
         pT5+brlNb7SCBumtVMqei9UZg+SCOtDyXebzI+K5t5EBhJOPlV2l5CRDmFih8SMnqaHq
         6MsH0U+fea0Jr+t2RWarZtS49iatsZzu9HtPWl2RswgVk1q64XC7Kq7zZs3kltwCsxSv
         l938Z5D3fTCMpu5VZEL3WFIw6T0DsMIj+c+kq3tXBBMdi7VSYc2S8zrX+snSfCqeAMYD
         zvdqsZJpIIeRzRpza+ZRhVjTbh8mwefQnj3vckMJeoC+iDz5QBQrJm4LojhpDGzDfFGk
         NCYQ==
X-Gm-Message-State: ACrzQf0ynhsGxKWd2XcxCqGXm67M0elcu4lCFxKBgAN8KCp3RTPS9Lkj
        tpz5wIdbYCRc5ko+QXtQV3IRaA==
X-Google-Smtp-Source: AMsMyM6aTQP5kPMGw4HIGximP07bbRwNCO6igOcOZs22Ff19oUZTGj53V2La5HXh9et1oEl6fpi67w==
X-Received: by 2002:a1c:ed0e:0:b0:3cf:6b2b:f1db with SMTP id l14-20020a1ced0e000000b003cf6b2bf1dbmr19736113wmh.117.1667542870847;
        Thu, 03 Nov 2022 23:21:10 -0700 (PDT)
Received: from usaari01.cust.communityfibre.co.uk ([2a02:6b6a:b4d7:0:c7c:f931:dd4c:1ea6])
        by smtp.gmail.com with ESMTPSA id w11-20020a5d608b000000b002366f9bd717sm3099924wrt.45.2022.11.03.23.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 23:21:10 -0700 (PDT)
From:   Usama Arif <usama.arif@bytedance.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, linux@armlinux.org.uk,
        yezengruan@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        maz@kernel.org, steven.price@arm.com, mark.rutland@arm.com,
        bagasdotme@gmail.com
Cc:     fam.zheng@bytedance.com, liangma@liangbit.com,
        punit.agrawal@bytedance.com, Usama Arif <usama.arif@bytedance.com>
Subject: [v2 0/6] KVM: arm64: implement vcpu_is_preempted check
Date:   Fri,  4 Nov 2022 06:20:59 +0000
Message-Id: <20221104062105.4119003-1-usama.arif@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patchset adds support for vcpu_is_preempted in arm64, which allows the guest
to check if a vcpu was scheduled out, which is useful to know incase it was
holding a lock. vcpu_is_preempted can be used to improve
performance in locking (see owner_on_cpu usage in mutex_spin_on_owner,
mutex_can_spin_on_owner, rtmutex_spin_on_owner and osq_lock) and scheduling
(see available_idle_cpu which is used in several places in kernel/sched/fair.c
for e.g. in wake_affine to determine which CPU can run soonest):

This patchset shows improvement on overcommitted hosts (vCPUs > pCPUS), as waiting
for preempted vCPUs reduces performance.

This patchset is inspired from the para_steal_clock implementation and from the
work originally done by Zengruan Ye:
https://lore.kernel.org/linux-arm-kernel/20191226135833.1052-1-yezengruan@huawei.com/.

All the results in the below experiments are done on an aws r6g.metal instance
which has 64 pCPUs.

The following table shows the index results of UnixBench running on a 128 vCPU VM
with (6.0.0+vcpu_is_preempted) and without (6.0.0 base) the patchset.
TestName                                6.0.0 base  6.0.0+vcpu_is_preempted    % improvement for vcpu_is_preempted
Dhrystone 2 using register variables    187761      191274.7                   1.871368389
Double-Precision Whetstone              96743.6     98414.4                    1.727039308
Execl Throughput                        689.3       10426                      1412.548963
File Copy 1024 bufsize 2000 maxblocks   549.5       3165                       475.978162
File Copy 256 bufsize 500 maxblocks     400.7       2084.7                     420.2645371
File Copy 4096 bufsize 8000 maxblocks   894.3       5003.2                     459.4543218
Pipe Throughput                         76819.5     78601.5                    2.319723508
Pipe-based Context Switching            3444.8      13414.5                    289.4130283
Process Creation                        301.1       293.4                      -2.557289937
Shell Scripts (1 concurrent)            1248.1      28300.6                    2167.494592
Shell Scripts (8 concurrent)            781.2       26222.3                    3256.669227
System Call Overhead                    3426        3729.4                     8.855808523

System Benchmarks Index Score           3053        11534                      277.7923354

This shows a 277% overall improvement using these patches.

The biggest improvement is in the shell scripts benchmark, which forks a lot of processes.
This acquires rwsem lock where a large chunk of time is spent in base 6.0.0 kernel.
This can be seen from one of the callstack of the perf output of the shell
scripts benchmark on 6.0.0 base (pseudo NMI enabled for perf numbers below):
- 33.79% el0_svc
   - 33.43% do_el0_svc
      - 33.43% el0_svc_common.constprop.3
         - 33.30% invoke_syscall
            - 17.27% __arm64_sys_clone
               - 17.27% __do_sys_clone
                  - 17.26% kernel_clone
                     - 16.73% copy_process
                        - 11.91% dup_mm
                           - 11.82% dup_mmap
                              - 9.15% down_write
                                 - 8.87% rwsem_down_write_slowpath
                                    - 8.48% osq_lock

Just under 50% of the total time in the shell script benchmarks ends up being
spent in osq_lock in the base 6.0.0 kernel:
  Children      Self  Command   Shared Object        Symbol
   17.19%    10.71%  sh      [kernel.kallsyms]  [k] osq_lock
    6.17%     4.04%  sort    [kernel.kallsyms]  [k] osq_lock
    4.20%     2.60%  multi.  [kernel.kallsyms]  [k] osq_lock
    3.77%     2.47%  grep    [kernel.kallsyms]  [k] osq_lock
    3.50%     2.24%  expr    [kernel.kallsyms]  [k] osq_lock
    3.41%     2.23%  od      [kernel.kallsyms]  [k] osq_lock
    3.36%     2.15%  rm      [kernel.kallsyms]  [k] osq_lock
    3.28%     2.12%  tee     [kernel.kallsyms]  [k] osq_lock
    3.16%     2.02%  wc      [kernel.kallsyms]  [k] osq_lock
    0.21%     0.13%  looper  [kernel.kallsyms]  [k] osq_lock
    0.01%     0.00%  Run     [kernel.kallsyms]  [k] osq_lock

and this comes down to less than 1% total with 6.0.0+vcpu_is_preempted kernel:
  Children      Self  Command   Shared Object        Symbol
     0.26%     0.21%  sh      [kernel.kallsyms]  [k] osq_lock
     0.10%     0.08%  multi.  [kernel.kallsyms]  [k] osq_lock
     0.04%     0.04%  sort    [kernel.kallsyms]  [k] osq_lock
     0.02%     0.01%  grep    [kernel.kallsyms]  [k] osq_lock
     0.02%     0.02%  od      [kernel.kallsyms]  [k] osq_lock
     0.01%     0.01%  tee     [kernel.kallsyms]  [k] osq_lock
     0.01%     0.00%  expr    [kernel.kallsyms]  [k] osq_lock
     0.01%     0.01%  looper  [kernel.kallsyms]  [k] osq_lock
     0.00%     0.00%  wc      [kernel.kallsyms]  [k] osq_lock
     0.00%     0.00%  rm      [kernel.kallsyms]  [k] osq_lock

To make sure, there is no change in performance when vCPUs < pCPUs, UnixBench
was run on a 32 CPU VM. The kernel with vcpu_is_preempted implemented
performed 0.9% better overall than base kernel, and the individual benchmarks
were within +/-2% improvement over 6.0.0 base.
Hence the patches have no negative affect when vCPUs < pCPUs.


The other method discussed in https://lore.kernel.org/linux-arm-kernel/20191226135833.1052-1-yezengruan@huawei.com/
was pv conditional yield by Marc Zyngier and Will Deacon to reduce vCPU reschedule
if the vCPU will exit immediately.
(https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/pvcy).
The patches were ported to 6.0.0 kernel and tested with UnixBench with a 128 vCPU VM:

TestName                                6.0.0 base  6.0.0+pvcy      % improvement for pvcy
Dhrystone 2 using register variables    187761      183128          -2.467498575
Double-Precision Whetstone              96743.6     96645           -0.101918887
Execl Throughput                        689.3       1019.8          47.9471928
File Copy 1024 bufsize 2000 maxblocks   549.5       2029.7          269.3721565
File Copy 256 bufsize 500 maxblocks     400.7       1439.4          259.2213626
File Copy 4096 bufsize 8000 maxblocks   894.3       3434.1          283.9986582
Pipe Throughput                         76819.5     74268.8         -3.320380893
Pipe-based Context Switching            3444.8      5963.3          73.11019508
Process Creation                        301.1       163.2           -45.79873796
Shell Scripts (1 concurrent)            1248.1      1859.7          49.00248378
Shell Scripts (8 concurrent)            781.2       1171            49.89759345
System Call Overhead                    3426        3194.4          -6.760070053

System Benchmarks Index Score           3053        4605            50.83524402

pvcy shows a smaller overall improvement (50%) compared to vcpu_is_preempted (277%).
Host side flamegraph analysis shows that ~60% of the host time when using pvcy
is spent in kvm_handle_wfx, compared with ~1.5% when using vcpu_is_preempted,
hence vcpu_is_preempted shows a larger improvement.

It might be that pvcy can be used in combination with vcpu_is_preempted, but this
series is to start a discussion on vcpu_is_preempted as it shows a much bigger
improvement in performance and its much easier to review vcpu_is_preempted standalone.

The respective QEMU change to test this is at
https://github.com/uarif1/qemu/commit/2da2c2927ae8de8f03f439804a0dad9cf68501b6,

Looking forward to your response!
Thanks,
Usama
---
RFC->v2
- Fixed table and code referencing in pvlock documentation
- Switched to using a single hypercall similar to ptp_kvm and made check
  for has_kvm_pvlock simpler

Usama Arif (6):
  KVM: arm64: Document PV-lock interface
  KVM: arm64: Add SMCCC paravirtualised lock calls
  KVM: arm64: Support pvlock preempted via shared structure
  KVM: arm64: Provide VCPU attributes for PV lock
  KVM: arm64: Support the VCPU preemption check
  KVM: selftests: add tests for PV time specific hypercall

 Documentation/virt/kvm/arm/hypercalls.rst     |   3 +
 Documentation/virt/kvm/arm/index.rst          |   1 +
 Documentation/virt/kvm/arm/pvlock.rst         |  52 ++++++++
 Documentation/virt/kvm/devices/vcpu.rst       |  25 ++++
 arch/arm64/include/asm/kvm_host.h             |  25 ++++
 arch/arm64/include/asm/paravirt.h             |   2 +
 arch/arm64/include/asm/pvlock-abi.h           |  17 +++
 arch/arm64/include/asm/spinlock.h             |  16 ++-
 arch/arm64/include/uapi/asm/kvm.h             |   3 +
 arch/arm64/kernel/paravirt.c                  | 112 ++++++++++++++++++
 arch/arm64/kernel/setup.c                     |   3 +
 arch/arm64/kvm/Makefile                       |   2 +-
 arch/arm64/kvm/arm.c                          |   8 ++
 arch/arm64/kvm/guest.c                        |   9 ++
 arch/arm64/kvm/hypercalls.c                   |   8 ++
 arch/arm64/kvm/pvlock.c                       | 100 ++++++++++++++++
 include/linux/arm-smccc.h                     |   8 ++
 include/linux/cpuhotplug.h                    |   1 +
 include/uapi/linux/kvm.h                      |   2 +
 tools/arch/arm64/include/uapi/asm/kvm.h       |   1 +
 tools/include/linux/arm-smccc.h               |   8 ++
 .../selftests/kvm/aarch64/hypercalls.c        |   2 +
 22 files changed, 406 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/virt/kvm/arm/pvlock.rst
 create mode 100644 arch/arm64/include/asm/pvlock-abi.h
 create mode 100644 arch/arm64/kvm/pvlock.c

-- 
2.25.1

