Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B110932DDB1
	for <lists+linux-doc@lfdr.de>; Fri,  5 Mar 2021 00:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232917AbhCDXT5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Mar 2021 18:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbhCDXTw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Mar 2021 18:19:52 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83242C061756
        for <linux-doc@vger.kernel.org>; Thu,  4 Mar 2021 15:19:52 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id v196so394176ybv.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Mar 2021 15:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=/tCag2eM5nibLNaUG4o5xV/pF/skcGVt2I4xreL6gfI=;
        b=LQXYw+cnQ5skNeBCxADkh40ZLQqdcnVS3py7rRwFSc5jFkf7xMzj9/kzaAN030I1cc
         ALcihEajKRdWwIjzVkdnEEJ5clsDxKQCKHquzcrv8S9dEvFia/6LDSqmEcIN11QY9L6s
         saub2b4HcnLstNNeZJqAxnWxq24Uy7PY/kp2g+fFrOD3byGvmkozYDdoNEj/CKOcCnzr
         mAe6R+sOd5omrR9C1LNlE2Xm/myYz5zAmPVWmxnMkeZ0NlyjRM2duTuxU/21B5qSsWFQ
         jaWvUqgeCXHh+Gdf8ecYjuYDFAHn+R3NKCwzyTigP2dz/HK4C6F8nONvHgpXHdCe/Efg
         uRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=/tCag2eM5nibLNaUG4o5xV/pF/skcGVt2I4xreL6gfI=;
        b=hcHW1m8KZ17hNWGjuaaZJ6SP1Bn+3+rzGkbmsg7FHJD8E37zo19aGKHBiO2vIhqdhY
         wbhZP8BnwWXL/9PohJ2F6SR6LJNKuEFmLTGImnEVPfLbRkvVaRisFcwajFj9MgYbelQn
         y7O4UK+gzNZAJ4VAXs/o32sfDb18Ajz0P2lwutnMglHzApMtyQ92viVeZXwpIWl7ILmF
         DgIuihrGA9LVoHIh5dpXJBK1BPXgJKZsYi6sy2x3OAbkjJiAqfV1Q9Qt4QehydhE4ASG
         qdTfXNRFCn0Tzr8/Mb22HqOq5MdztWShgXoArNCC01y1ArGmcV2l6ZfYd4NYXApOFrxO
         ystA==
X-Gm-Message-State: AOAM5307vMhZazwhOY7UHlYVUU9haA3vjP7+kbShcHXME3zjvmR5Kelt
        O7v35Aw7HDiB/GeWuAn+QL0VKnccHxN3
X-Google-Smtp-Source: ABdhPJzCDUXR9u2rQTEwXTd/5pmu8kU2aaY9EivX2IsEE/Kg4Magvz6cMaCrKA0IcEd5OAkrrgrDlwzPON77
Sender: "vipinsh via sendgmr" <vipinsh@vipinsh.kir.corp.google.com>
X-Received: from vipinsh.kir.corp.google.com ([2620:0:1008:10:1b1:4021:52a5:84d])
 (user=vipinsh job=sendgmr) by 2002:a25:c707:: with SMTP id
 w7mr9662857ybe.225.1614899991739; Thu, 04 Mar 2021 15:19:51 -0800 (PST)
Date:   Thu,  4 Mar 2021 15:19:44 -0800
Message-Id: <20210304231946.2766648-1-vipinsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [Patch v3 0/2] cgroup: New misc cgroup controller
From:   Vipin Sharma <vipinsh@google.com>
To:     tj@kernel.org, mkoutny@suse.com, rdunlap@infradead.org,
        thomas.lendacky@amd.com, brijesh.singh@amd.com, jon.grimm@amd.com,
        eric.vantassell@amd.com, pbonzini@redhat.com, hannes@cmpxchg.org,
        frankja@linux.ibm.com, borntraeger@de.ibm.com
Cc:     corbet@lwn.net, seanjc@google.com, vkuznets@redhat.com,
        wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        gingell@google.com, rientjes@google.com, dionnaglaze@google.com,
        kvm@vger.kernel.org, x86@kernel.org, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello

This patch series is creating a new misc cgroup controller for limiting
and tracking of resources which are not abstract like other cgroup
controllers.

This controller was initially proposed as encryption_id but after
the feedbacks, it is now changed to misc cgroup.
https://lore.kernel.org/lkml/20210108012846.4134815-2-vipinsh@google.com/

Changes in RFC v3:
1. Changed implementation to support 64 bit counters.
2. Print kernel logs only once per resource per cgroup.
3. Capacity can be set less than the current usage.

Changes in RFC v2:
1. Documentation fixes.
2. Added kernel log messages.
3. Changed charge API to treat misc_cg as input parameter.
4. Added helper APIs to get and release references on the cgroup.

[1] https://lore.kernel.org/lkml/20210218195549.1696769-1-vipinsh@google.com
[2] https://lore.kernel.org/lkml/20210302081705.1990283-1-vipinsh@google.com/

Vipin Sharma (2):
  cgroup: sev: Add misc cgroup controller
  cgroup: sev: Miscellaneous cgroup documentation.

 Documentation/admin-guide/cgroup-v1/index.rst |   1 +
 Documentation/admin-guide/cgroup-v1/misc.rst  |   4 +
 Documentation/admin-guide/cgroup-v2.rst       |  69 ++-
 arch/x86/kvm/svm/sev.c                        |  65 ++-
 arch/x86/kvm/svm/svm.h                        |   1 +
 include/linux/cgroup_subsys.h                 |   4 +
 include/linux/misc_cgroup.h                   | 130 ++++++
 init/Kconfig                                  |  14 +
 kernel/cgroup/Makefile                        |   1 +
 kernel/cgroup/misc.c                          | 402 ++++++++++++++++++
 10 files changed, 679 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/admin-guide/cgroup-v1/misc.rst
 create mode 100644 include/linux/misc_cgroup.h
 create mode 100644 kernel/cgroup/misc.c

-- 
2.30.1.766.gb4fecdf3b7-goog

