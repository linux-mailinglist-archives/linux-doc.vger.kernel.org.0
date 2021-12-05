Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0A3468CB2
	for <lists+linux-doc@lfdr.de>; Sun,  5 Dec 2021 19:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237149AbhLESgY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 5 Dec 2021 13:36:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44546 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237147AbhLESgX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Dec 2021 13:36:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638729175;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ckklSfDz3nojQs2K22H6SivuEMKa8COQifCKiLedmKk=;
        b=U6lKE7sbt7DrRqKqJJzAAHp0pCtT/nqI9UrpvJE+gHFzQ42sjGwJTSzu8+caSH+KU/qT4P
        75dqYE6MV/7SpiUsI/DGCvXyE3tiU5yiBcXmhg9jmbx0v9rIlRCB0Tj39GyedUvHyz2/bO
        H0mejHzjhusiUh+ZA28lJmtwNgggVHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-L7rQEBuTPdq1pAYtFjuTfg-1; Sun, 05 Dec 2021 13:32:54 -0500
X-MC-Unique: L7rQEBuTPdq1pAYtFjuTfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7022C81C9A6;
        Sun,  5 Dec 2021 18:32:52 +0000 (UTC)
Received: from llong.com (unknown [10.22.32.89])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C3EA95BAE2;
        Sun,  5 Dec 2021 18:32:31 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc:     cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, Phil Auld <pauld@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v9 0/7] cgroup/cpuset: Add new cpuset partition type & empty effecitve cpus
Date:   Sun,  5 Dec 2021 13:32:13 -0500
Message-Id: <20211205183220.818872-1-longman@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v9:
 - Add a new patch 1 to remove the child cpuset restriction on parent's
   "cpuset.cpus".
 - Relax initial root partition entry limitation to allow cpuset.cpus to
   overlap that of parent's.
 - An "isolated invalid" displayed type is added to
   cpuset.cpus.partition.
 - Resetting partition root to "member" will leave child partition root
   as invalid.
 - Update documentation and test accordingly.

v8:
 - Reorganize the patch series and rationalize the features and
   constraints of a partition.
 - Update patch descriptions and documentation accordingly.

v7:
 - Simplify the documentation patch (patch 5) as suggested by Tejun.
 - Fix a typo in patch 2 and improper commit log in patch 3.

This patchset includes one bug fix and four enhancements to the cpuset v2 code.

 Patch 1: Allow parent to set "cpuset.cpus" that may not be a superset
 of children's "cpuset.cpus" for default hierarchy.

 Patch 2: Enable partition with no task to have empty cpuset.cpus.effective.

 Patch 3: Refining the features and constraints of a cpuset partition
 clarifying what changes are allowed.

 Patch 4: Add a new partition state "isolated" to create a partition
 root without load balancing. This is for handling intermitten workloads
 that have a strict low latency requirement.

 Patch 5: Enable the "cpuset.cpus.partition" file to show the reason
 that causes invalid partition like "root invalid (No cpu available
 due to hotplug)".

Patch 6 updates the cgroup-v2.rst file accordingly. Patch 7 adds a new
cpuset test to test the new cpuset partition code.

Waiman Long (7):
  cgroup/cpuset: Don't let child cpusets restrict parent in default
    hierarchy
  cgroup/cpuset: Allow no-task partition to have empty
    cpuset.cpus.effective
  cgroup/cpuset: Refining features and constraints of a partition
  cgroup/cpuset: Add a new isolated cpus.partition type
  cgroup/cpuset: Show invalid partition reason string
  cgroup/cpuset: Update description of cpuset.cpus.partition in
    cgroup-v2.rst
  kselftest/cgroup: Add cpuset v2 partition root state test

 Documentation/admin-guide/cgroup-v2.rst       | 168 +++--
 kernel/cgroup/cpuset.c                        | 440 +++++++-----
 tools/testing/selftests/cgroup/Makefile       |   5 +-
 .../selftests/cgroup/test_cpuset_prs.sh       | 667 ++++++++++++++++++
 tools/testing/selftests/cgroup/wait_inotify.c |  87 +++
 5 files changed, 1142 insertions(+), 225 deletions(-)
 create mode 100755 tools/testing/selftests/cgroup/test_cpuset_prs.sh
 create mode 100644 tools/testing/selftests/cgroup/wait_inotify.c

-- 
2.27.0

