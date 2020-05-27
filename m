Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3FB1E3BAF
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2020 10:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388070AbgE0IPV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 May 2020 04:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388069AbgE0IPU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 May 2020 04:15:20 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD43C03E97C
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2020 01:15:19 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z206so10295966lfc.6
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2020 01:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VdE4MiNfWQ7/UsB/TdHz4sDfTF/wlLohSStV9HV5fKw=;
        b=wH0x8AcgItAJV/HWLqsQV3W2jN3ro/TwzK40BVUo8Pok/+fX6bwrIOAl5yUpL5xOv7
         TcJToaoWgxwe9VgX288FoBQ+hgoESgMw0kEd9Tt7Hej4NM8FVHsLLjvL4lbiHm36PMXi
         +0JKok1fFkfM14h8FWB5Gd6/ygtONQVvRWKWvN2m/RW5R7QgyzSC0cQiyRbZC9nQPMAt
         Gcp8JrKiFcv746C+YL5qZKrGPiIcnElpOf6MbROxAU8E7eUPhMn22oWi7QwdwFDx0qyh
         N2laV7D2w5M4Pcsow+hkcMrkvd2Bw9QoMb5Fx2syyxe+Ikj/BvNWWjBh5+PwZrLTufNG
         yrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VdE4MiNfWQ7/UsB/TdHz4sDfTF/wlLohSStV9HV5fKw=;
        b=Qj44gYh8pidakGF/HKPsTjVm1ngWgKh2p3l8029sijfWDy71q3z7j+BuPuAQ8N5E6J
         Iuvq2/TmLB4d94J3wGoe9DckPpPZnK3XSeP6du0n0DXqHgxMMsp7g/C2ykXatKJ/D2hl
         zLKx5B55HjvQG7RGiu6BsChIoUSzZlQ/raV1jKC75Ll22vywU1BPI/FlUQ4rnuVsEPNi
         tnj5jIFKE115nCQO1kv2pk3uQTPiCKgMhGaylQlY8QwYRpMf1TGlI2aKYc+0bHARR+gg
         TZDNkSrfA9eOlOnugWjZLUHKSEH0c9RG2ChtOM3r5cWU/czaJdRqQgA0Zcddlalhvg+b
         qWuA==
X-Gm-Message-State: AOAM531452lucV5ORGcoBGZ3v1/eHDbUyeUPrzkOD7SqXRrBU0qMAkyO
        ft6awprCHhMhn06ngDxVLZD27Xi7v0Hbyw==
X-Google-Smtp-Source: ABdhPJzWLeCir2lA5lcuZjcFbKtnREQ6tLi3Pjcy8PSj7mTEIhIbcqRxmCCFrMdfLp0ZVOYV1U7/ug==
X-Received: by 2002:ac2:4257:: with SMTP id m23mr2492061lfl.141.1590567317890;
        Wed, 27 May 2020 01:15:17 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id n26sm533761ljc.42.2020.05.27.01.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 01:15:17 -0700 (PDT)
From:   john mathew <john.mathew@unikie.com>
X-Google-Original-From: john mathew <John.Mathew@unikie.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@gmail.com, willy@infradead.org,
        valentin.schneider@arm.com, srikar@linux.vnet.ibm.com,
        John Mathew <john.mathew@unikie.com>
Subject: [RFC PATCH v6 1/3] docs: scheduler: Restructure scheduler documentation.
Date:   Wed, 27 May 2020 11:15:03 +0300
Message-Id: <20200527081505.1783-2-John.Mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527081505.1783-1-John.Mathew@unikie.com>
References: <20200527081505.1783-1-John.Mathew@unikie.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: John Mathew <john.mathew@unikie.com>

Add new sections to enable addition of new documentation on
the scheduler. Existing documentation is moved under the related
new sections. The sections are
  - overview
  - sched-features
  - arch-specific.rst
  - sched-debugging.rst

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: John Mathew <john.mathew@unikie.com>
---
 Documentation/scheduler/arch-specific.rst   | 11 ++++++++
 Documentation/scheduler/index.rst           | 30 ++++++++++++---------
 Documentation/scheduler/overview.rst        |  5 ++++
 Documentation/scheduler/sched-debugging.rst | 14 ++++++++++
 Documentation/scheduler/sched-features.rst  | 20 ++++++++++++++
 5 files changed, 67 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/scheduler/arch-specific.rst
 create mode 100644 Documentation/scheduler/overview.rst
 create mode 100644 Documentation/scheduler/sched-debugging.rst
 create mode 100644 Documentation/scheduler/sched-features.rst

diff --git a/Documentation/scheduler/arch-specific.rst b/Documentation/scheduler/arch-specific.rst
new file mode 100644
index 000000000000..c9c34863d994
--- /dev/null
+++ b/Documentation/scheduler/arch-specific.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Architecture Specific Scheduler Implementation Differences
+==========================================================
+
+.. class:: toc-title
+
+	   Table of contents
+
+.. toctree::
+   :maxdepth: 2
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 69074e5de9c4..9bdccea74af9 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -1,23 +1,27 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
 ===============
 Linux Scheduler
 ===============
 
-.. toctree::
-    :maxdepth: 1
+This documentation outlines the Linux kernel scheduler with its concepts,
+details about the scheduler design and its data structures and architecture
+specific implementation differences.
 
 
-    completion
-    sched-arch
-    sched-bwc
-    sched-deadline
-    sched-design-CFS
-    sched-domains
-    sched-energy
-    sched-nice-design
-    sched-rt-group
-    sched-stats
+.. class:: toc-title
+
+	   Table of contents
 
-    text_files
+.. toctree::
+    :maxdepth: 2
+
+    overview
+    sched-design-CFS
+    sched-features
+    arch-specific
+    sched-debugging
+    scheduler-api
 
 .. only::  subproject and html
 
diff --git a/Documentation/scheduler/overview.rst b/Documentation/scheduler/overview.rst
new file mode 100644
index 000000000000..aee16feefc61
--- /dev/null
+++ b/Documentation/scheduler/overview.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+====================
+Scheduler overview
+====================
diff --git a/Documentation/scheduler/sched-debugging.rst b/Documentation/scheduler/sched-debugging.rst
new file mode 100644
index 000000000000..e332069f99d6
--- /dev/null
+++ b/Documentation/scheduler/sched-debugging.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Scheduler Debugging Interface
+==============================
+
+.. class:: toc-title
+
+	   Table of contents
+
+.. toctree::
+   :maxdepth: 2
+
+   sched-stats
+   text_files
diff --git a/Documentation/scheduler/sched-features.rst b/Documentation/scheduler/sched-features.rst
new file mode 100644
index 000000000000..1afbd9cc8d52
--- /dev/null
+++ b/Documentation/scheduler/sched-features.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Scheduler Features
+=====================
+
+.. class:: toc-title
+
+	   Table of contents
+
+.. toctree::
+   :maxdepth: 2
+
+   sched-arch
+   sched-bwc
+   sched-deadline
+   sched-domains
+   sched-energy
+   sched-nice-design
+   sched-rt-group
+   completion
-- 
2.17.1

