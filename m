Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B708B25B1A5
	for <lists+linux-doc@lfdr.de>; Wed,  2 Sep 2020 18:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgIBQ1T (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 2 Sep 2020 12:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgIBQ0o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Sep 2020 12:26:44 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7715C061246
        for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2020 09:26:43 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r13so6691300ljm.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2020 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Da01bO+sIUe8sEz8rENVmrJBnaMlRbIayPJ8UcNmInk=;
        b=rxEzj0rzUuZpcyXm/Zt6f4Ldf2lrh1nLFS2GUUGlQmye0U49XOX8FjNVQh1POqWmRj
         hbFoGHzjeEYp9r13TVeA6nYWlAcQkTn7gO+OPP4jfNhjTIHQHRAwRw9d+n3xEp4WSPaB
         +EoVs+cZTKI4z5QJG6tu/n+f7JN9F5hIOL7bDOFJoFm1YY65e4Tbx+RcoIPELyN2TUaw
         sDn+Li7l9QJPIEYa0p92t+MUytZKKetajbG+k/AhzuwhOeJ+ytatA13ctDsdX0Hn+01j
         S5q1zpgIxANgZyJuQTvwTPExU72X8CY3rh9JqQdSdm2Vr9bji9ovpfXMVVQTHTtVsTFe
         q2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Da01bO+sIUe8sEz8rENVmrJBnaMlRbIayPJ8UcNmInk=;
        b=B54RD6AecRxYywFUjKbtpa6xoFYZA16vL5vEAgd3utIK4wf6f5mxe9TSiLEmTB/jsz
         IIMtqndeZVxFddhmE0dARxJmL7968vAf6DYbEB1d9sRkdOIkg34rO45rU7l6c86fsfQi
         l6v3T6mawkli9ZjbjN6NzMdesVoCt0FF2qoF3nxSBZpNDUYNquwQke/uSKdnGNwGwUJl
         8Bs+8pKNSIu5C/eb4+cZ+gbIwkCBLYHsJx+D4L7N3NLIVrHUWxuHqBE/ElZ5JDJy8k27
         8SCVj/1mcOJ86UGU/rmLNH9bqrnfp0mUV9itqPXAMxocw1DmVMIeZOUWBvKseKdxuy8B
         hmjw==
X-Gm-Message-State: AOAM530hbJDacXpcBNPjN8wGBLOr2bcp6vOj5ZwX+zXMWsdyypockwd/
        adUKmkngYCi5cIuc0/VYe2KnQI2IIP3ScKAJ
X-Google-Smtp-Source: ABdhPJxqYL8WOkN/LSqpZ8A4YRk9Gg9qr0O1fklPNoDNI7R4X34XHy1ANiz52SMpvqQCca1V53YmaQ==
X-Received: by 2002:a2e:9810:: with SMTP id a16mr3317459ljj.157.1599064001884;
        Wed, 02 Sep 2020 09:26:41 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id y24sm1191887lfg.75.2020.09.02.09.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 09:26:41 -0700 (PDT)
From:   John Mathew <john.mathew@unikie.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        willy@infradead.org, valentin.schneider@arm.com,
        John Mathew <john.mathew@unikie.com>
Subject: [RFC PATCH v8 1/3] docs: scheduler: Restructure scheduler documentation.
Date:   Wed,  2 Sep 2020 19:26:29 +0300
Message-Id: <20200902162632.10271-2-john.mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902162632.10271-1-john.mathew@unikie.com>
References: <20200902162632.10271-1-john.mathew@unikie.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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
 Documentation/scheduler/arch-specific.rst   | 12 +++++++++
 Documentation/scheduler/index.rst           | 30 +++++++++++----------
 Documentation/scheduler/overview.rst        |  5 ++++
 Documentation/scheduler/sched-debugging.rst | 14 ++++++++++
 Documentation/scheduler/sched-features.rst  | 25 +++++++++++++++++
 5 files changed, 72 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/scheduler/arch-specific.rst
 create mode 100644 Documentation/scheduler/overview.rst
 create mode 100644 Documentation/scheduler/sched-debugging.rst
 create mode 100644 Documentation/scheduler/sched-features.rst

diff --git a/Documentation/scheduler/arch-specific.rst b/Documentation/scheduler/arch-specific.rst
new file mode 100644
index 000000000000..3e5af3a0695e
--- /dev/null
+++ b/Documentation/scheduler/arch-specific.rst
@@ -0,0 +1,12 @@
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
+
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 88900aabdbf7..6e88a070c503 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -1,24 +1,26 @@
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
+
 
+.. class:: toc-title
+
+    Table of contents
+
+.. toctree::
+    :maxdepth: 2
 
-    completion
-    sched-arch
-    sched-bwc
-    sched-deadline
+    overview
     sched-design-CFS
-    sched-domains
-    sched-capacity
-    sched-energy
-    sched-nice-design
-    sched-rt-group
-    sched-stats
-
-    text_files
+    sched-features
+    arch-specific
+    sched-debugging
 
 .. only::  subproject and html
 
diff --git a/Documentation/scheduler/overview.rst b/Documentation/scheduler/overview.rst
new file mode 100644
index 000000000000..a1d2d26629eb
--- /dev/null
+++ b/Documentation/scheduler/overview.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+====================
+Scheduler overview
+====================
\ No newline at end of file
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
index 000000000000..8eb90e86e489
--- /dev/null
+++ b/Documentation/scheduler/sched-features.rst
@@ -0,0 +1,25 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Scheduler Features
+===================
+
+.. class:: toc-title
+
+	Table of contents
+
+.. toctree::
+   :maxdepth: 1
+
+   completion
+   sched-arch
+   sched-bwc
+   sched-deadline
+   sched-domains
+   sched-capacity
+   sched-energy
+   sched-nice-design
+   sched-rt-group
+   sched-stats
+
+   text_files
+
-- 
2.17.1

