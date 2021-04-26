Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C51436AC8B
	for <lists+linux-doc@lfdr.de>; Mon, 26 Apr 2021 09:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbhDZHAr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 26 Apr 2021 03:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231939AbhDZHAr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Apr 2021 03:00:47 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D5CC06175F
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 00:00:06 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id y22-20020a17090a8b16b0290150ae1a6d2bso4726342pjn.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Apr 2021 00:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zQJFsnvvf+cAKiYz/Z4RGmPSASOASqem20+Xe3nf8L4=;
        b=rFbAf5HW/enG9XTTfpSGA0WYelsHsonhsmYHuClYBdPVZc7Gaz9r9Jv5Kx2C0U+HXT
         ndRKuwV7wVJoAfdW/BUEoKQ7tZZS2bmesu2dGZnFUVeiFRzkAptjEEzGoz4ZrnlXTD1G
         dwsfvNKLwPRNzbwsrqYUtoCcJZokDMAhf3xxnGxnakGx7zk5k5PN8IRw7QX0QKwh2S64
         c0aNhW34fLDcrKe6gtm8cb98zhFBxicTjJd6aXNcOmaEzJjiz2ozgTSs5PokG4DCrGsv
         Fnj1OvqGq7utVziqCVPJTVuCWn7XBZpXwlH000Bghi6grQgWhMsS05alWhoWVS3SWO5J
         K3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zQJFsnvvf+cAKiYz/Z4RGmPSASOASqem20+Xe3nf8L4=;
        b=F3RQwL+8o2MQirRsjYfuOiHiLxK3kvJvY6cYAcTMc07SjNsMmqDT45v5ChUdJMD9dP
         P1oin+t0QGtamfcH4KaJtbFQ4HNmFQisfaTVozw3xQLCm082jx9FISHqDsSPHc5FaOFI
         v9/QgfvpyJHZK+LUswzSOp74pvx+KSsF7gJf527eqmevaJ0iHRgjeX7HVRl+swB/G5LA
         i9tdXBP9jx7uIRGXidZWA8Am17/10NY56ThBtdKzy1iJmPLlU97yB2YmDVk/GpJA4xtL
         KOJIpETiu8+RW5cpqlVbmHTACR8mNyFWyxF+WHu3vWZjUs3SCZUF2gJuNEHcFt4X2ZaS
         8C0w==
X-Gm-Message-State: AOAM5326JO/nBRtmJnFw3RWZij2AykOwqCQMlIyY6kmWwWgFhST3aqp0
        woeFK27/xDUaFwzvRvzWKJ2R9w==
X-Google-Smtp-Source: ABdhPJyAhdfGUyej/IOi6zo0QWrwPfJ3xo69/SCuWDJDsQxtMxgPPaknIazk/RwZHxceolGv5fi8Sw==
X-Received: by 2002:a17:90a:bb13:: with SMTP id u19mr19140620pjr.96.1619420405702;
        Mon, 26 Apr 2021 00:00:05 -0700 (PDT)
Received: from C02DV8HUMD6R.bytedance.net ([139.177.225.224])
        by smtp.gmail.com with ESMTPSA id w14sm4535047pfn.3.2021.04.26.00.00.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Apr 2021 00:00:05 -0700 (PDT)
From:   Abel Wu <wuyun.abel@bytedance.com>
To:     akpm@linux-foundation.org, lizefan.x@bytedance.com, tj@kernel.org,
        hannes@cmpxchg.org, corbet@lwn.net
Cc:     cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Wu <wuyun.abel@bytedance.com>
Subject: [PATCH 0/3] cgroup2: introduce cpuset.mems.migration
Date:   Mon, 26 Apr 2021 14:59:43 +0800
Message-Id: <20210426065946.40491-1-wuyun.abel@bytedance.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some of our services are quite performance sensitive and
actually NUMA-aware designed, aka numa-service. The SLOs
can be easily violated when co-locate numa-services with
other workloads. Thus they are granted to occupy the whole
NUMA node and when such assignment applies, the workload
on that node needs to be moved away fast and complete.

This new cgroup v2 interface is an enhancement of cgroup
v1 interface cpuset.memory_migrate by adding a new mode
called "lazy". With the help of the "lazy" mode migration
we solved the aforementioned problem on fast eviction.

Patch 1 applies cpusets limits to tasks that using default
memory policies, which makes pages inside mems_allowed are
preferred when autoNUMA is enabled. This is also necessary
for the "lazy" mode of cpuset.mems.migration.

Patch 2&3 introduce cpuset.mems.migration, see the patches
for detailed information please.

Abel Wu (3):
  mm/mempolicy: apply cpuset limits to tasks using default policy
  cgroup/cpuset: introduce cpuset.mems.migration
  docs/admin-guide/cgroup-v2: add cpuset.mems.migration

 Documentation/admin-guide/cgroup-v2.rst |  36 ++++++++
 kernel/cgroup/cpuset.c                  | 104 +++++++++++++++++++-----
 mm/mempolicy.c                          |   7 +-
 3 files changed, 124 insertions(+), 23 deletions(-)

-- 
2.31.1

