Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7351D1621
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2020 15:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387906AbgEMNnz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 May 2020 09:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388120AbgEMNnx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 May 2020 09:43:53 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BF4C061A0F
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2020 06:43:52 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 188so13647351lfa.10
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2020 06:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aUaq+FTPLwUj6E+pCwoQEQ6JV9QgxALeXAkDkFOPR7g=;
        b=gBh6jXYDqujE825pU+j4iL/+SPPrN3a5c0dt6G1hkUDBowbG+9aqlqYvKsY4df8k6x
         ZUj7Ht+pPqQ0eEEX7B0FCwKQ+zCUJqc4tXVfQ0V/EuzpYgG2LxpGdZImzetVEXzIH3JC
         tKLdjRv6THnXJZzRdYkx+HfejLWUuUoRPlFhoi8M5niVg0o0LjoX/KD7VCDFGPu9Xdn6
         SldZsUhBTjf0a3Nxvg92rjgvv8Pb2yLkKrNTXiCNsZsNGzcyq2GWQHVgp4LqGh5u4S0B
         +qjnUhPjLFhPfHjLx0+uZJRygFe+qo0kpg/K6f70T5ULVE4lwFgB9OablCG3sk622oIH
         AeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aUaq+FTPLwUj6E+pCwoQEQ6JV9QgxALeXAkDkFOPR7g=;
        b=iFPfwNsWx3Q5VINptESKm6fDz0ZRPzfEiZAcJ+0LuIHTYn4Msk1TMt/ntAcHt9n5++
         ZQxiQUPvc29VkpizBnH3SFNHtIJpcD7ho8RUORZRxZCovusjOEy7+pa6tEHQF7Z+RQxj
         KrOL+LVHdcUASGdKOn1F6eXk/ne0jWkFMA0SBJUZ14iqMvv/1iDfvU6btPvT8rVjYckH
         TCl52H++35+nrVBywE2kzvlvxyq8d7Qp6oRZCmRXwGpnugeqzXmatbsl0uJ2qIfHacp4
         Tcs2wyNnv9I/qkqQOah0f7uEWDDbR2yEZI/ZGlm5Q/rjc0ikvsyXh41PgyYfp/oHkRGv
         /wzg==
X-Gm-Message-State: AOAM531RJ4HDp9WXqF+6cPB0W3xCWjj6gOG0tqMyiVDceIvSiV4jo9pI
        JpCM2/XJgqFlWdf2doG7/wOOD0/O8C+vo9jg
X-Google-Smtp-Source: ABdhPJzxzHWAVwfLKt83j5dQr07PJTsv42mFTW6jFhYAc8D8FiMzUovBw+zsgsA2DB1gKC7jY3rpQQ==
X-Received: by 2002:a05:6512:455:: with SMTP id y21mr18596130lfk.202.1589377431091;
        Wed, 13 May 2020 06:43:51 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id t16sm17441367lff.72.2020.05.13.06.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 06:43:50 -0700 (PDT)
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
        valentin.schneider@arm.com, john mathew <John.Mathew@unikie.com>
Subject: [RFC PATCH v4 0/3] Add scheduler overview documentation
Date:   Wed, 13 May 2020 16:43:35 +0300
Message-Id: <20200513134338.19688-2-John.Mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513134338.19688-1-John.Mathew@unikie.com>
References: <20200513134338.19688-1-John.Mathew@unikie.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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
 Documentation/scheduler/sched-cas.rst         |  90 ++++++
 .../scheduler/sched-data-structs.rst          | 182 +++++++++++
 Documentation/scheduler/sched-debugging.rst   |  14 +
 Documentation/scheduler/sched-features.rst    |  21 ++
 Documentation/scheduler/scheduler-api.rst     |  31 ++
 .../scheduler/x86-context-switch.rst          |  65 ++++
 kernel/sched/core.c                           |  28 +-
 kernel/sched/sched.h                          | 169 +++++++++-
 14 files changed, 1236 insertions(+), 20 deletions(-)
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

