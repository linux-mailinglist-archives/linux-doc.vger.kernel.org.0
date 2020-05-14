Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A5B1D2B5F
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2020 11:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgENJ0v (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 14 May 2020 05:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726278AbgENJ0v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 May 2020 05:26:51 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A04E9C061A0F
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2020 02:26:50 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id v5so1976162lfp.13
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2020 02:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VdE4MiNfWQ7/UsB/TdHz4sDfTF/wlLohSStV9HV5fKw=;
        b=vPYozenLcnKBca3iEOEYfnRNqSdIzjk0xONooQrjkEYNcpCv9k5jpf22kYDz/WHSXL
         rVghhwp19p9TECj17baXiUq/uSl4Cj4K1mtNnXR/sRpzUNHBRKevoL4GitjZBFbFa0VW
         qhzQcKQ9Txg9ngfU86uqs/FxCJ7Lrqqx0OZOfr9AhTi6wlTkZcdGdbv6W9GdXEOEOMQ7
         xG7+Z+C0oSrSHr5S9gVVNRHo+QK9YW6yYEKHD7wvjORrbluCByFdMR1k4Nd26wbGv8x2
         2R5O2pVG7SyZoAb1WPdnKD++urAzPRRDWG7O6JKMJDSqYtmjux2QpBVh8UViz8mNCT8y
         4gbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VdE4MiNfWQ7/UsB/TdHz4sDfTF/wlLohSStV9HV5fKw=;
        b=P7NUWT8apK2kXIp/KmFaSaAR6LR09hDChE0FEPeoOLXZ1cxIVi1zqVjLASHL/xtiGC
         sYO4gl0NwUPfabdCMNtLRS3rJq/ERCIAVYJcHHlfrYw2mlf9GctN1JNZsobV18L3BpkK
         j+QrkDX59Pri15LMe5TtkguSQh7hln6KpSugiJ5C9ThcihZX74UoSlFXLbYWYlahsMGg
         X/ON9mc4QabgAAKy5bL78vKMAgHtSZXl3vSdGRmW655Si41I5W+4bTgVNcDEL2/6aC8z
         ZgZ8vrkxNroGu2QFj4uQryRsvTHHcewbOJ+3I7rSnlb6LI8brUVgbm2CVCUiU4xbB+z8
         DQHA==
X-Gm-Message-State: AOAM531+79bXsrDb5nUUNVEKNvn8N3o/uohNPHncFz1MRq2W7fvm6+Rq
        V04Tzj6SQ50vnnwxX9W5aBvLKLTSMyGDsQ==
X-Google-Smtp-Source: ABdhPJz0rgJ4BD1sLJZ3teGoSRUVzHERQPLeERx9meQ77L0gwulfgtfRjcq8vDLq6G0yvMBlVWekfA==
X-Received: by 2002:ac2:4910:: with SMTP id n16mr2692345lfi.35.1589448408768;
        Thu, 14 May 2020 02:26:48 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id e25sm1426117lfb.89.2020.05.14.02.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 02:26:48 -0700 (PDT)
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
        valentin.schneider@arm.com, rdunlap@infradead.org,
        John Mathew <john.mathew@unikie.com>
Subject: [RFC PATCH v5 1/3] docs: scheduler: Restructure scheduler documentation.
Date:   Thu, 14 May 2020 12:26:35 +0300
Message-Id: <20200514092637.15684-2-John.Mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200514092637.15684-1-John.Mathew@unikie.com>
References: <20200514092637.15684-1-John.Mathew@unikie.com>
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

