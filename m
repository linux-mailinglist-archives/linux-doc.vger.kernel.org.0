Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDB61E3BAD
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2020 10:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388056AbgE0IPR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 May 2020 04:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387782AbgE0IPQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 May 2020 04:15:16 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9958C03E97A
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2020 01:15:15 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x22so13941093lfd.4
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2020 01:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=IMgjWilr9oZ9iDIRuPwSPN6NiHr6WddYNQXqrrKqO5E=;
        b=VdrkliPQ9A8myqx8xMTEpUvvGryh9+5hiiCdvddlHerpe0rwKujSebDZMTmzFCuHPn
         /Dbx0YSB9v1s3F6uKNrg2CB2kKK5DcZlsoM3Dk5LRCPkg1Ujqe0jl7W4UMwIIHYJvu5e
         O7ZBXIR+YquL7keHElSgFWD9iyWe/IhCJCtGIjKW4gpUU6bwiUGgzqUObno1dnxetDoB
         neiLXwEA1M8wK8rEcOo3CACbKozNa2rGxSmgutAn5r7BqaPeqxSPs+aqWsLsVn8sUmRb
         5JCOOrIJ7+/zgfSukvEq4j238kjro6gSqFeN/W+arT2HKkwRY0hSdERrTLEt3sANUksU
         OJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IMgjWilr9oZ9iDIRuPwSPN6NiHr6WddYNQXqrrKqO5E=;
        b=TEGqfptkjIJkguLpBq8KIrjqBp0Ei4F4DFLeuC4Pv+hIS9jgIDJFo2tN4Ui7pK3rLL
         OyzcaEDIGu+Q9NlT5qSduau+ClIy08YFCqpkqEgfVMyYtU4esGvNKgXB2hgQ4xUGf1VS
         QaEqGg/oqabUktEmUQjc7crFI9g4YYhY0RAHMj070GCyuwk2nhzqzmmGjvKGSYF0dW0H
         Qy9OGuCfa3QLNzeyEr0aZR0GrZBIuNt0WEhlkZPA9rgOQaSQkRET44UFIICXdB8/yQ3E
         1w1LapV/r9ZisPWzH4hSSjpIy+MymJ1T+H30fgRTnUMBxTCAlTN+S3H/RMkI55K2akP4
         YSkg==
X-Gm-Message-State: AOAM531rRkBeOCisBznK90unJyKZEZiv6uM+EG2mdtvjru99w+3NQlCw
        IGxjdzEja4F7IsRmKdSnlJMhlr7J7RdptA==
X-Google-Smtp-Source: ABdhPJz8IMKoC6RWx7FjoLpP0lCd1gN1p6czuZcswHsxWLkZVvftbtqCPywjBYDAfHXpsCT6z1dzZQ==
X-Received: by 2002:a19:987:: with SMTP id 129mr2541695lfj.8.1590567313739;
        Wed, 27 May 2020 01:15:13 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id n26sm533761ljc.42.2020.05.27.01.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 01:15:12 -0700 (PDT)
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
        john mathew <John.Mathew@unikie.com>
Subject: [RFC PATCH v6 0/3] Add scheduler overview documentation
Date:   Wed, 27 May 2020 11:15:02 +0300
Message-Id: <20200527081505.1783-1-John.Mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series updates the scheduler documentation to add more topics
wrt to scheduler overview. New sections are added to provide a brief
overview of the kernel structs used by the scheduler, scheduler invocation,
context switch and Capacity Aware Scheduling. Previous version of
the patch was reviewed at:
https://lore.kernel.org/lkml/20200514092637.15684-1-John.Mathew@unikie.com/

version 6:
 -Fix typos.

version 5:
 -Fix description error on CAS

version 4:
 -Added section on Capacity-Aware Scheduling
 -Reworded CFS recently added features.
 -Removed vruntime description from scheduler structs
 -Added description of idle and stopper sched classses

version 3:
 -Fix spelling, spacing and typo errors.

version 2:
- Remove :c:func: directive as it was redundant
- Limit document width (line symbol count) to 75
- Replace dot file with ASCII art
- Describe prepare_task_switch(), ASID use, 
  kernel/user transtion, MIPS FPU affinity correctly
- Add missing references to files
- Removed internal APIs from scheduler API reference
- Described rq struct member as kernel-doc comments
- Replaced CFS history with CFS current status
- Added documentation for sched_class fields
- Refined explanation of context swtich functionality
- Replace CFS history with recent changes
- Added kernel-doc comments for struct rq

John Mathew (3):
  docs: scheduler: Restructure scheduler documentation.
  docs: scheduler: Add scheduler overview documentation
  docs: scheduler: Add introduction to scheduler context-switch

 Documentation/scheduler/arch-specific.rst     |  14 +
 Documentation/scheduler/cfs-overview.rst      | 102 ++++++
 Documentation/scheduler/context-switching.rst | 125 ++++++++
 Documentation/scheduler/index.rst             |  33 +-
 .../scheduler/mips-context-switch.rst         |  89 ++++++
 Documentation/scheduler/overview.rst          | 293 ++++++++++++++++++
 Documentation/scheduler/sched-cas.rst         |  92 ++++++
 .../scheduler/sched-data-structs.rst          | 182 +++++++++++
 Documentation/scheduler/sched-debugging.rst   |  14 +
 Documentation/scheduler/sched-features.rst    |  21 ++
 Documentation/scheduler/scheduler-api.rst     |  31 ++
 .../scheduler/x86-context-switch.rst          |  65 ++++
 kernel/sched/core.c                           |  28 +-
 kernel/sched/sched.h                          | 169 +++++++++-
 14 files changed, 1238 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/scheduler/arch-specific.rst
 create mode 100644 Documentation/scheduler/cfs-overview.rst
 create mode 100644 Documentation/scheduler/context-switching.rst
 create mode 100644 Documentation/scheduler/mips-context-switch.rst
 create mode 100644 Documentation/scheduler/overview.rst
 create mode 100644 Documentation/scheduler/sched-cas.rst
 create mode 100644 Documentation/scheduler/sched-data-structs.rst
 create mode 100644 Documentation/scheduler/sched-debugging.rst
 create mode 100644 Documentation/scheduler/sched-features.rst
 create mode 100644 Documentation/scheduler/scheduler-api.rst
 create mode 100644 Documentation/scheduler/x86-context-switch.rst

-- 
2.17.1

