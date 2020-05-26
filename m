Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981EA1D1623
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2020 15:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388063AbgEMNn5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 May 2020 09:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388209AbgEMNn4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 May 2020 09:43:56 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1262C061A0F
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2020 06:43:55 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h4so17824910ljg.12
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2020 06:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VdE4MiNfWQ7/UsB/TdHz4sDfTF/wlLohSStV9HV5fKw=;
        b=WRomXU/PQ0ZbqL7E8TfaCKYgSV4V6n/Tqb6jpurAEwAxZHWkUDc7NpkLu+ugF5wgkU
         RS/1eiPZZhq70uJbvCMM0lal4/V/Ki6+y1xu6VcJ0BnQsPSkFizVKpFXN5Ua5bN6ngz9
         RddwbEJGatiRbqUyJifDrOLvbQGom/UVAAUv4ij2jtE6CrDPzgTgP+NHwXD9+Tk2DqOH
         zCf62/9jAcd+Ih+FBz6TPQGvzMCfPE+tJrnNJ+QO/85GsXd1XQ3BS3xrd56uBXOj5+PS
         /sONSiFXk61gF7+lh2cYkI1zzmen43eCohoJjzWJ86QByUB/PpLz8RPhqC87XEcMLmKG
         aJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VdE4MiNfWQ7/UsB/TdHz4sDfTF/wlLohSStV9HV5fKw=;
        b=VGEiSHZF4AfzMblGMkJS2okAk8IThOh1qlDkTHpdAHWmvuzNUXqbn8aTm5OjNiHcAm
         eL/tycqGBV/woQFzeN+06w+aCgoYu5QlwpXM+Dxqre4WJRPduuIyf6K61AGUT3Rssymh
         SWhZtNzyp5+Rh2Ol6H3XIve+lOpyJ6ikIrgWTQI4px1fOvrLFUoHbcKm+t5N8QvUl998
         2RPJX+mibsQo65iMDiWZeR7UeGmuZvhv4zgLNr5b96t7BuV4/dx8r34phy7aLwhZ4f6N
         gN1FbIrG90XucHEw4J1ay6siBKsHKTPDSj4a/6qThlovdN1MgXJIXFvEtF0O1cPual7k
         ERLg==
X-Gm-Message-State: AOAM530O21Yx5Xf/yOIphOVvsffIyFIziVoIAAGU2QY04hLz7vkR80RB
        nYocAvMbtrptJDjFbUuLd5XkZGjP96FSCkx9
X-Google-Smtp-Source: ABdhPJxl76yv3bxNLRnWikxRI/wdw4wvQ/PlJlDgZgp0HA5+9/NUr6Yn/x9OLcbskXZMNhESCKPBlQ==
X-Received: by 2002:a05:651c:105c:: with SMTP id x28mr5301731ljm.65.1589377433456;
        Wed, 13 May 2020 06:43:53 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id t16sm17441367lff.72.2020.05.13.06.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 06:43:52 -0700 (PDT)
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
        valentin.schneider@arm.com, John Mathew <john.mathew@unikie.com>
Subject: [RFC PATCH v4 1/3] docs: scheduler: Restructure scheduler documentation.
Date:   Wed, 13 May 2020 16:43:36 +0300
Message-Id: <20200513134338.19688-3-John.Mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513134338.19688-1-John.Mathew@unikie.com>
References: <20200513134338.19688-1-John.Mathew@unikie.com>
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

