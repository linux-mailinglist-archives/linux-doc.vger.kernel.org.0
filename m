Return-Path: <linux-doc+bounces-43830-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB32A96767
	for <lists+linux-doc@lfdr.de>; Tue, 22 Apr 2025 13:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2251E1899E0E
	for <lists+linux-doc@lfdr.de>; Tue, 22 Apr 2025 11:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B14327BF93;
	Tue, 22 Apr 2025 11:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j/6lfi3n"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB5D20B801
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 11:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321532; cv=none; b=RyfeBkyT6UKfnCluazlGbVgNJx+W0DtybNou6pv8kO9xrxH1v9f7g0O//FUTDJ0t2qK3Y2Xk+WJnG7T4vSWAWogncGjkWNXQ98u7DOMkenICLbpEVvOPGV+A1DNV+3rStSX8PorxoWfee2U3LvxPw3tSqQjqS+HCJZORrztV9Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321532; c=relaxed/simple;
	bh=s08ygIH7nJOtJn3MO5u3CvMAV4YYct9r92N6MxkXoyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ty66P6ycxxnn8XuPa6wgzFZVwMHfSgqc4gv6bdc526NECPOLpOsxPbAZm1OyH0t86Lg0+nGb7xW1tS81J0gLsmyHy6N35b+K7PHuBX316FqtSZf4BVMtzxlOUfvZSewWuz1Y6imbvaD7us/s0EbDUre5DA0WoZd4wqlRX0KK8dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j/6lfi3n; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3441742f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 04:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321529; x=1745926329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OefwBLy5C9nQRNf2nMOiIbJOsB3W42el5vzyC2W690w=;
        b=j/6lfi3nKgyIhDtYkmw4/AgVwBzc5fe6nAaAHgPRpIVF73RMGEpXB8CMfPjN10CBng
         uuBavm0QoKwtE6rOwFB6RhYtzzs3CDYMIn7ecY5i8gIw6Q6t6vPHaJec3EErWT4flQgr
         VZBqpB7umPYJCLQcs/kw0Do6YdAMRcUBajQNNzklnEUjAVWOYazt+dtJE/08KhoNs0Ko
         kj5KSaEnOdi36v4rJq7V5MNsPVzwqrkZa5Sdiwf82KZxIygawbpM4Yqo7y9knDK0FHZr
         K3BpD7AiN7q2kh2PJdq0Xlqn24zFZgHhVycoIvYrTbgcz/0xWSUn30rclA3sV6lzARIn
         fIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321529; x=1745926329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OefwBLy5C9nQRNf2nMOiIbJOsB3W42el5vzyC2W690w=;
        b=iz7DkDLIvZx/nlY3AfEaV0VW6pZBOhUkblXEg3fANFC2riNMz+Xi/PY9y5WDWCfJ8j
         OzEjCniUCivOF6D42qhvqXw5N+Lz+UdW3VjwjCKr3lK0klF5+3NgP+XL7G5EELfp+rdl
         8dncAZzuXMxeurVSZ4OEygxW93mQYZky3PvZw3agZYSCzrrU+sUMXT/cmR2fbXWFwZsf
         VmMapRnt73xw5ihe5bQ6ziPXfFci03Fnwf8KlNpE9h++Q1tf+EvR4FimzinPXl3V3RxW
         bvaucMRkTjDoitezMv2lqcJ88Ml+MKEsjMqm/iEGnR+3CbOmi7XZfNtjzcoWP9XMqmzU
         8bvQ==
X-Gm-Message-State: AOJu0YxpAmFUI0USutsoTUlMLJAHIiAfjAcuo8rsCXhaoenx2P8PIJQf
	cFaLlLji4msJef4GPSZxX/alaDajqkAjRK3YPMOSVtAna/CsfbPdpv4mUgd2kxY=
X-Gm-Gg: ASbGncsB0zx9GytPR1YGYWBIgKVC2uZJYtokFHRlRYmAhHAg6AwQgukYP6vJNFVMlJF
	+l8B/RaSIs9G5gy/PBgEXS5xaiwKVB5+IZJ1V8z60Ior31mmwxD7NaN9BTq5sTwvLndgf33AbG1
	tgF0uc4Y4shhWZg7XYOngrFgno8l8z5t5ITBKTfAcd2CFcP32jRebyw1NQmNu+eS/NhPtBRL8xv
	Rf6UacROOhglOtfC+tPwbAR0+IrN3Av454Oz0eJvl0KwjJRPwFIWHTsX6i5Jl7N+EEvB2Q4SMVS
	wKOLjkdn8uUpQ8K/zd029gsCWyEt8n8ZrHzBkUA8vWS3N1bB954U
X-Google-Smtp-Source: AGHT+IH0nb8o7hKQyGVq2JnvWNqH5INVMxoDkBitlvauZDO1uWFUGhcBewPYsW8bzlAMjNtYGE2jiA==
X-Received: by 2002:a5d:5f90:0:b0:39c:dcc:6451 with SMTP id ffacd0b85a97d-39efbace334mr11602293f8f.43.1745321529180;
        Tue, 22 Apr 2025 04:32:09 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:08 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 00/14] introduce kmemdump
