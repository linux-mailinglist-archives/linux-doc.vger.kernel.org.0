Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D013A69299E
	for <lists+linux-doc@lfdr.de>; Fri, 10 Feb 2023 22:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233413AbjBJVyO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 10 Feb 2023 16:54:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233563AbjBJVxy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Feb 2023 16:53:54 -0500
Received: from 66-220-144-178.mail-mxout.facebook.com (66-220-144-178.mail-mxout.facebook.com [66.220.144.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A85955ACF9
        for <linux-doc@vger.kernel.org>; Fri, 10 Feb 2023 13:53:52 -0800 (PST)
Received: by dev0134.prn3.facebook.com (Postfix, from userid 425415)
        id 8D1306BFC2D9; Fri, 10 Feb 2023 13:50:33 -0800 (PST)
From:   Stefan Roesch <shr@devkernel.io>
To:     kernel-team@fb.com
Cc:     shr@devkernel.io, linux-mm@kvack.org, riel@surriel.com,
        mhocko@suse.com, david@redhat.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, akpm@linux-foundation.org
Subject: [RFC PATCH v2 10/19] mm: calculate ksm process profit metric
Date:   Fri, 10 Feb 2023 13:50:14 -0800
Message-Id: <20230210215023.2740545-11-shr@devkernel.io>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230210215023.2740545-1-shr@devkernel.io>
References: <20230210215023.2740545-1-shr@devkernel.io>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
        SPF_HELO_PASS,SPF_NEUTRAL,TVD_RCVD_IP autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The ksm documentation mentions the process profit metric and how to
calculate it. This adds the calculation of the metric.

Signed-off-by: Stefan Roesch <shr@devkernel.io>
---
 include/linux/ksm.h | 4 ++++
 mm/ksm.c            | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/ksm.h b/include/linux/ksm.h
index d38a05a36298..a18cd03efcfb 100644
--- a/include/linux/ksm.h
+++ b/include/linux/ksm.h
@@ -55,6 +55,10 @@ struct page *ksm_might_need_to_copy(struct page *page,
 void rmap_walk_ksm(struct folio *folio, struct rmap_walk_control *rwc);
 void folio_migrate_ksm(struct folio *newfolio, struct folio *folio);
=20
+#ifdef CONFIG_PROC_FS
+long ksm_process_profit(struct mm_struct *);
+#endif /* CONFIG_PROC_FS */
+
 #else  /* !CONFIG_KSM */
=20
 static inline int ksm_fork(struct mm_struct *mm, struct mm_struct *oldmm=
)
diff --git a/mm/ksm.c b/mm/ksm.c
index a0b4611112c0..b3db29605303 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -3024,6 +3024,14 @@ static void wait_while_offlining(void)
 }
 #endif /* CONFIG_MEMORY_HOTREMOVE */
=20
+#ifdef CONFIG_PROC_FS
+long ksm_process_profit(struct mm_struct *mm)
+{
+	return (long)mm->ksm_merging_pages * PAGE_SIZE -
+		mm->ksm_rmap_items * sizeof(struct ksm_rmap_item);
+}
+#endif /* CONFIG_PROC_FS */
+
 #ifdef CONFIG_SYSFS
 /*
  * This all compiles without CONFIG_SYSFS, but is a waste of space.
--=20
2.30.2

