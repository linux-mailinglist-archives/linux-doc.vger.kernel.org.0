Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29975734479
	for <lists+linux-doc@lfdr.de>; Sun, 18 Jun 2023 02:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232455AbjFRAJU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 17 Jun 2023 20:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbjFRAJS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Jun 2023 20:09:18 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3801170A
        for <linux-doc@vger.kernel.org>; Sat, 17 Jun 2023 17:09:17 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-666e87eff0eso1391861b3a.3
        for <linux-doc@vger.kernel.org>; Sat, 17 Jun 2023 17:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687046957; x=1689638957;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SWUWH2lvAYfFJm9Hx/6bdaK1OOQ3GRc/IjgAVTyvQ3A=;
        b=30sbRvHSEui1YuUerrYqr2XHk9jphndeiTUEpOhR4E/MjyMQ1vFoouVxAiTi+cWC2b
         z68RRVMYzKkyMcAJOFe9blpf8xgZ8aCKYV/bLeBkqCGnAYyF+I2DklMOG9N1+BvZnfdu
         wfyveTLvxnSK7i5/yPlXLgYGxmgdAxy6dmsWfAy3EwaEkNPHPb39w1nH1Vs6X+W0iXFC
         BQ7C5nEuqvgBVkKP7Sfb/2gv7rR5lbOsr+lTA9UnW0phq1AzQFgGDzruoKEnJsqowt8e
         v80Te8LKsZJf0Fvy4Y4zuIkUzFA+UHI/AsSBvfilqKtD4FLzAZAWaSxbeOOFjebG9hn/
         PdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687046957; x=1689638957;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWUWH2lvAYfFJm9Hx/6bdaK1OOQ3GRc/IjgAVTyvQ3A=;
        b=VPfPA86lMB/ww99aAEYGOLrORYG4J/XTvYa1zHoa+WMAkRlCB3w/ZKJnmcNjs/xAIn
         cHjcz9It+vnCb8aN0YSC1I/Dwhox4BggOuB3nszrxBPHt0V0SGug3Fht5pd8pHjPS+yJ
         VzKQLxA5PG/pzbSsqg414Ci8VfiI7Qfpz0fHAHUYJZkgywAIBycR/eDdG+MrYSglXP6T
         9B7v2+ws2cJih7UQGMy1INewxJVKubqfkw36d1E53sosJqF9juVeDAR52Cg6gHvzqXqI
         /A+z957w1yLICVdcWzsqvqD9vzHLdC3HUmhaio7VpHiVprLF0JWMHeNEW7oh5iqnfi7s
         0nZg==
X-Gm-Message-State: AC+VfDyOa5fRvn66X/4dilOHeqUp/MeWt9VctBZZrTtvcbJZwCMz5fY9
        QktRyDGbc+nmeGeXnChC3QyOpuJ3bRIt
X-Google-Smtp-Source: ACHHUZ79mIcs2IxhJoFUUkYrk9X7TD65uocd+N5bEK1pWUIg35JWl817ZPlg6BzzlYKbhgPk/Fly8vAOJETY
X-Received: from mizhang-super.c.googlers.com ([34.105.13.176]) (user=mizhang
 job=sendgmr) by 2002:a05:6a00:1789:b0:643:a542:b311 with SMTP id
 s9-20020a056a00178900b00643a542b311mr1764182pfg.0.1687046957241; Sat, 17 Jun
 2023 17:09:17 -0700 (PDT)
Reply-To: Mingwei Zhang <mizhang@google.com>
Date:   Sun, 18 Jun 2023 00:08:53 +0000
In-Reply-To: <20230618000856.1714902-1-mizhang@google.com>
Mime-Version: 1.0
References: <20230618000856.1714902-1-mizhang@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230618000856.1714902-4-mizhang@google.com>
Subject: [PATCH 3/6] KVM: Documentation: Add the missing ptep in kvm_mmu_page
From:   Mingwei Zhang <mizhang@google.com>
To:     Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mingwei Zhang <mizhang@google.com>,
        Jim Mattson <jmattson@google.com>,
        David Matlack <dmatlack@google.com>,
        Ben Gardon <bgardon@google.com>
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

Add the missing ptep in kvm_mmu_page description. ptep is used when TDP MMU
is enabled and it shares the storage with parent_ptes. Update the doc to
help readers to get up-to-date info.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
---
 Documentation/virt/kvm/x86/mmu.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/virt/kvm/x86/mmu.rst b/Documentation/virt/kvm/x86/mmu.rst
index 149dd3cba48f..36bfe0fe02bb 100644
--- a/Documentation/virt/kvm/x86/mmu.rst
+++ b/Documentation/virt/kvm/x86/mmu.rst
@@ -236,6 +236,10 @@ Shadow pages contain the following information:
     parent_ptes points at this single spte, otherwise, there exists multiple
     sptes pointing at this page and (parent_ptes & ~0x1) points at a data
     structure with a list of parent sptes.
+  ptep:
+    Pointer to the parent spte when TDP MMU is enabled. In TDP MMU, each
+    shadow page will have at most one parent. Note that this field is a
+    union with parent_ptes.
   unsync:
     If true, then the translations in this page may not match the guest's
     translation.  This is equivalent to the state of the tlb when a pte is
-- 
2.41.0.162.gfafddb0af9-goog

