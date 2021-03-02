Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10F932A8FB
	for <lists+linux-doc@lfdr.de>; Tue,  2 Mar 2021 19:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580470AbhCBSDm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Mar 2021 13:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344218AbhCBRlq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Mar 2021 12:41:46 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456E2C0698D4
        for <linux-doc@vger.kernel.org>; Tue,  2 Mar 2021 09:20:50 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id o188so7591818pfg.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Mar 2021 09:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cilium-io.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m3P34ZfaEcKP5uSP2XHxCLx/BufSt6qtkFAu5J+XEKw=;
        b=b7qqfY67saC70WwhUWdvFwLduwR5bjWQdVPqvMMQYOrNZsxV+HyNS9i4m6UrLQJnZl
         cosTd+ZEy7e3dJGM+OmHRmRnl9ZqgSrqAdHJq4yFZ5uN+1E5wNYHjEuPfPz4llqnh+qZ
         zFd4zhIj8JBjyciMDjYZLZ6egWzxG7GHVT7PXrRPf80rKzU4BjXc/+00vx1gGF8X9wZr
         XkpyhdSl+ojyoYM/ciS9OeFobiAsssbunCb80qBhoqweCNxUi4euAzQd0vC+BdmQpXD1
         ac1UmBPtGkx2p5d4wbobyX4AeFGBYDlxib9vFXJNMqNCHRbEtyQWnYHj0V0wN2FHqd+C
         sjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m3P34ZfaEcKP5uSP2XHxCLx/BufSt6qtkFAu5J+XEKw=;
        b=inbgYnKT1FHaMhEo+QM7L9lIrWNzzEKPRYYowyYr02+FBCICWYOuRKhHFMD6BA/mAC
         xvQklaUa8+BNn4Z7ZIffVNcxsQty3hnBo/82Pz71BGqatR7zXNeXVkl3pxIjaRx9g10D
         nSGN6Rw1O1gat6ajyFavahKxGpE6bxvAFIq/DrqdihfH7YoQkVwG/+FqEGgu58+IgJqd
         zLi49xl0V9x2DLjFnlN2ZV/aLxakPqEq2ZZyuYPWxt394octQA80sxMkyZAieannz+Gk
         SqsRg6edds5uxubZ8RDa4yGFIqEVB+L26YeObtZo4MSPLFjHYwPRlch2lizA7eWYNhD1
         yzEA==
X-Gm-Message-State: AOAM531l8GkG/j+DT92aRwiGpWdgmg8FPrPtLHBwwXmkC2xFT/6R3qdM
        NAVNMAtLoqgKvcZn/LVDAqexyUMZBqNxu6Ib
X-Google-Smtp-Source: ABdhPJznxMzff9wTxkL7798tBHvE1eRQ1e22bBhq0XiAPiSvYqzLyKWUt0lHw97Q3g3+PIX8vymIQA==
X-Received: by 2002:a63:1906:: with SMTP id z6mr19365033pgl.292.1614705649881;
        Tue, 02 Mar 2021 09:20:49 -0800 (PST)
Received: from localhost.localdomain (c-73-93-5-123.hsd1.ca.comcast.net. [73.93.5.123])
        by smtp.gmail.com with ESMTPSA id b15sm20073923pgg.85.2021.03.02.09.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 09:20:49 -0800 (PST)
From:   Joe Stringer <joe@cilium.io>
To:     bpf@vger.kernel.org
Cc:     daniel@iogearbox.net, ast@kernel.org, linux-doc@vger.kernel.org,
        linux-man@vger.kernel.org,
        =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
        Quentin Monnet <quentin@isovalent.com>
Subject: [PATCHv2 bpf-next 14/15] docs/bpf: Add bpf() syscall command reference
Date:   Tue,  2 Mar 2021 09:19:46 -0800
Message-Id: <20210302171947.2268128-15-joe@cilium.io>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302171947.2268128-1-joe@cilium.io>
References: <20210302171947.2268128-1-joe@cilium.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Generate the syscall command reference from the UAPI header file and
include it in the main bpf docs page.

