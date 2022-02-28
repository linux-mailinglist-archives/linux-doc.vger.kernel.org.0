Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB184C63AA
	for <lists+linux-doc@lfdr.de>; Mon, 28 Feb 2022 08:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233587AbiB1HMM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Feb 2022 02:12:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233586AbiB1HMK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Feb 2022 02:12:10 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8309674C0
        for <linux-doc@vger.kernel.org>; Sun, 27 Feb 2022 23:11:31 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id z11so1531593pla.7
        for <linux-doc@vger.kernel.org>; Sun, 27 Feb 2022 23:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oqE92Z30jLRB5qj639p7ReXjqJAONBgi3Xr8rqugwWc=;
        b=e2F/6vYuG7H/7yU5OibJdQw/ZPCcUdpXzvY1YCsl6iX6fv1pAnjbnW2Mjddjky6LK9
         uzjUZZZJBhd2peqU+T3t4mdTPJv5YZaODOD3iKFHa6tL7PTAKR8rzj0atcTRNL0EMx/b
         NbZzF1mPZkhDn9fxn/XJ8FzqQbVEApgBQi+jQ8HqKqg0dmNOFHHpLCLs7R09wtLpqTNm
         RjIVCwzjknwpWcPrrul95klarohrfak/wSmWb1LisWOtHrPyj/27/KHtUnQhdxvdhF6u
         +fPqkPBrOhlguOPAehK38KtyA/LpERXHqg7GVrbY6tHr+WXEbixjZ3Hey8zQvbEjkJht
         DAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oqE92Z30jLRB5qj639p7ReXjqJAONBgi3Xr8rqugwWc=;
        b=RvCky855tU3Xy5DIsUW6htPAgimg+AyqWPh99Do9aL9So/IimHUlTmGAAOk2CJ02oi
         7Mq7INYN1QAHrYsesAzV67Eb7bVZUtYdJROGzFagL5UtBnS9vkyeGZeE21+mGx2WfQ2X
         GsPbp2BWxU0qYRQcgajAo/Y9lsCSkcOBWjKHbbDTANJ5tgIiklM0UFw5AOsLPfCsOj6J
         WA9jiAwA4NvR7ES1/Xs4PTNovhT1njOv19d3+7Wq6o/U49Fdaw5C/Z8cVDGew3W4HJF1
         xlF+M4Dqfh2AUrG2/fJMzKHEaeT2Nsfb9Lw2Xe/VGSUD+eqOfUa47UX9nzdVQ/gm6c0M
         TA6w==
X-Gm-Message-State: AOAM531w83i/KrmKjBs4SXld0wwe1v9ip5ShwhKIr5mgoIYIkVKrmh/R
        BOYOQAsLWpFJRHyC7zF37zerqA==
X-Google-Smtp-Source: ABdhPJzSxBRm2Jc+FR3haOpBiZvOJNWnMLPpmqPSQ2uOi05bt+bgbNRdMNtr3yqqrTJeLgu2AeKf1g==
X-Received: by 2002:a17:902:da8a:b0:151:6240:b877 with SMTP id j10-20020a170902da8a00b001516240b877mr5078007plx.22.1646032291347;
        Sun, 27 Feb 2022 23:11:31 -0800 (PST)
Received: from FVFYT0MHHV2J.tiktokcdn.com ([139.177.225.243])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090a65c700b001b936b8abe0sm16240390pjs.7.2022.02.27.23.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 23:11:31 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 1/3] mm: hugetlb: disable freeing vmemmap pages when struct page crosses page boundaries
Date:   Mon, 28 Feb 2022 15:10:20 +0800
Message-Id: <20220228071022.26143-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220228071022.26143-1-songmuchun@bytedance.com>
References: <20220228071022.26143-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON is enabled and the size
of "struct page" is not power of two, we cannot optimize vmemmap pages
of HugeTLB pages. We should disable this feature in this case.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index b3118dba0518..836d1117f08b 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -121,6 +121,17 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	if (!hugetlb_free_vmemmap_enabled())
 		return;
 
+	if (IS_ENABLED(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON) &&
+	    !is_power_of_2(sizeof(struct page))) {
+		/*
+		 * The hugetlb_free_vmemmap_enabled_key can be enabled when
+		 * CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON. It should
+		 * be disabled if "struct page" crosses page boundaries.
+		 */
+		static_branch_disable(&hugetlb_free_vmemmap_enabled_key);
+		return;
+	}
+
 	vmemmap_pages = (nr_pages * sizeof(struct page)) >> PAGE_SHIFT;
 	/*
 	 * The head page is not to be freed to buddy allocator, the other tail
-- 
2.11.0

