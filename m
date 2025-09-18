Return-Path: <linux-doc+bounces-60272-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5E9B552F9
	for <lists+linux-doc@lfdr.de>; Fri, 12 Sep 2025 17:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36A2AB61CB4
	for <lists+linux-doc@lfdr.de>; Fri, 12 Sep 2025 15:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689CF324B15;
	Fri, 12 Sep 2025 15:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZypKfUU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3D3322A34
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689850; cv=none; b=pEWmrAW4Ik33XOi6TagWvx+US+wNhtqvLQzMzu3D2JlUrxsifqY5+1go/f0C63EOZmCOCY6yUXCylYtFbVYKb7swpNPoGQwWZGTIv5v8XLTYr01K6G2wDtTR3IomWkvY7cwAd05xR7RAZpOjDAvgFZOgjGcjyzdmxwegosXHScU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689850; c=relaxed/simple;
	bh=/BXmkvpKDtyn0qN8V/YK7rPLmRpgpvD9OPV5hibBmzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lI+WR6rIi82V7eI9ZtS1O1X0MV/dKGATvJ3TIeOIruKR6PGCYJY4pRRtsJ1PxnRLB7cayTGGuoJpUSmmFXd8wtJJ5ux11GmW/ZhbKfyC0n4w0Cr2iw1d/sUpDexEe+GJn4cuFx8EKdJoi3+g3CJIkqq+A7Ay+FXkGWHHOQd/Cy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZypKfUU; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-723960ded6bso13973347b3.3
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689847; x=1758294647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvjoC9HrZ6XyeC1MmkaG/lWnbuRS5G1sVQIYvweJDZo=;
        b=YZypKfUUilMWvSOC5tKJEyTgzwdJPYqeNXJf9FaJuF+EXB5614ExOqocoFR2zokgth
         z3v+NG9SaCReUJAEdIU5jm6VnckPGRDxYmiM9LwJagc7Bpa5LgpuBr7qnGwepz712IiT
         mH8TKsy2EmsmpRajtRjKlT/mJCeGbYpwZvepubkvev3TsBNjKxOSdSFlSd1w6aEuZ8Vu
         GsoRgc6QC8knFhDDZrEYduQSljdhI9SK3vYc/giECpsxh7v/aR20rIV4kGmo+TLP4xsp
         laTJy7nJ6KfD276gyuuXGUDUPP7scjNJRSCam+HDlAUrGAz0C9rIOBc0q2Ixh1snPk6r
         Avzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689847; x=1758294647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvjoC9HrZ6XyeC1MmkaG/lWnbuRS5G1sVQIYvweJDZo=;
        b=RjmZWOT1ArqzGfQAHFeNpcXBOgOpKktgqP74apO9SQLPCfsK3ZwX4GHk6HjKLITp3Q
         6ZQahQ3OjFqlBwUkyqE7N5W5T/lTrrDEWPxHavvza431H6KSIwYijNZTP+EkYR1NFI5k
         63QUOiWe/kgf/i5nmdVvd47a8+4t2eWolOjvrcwOIb4NxzPOz/ki7lBHbsrfwsGFUHqy
         gq/i8XyH5oLS6q/cCDb5+RjdhIeck1gcXCwnSyMy34vlpac7QmZ/KpSFlxq2y3WYi1tc
         j9U03DQNlb3iWUns6qQGbfrMY3wIJwZbfSNgnQ4oR1MreK7F6x1pe1uYCxGZeKKD1mTz
         CCaA==
X-Forwarded-Encrypted: i=1; AJvYcCWCWSxjxzfg3g6HyD/8ZURfxKkI9BZen9wn777Wi0U09YTU10hNjpmIKwOMp2WLoceuJjVtmCgjFmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwSp89yrkNfpnbNHmu2MoehCRQQCADdx5u5TCts5P68LDaBC5H
	XI/RUq8Gw0RMfZ6Wxfc4FHjMAudvbuTVwHdn7lCcmiS315QQJNjB6eKOdQvk0fucjl8=
X-Gm-Gg: ASbGncuBd6xXySzBVCGpVCS24EbjcK9eU9EwK19HY7JpGEyoeLr/0RGCsQq3dfWcS8M
	anWHluucGhPHXeKlv7HABazyFalpOQpkEkBX2Qn++0QU2R6bzkjoGyWONC3YorS/jTcILq2Q2Lg
	SOfonkXC7iibgNyZQTG9mphy+o4Y6758AuntU10PrmhXDLMRLi9fJaNmQlx3vdZ4nXHVikkUBIT
	H9lQbpiiQxLGw3vJUTnupF2CFUnsGBoYNDWtMkTbfrIre78C1mpvjywGezDSv3og16rhdRkjCQp
	1FJg2eT3RQqUY/xrBx9vnsMPk3acTdcgxFN8Js834ivPhIETwiWG3RmMlov67eN8IzubAW+ZX6Q
	vmrEnUo+WDrJMAnVbh6uI10dIwT5a1pDoqw==
X-Google-Smtp-Source: AGHT+IG0Y2LxTvBY/AtHJvp89fVFaBOgxCKmySrObEvM5zSsJDKwSvyDpIHnZ+Ay7rKBasM7LP2xug==
X-Received: by 2002:a05:690c:768a:b0:731:1bc7:7830 with SMTP id 00721157ae682-7311bc77c1fmr16987957b3.23.1757689847322;
        Fri, 12 Sep 2025 08:10:47 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:47 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 11/16] mm/swapfile: Have nr_swapfiles as non-static
Date: Fri, 12 Sep 2025 18:08:50 +0300
Message-ID: <20250912150855.2901211-12-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nr_swapfiles is required for debugging the kernel, and needs to be
accessible for kmemdump into vmcoreinfo.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/swapfile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index a7ffabbe65ef..2ef51da2c642 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -63,7 +63,7 @@ static struct swap_cluster_info *lock_cluster(struct swap_info_struct *si,
 static inline void unlock_cluster(struct swap_cluster_info *ci);
 
 static DEFINE_SPINLOCK(swap_lock);
-static unsigned int nr_swapfiles;
+unsigned int nr_swapfiles;
 atomic_long_t nr_swap_pages;
 /*
  * Some modules use swappable objects and may try to swap them out under
-- 
2.43.0


