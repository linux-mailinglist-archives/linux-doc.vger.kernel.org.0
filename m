Return-Path: <linux-doc+bounces-19257-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 069779153F2
	for <lists+linux-doc@lfdr.de>; Mon, 24 Jun 2024 18:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4CFD1F230B2
	for <lists+linux-doc@lfdr.de>; Mon, 24 Jun 2024 16:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF0319E7DD;
	Mon, 24 Jun 2024 16:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XX6TdaPC"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C64E19DFB5
	for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246835; cv=none; b=J6meVc9Y7ryzd/WQKxt4CDjzSKfqhk8+CZdP+Pps57Nf25wjVZR79hn58PdHnLtuTWg/bKwPGqt1o0CvkFEXbq07AjQV0iyUp55jytLN54b93OBYkK9yLT9UdULS88soT7K6tNJ7svDsQk4RYpvMFNxL1Y+MIXzzZF4ZDZGFtLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246835; c=relaxed/simple;
	bh=ZJlt/X6PrwPET2Sqp74JHEjJORFV5iRxJOPxh1IkXWU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=udsnMBWq4ZJQ9r4Csx2zv0I+wp3TNmg9aSXI9s6F7kfN2rcViXBpAX4xDU7ZiIJ4MnP0Sp5O6s6bsk/lFt2DuM84kipYzKxnjyx7yu7mYarFSHw0JwpRbvkFZfFpYkAMEFNoIEBr3uufetxUKgsW0qeNDzSwVeNFLLGvDmXwyRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XX6TdaPC; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-717fdb2bf03so1823871a12.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Jun 2024 09:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719246833; x=1719851633; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1wu1wVc+3ogmDWb1QmIkKTSRvM9RrOiJDS3aYm0qmOo=;
        b=XX6TdaPCwOyqrWjzoOsRHf4heBe84hZepeYxn7tLBu5jpxD1EUJlbrJYNB/zYXkjDP
         b5XXxwfq8dDMf1WB1ZM612fl4K7W2VHZeDoU+2wcygkz2nQOSjo+rXauEjpE7tZtHxUx
         1rXuSVp2LappGipBSmrPWL2JT19B0VBViQnxvgA+Qx7Dd67zKbzusOdJ8RrqZ4Vzle2H
         Clm3xk+9jfml3tMq78Rw3ZnYBATGvXjVuNSrEjEGMnjS7Ke1f0uHiR59cfgYT+bTFCvF
         C2pUidZzHKWRyUDLOwUFeLS2s1VpN8vcoEwLQ08R1F21rnveCit7wrClIT+Njk1Gl3C5
         oHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719246833; x=1719851633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1wu1wVc+3ogmDWb1QmIkKTSRvM9RrOiJDS3aYm0qmOo=;
        b=Q1DkkHMGzG1t0eOeNYpYTKbnVINO4Xf1RIftYJ2bWE0XUNKqFK/IYVRq5wvuKNqxOQ
         +NVHyk/FKYrvEj87sBW+xdDrGRM0TRgr8U2fnYClvQVAtnikchS90NdtNKQmoGdQtocy
         r9lgiifC3e632p9VAMW+/SxDkx8qtb1vBtcKwjJ8A1QkFH1BkWBa5SV6S0oVPJw7O/m2
         E9C4kuHzw0x/Fofu5AfGRiXN7/dxusH3h/WXoAH1wYK85WhcrlvwRw0wx0vBLotyQQvA
         Nic5/KcgZYJtheUHRx1Q1vEdO/xEgmondkS0RFrZ+OeVBOUW163Ikfstg0TbYp9WlqZ6
         Ln9A==
X-Forwarded-Encrypted: i=1; AJvYcCXTsqCvDFFMidUAQcwsN4jkStFi/8AUxsxlu1rNUF2o3QKFGr/fdPvmbjNQwu6/QE+paxADl8NqYQqeuOzBu5Ez121QGeKR8J68
X-Gm-Message-State: AOJu0YyA0R2+ODYFS0LRCvXNyJjHbCpdZB3rCwXSzIu+ynxU5viH5tOe
	BpHkQJsXkl2Jf1Wc1y4+Eysjr+e+/fiPSpuKKGNmlFHnBQR+7hyNxpyQ0zyfIQiDg605dBWPrR1
	mnfz0NLpiew==
