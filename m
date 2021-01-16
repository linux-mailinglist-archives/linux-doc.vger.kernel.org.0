Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A66E2F8ABF
	for <lists+linux-doc@lfdr.de>; Sat, 16 Jan 2021 03:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbhAPCdB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 Jan 2021 21:33:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbhAPCdA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Jan 2021 21:33:00 -0500
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FE4C061794
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 18:32:14 -0800 (PST)
Received: by mail-qt1-x84a.google.com with SMTP id l7so9057092qth.15
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 18:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=bK7/dTmSR86C29WgdGxGU8MYCwIuJFaDUK2eSVHNrX4=;
        b=sxCHu/OuwVoHklKKuzYAF3YsaoWE9hexH3rykqnuF4Wa1pLx0+47yDulZFXTH0z6UR
         lN1cYFqW2c25FiOwJmS3zmeJkpRkqtUGZdl8y6vtKIEBU8+r9EhEZ2rRX84KdZH/x8l1
         sLMnYBccUlFvPDG/uqbFCIPzXC+bBTmbJHP3EZfwKpedZs1BPJJ0GqFSKc560A0bgH/T
         7TiDfF625MkvdOAtu394qMmd1073/f9aGb+zxUt394QKEwpQy7hJYWYGBZy9k5J0ADkx
         tSP8iSsMYb9yV/NoQbVJg/7K9WCO111I+F0VjQhCpQgiqf3lZwr9omaJnGgSme+njipm
         xdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=bK7/dTmSR86C29WgdGxGU8MYCwIuJFaDUK2eSVHNrX4=;
        b=sM8cHTaNd+YZWPFOXNk27Wr2EWycQMZDXF4lCrrd+p38RgpVsM+a1bVVJwfGFXTkS9
         hfMDH3pA0ZAmK9J5wwhkC8wCUFHN5c8u8mF1coJNWgIicr9zgnjyYqfQYgckI35q5+54
         /EhCY2TuOfc1xX201UBQ2fNBW72JiNQGo05eUHnSpUKMW2lxlUae/Ym1MbSuSQgasRDl
         p6awBzy+dLjtNPx+SuVedaetoOGKQZI78ftCzg/ELbTCcJ6T5BDKI6Mqy9DIR0v7lpGA
         NVPmAaddcUhxONV74WRQyxbb4M2Y4PXpGtvYF2KSxInhk3iWnVfKjsSnqfwznnHpXdGv
         JocQ==
X-Gm-Message-State: AOAM5335eyM+nz6mt3oHCEUEeeCKS1TdtzhyJ2QC7g6Nd5nmy7lwQbGU
        cTpDMyDXZ2fMMn2FAWdg+tAro/ZZeKYM
X-Google-Smtp-Source: ABdhPJx8zg6GHMhhgyZyzbY0pMKP05X/oObg4+gTaSfWzbBiuE54CPTESrNjdV7FtuFvVuyrM+3U2lobDBxW
Sender: "vipinsh via sendgmr" <vipinsh@vipinsh.kir.corp.google.com>
X-Received: from vipinsh.kir.corp.google.com ([2620:0:1008:10:1ea0:b8ff:fe75:b885])
 (user=vipinsh job=sendgmr) by 2002:a0c:fe47:: with SMTP id
 u7mr15197077qvs.4.1610764333565; Fri, 15 Jan 2021 18:32:13 -0800 (PST)
Date:   Fri, 15 Jan 2021 18:32:02 -0800
Message-Id: <20210116023204.670834-1-vipinsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [Patch v5 0/2] cgroup: KVM: New Encryption IDs cgroup controller
From:   Vipin Sharma <vipinsh@google.com>
To:     thomas.lendacky@amd.com, brijesh.singh@amd.com, jon.grimm@amd.com,
        eric.vantassell@amd.com, pbonzini@redhat.com, seanjc@google.com,
        tj@kernel.org, hannes@cmpxchg.org, frankja@linux.ibm.com,
        borntraeger@de.ibm.com, corbet@lwn.net
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
tracking support of the SEV and SEV-ES ASIDs.

Changes in v5:
- Changed controller filenames from encryption_ids.*.* to encids.*.*
- Documentation of cgroup v1 now points to cgroup v2.

Changes in v4:
- The max value can be set lower than the current.
- Added SEV-ES support.

Changes in v3:
- Fixes a build error when CONFIG_CGROUP is disabled.

Changes in v2:
- Changed cgroup name from sev to encryption_ids.
- Replaced SEV specific names in APIs and documentations with generic
  encryption IDs.
- Providing 3 cgroup files per encryption ID type. For example in SEV,
  - encryption_ids.sev.stat (only in the root cgroup directory).
  - encryption_ids.sev.max
  - encryption_ids.sev.current

[1] https://lore.kernel.org/lkml/20200922004024.3699923-1-vipinsh@google.com/
[2] https://lore.kernel.org/lkml/20201208213531.2626955-1-vipinsh@google.com/
[3] https://lore.kernel.org/lkml/20201209205413.3391139-1-vipinsh@google.com/
[4] https://lore.kernel.org/lkml/20210108012846.4134815-1-vipinsh@google.com/

Vipin Sharma (2):
  cgroup: svm: Add Encryption ID controller
  cgroup: svm: Encryption IDs cgroup documentation.

 .../admin-guide/cgroup-v1/encryption_ids.rst  |   1 +
 Documentation/admin-guide/cgroup-v2.rst       |  78 +++-
 arch/x86/kvm/svm/sev.c                        |  52 ++-
 include/linux/cgroup_subsys.h                 |   4 +
 include/linux/encryption_ids_cgroup.h         |  72 +++
 include/linux/kvm_host.h                      |   4 +
 init/Kconfig                                  |  14 +
 kernel/cgroup/Makefile                        |   1 +
 kernel/cgroup/encryption_ids.c                | 421 ++++++++++++++++++
 9 files changed, 633 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/admin-guide/cgroup-v1/encryption_ids.rst
 create mode 100644 include/linux/encryption_ids_cgroup.h
 create mode 100644 kernel/cgroup/encryption_ids.c

-- 
2.30.0.284.gd98b1dd5eaa7-goog

