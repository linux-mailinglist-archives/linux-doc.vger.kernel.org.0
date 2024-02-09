Return-Path: <linux-doc+bounces-8793-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D458384F048
	for <lists+linux-doc@lfdr.de>; Fri,  9 Feb 2024 07:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C2BE1F246E5
	for <lists+linux-doc@lfdr.de>; Fri,  9 Feb 2024 06:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6017657A8;
	Fri,  9 Feb 2024 06:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vrull.eu header.i=@vrull.eu header.b="jftvQyyn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2944651BE
	for <linux-doc@vger.kernel.org>; Fri,  9 Feb 2024 06:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707460858; cv=none; b=kLslWAHfDCQIQ1v4WMb6ISNartN+NrVECCKDMG3GiKhY+HtxcEHH5DHx+296PslubDZQ0K9175U1tAUqhBniDDhmQWb9SneTHHjfZ6IPMW76+lEZ0M3dc6QpsBxEe6M06tmZdjmLhFxmJb4SruUQw4NUWecTyHFqW1hmq3akSwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707460858; c=relaxed/simple;
	bh=ttzGZt8Xqfj1jyMzn/IlnS9IW32N05ugyiqia/LyfNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y3H49gNr/292toX3/7ATb+PqUJOuwobhQhYU8228Fgv+boIW75TsXx2czH3lGQtexinUoACh16smkHRDGiFbUDPbZaYj/EGV+GAkR6O4aHao06lsBW/H1WjXjgFhatDb176gXgkpMFHJZ31hdEj2e8/Ro4To0aQN9A28hO5ZlPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vrull.eu; spf=pass smtp.mailfrom=vrull.eu; dkim=pass (2048-bit key) header.d=vrull.eu header.i=@vrull.eu header.b=jftvQyyn; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vrull.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vrull.eu
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55cca88b6a5so801042a12.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Feb 2024 22:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1707460855; x=1708065655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kvtDAF5lfbY4yUhZUUJ7CosOcOxm/24HARcc6AfCtK4=;
        b=jftvQyynacKK+2bqkhX2ctKOCT7Bp3TmFdEiiZVV0LwvP6ezb4fD65WvPoE5D/DonQ
         MHbVW/h+oUugxQfPHGg/2a/LKPnVGX0L6EsGZ8rnBiTfnpPDYk12dRi/ejBNmP/6DGOf
         jJC4pkQ8jR4rJ/oleJkE29qBzocm0ccxehFibTMzXZUvRAPDdJTyv5eVCDoBfB6LVNDG
         4hOFEnJ4gTYXk4iPlOVYHED22tgsz7kACjSdCVND+jKFCU1xKOO1aEy6tWlpuap8xBf/
         7hkxxmEKnzJrgKxALUdG/WHlUBPOTI7r0NXQMDFOF5vNNuObaqUQrVrRS6gtHbv8c4cq
         Natw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707460855; x=1708065655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvtDAF5lfbY4yUhZUUJ7CosOcOxm/24HARcc6AfCtK4=;
        b=i44BYtGgExpmpJSRIJxPoi7ss+c3TiPVUhosxrfkIeC+GSRMvYNnrLEwY+M8G3i7NR
         8JQX0T4Dz8kbkWV7ayYPGg11dxBvrWpJRMJxf4KP9alBpOd5+KDdW+87DPtwWwNuUKve
         i+fjbu4SC7FImzexKW7tQq7evRcYxUxPShCGzJcwy/wx03aDfUhcWCwn3UusTICQUDrc
         gc4+SyR+dnjao2+V1QbvqkZwmhEapscKus7VGTRPpk7RPqVRXPKI3vFUHRw7Gk5VfPrc
         lEthFVqgBNPiESc/teTMyHEJdWOciieIvWp+YVNcJz6NizCFzit9pxd6WvZ4m6ohfJM2
         SX5w==
X-Gm-Message-State: AOJu0YxBrgGMOHVfHr+p6klS2dgTrXArz+dG7RBGDEaQqHLHNj6lpb/t
	8GiG5a6ruoR0WV7RhSILV25FLKtn3MGSXGq8EnN5GJ69TmPt+di892VHw9ZxDn6ka8t/OnwwnJR
	do3s=
