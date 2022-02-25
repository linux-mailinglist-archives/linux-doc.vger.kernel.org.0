Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3071C4C454F
	for <lists+linux-doc@lfdr.de>; Fri, 25 Feb 2022 14:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238280AbiBYNIM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 25 Feb 2022 08:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240922AbiBYNIE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Feb 2022 08:08:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44AA722A2AE;
        Fri, 25 Feb 2022 05:07:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D442561C58;
        Fri, 25 Feb 2022 13:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDA6C340E7;
        Fri, 25 Feb 2022 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645794451;
        bh=BN0RNQE82EItJGsbrfD48UPrIRDNL1uB0fAkgBxI96s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PC/hsuXwwEBqFRHWJtWJUhNQAftRG8uhJbV8Ol1tOzcjoXuTywjB+QVZ9xEbr8bWr
         D+ZEViOzODjhZnMdEpK1TfqirM3TmIdFfav1j+9A2xlpwOfnAE7XSbWqzhqqk+x0L6
         evdDnoEEkrJxV0yVCZq6HyHYqGH3hRlNBsfIV569eF8jzrUY29J6CjTBo9LWO3Z1cw
         MBUR4mcvVZyf5QHJnMSmJ1P56mOcVzpaxIf4q8ddcVP5ldNb/FIQMgwh9bQb70RWWO
         Jn7j6lxOOa93gp1PhGBWSTuRSZN0dsA55tnfnRUIpnJHNyXDoCSKCi1/hCDsJC6wQk
         w/GWThdyLjo0w==
From:   SeongJae Park <sj@kernel.org>
To:     akpm@linux-foundation.org
Cc:     corbet@lwn.net, skhan@linuxfoundation.org, rientjes@google.com,
        xhao@linux.alibaba.com, linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>
Subject: [PATCH v2 02/13] mm/damon/core: Add number of each enum type values
Date:   Fri, 25 Feb 2022 13:07:01 +0000
Message-Id: <20220225130712.12682-3-sj@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225130712.12682-1-sj@kernel.org>
References: <20220225130712.12682-1-sj@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This commit declares the number of legal values for each DAMON enum
types to make traversals of such DAMON enum types easy and safe.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 include/linux/damon.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index f8e99e47d747..f23cbfa4248d 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -87,6 +87,7 @@ struct damon_target {
  * @DAMOS_HUGEPAGE:	Call ``madvise()`` for the region with MADV_HUGEPAGE.
  * @DAMOS_NOHUGEPAGE:	Call ``madvise()`` for the region with MADV_NOHUGEPAGE.
  * @DAMOS_STAT:		Do nothing but count the stat.
+ * @NR_DAMOS_ACTIONS:	Total number of DAMOS actions
  */
 enum damos_action {
 	DAMOS_WILLNEED,
@@ -95,6 +96,7 @@ enum damos_action {
 	DAMOS_HUGEPAGE,
 	DAMOS_NOHUGEPAGE,
 	DAMOS_STAT,		/* Do nothing but only record the stat */
+	NR_DAMOS_ACTIONS,
 };
 
 /**
@@ -157,10 +159,12 @@ struct damos_quota {
  *
  * @DAMOS_WMARK_NONE:		Ignore the watermarks of the given scheme.
  * @DAMOS_WMARK_FREE_MEM_RATE:	Free memory rate of the system in [0,1000].
+ * @NR_DAMOS_WMARK_METRICS:	Total number of DAMOS watermark metrics
  */
 enum damos_wmark_metric {
 	DAMOS_WMARK_NONE,
 	DAMOS_WMARK_FREE_MEM_RATE,
+	NR_DAMOS_WMARK_METRICS,
 };
 
 /**
-- 
2.17.1