X-Google-Smtp-Source: AGHT+IF1GRQbf9f53JYi+zCzPqxL0zi378t5Qx/Cho038U/27Y5JAiHIF9pEqP5D5pV+1pUBlBOa/tOCbhRcIQ==
X-Received: from yjq3.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:272f])
 (user=jiaqiyan job=sendgmr) by 2002:a17:90b:3c4:b0:2c7:471d:172b with SMTP id
 98e67ed59e1d1-2c848a4d8c7mr123984a91.2.1719246833134; Mon, 24 Jun 2024
 09:33:53 -0700 (PDT)
Date: Mon, 24 Jun 2024 16:33:45 +0000
In-Reply-To: <20240624163348.1751454-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240624163348.1751454-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240624163348.1751454-2-jiaqiyan@google.com>
Subject: [PATCH v5 1/4] mm/memory-failure: refactor log format in soft offline code
From: Jiaqi Yan <jiaqiyan@google.com>
To: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
	ioworker0@gmail.com
Cc: muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Logs from soft_offline_page and soft_offline_in_use_page have
different formats than majority of the memory failure code:

  "Memory failure: 0x${pfn}: ${lower_case_message}"

Convert them to the following format:

  "Soft offline: 0x${pfn}: ${lower_case_message}"

No functional change in this commit.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 mm/memory-failure.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index d3c830e817e3..2a097af7da0e 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -2631,6 +2631,9 @@ int unpoison_memory(unsigned long pfn)
 }
 EXPORT_SYMBOL(unpoison_memory);
 
+#undef pr_fmt
+#define pr_fmt(fmt) "Soft offline: " fmt
+
 static bool mf_isolate_folio(struct folio *folio, struct list_head *pagelist)
 {
 	bool isolated = false;
@@ -2686,7 +2689,7 @@ static int soft_offline_in_use_page(struct page *page)
 
 	if (!huge && folio_test_large(folio)) {
 		if (try_to_split_thp_page(page)) {
-			pr_info("soft offline: %#lx: thp split failed\n", pfn);
+			pr_info("%#lx: thp split failed\n", pfn);
 			return -EBUSY;
 		}
 		folio = page_folio(page);
@@ -2698,7 +2701,7 @@ static int soft_offline_in_use_page(struct page *page)
 	if (PageHWPoison(page)) {
 		folio_unlock(folio);
 		folio_put(folio);
-		pr_info("soft offline: %#lx page already poisoned\n", pfn);
+		pr_info("%#lx page already poisoned\n", pfn);
 		return 0;
 	}
 
@@ -2711,7 +2714,7 @@ static int soft_offline_in_use_page(struct page *page)
 	folio_unlock(folio);
 
 	if (ret) {
-		pr_info("soft_offline: %#lx: invalidated\n", pfn);
+		pr_info("%#lx: invalidated\n", pfn);
 		page_handle_poison(page, false, true);
 		return 0;
 	}
@@ -2728,13 +2731,13 @@ static int soft_offline_in_use_page(struct page *page)
 			if (!list_empty(&pagelist))
 				putback_movable_pages(&pagelist);
 
-			pr_info("soft offline: %#lx: %s migration failed %ld, type %pGp\n",
+			pr_info("%#lx: %s migration failed %ld, type %pGp\n",
 				pfn, msg_page[huge], ret, &page->flags);
 			if (ret > 0)
 				ret = -EBUSY;
 		}
 	} else {
-		pr_info("soft offline: %#lx: %s isolation failed, page count %d, type %pGp\n",
+		pr_info("%#lx: %s isolation failed, page count %d, type %pGp\n",
 			pfn, msg_page[huge], page_count(page), &page->flags);
 		ret = -EBUSY;
 	}
@@ -2786,7 +2789,7 @@ int soft_offline_page(unsigned long pfn, int flags)
 	mutex_lock(&mf_mutex);
 
 	if (PageHWPoison(page)) {
-		pr_info("%s: %#lx page already poisoned\n", __func__, pfn);
+		pr_info("%#lx: page already poisoned\n", pfn);
 		put_ref_page(pfn, flags);
 		mutex_unlock(&mf_mutex);
 		return 0;
-- 
2.45.2.741.gdbec12cfda-goog


