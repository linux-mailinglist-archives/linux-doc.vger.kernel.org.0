Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4780DC044
	for <lists+linux-doc@lfdr.de>; Fri, 18 Oct 2019 10:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442221AbfJRIwL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Oct 2019 04:52:11 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38966 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442219AbfJRIwL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Oct 2019 04:52:11 -0400
Received: by mail-pf1-f194.google.com with SMTP id v4so3450764pff.6
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2019 01:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=8Twp36GSbpZi8uCaMU+5CBUJfogrOLDIK7KeRjSvPeo=;
        b=i0VuWL93/QAsy39njpz8hRgcLisEdpr+3KDPnSKzQ/awFW4pHcUg0UjlGu+xlAklGX
         //w7RDxTTEbHiCZlDWhV8fb2xW0/nKfpvZFQEz4XoqB3WFvF2FB6oUjasGQAbwH6uuC7
         wfiPJkAgPr3nTCPj0QhLnvy1e5YyA5e5r8alBv0c8CFRU3tb4JYL9W1sSMGL3gKa5tto
         M+9LCFG2NwFaMw4SZt7mfiJZbqHXDmvybREgVDtVUsQMo1py7X4RVn9D4AgVNnfCuo42
         KCPQ7glVcGEcJRD3uZfsOtnkXZR+Z8o3tP9Y2D6jmwnX9QJMpc28t0Pi8FdyhfamqMzl
         zNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8Twp36GSbpZi8uCaMU+5CBUJfogrOLDIK7KeRjSvPeo=;
        b=fZyEfw2EidYl21at5gUMoao1qdlelVh8XGKOXZvY1BLa1BjP7R4D5qKl/5qtb3vtpp
         iaKmrzx5T7RFNd6Nbb61XSunn4DbECs73hziWSVBA9u7bdTsL7+NScizNTt2jx+2UDuE
         gc+fd4C/idER3pMmgdYDWeO4AG10kC3HwzkL4Uz3yVFe+JzK2KJvAubTZubBpwEf6R1R
         ++GGGnYw0kwyy3Kp3GHN1hzBd7sh1bNfyikwcrN+Wiu+FIceEwPmbYvh9oSKcIAme4kw
         tihtCO995FOX1FT7vbY6nfb+Kwe+3EFMGKUSRUgYMPZ/yhE1DO+XdMo7JSVLu8w9XDx+
         cphA==
X-Gm-Message-State: APjAAAVyabMCD/11G8FyIItUTH0OMqAYdbGIG6vicyH9eWJHVmFVQnwV
        fi1wPbXENwWDoXxud6r8E/0J6R1DL0T4tg==
X-Google-Smtp-Source: APXvYqwdiN3EAKBoUU6BThGO5LVz4hi1jwIiB7pRL30zoDY6vs7gW8L2LmbVKtj6UUm9OUN0OCFjsg==
X-Received: by 2002:aa7:86c2:: with SMTP id h2mr5445157pfo.0.1571388730332;
        Fri, 18 Oct 2019 01:52:10 -0700 (PDT)
Received: from localhost ([49.248.178.134])
        by smtp.gmail.com with ESMTPSA id y7sm5886971pfn.142.2019.10.18.01.52.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 01:52:09 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        sudeep.holla@arm.com, bjorn.andersson@linaro.org,
        edubezval@gmail.com, agross@kernel.org, tdas@codeaurora.org,
        swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-clk@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v4 0/6] Initialise thermal framework and cpufreq earlier during boot
Date:   Fri, 18 Oct 2019 14:21:57 +0530
Message-Id: <cover.1571387352.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changes since v3:
- Init schedutil governor earlier too
- Simplified changes to thermal_init() error path
- Collects Acks

Changes since v2:
- Missed one patch when posting v2. Respinning.

Changes since v1:
- Completely get rid of netlink support in the thermal framework.
- This changes the early init patch to a single line - change to
  core_initcall. Changed authorship of patch since it is nothing like the
  original. Lina, let me know if you feel otherwise.
- I've tested to make sure that the qcom-cpufreq-hw driver continues to
  work correctly as a module so this won't impact Android's GKI plans.
- Collected Acks

Device boot needs to be as fast as possible while keeping under the thermal
envelope. Now that thermal framework is built-in to the kernel, we can
initialize it earlier to enable thermal mitigation during boot.

We also need the cpufreq HW drivers to be initialised earlier to act as the
cooling devices. This series only converts over the qcom-hw driver to
initialize earlier but can be extended to other platforms as well.

Amit Kucheria (6):
  thermal: Remove netlink support
  thermal: Initialize thermal subsystem earlier
  cpufreq: Initialise the governors in core_initcall
  cpufreq: Initialize cpufreq-dt driver earlier
  clk: qcom: Initialise clock drivers earlier
  cpufreq: qcom-hw: Move driver initialisation earlier

 .../driver-api/thermal/sysfs-api.rst          |  26 +----
 drivers/clk/qcom/clk-rpmh.c                   |   2 +-
 drivers/clk/qcom/gcc-qcs404.c                 |   2 +-
 drivers/clk/qcom/gcc-sdm845.c                 |   2 +-
 drivers/cpufreq/cpufreq-dt-platdev.c          |   2 +-
 drivers/cpufreq/cpufreq_conservative.c        |   2 +-
 drivers/cpufreq/cpufreq_ondemand.c            |   2 +-
 drivers/cpufreq/cpufreq_performance.c         |   2 +-
 drivers/cpufreq/cpufreq_powersave.c           |   2 +-
 drivers/cpufreq/cpufreq_userspace.c           |   2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c             |   2 +-
 drivers/thermal/thermal_core.c                | 103 +-----------------
 include/linux/thermal.h                       |  11 --
 kernel/sched/cpufreq_schedutil.c              |   2 +-
 14 files changed, 19 insertions(+), 143 deletions(-)

-- 
2.17.1