Date: Tue, 22 Apr 2025 14:31:42 +0300
Message-ID: <20250422113156.575971-1-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmemdump is a mechanism which allows the kernel to mark specific memory
areas for dumping or specific backend usage.
Once regions are marked, kmemdump keeps an internal list with the regions
and registers them in the backend.
Further, depending on the backend driver, these regions can be dumped using
firmware or different hardware block.
Regions being marked beforehand, when the system is up and running, there
is no need nor dependency on a panic handler, or a working kernel that can
dump the debug information.
The kmemdump approach works when pstore, kdump, or another mechanism do not.
Pstore relies on persistent storage, a dedicated RAM area or flash, which
has the disadvantage of having the memory reserved all the time, or another
specific non volatile memory. Some devices cannot keep the RAM contents on
reboot so ramoops does not work. Some devices do not allow kexec to run
another kernel to debug the crashed one.
For such devices, that have another mechanism to help debugging, like
firmware, kmemdump is a viable solution.

kmemdump can create a core image, similar with /proc/vmcore, with only
the registered regions included. This can be loaded into crash tool/gdb and
analyzed.
To have this working, specific information from the kernel is registered,
and this is done at kmemdump init time, no need for the kmemdump user to
do anything.

The implementation is based on the initial Pstore/directly mapped zones
published as an RFC here:
https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/

The back-end implementation for qcom_smem is based on the minidump
patch series and driver written by Mukesh Ojha, thanks:
https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/

I appreciate the feedback on this series, I know it is a longshot, and there
is a lot to improve, but I hope I am on the right track.

Thanks,
Eugen

PS. Here is how crash tool reports the dump:

     KERNEL: /home/eugen/linux-minidump/vmlinux  [TAINTED]
    DUMPFILE: /home/eugen/eee
        CPUS: 8 [OFFLINE: 7]
        DATE: Thu Jan  1 02:00:00 EET 1970
      UPTIME: 00:00:28
    NODENAME: qemuarm64
     RELEASE: 6.14.0-rc5-next-20250303-00014-g011eb2aaf7b6-dirty
     VERSION: #169 SMP PREEMPT Thu Apr 17 14:12:21 EEST 2025
     MACHINE: aarch64  (unknown Mhz)
      MEMORY: 0
       PANIC: ""

crash> log
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd4b2]
[    0.000000] Linux version 6.14.0-rc5-next-20250303-00014-g011eb2aaf7b6-dirty (eugen@eugen-station) (aarch64-none-linux-gnu-gcc (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 13.3.1 20240614, GNU ld (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 2.42.0.20240614) #169 SMP PREEMPT Thu Apr 17 14:12:21 EEST 2025
[    0.000000] KASLR enabled
[...]

Eugen Hristev (14):
  Documentation: add kmemdump
  kmemdump: introduce kmemdump
  kmemdump: introduce qcom-md backend driver
  soc: qcom: smem: add minidump device
  Documentation: kmemdump: add section for coreimage ELF
  kmemdump: add coreimage ELF layer
  printk: add kmsg_kmemdump_register
  kmemdump: coreimage: add kmsg registration
  genirq: add irq_kmemdump_register
  kmemdump: coreimage: add irq registration
  panic: add panic_kmemdump_register
  kmemdump: coreimage: add panic registration
  sched: add sched_kmemdump_register
  kmemdump: coreimage: add sched registration

 Documentation/debug/index.rst      |  17 ++
 Documentation/debug/kmemdump.rst   |  83 +++++
 drivers/Kconfig                    |   2 +
 drivers/Makefile                   |   2 +
 drivers/debug/Kconfig              |  39 +++
 drivers/debug/Makefile             |   5 +
 drivers/debug/kmemdump.c           | 197 ++++++++++++
 drivers/debug/kmemdump_coreimage.c | 293 ++++++++++++++++++
 drivers/debug/qcom_md.c            | 467 +++++++++++++++++++++++++++++
 drivers/soc/qcom/smem.c            |  10 +
 include/linux/irqnr.h              |   1 +
 include/linux/kmemdump.h           |  77 +++++
 include/linux/kmsg_dump.h          |   6 +
 include/linux/panic.h              |   1 +
 include/linux/sched.h              |   1 +
 kernel/irq/irqdesc.c               |   7 +
 kernel/panic.c                     |   8 +
 kernel/printk/printk.c             |  13 +
 kernel/sched/core.c                |   7 +
 19 files changed, 1236 insertions(+)
 create mode 100644 Documentation/debug/index.rst
 create mode 100644 Documentation/debug/kmemdump.rst
 create mode 100644 drivers/debug/Kconfig
 create mode 100644 drivers/debug/Makefile
 create mode 100644 drivers/debug/kmemdump.c
 create mode 100644 drivers/debug/kmemdump_coreimage.c
 create mode 100644 drivers/debug/qcom_md.c
 create mode 100644 include/linux/kmemdump.h

-- 
2.43.0


