Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7FF73E7F2
	for <lists+linux-doc@lfdr.de>; Mon, 26 Jun 2023 20:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbjFZSUj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 26 Jun 2023 14:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbjFZSUd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 14:20:33 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82EDC10C1
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 11:20:26 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-262e7132c74so808364a91.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 11:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687803626; x=1690395626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0/miHGwTxT7US89Pp4p1SvRY38MOXEBbZOtBg20Cazc=;
        b=EHDAWz7QvBILtIie52w2HPumTE/XxMe4cOKd0HoxlAziAbEANSPDGzUZbDDuBQD+Wh
         Yp1DPuuapOk0eBvd1dE5O1zoBwyM5xvIQTserlY0buVkCErHOi5Qed8HmpRRPFe9ktOy
         FB7LOJmQ+2BAmiv4C2ktrEZ2eUqteQcG9Ugu8OBZ6IH6bFIdOjXLCoZM8oDaCxKYf0bZ
         0hXLMenwq8XpV0Z6lgKtI3wkgj8nKTdD8qgqkg1Gnfwj8HeH5XA3/WvGrAIBXo9Sil0i
         +Y9WNlnB4SBC9g1OJvgHnc/qT7yufkr8d67BdfJ/o15lCD0IXlkz1aAha4ybBsoY00YC
         SJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687803626; x=1690395626;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/miHGwTxT7US89Pp4p1SvRY38MOXEBbZOtBg20Cazc=;
        b=LzjiJJNdwdgWC25yBmZ6rUk+O9dKlNO449L+UtGFDNWVHJHlrqbtgFDOKFURyIDTW5
         JRN8J7QRytJa+8wzlLM0wQsZad7cpkndwtHj58Kar1wa5a9MrWVwaqPqz9EVhxuYUfiC
         T1KIWKwLoJO2fxUa5CSsh4UtDkpk7TiNUIRHZP3PnI1/SFtoCOuRPhyHwWhqfiN/lhnt
         xS/nyCMXrHZ3RI2OGSYftfvjZNa8eMbmqu/6HavhfcuQjD63aLO1ame1FyMmGj8jkw9r
         nE58xIqmlydtc1ACJU2PMnFECxNFz3xJro5YgApYxiy4cfsfJ11f41yvjqS8+lvnFTvi
         TDOg==
X-Gm-Message-State: AC+VfDwAYtgMYU/BlSYzCe0zxNeYaclH6NNoWrcCCb2u3ibv9hs5JqjX
        t8ZgaFOHy+PUyEjLXEQnP0ngNkk0+KH8
X-Google-Smtp-Source: ACHHUZ7ILUzkwgOPJbhik1kqQlUy2tUJqjg/LBtHn1mqOnidDPGUgGGw7+y5RFsxbllPbkG7nBFVtfNmrkd+
X-Received: from mizhang-super.c.googlers.com ([35.247.89.60]) (user=mizhang
 job=sendgmr) by 2002:a17:90b:797:b0:262:fb5d:1483 with SMTP id
 l23-20020a17090b079700b00262fb5d1483mr434837pjz.6.1687803625969; Mon, 26 Jun
 2023 11:20:25 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Mon, 26 Jun 2023 18:20:13 +0000
In-Reply-To: <20230626182016.4127366-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230626182016.4127366-1-mizhang@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230626182016.4127366-4-mizhang@google.com>
Subject: [PATCH v2 3/6] KVM: Documentation: Add the missing description for
 ptep in kvm_mmu_page
From:   Mingwei Zhang <mizhang@google.com>
To:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mingwei Zhang <mizhang@google.com>,
        Kai Huang <kai.huang@intel.com>,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>, Xu Yilun <yilun.xu@intel.com>,
        Zhi Wang <zhi.wang.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the missing description for ptep in kvm_mmu_page description. ptep is
used when TDP MMU is enabled and it shares the storage with parent_ptes.
Update the doc to help readers to get up-to-date info.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
---
 Documentation/virt/kvm/x86/mmu.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index 4c9044b4dc6c..5cd6cd5e8926 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -237,6 +237,11 @@ Shadow pages contain the following information:
     parent_ptes points at this single spte, otherwise, there exists multiple
     sptes pointing at this page and (parent_ptes & ~0x1) points at a data
     structure with a list of parent sptes.
+  ptep:
+    The reverse mapping for the pte pointing at this page's spt. This field is
+    used in replace of parent_ptes when TDP MMU is used. In TDP MMU, each
+    non-root shadow page will have one parent, while each root shadow page has
+    no parent. Note that this field is a union with parent_ptes.
   unsync:
     If true, then the translations in this page may not match the guest's
     translation.  This is equivalent to the state of the tlb when a pte is
-- 
2.41.0.162.gfafddb0af9-goog

