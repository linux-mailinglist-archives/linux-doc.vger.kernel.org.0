Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B311BC57C
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2020 18:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgD1QmE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 Apr 2020 12:42:04 -0400
Received: from foss.arm.com ([217.140.110.172]:55340 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728388AbgD1QmE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 28 Apr 2020 12:42:04 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F311CC14;
        Tue, 28 Apr 2020 09:42:02 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com [10.1.195.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E3B23F305;
        Tue, 28 Apr 2020 09:42:00 -0700 (PDT)
From:   Qais Yousef <qais.yousef@arm.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     Qais Yousef <qais.yousef@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Quentin Perret <qperret@google.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Patrick Bellasi <patrick.bellasi@matbug.net>,
        Pavan Kondeti <pkondeti@codeaurora.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
Subject: [PATCH v3 2/2] Documentation/sysctl: Document uclamp sysctl knobs
Date:   Tue, 28 Apr 2020 17:41:34 +0100
Message-Id: <20200428164134.5588-2-qais.yousef@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428164134.5588-1-qais.yousef@arm.com>
References: <20200428164134.5588-1-qais.yousef@arm.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Uclamp exposes 3 sysctl knobs:

	* sched_util_clamp_min
	* sched_util_clamp_max
	* sched_util_clamp_min_rt_default

Document them in sysctl/kernel.rst.

Signed-off-by: Qais Yousef <qais.yousef@arm.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Juri Lelli <juri.lelli@redhat.com>
CC: Vincent Guittot <vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>
CC: Steven Rostedt <rostedt@goodmis.org>
CC: Ben Segall <bsegall@google.com>
CC: Mel Gorman <mgorman@suse.de>
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Kees Cook <keescook@chromium.org>
CC: Iurii Zaikin <yzaikin@google.com>
CC: Quentin Perret <qperret@google.com>
CC: Valentin Schneider <valentin.schneider@arm.com>
CC: Patrick Bellasi <patrick.bellasi@matbug.net>
CC: Pavan Kondeti <pkondeti@codeaurora.org>
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-fsdevel@vger.kernel.org
---
 Documentation/admin-guide/sysctl/kernel.rst | 48 +++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 0d427fd10941..e7255f71493c 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -940,6 +940,54 @@ Enables/disables scheduler statistics. Enabling this feature
 incurs a small amount of overhead in the scheduler but is
 useful for debugging and performance tuning.
 
+sched_util_clamp_min:
+=====================
+
+Max allowed *minimum* utilization.
+
+Default value is SCHED_CAPACITY_SCALE (1024), which is the maximum possible
+value.
+
+It means that any requested uclamp.min value cannot be greater than
+sched_util_clamp_min, ie: it is restricted to the range
+[0:sched_util_clamp_min].
+
+sched_util_clamp_max:
+=====================
+
+Max allowed *maximum* utilization.
+
+Default value is SCHED_CAPACITY_SCALE (1024), which is the maximum possible
+value.
+
+It means that any requested uclamp.max value cannot be greater than
+sched_util_clamp_max, ie: it is restricted to the range
+[0:sched_util_clamp_max].
+
+sched_util_clamp_min_rt_default:
+================================
+
+By default Linux is tuned for performance. Which means that RT tasks always run
+at the highest frequency and most capable (highest capacity) CPU (in
+heterogeneous systems).
+
+Uclamp achieves this by setting the requested uclamp.min of all RT tasks to
+SCHED_CAPACITY_SCALE (1024) by default. Which effectively boosts the tasks to
+run at the highest frequency and bias them to run on the biggest CPU.
+
+This knob allows admins to change the default behavior when uclamp is being
+used. In battery powered devices particularly, running at the maximum
+capacity and frequency will increase energy consumption and shorten the battery
+life.
+
+This knob is only effective for RT tasks which the user hasn't modified their
+requested uclamp.min value via sched_setattr() syscall.
+
+This knob will not escape the constraint imposed by sched_util_clamp_min
+defined above.
+
+Any modification is applied lazily on the next opportunity the scheduler needs
+to calculate the effective value of uclamp.min of the task.
 
 seccomp
 =======
-- 
2.17.1

