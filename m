Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3146B20AAEF
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2020 05:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbgFZDvv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 25 Jun 2020 23:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbgFZDvu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Jun 2020 23:51:50 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888DFC08C5DB
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2020 20:51:50 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x11so3768212plo.7
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2020 20:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7bN1uZrTrlYe7+hbOLOxin5wT6ZnXt4+ox32w8sL7Hc=;
        b=FrOalOYSHarf0XoChv3NrRBqbQ9p5VWA6f832QKG0SInAh154BXvlKEgwC7obvI2vX
         7kX+40HAcARrqUPtcQWUBdObgGt0OWnCUZyqIIZUJ6DWbTcyfQ/DfPU4U/E1uTJmdREy
         wFbf8x9TOckfDIqN3oUmguJLxibXTcl4NAtqH5l9OslDU4ff/kK7wJkVtbOjda30fKI9
         oG6K7yY8/3KtSfDsa/Vu85lYcBAvZsBxSW75ooXamgKyFsYPsFKhgEU7eKpU7V8WlHsT
         36wgUHu0VhqQccdu9tD396DLlUYUvtfvzYfQgA3NRgxQw1hJ4f2aguN7PLlX42dZrUGG
         ripA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7bN1uZrTrlYe7+hbOLOxin5wT6ZnXt4+ox32w8sL7Hc=;
        b=Ty5kxKnHvY3bBz4D1eBAOdLCAdT27Mt+vlwdaUMHU5e09VB8SDlwOeedEqvPDdVMJi
         d/DA/m6Gh6UzWLaVNATLSBl+6TPBdsDPYpwP0T/v6gLsbhlYvTZdKCiOy9nIb+vnxb4V
         PPMyL9Xni2OdRHRU5KWWI8Bkk6x/0bJLWS4NjCJAbMG4Kzd6J/xTTrBmZFfJi12Y5BWp
         DDSzJm2tKL/dN+1dMZ0qR1+Pomr68Qqld7LKSLkh3lD2y0aMVqz11w2lfSv2SisTqm6f
         PwyILeVttK5kU+FA1qz+J1TLaebtFLYnQrIXIuACh2Bs1VyEqL6vzH/5TEWHHWtEXyEG
         PgzQ==
X-Gm-Message-State: AOAM533NVRyz5vG2ziHWiDSqs+c1NE9DgVKMsFP0iNxySVhowh76SXNh
        Ag4prP8Ru19hZBY5OMaz8aHudw==
X-Google-Smtp-Source: ABdhPJxMTAmTM5qxQmboEyQh780zfG4EvDvMqOf9pXytg/TYG0YYGsrLP0EM+wrQTSlA3WSMtfjUnQ==
X-Received: by 2002:a17:902:b78a:: with SMTP id e10mr985267pls.194.1593143509854;
        Thu, 25 Jun 2020 20:51:49 -0700 (PDT)
Received: from localhost ([122.172.127.76])
        by smtp.gmail.com with ESMTPSA id iq19sm9466929pjb.48.2020.06.25.20.51.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jun 2020 20:51:49 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>, Arnd Bergmann <arnd@arndb.de>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-pm@vger.kernel.org, kernel-team@android.com,
        tkjos@google.com, adharmap@codeaurora.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Quentin Perret <qperret@google.com>
Subject: [PATCH v3 0/3] cpufreq: Allow default governor on cmdline and fix locking issues
Date:   Fri, 26 Jun 2020 09:21:41 +0530
Message-Id: <cover.1593143118.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

I have picked Quentin's series over my patch, modified both and tested.

V2->V3:
- default_governor is a string now and we don't set it on governor
  registration or unregistration anymore.
- Fixed locking issues in cpufreq_init_policy().

--
Viresh

Original cover letter fro Quentin:

This series enables users of prebuilt kernels (e.g. distro kernels) to
specify their CPUfreq governor of choice using the kernel command line,
instead of having to wait for the system to fully boot to userspace to
switch using the sysfs interface. This is helpful for 2 reasons:
  1. users get to choose the governor that runs during the actual boot;
  2. it simplifies the userspace boot procedure a bit (one less thing to
     worry about).

To enable this, the first patch moves all governor init calls to
core_initcall, to make sure they are registered by the time the drivers
probe. This should be relatively low impact as registering a governor
is a simple procedure (it gets added to a llist), and all governors
already load at core_initcall anyway when they're set as the default
in Kconfig. This also allows to clean-up the governors' init/exit code,
and reduces boilerplate.

The second patch introduces the new command line parameter, inspired by
its cpuidle counterpart. More details can be found in the respective
patch headers.

Changes in v2:
 - added Viresh's ack to patch 01
 - moved the assignment of 'default_governor' in patch 02 to the governor
   registration path instead of the driver registration (Viresh)

Quentin Perret (2):
  cpufreq: Register governors at core_initcall
  cpufreq: Specify default governor on command line

Viresh Kumar (1):
  cpufreq: Fix locking issues with governors

 .../admin-guide/kernel-parameters.txt         |  5 +
 Documentation/admin-guide/pm/cpufreq.rst      |  6 +-
 .../platforms/cell/cpufreq_spudemand.c        | 26 +-----
 drivers/cpufreq/cpufreq.c                     | 93 ++++++++++++-------
 drivers/cpufreq/cpufreq_conservative.c        | 22 +----
 drivers/cpufreq/cpufreq_ondemand.c            | 24 ++---
 drivers/cpufreq/cpufreq_performance.c         | 14 +--
 drivers/cpufreq/cpufreq_powersave.c           | 18 +---
 drivers/cpufreq/cpufreq_userspace.c           | 18 +---
 include/linux/cpufreq.h                       | 14 +++
 kernel/sched/cpufreq_schedutil.c              |  6 +-
 11 files changed, 106 insertions(+), 140 deletions(-)

-- 
2.25.0.rc1.19.g042ed3e048af