X-Google-Smtp-Source: AGHT+IHpIKkOgxjK+OQ+Z52aahdSsMDEuAEAMDQo+EQ8mKVlTca/L55YC6piRGYTQoHdHcL4KlFQuA==
X-Received: by 2002:a17:907:7673:b0:a3b:f72d:9c2a with SMTP id kk19-20020a170907767300b00a3bf72d9c2amr190059ejc.62.1707460854816;
        Thu, 08 Feb 2024 22:40:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWAlu54lRX16jytgJW8roJL2H0QKMI9bHlcj3TnXGSlYBIoBk1ttjdrTZzNzmVirHFnXFID3upTy4H1ASA/tzipHETgZkmgNtT+1sIwmU0GhKj3EYBRncTJaqvOv7y+mqhZEKbuQbD5nVdE67KR3Vie9bp57bSJ0X/SfGEHPifA05xGWJ5yNomEWstB8tmS7GLuOG2OKK1emxDCGGDQILzS5/CoaVrwlvN5S0JIzHLCqSqFInP5MruknJDOMS9QBs5gvY1r9lp4a859m45AERXSfEKyEAr4GfeWJYc47vGbCOZ2QDeL/6I4cycDMcAl5vG7BID+v8/SxhulWhKkd3XIVvrTO9d1GKsCl6l+2uByZ1/IgXiJQ4iQwA0Qzodf53LBcoPOv99eWt/9zg8TjkDXy/GyYY3WSVgEbhjm5/o8MVTmxzr8vmfHaLOF9dYK6uqsahEbm4xyi2IWAVfs5eTpYHA6+lJOYXQpak9GUsfyWOp1z2cvJP/0MYJkWii8qqNUkdL8nJOlA8dOVvAjrgveq9g463WU+mKshPGavZylY+KSSLvr1zr0hkxpdcnYMRsV/VPkvLKBJylM1JWpUq7IHO+PeNGJC1OC9lCWA2Xrn8Qp+d0uXNdiebytIebrZVauV3FGf/oD/dQ9cNHb5LmPViq2yncp2V5fvI98v4ySLt2bcglj4dyHs2Ch2Z1YuGhTqcSSanM0d41wzHCHZZRvj1BpzO/LNtgMpWu6HOjLwTztDQ2Kk2tzDwtpi2jlaLFxH/w+mOMZzU1uHKzlAKbZbJd9hST1aqKBG/MooIXznVMGfUueWTBogXnPkAD/qQ4ZQMwzTDr27AVyQdRx7d7Wi0c6FvJowfnExEtugC6H9g==
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id vb9-20020a170907d04900b00a370a76d3a0sm441180ejc.123.2024.02.08.22.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 22:40:54 -0800 (PST)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Will Deacon <will@kernel.org>,
	Daniel Lustig <dlustig@nvidia.com>,
	Brendan Sweeney <turtwig@utexas.edu>,
	Andrew Waterman <andrew@sifive.com>,
	Brendan Sweeney <brs@berkeley.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Hans Boehm <hboehm@google.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [RFC PATCH v2 0/6] RISC-V: Add dynamic TSO support
Date: Fri,  9 Feb 2024 07:40:44 +0100
Message-ID: <20240209064050.2746540-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The upcoming RISC-V Ssdtso specification introduces a bit in the senvcfg
CSR to switch the memory consistency model of user mode at run-time from
RVWMO to TSO. The active consistency model can therefore be switched on a
per-hart base and managed by the kernel on a per-process base.

This patchset implements basic Ssdtso support and adds a prctl API on top
so that user-space processes can switch to a stronger memory consistency
model (than the kernel was written for) at run-time.
The patchset also comes with a short documentation of the prctl API.

This series is based on the third draft of the Ssdtso specification
which can be found here:
  https://github.com/riscv/riscv-ssdtso/releases/tag/v1.0-draft3
Note, that the Ssdtso specification is in development state
(i.e., not frozen or even ratified) which is also the reason
why this series is marked as RFC.

This series saw the following changes since v1:
* Reordered/restructured patches
* Fixed build issues
* Addressed typos
* Removed ability to switch TSO->WMO
* Moved the state from per-thread to per-process
* Reschedule all CPUs after switching
* Some cleanups in the documentation
* Adding compatibility with Ztso (spec change in draft 3)

This patchset can also be found in this GitHub branch:
  https://github.com/cmuellner/linux/tree/ssdtso-v2

A QEMU implementation of DTSO can be found in this GitHub branch:
  https://github.com/cmuellner/qemu/tree/ssdtso-v2

Christoph Müllner (6):
  mm: Add dynamic memory consistency model switching
  uapi: prctl: Add new prctl call to set/get the memory consistency
    model
  RISC-V: Enable dynamic memory consistency model support with Ssdtso
  RISC-V: Implement prctl call to set/get the memory consistency model
  RISC-V: Expose Ssdtso via hwprobe API
  RISC-V: selftests: Add DTSO tests

 Documentation/arch/riscv/hwprobe.rst          |  3 +
 .../mm/dynamic-memory-consistency-model.rst   | 86 ++++++++++++++++
 Documentation/mm/index.rst                    |  1 +
 arch/Kconfig                                  | 14 +++
 arch/riscv/Kconfig                            | 11 +++
 arch/riscv/include/asm/csr.h                  |  1 +
 arch/riscv/include/asm/dtso.h                 | 97 +++++++++++++++++++
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/processor.h            |  7 ++
 arch/riscv/include/asm/switch_to.h            |  3 +
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/asm-offsets.c               |  3 +
 arch/riscv/kernel/cpufeature.c                |  1 +
 arch/riscv/kernel/dtso.c                      | 67 +++++++++++++
 arch/riscv/kernel/sys_hwprobe.c               |  2 +
 include/linux/sched.h                         |  5 +
 include/uapi/linux/prctl.h                    |  5 +
 kernel/sys.c                                  | 12 +++
 tools/testing/selftests/riscv/Makefile        |  2 +-
 tools/testing/selftests/riscv/dtso/.gitignore |  1 +
 tools/testing/selftests/riscv/dtso/Makefile   | 11 +++
 tools/testing/selftests/riscv/dtso/dtso.c     | 82 ++++++++++++++++
 23 files changed, 416 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/mm/dynamic-memory-consistency-model.rst
 create mode 100644 arch/riscv/include/asm/dtso.h
 create mode 100644 arch/riscv/kernel/dtso.c
 create mode 100644 tools/testing/selftests/riscv/dtso/.gitignore
 create mode 100644 tools/testing/selftests/riscv/dtso/Makefile
 create mode 100644 tools/testing/selftests/riscv/dtso/dtso.c

-- 
2.43.0


