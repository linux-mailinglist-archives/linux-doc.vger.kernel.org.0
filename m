Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 772E72D3560
	for <lists+linux-doc@lfdr.de>; Tue,  8 Dec 2020 22:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729984AbgLHVgb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Dec 2020 16:36:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbgLHVgb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Dec 2020 16:36:31 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F90C06179C
        for <linux-doc@vger.kernel.org>; Tue,  8 Dec 2020 13:35:51 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id d4so25340ybs.20
        for <linux-doc@vger.kernel.org>; Tue, 08 Dec 2020 13:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=w7i58lgoN4yW28AWglPeAW5jTbGmkiCZtKgp4popZcc=;
        b=cmAFANNztRVo5bcJBIrm7/VkOuuWoHPWc5pigdvPJhC9R5k1TVvIwqVsfGvJ8Kqn2W
         LofKecjevhtSgJ+OJk+3xEAbq5qqz8xUZ4BwwQH1W8dZwmQTPRSIDki7p7K5EgIonnA3
         Pme7BumHABfVNEjYhRMry7dncrf+prQy/aqsOMM/B0rErRWp79zTH2kvnEmBGTFDy8e5
         pfvheV39CD1909OjKIaQGXjXAbhjF4Ky3pMisHQiqm1WozZDkDTYZ0IwhyXohyE1zc2I
         65almQXI8ocH7FM8BJbIHjLLSJ4RoaqwMrMqCx6orRI6v/Mw1vJ5eMGd+vdPV/Fy1z/B
         khjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=w7i58lgoN4yW28AWglPeAW5jTbGmkiCZtKgp4popZcc=;
        b=fBC5YFn8fhyLZvNBUNAnPLah5XoH01viGD2xoa4ms6/HOp+v7BAofOnKNTfkvyqR1j
         pXiIluHb4oJpIsCWHn3g7WMXeUpwcHy86n1nNj8tJlEpognQe0YsR6F8o1Qso3monTyg
         0jsKHJCMzN+KljH5nxSdTQg0uRSCZUtpuFmzXOvUKjljexkQvrBXOOS9AXSRcfA8Mf4j
         D46bYgKCYB5fSf39XgNgSQE+ThbAjWzwEuEZTmlM6aOwyPqh8VGYOpZDJ1dwlIsmghjy
         wZlEOXKNePUEiUekObn5ryV+YQxwKQATWLWRq0ve8T3mFzorKUR1wOnruOPBHFaiQ84b
         Yr1w==
X-Gm-Message-State: AOAM530VuuFcoO0ytjX4Ihjcd2A6vhSDvcGbZwETEd3LClgDChIKCIm+
        wJocHorIxHFRYO5ZJVtqettIMKOKtPjk
X-Google-Smtp-Source: ABdhPJxv9t+/Yf+hfpLCJJzCVk0GjB3OzRY53aMVm1Ux4RAJduUyT84FHqlVOMF6xIeuZn/bKfCVJO4kOJ4+
Sender: "vipinsh via sendgmr" <vipinsh@vipinsh.kir.corp.google.com>
X-Received: from vipinsh.kir.corp.google.com ([2620:0:1008:10:1ea0:b8ff:fe75:b885])
 (user=vipinsh job=sendgmr) by 2002:a25:ed7:: with SMTP id 206mr30793524ybo.136.1607463350496;
 Tue, 08 Dec 2020 13:35:50 -0800 (PST)
Date:   Tue,  8 Dec 2020 13:35:29 -0800
Message-Id: <20201208213531.2626955-1-vipinsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [Patch v2 0/2] cgroup: KVM: New Encryption IDs cgroup controller
From:   Vipin Sharma <vipinsh@google.com>
To:     thomas.lendacky@amd.com, brijesh.singh@amd.com, jon.grimm@amd.com,
        eric.vantassell@amd.com, pbonzini@redhat.com, seanjc@google.com,
        tj@kernel.org, lizefan@huawei.com, hannes@cmpxchg.org,
        frankja@linux.ibm.com, borntraeger@de.ibm.com, corbet@lwn.net
Cc:     joro@8bytes.org, vkuznets@redhat.com, wanpengli@tencent.com,
        jmattson@google.com, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, hpa@zytor.com, gingell@google.com,
        rientjes@google.com, dionnaglaze@google.com, kvm@vger.kernel.org,
        x86@kernel.org, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

This patch adds a new cgroup controller, Encryption IDs, to track and
limit the usage of encryption IDs on a host.

AMD provides Secure Encrypted Virtualization (SEV) and SEV with
Encrypted State (SEV-ES) to encrypt the guest OS's memory using limited
number of Address Space Identifiers (ASIDs).

This limited number of ASIDs creates issues like SEV ASID starvation and
unoptimized scheduling in the cloud infrastucture.

In the RFC patch v1, I provided only SEV cgroup controller but based
on the feedback and discussion it became clear that this cgroup
controller can be extended to be used by Intel's Trusted Domain
Extension (TDX) and s390's protected virtualization Secure Execution IDs
(SEID)

This patch series provides a generic Encryption IDs controller with
tracking support of the SEV ASIDs.

Changes in v2:
- Changed cgroup name from sev to encryption_ids.
- Replaced SEV specific names in APIs and documentations with generic
  encryption IDs.
- Providing 3 cgroup files per encryption ID type. For example in SEV,
  - encryption_ids.sev.stat (only in the root cgroup directory).
  - encryption_ids.sev.max
  - encryption_ids.sev.current

Thanks
Vipin Sharma

[1] https://lore.kernel.org/lkml/20200922004024.3699923-1-vipinsh@google.com/#r

Vipin Sharma (2):
  cgroup: svm: Add Encryption ID controller
  cgroup: svm: Encryption IDs cgroup documentation.

 .../admin-guide/cgroup-v1/encryption_ids.rst  | 108 +++++
 Documentation/admin-guide/cgroup-v2.rst       |  78 +++-
 arch/x86/kvm/svm/sev.c                        |  28 +-
 include/linux/cgroup_subsys.h                 |   4 +
 include/linux/encryption_ids_cgroup.h         |  70 +++
 include/linux/kvm_host.h                      |   4 +
 init/Kconfig                                  |  14 +
 kernel/cgroup/Makefile                        |   1 +
 kernel/cgroup/encryption_ids.c                | 430 ++++++++++++++++++
 9 files changed, 728 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/admin-guide/cgroup-v1/encryption_ids.rst
 create mode 100644 include/linux/encryption_ids_cgroup.h
 create mode 100644 kernel/cgroup/encryption_ids.c

--
2.29.2.576.ga3fc446d84-goog

