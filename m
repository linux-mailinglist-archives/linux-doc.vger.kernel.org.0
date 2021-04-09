Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B8735954A
	for <lists+linux-doc@lfdr.de>; Fri,  9 Apr 2021 08:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbhDIGRm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 9 Apr 2021 02:17:42 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:54453 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233381AbhDIGRl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Apr 2021 02:17:41 -0400
X-Originating-IP: 81.185.169.105
Received: from localhost.localdomain (105.169.185.81.rev.sfr.net [81.185.169.105])
        (Authenticated sender: alex@ghiti.fr)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D86D3E0003;
        Fri,  9 Apr 2021 06:17:23 +0000 (UTC)
From:   Alexandre Ghiti <alex@ghiti.fr>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com, linux-arch@vger.kernel.org,
        linux-mm@kvack.org
Cc:     Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v4 2/3] Documentation: riscv: Add documentation that describes the VM layout
Date:   Fri,  9 Apr 2021 02:14:59 -0400
Message-Id: <20210409061500.14673-3-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210409061500.14673-1-alex@ghiti.fr>
References: <20210409061500.14673-1-alex@ghiti.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This new document presents the RISC-V virtual memory layout and is based
one the x86 one: it describes the different limits of the different regions
of the virtual address space.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 Documentation/riscv/index.rst     |  1 +
 Documentation/riscv/vm-layout.rst | 63 +++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/riscv/vm-layout.rst

diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
index 6e6e39482502..ea915c196048 100644
--- a/Documentation/riscv/index.rst
+++ b/Documentation/riscv/index.rst
@@ -6,6 +6,7 @@ RISC-V architecture
     :maxdepth: 1
 
     boot-image-header
+    vm-layout
     pmu
     patch-acceptance
 
diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
new file mode 100644
index 000000000000..329d32098af4
--- /dev/null
+++ b/Documentation/riscv/vm-layout.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================================
+Virtual Memory Layout on RISC-V Linux
+=====================================
+
+:Author: Alexandre Ghiti <alex@ghiti.fr>
+:Date: 12 February 2021
+
+This document describes the virtual memory layout used by the RISC-V Linux
+Kernel.
+
+RISC-V Linux Kernel 32bit
+=========================
+
+RISC-V Linux Kernel SV32
+------------------------
+
+TODO
+
+RISC-V Linux Kernel 64bit
+=========================
+
+The RISC-V privileged architecture document states that the 64bit addresses
+"must have bits 63–48 all equal to bit 47, or else a page-fault exception will
+occur.": that splits the virtual address space into 2 halves separated by a very
+big hole, the lower half is where the userspace resides, the upper half is where
+the RISC-V Linux Kernel resides.
+
+RISC-V Linux Kernel SV39
+------------------------
+
+::
+
+  ========================================================================================================================
+      Start addr    |   Offset   |     End addr     |  Size   | VM area description
+  ========================================================================================================================
+                    |            |                  |         |
+   0000000000000000 |    0       | 0000003fffffffff |  256 GB | user-space virtual memory, different per mm
+  __________________|____________|__________________|_________|___________________________________________________________
+                    |            |                  |         |
+   0000004000000000 | +256    GB | ffffffbfffffffff | ~16M TB | ... huge, almost 64 bits wide hole of non-canonical
+                    |            |                  |         |     virtual memory addresses up to the -256 GB
+                    |            |                  |         |     starting offset of kernel mappings.
+  __________________|____________|__________________|_________|___________________________________________________________
+                                                              |
+                                                              | Kernel-space virtual memory, shared between all processes:
+  ____________________________________________________________|___________________________________________________________
+                    |            |                  |         |
+   ffffffc000000000 | -256    GB | ffffffc7ffffffff |   32 GB | kasan
+   ffffffcefee00000 | -196    GB | ffffffcefeffffff |    2 MB | fixmap
+   ffffffceff000000 | -196    GB | ffffffceffffffff |   16 MB | PCI io
+   ffffffcf00000000 | -196    GB | ffffffcfffffffff |    4 GB | vmemmap
+   ffffffd000000000 | -192    GB | ffffffdfffffffff |   64 GB | vmalloc/ioremap space
+   ffffffe000000000 | -128    GB | ffffffff7fffffff |  124 GB | direct mapping of all physical memory
+  __________________|____________|__________________|_________|____________________________________________________________
+                                                              |
+                                                              |
+  ____________________________________________________________|____________________________________________________________
+                    |            |                  |         |
+   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules
+   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel, BPF
+  __________________|____________|__________________|_________|____________________________________________________________
-- 
2.20.1