Acked-by: Toke Høiland-Jørgensen <toke@redhat.com>
Reviewed-by: Quentin Monnet <quentin@isovalent.com>
Signed-off-by: Joe Stringer <joe@cilium.io>
---
CC: linux-doc@vger.kernel.org
---
 Documentation/bpf/index.rst                  |  9 +++++---
 Documentation/userspace-api/ebpf/index.rst   | 17 ++++++++++++++
 Documentation/userspace-api/ebpf/syscall.rst | 24 ++++++++++++++++++++
 Documentation/userspace-api/index.rst        |  1 +
 MAINTAINERS                                  |  1 +
 5 files changed, 49 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/userspace-api/ebpf/index.rst
 create mode 100644 Documentation/userspace-api/ebpf/syscall.rst

diff --git a/Documentation/bpf/index.rst b/Documentation/bpf/index.rst
index 4f2874b729c3..a702f67dd45f 100644
--- a/Documentation/bpf/index.rst
+++ b/Documentation/bpf/index.rst
@@ -12,9 +12,6 @@ BPF instruction-set.
 The Cilium project also maintains a `BPF and XDP Reference Guide`_
 that goes into great technical depth about the BPF Architecture.
 
-The primary info for the bpf syscall is available in the `man-pages`_
-for `bpf(2)`_.
-
 BPF Type Format (BTF)
 =====================
 
@@ -35,6 +32,12 @@ Two sets of Questions and Answers (Q&A) are maintained.
    bpf_design_QA
    bpf_devel_QA
 
+Syscall API
+===========
+
+The primary info for the bpf syscall is available in the `man-pages`_
+for `bpf(2)`_. For more information about the userspace API, see
+Documentation/userspace-api/ebpf/index.rst.
 
 Helper functions
 ================
diff --git a/Documentation/userspace-api/ebpf/index.rst b/Documentation/userspace-api/ebpf/index.rst
new file mode 100644
index 000000000000..473dfba78116
--- /dev/null
+++ b/Documentation/userspace-api/ebpf/index.rst
@@ -0,0 +1,17 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+eBPF Userspace API
+==================
+
+eBPF is a kernel mechanism to provide a sandboxed runtime environment in the
+Linux kernel for runtime extension and instrumentation without changing kernel
+source code or loading kernel modules. eBPF programs can be attached to various
+kernel subsystems, including networking, tracing and Linux security modules
+(LSM).
+
+For internal kernel documentation on eBPF, see Documentation/bpf/index.rst.
+
+.. toctree::
+   :maxdepth: 1
+
+   syscall
diff --git a/Documentation/userspace-api/ebpf/syscall.rst b/Documentation/userspace-api/ebpf/syscall.rst
new file mode 100644
index 000000000000..ea9918084221
--- /dev/null
+++ b/Documentation/userspace-api/ebpf/syscall.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+eBPF Syscall
+------------
+
+:Authors: - Alexei Starovoitov <ast@kernel.org>
+          - Joe Stringer <joe@wand.net.nz>
+          - Michael Kerrisk <mtk.manpages@gmail.com>
+
+The primary info for the bpf syscall is available in the `man-pages`_
+for `bpf(2)`_.
+
+bpf() subcommand reference
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: include/uapi/linux/bpf.h
+   :doc: eBPF Syscall Preamble
+
+.. kernel-doc:: include/uapi/linux/bpf.h
+   :doc: eBPF Syscall Commands
+
+.. Links:
+.. _man-pages: https://www.kernel.org/doc/man-pages/
+.. _bpf(2): https://man7.org/linux/man-pages/man2/bpf.2.html
diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index d29b020e5622..1e2438b7afa0 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -21,6 +21,7 @@ place where this information is gathered.
    unshare
    spec_ctrl
    accelerators/ocxl
+   ebpf/index
    ioctl/index
    iommu
    media/index
diff --git a/MAINTAINERS b/MAINTAINERS
index 8d56c7044067..4446d1455354 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3209,6 +3209,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
 F:	Documentation/bpf/
 F:	Documentation/networking/filter.rst
+F:	Documentation/userspace-api/ebpf/
 F:	arch/*/net/*
 F:	include/linux/bpf*
 F:	include/linux/filter.h
-- 
2.27.0

