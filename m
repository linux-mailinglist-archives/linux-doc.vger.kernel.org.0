Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A3A73E7F1
	for <lists+linux-doc@lfdr.de>; Mon, 26 Jun 2023 20:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbjFZSUf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 26 Jun 2023 14:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbjFZSUd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 14:20:33 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2030B99
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 11:20:23 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-56942667393so46192707b3.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 11:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687803622; x=1690395622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2F7UYJOU65mERHIxW2LZZxZD/ZR1RVDUwRiTiwItys=;
        b=6QKwtXOYY51Y7PQ7wfsNGjwbER6Yz6DPkobVYnmu5EEdKXoy/LHSOUX9cZtrLAgc6l
         litzVO5osAdbdQOcIO9Ga09HDzeq991xxbTlUdrk8DGRDuLeBMBX+1QgBMHmD00U7ZCs
         X9QGUnLkynNHJD2SfzoWZF3tX+dVdOMrEIHLmIWcHx1Rh7x8bqAaZDEP79yvnQE5l379
         DXf9OnZQ/SLCBLcWzSD/1BT/NnxYx71SyISYFLLWR0lBQoIauVezVB7226VQnLXs2zJx
         MWP/ZgD4p03HYOWXNnBk2ZC/IgiMVf9tmFf4kqkp2snXcUqAA7joP+HYybq1y12XLq3c
         YW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687803622; x=1690395622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2F7UYJOU65mERHIxW2LZZxZD/ZR1RVDUwRiTiwItys=;
        b=UZR6ltCZwLnlNFnoi7ZX041yGJ1HSnYdutx8HAE45JoVWyFziOQlUJKOBuDiv8S2Bk
         sqFRpwPbSu1w0OyH1o4OkRYjoDsOwd5C1rxUYTQvo62Qp94Pu8DFwmGE6r6NI2Vl+4oV
         rRiVDKSe3rYbCz9zL4Kba//MpgRehomssbEy8EVrL4MsTMsBsjnNhjkViUpW5uhksGEf
         8tvxxmRLOB3Bw8f2/WSOPeenc/YO1/gQBr5dfs2YydPHp/SRNBHhOtmhpJgvjR3Mqd0Z
         Mn96S9fQuFpB1aMF8hvqXwpx45faDCO34vsjPhulLGbhr1mORVpOWU84GVFR5sBUfoYo
         1+vQ==
X-Gm-Message-State: AC+VfDzeQ3SJeJQcEOUjBqx4vZ7H8GV97jx7T7qimu4GtRezyP4m5Zcc
        DS+nu8VycwID85DZ8tdxcc+TTI+/Z/nD
X-Google-Smtp-Source: ACHHUZ5ZiluUVnGMjRQ7bq/BIu65O/ivKvxYxEHH1I9TDadsaaA1nqbhv0CpQWdLWlFSIezrHLZb/DHWgC7m
X-Received: from mizhang-super.c.googlers.com ([35.247.89.60]) (user=mizhang
 job=sendgmr) by 2002:a25:e0d1:0:b0:c2a:e79a:fc11 with SMTP id
 x200-20020a25e0d1000000b00c2ae79afc11mr130358ybg.9.1687803622386; Mon, 26 Jun
 2023 11:20:22 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Mon, 26 Jun 2023 18:20:11 +0000
In-Reply-To: <20230626182016.4127366-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230626182016.4127366-1-mizhang@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230626182016.4127366-2-mizhang@google.com>
Subject: [PATCH v2 1/6] KVM: Documentation: Add the missing description for
 guest_mode in kvm_mmu_page_role
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the missing description for guest_mode in kvm_mmu_page_role
description.  guest_mode tells KVM whether a shadow page is used for the L1
or an L2. Update the missing field in documentation.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
---
 Documentation/virt/kvm/x86/mmu.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index 8364afa228ec..561efa8ec7d7 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -202,6 +202,8 @@ Shadow pages contain the following information:
     Is 1 if the MMU instance cannot use A/D bits.  EPT did not have A/D
     bits before Haswell; shadow EPT page tables also cannot use A/D bits
     if the L1 hypervisor does not enable them.
+  role.guest_mode:
+    Indicates the shadow page is created for a nested guest.
   role.passthrough:
     The page is not backed by a guest page table, but its first entry
     points to one.  This is set if NPT uses 5-level page tables (host
-- 
2.41.0.162.gfafddb0af9-goog

