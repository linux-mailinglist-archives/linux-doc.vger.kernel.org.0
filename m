Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60D4579D8F3
	for <lists+linux-doc@lfdr.de>; Tue, 12 Sep 2023 20:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237577AbjILSqO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 Sep 2023 14:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237538AbjILSqK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Sep 2023 14:46:10 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7664170A
        for <linux-doc@vger.kernel.org>; Tue, 12 Sep 2023 11:46:04 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d812e4d1256so589621276.2
        for <linux-doc@vger.kernel.org>; Tue, 12 Sep 2023 11:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694544364; x=1695149164; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=1yc1t1cPhcaHcfI5EVv9bF1nMQXNiuICbyEqqARRk08=;
        b=0D+IFsg/c/klBU+DNRVCXwQuaPdObjt4HEf0QzddULB5ht7UgbaNXDYbBQkw6l6+h2
         bX6JEWXm/U32/BCN60XpkiaP24KDjH8ok6J3Vn4eFun8NNaBHThdBOVbhvZN+VrUuKiT
         YHDJM4NQtAfEbY0OaRb1dFlXL8b/frwQ2gJ3nFBKGUJZ1t1qj2AEZGebXZ8o0BVbFdf3
         WNqFkx7x4GNC1yxEidYpQeAs9dKdAhdvYKbjQITFc9UVZ958ueUWhyGA1AT1XVF80ktf
         ISjhn2nWRyT+iQDFTSBEG6dz1lQDnamH1KnfihB3yvKz8F8mzXFNvTEv/sj25rpuZFLH
         u1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694544364; x=1695149164;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yc1t1cPhcaHcfI5EVv9bF1nMQXNiuICbyEqqARRk08=;
        b=BITXBUhHEp3Li5MKQsXTfaqUV0M2u2mdSBnBtPDfVLXBvffHe+M4iQpzKJt/nx38DP
         jqd7wv8Uym/T7OyhyI7IrEz+GNsNajG7LxxTtdADACr0woHhMLUN12QSRT+3YG2vwINL
         blmNcfmi9WJ209XLA3FvSoJ7jG8aZglp2X7/TZjAuhaK7fiqPUxdGeQobbSJXi0lB/pA
         vvLkl3SFut4tsXDaRDE3hf6g9CRdrmafC6ujmlkDrBSyyfr8KwG5qQn/lxL7hSFDlC+t
         vZXVFhmKiXRBtFiTdF4zeZ+lsqHz/WMi4l+6JnQtbJvxKV3eXmDp4QTN2RaQLm6Ha2n2
         rj5A==
X-Gm-Message-State: AOJu0YxShIDXwqDOIgjz5djsFQj8hXkb3nwSAmfbYdm0hzuEKJ6Y7XOi
        by5NGDAgxIj0+ijmIdzIzDCljWTESpLN
X-Google-Smtp-Source: AGHT+IHHhcRDlPw3DSpf44fo6CQF4LFDpfJyENmkPgeVqzhES7DO2nLgb88kYl04s/IipXV1gy4yvLlc+lQb
X-Received: from mizhang-super.c.googlers.com ([35.247.89.60]) (user=mizhang
 job=sendgmr) by 2002:a25:549:0:b0:d74:6bcc:7b22 with SMTP id
 70-20020a250549000000b00d746bcc7b22mr5283ybf.6.1694544363864; Tue, 12 Sep
 2023 11:46:03 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Tue, 12 Sep 2023 18:45:51 +0000
In-Reply-To: <20230912184553.1887764-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230912184553.1887764-1-mizhang@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230912184553.1887764-5-mizhang@google.com>
Subject: [PATCH v4 4/6] KVM: Documentation: Add the missing description for
 tdp_mmu_root_count into kvm_mmu_page
From:   Mingwei Zhang <mizhang@google.com>
To:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mingwei Zhang <mizhang@google.com>,
        Kai Huang <kai.huang@intel.com>,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>, Xu Yilun <yilun.xu@intel.com>,
        Zhi Wang <zhi.wang.linux@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the description of tdp_mmu_root_count into kvm_mmu_page description and
combine it with the description of root_count. tdp_mmu_root_count is an
atomic counter used only in TDP MMU. Update the doc.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
---
 Documentation/virt/kvm/x86/mmu.rst | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index 22d221c180d7..4a82fa016833 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -229,10 +229,13 @@ Shadow pages contain the following information:
     can be calculated from the gfn field when used.  In addition, when
     role.direct is set, KVM does not track access permission for each of the
     gfn. See role.direct and gfn.
-  root_count:
-    A counter keeping track of how many hardware registers (guest cr3 or
-    pdptrs) are now pointing at the page.  While this counter is nonzero, the
-    page cannot be destroyed.  See role.invalid.
+  root_count / tdp_mmu_root_count:
+     root_count is a reference counter for root shadow pages in Shadow MMU.
+     vCPUs elevate the refcount when getting a shadow page that will be used as
+     a root page, i.e. page that will be loaded into hardware directly (CR3,
+     PDPTRs, nCR3 EPTP). Root pages cannot be destroyed while their refcount is
+     non-zero. See role.invalid. tdp_mmu_root_count is similar but exclusively
+     used in TDP MMU as an atomic refcount.
   parent_ptes:
     The reverse mapping for the pte/ptes pointing at this page's spt. If
     parent_ptes bit 0 is zero, only one spte points at this page and
-- 
2.42.0.283.g2d96d420d3-goog

