Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74EA31F0A0
	for <lists+linux-doc@lfdr.de>; Thu, 18 Feb 2021 21:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231829AbhBRT7E (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 18 Feb 2021 14:59:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbhBRT4k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Feb 2021 14:56:40 -0500
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E479CC061756
        for <linux-doc@vger.kernel.org>; Thu, 18 Feb 2021 11:56:00 -0800 (PST)
Received: by mail-pg1-x54a.google.com with SMTP id n2so1875360pgj.12
        for <linux-doc@vger.kernel.org>; Thu, 18 Feb 2021 11:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=7bVBB7/eb43F7sJCb2A73jGKQH5d6crP4qDBABCXugI=;
        b=MSGiXWGc/XBlhRD4FT6+UEMZ+VJARxb3RibM8Xi7pgr9pz0bgTNlOAetGX3p8x57hC
         D9NGC/+GSPxXLIuX4N+ZhEma+EfYEksySW3hvgaO5RI92DO3YOkf+l3+Hz/4dRKkCJdf
         4cMVb+Q2gHQlbE6XqbqTxkfw4bfAhObx0/dyqaDQRbt5/srIvx75jQGbX1PbYcJkSlg8
         hI0qu06XNCzJQ1hwwZl3Vi7StUkGbOxBPOtK7067VGnDl7Ahv9l8EKanVlB9gfUPJ6gp
         ChDRajvVL/VyOf74x+UM1yxcIda7D3fmjy8aa7r0MT38Aa/sNHX4SLupLZYl1t5ZYLIJ
         5EvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=7bVBB7/eb43F7sJCb2A73jGKQH5d6crP4qDBABCXugI=;
        b=mxCNtNgxznUaGnQ3sPqqm9/KBz5zFouVS/QnUeZtW47oRxt97oMKzKOyvlFyD4j6QY
         q4ThQxl8VCsdRyJ+Ks9IYE3KCfUMAenqL9TW6hj7jfSgVtqiLFD5+Zp/J5oCMn0PEcCc
         67gE3VcBFZilLZsOT+fuCNPBGGjJ/l91glGPYT6d1KR6SjcnGKBrIbK1SR+KHjhBg+Uj
         CxBgtn2c7YeF5XaagNcWO4xPJO0BXzu1JkWlb7ShRK418DmkWcVmRXZ4AaUfRFxEquof
         XSPx+j97+abPtneQwae4OdcAFiUkWgZy4WlIhWjzbhPdZSYU7zKQUaK1/NKT5D7mSMad
         uXdw==
X-Gm-Message-State: AOAM530Kexw23Q0sPf5Xajat5CkLhC99ixBZIFSBM4PNQIDna03TXHgm
        0nri1atY2f2cox3P2XICStJO6JL8iBmQ
X-Google-Smtp-Source: ABdhPJwJ107wMcTLi0gXo6iW/YPA31DgLY3oqSY85ZPspZZPcWLIo/f/8WwkOevVbXHZFcJm+ZFZ40/7R3qQ
Sender: "vipinsh via sendgmr" <vipinsh@vipinsh.kir.corp.google.com>
X-Received: from vipinsh.kir.corp.google.com ([2620:0:1008:10:580f:a4a0:74ce:b3b4])
 (user=vipinsh job=sendgmr) by 2002:a62:6304:0:b029:1c0:d62d:d213 with SMTP id
 x4-20020a6263040000b02901c0d62dd213mr5825540pfb.79.1613678160277; Thu, 18 Feb
 2021 11:56:00 -0800 (PST)
Date:   Thu, 18 Feb 2021 11:55:47 -0800
Message-Id: <20210218195549.1696769-1-vipinsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [RFC 0/2] cgroup: New misc cgroup controller
From:   Vipin Sharma <vipinsh@google.com>
To:     tj@kernel.org, thomas.lendacky@amd.com, brijesh.singh@amd.com,
        jon.grimm@amd.com, eric.vantassell@amd.com, pbonzini@redhat.com,
        hannes@cmpxchg.org, frankja@linux.ibm.com, borntraeger@de.ibm.com
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

Hello,

This patch is creating a new misc cgroup controller for allocation and
tracking of resources which are not abstract like other cgroup
controllers.

This controller was initially proposed as encryption_id but after
the feedbacks, it is now changed to misc cgroup.
https://lore.kernel.org/lkml/20210108012846.4134815-2-vipinsh@google.com/

Changes from the encryption_id controller are:
1. There are only 3 files misc.{capacity, max, current} for all
   resources compared to each resource having their own 3 files in
   encryption_id cgroup.
2. If a resource capacity is 0 then it is considered inactive and won't
   show up in control files.
2. This is a lockless implementation similar to page counter APIs
   compared to single lock implementation in encryption_id cgroup.

Please provide any feedback for this RFC or if it is good for
merging then I can send a patch for merging.

Thanks

Vipin Sharma (2):
  cgroup: sev: Add misc cgroup controller
  cgroup: sev: Miscellaneous cgroup documentation.

 Documentation/admin-guide/cgroup-v1/misc.rst |   1 +
 Documentation/admin-guide/cgroup-v2.rst      |  64 ++-
 arch/x86/kvm/svm/sev.c                       |  60 ++-
 arch/x86/kvm/svm/svm.h                       |   1 +
 include/linux/cgroup_subsys.h                |   4 +
 include/linux/misc_cgroup.h                  |  75 +++
 init/Kconfig                                 |  14 +
 kernel/cgroup/Makefile                       |   1 +
 kernel/cgroup/misc.c                         | 456 +++++++++++++++++++
 9 files changed, 664 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/admin-guide/cgroup-v1/misc.rst
 create mode 100644 include/linux/misc_cgroup.h
 create mode 100644 kernel/cgroup/misc.c

-- 
2.30.0.617.g56c4b15f3c-goog

