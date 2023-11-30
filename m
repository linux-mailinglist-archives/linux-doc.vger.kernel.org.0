Return-Path: <linux-doc+bounces-3589-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC7E7FEC54
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 10:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CABDEB20BF1
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 09:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609733AC0B;
	Thu, 30 Nov 2023 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3KHjea1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA8D10F1;
	Thu, 30 Nov 2023 01:55:21 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a0029289b1bso92484566b.1;
        Thu, 30 Nov 2023 01:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701338120; x=1701942920; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMJA5AfP0P9yxCn+eRvuLh+vUtXzzmDbdcliSqXeJ88=;
        b=W3KHjea1Zs6fa9m28KdNeZdNzjrrIu+QW896YKa+THlaJ8ZuJFWxv0lqUMEDtP4nH3
         1SlEzfgn4zfZ9MOOMPeV6nfaB09wAMIvuPQLhQkNr4rA6yQRsFdHmARRTV6awLGSBrAd
         mN7lTATKEFG2YALqGnslQDi9e9NJlup15l3u6bU0mpC8Qh127wgeXcHc3L+miW+qw7P4
         RGkLklW1rVobS3Xu5mBY9wjNZPW2tpHW7365xsXs5loyLNkMC4i715pvy1bQ8ve1z4cU
         BNnwaHYoLMpXZKeguKPJmcsBfl1jMh1vICAoyXY+WjZgcRtzo6uJEGtIKzXbhFUZ2+x6
         HL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701338120; x=1701942920;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMJA5AfP0P9yxCn+eRvuLh+vUtXzzmDbdcliSqXeJ88=;
        b=H8jxijvqpKXsZhqhqYddSBh1RMWTtAn9kiAUEAl/mETdgARFcir15z/VGc34ycjhev
         a+VR1kP4xq/FJyikW97aXlsaE1ugph6fbETcPcw2QQMGlM+2sawtEJym4gCXXYlUJkCG
         CUGkfU72i6nNICgga43IXrpysFahoyA3UZSo/rcCCaRV9JBTY85dECAIh+XUnHqyNOyB
         +osPGfIEEXIFRJbTYAJ+7jEBgkpWeEPV7w6kuOEy8zmks2DfSqXZq9Iyh3YVsFtb17Xg
         JTq5t70XuvvIL6bdiel5n0EMiKf4kW64ptDIc2KWC98uvqhyw9fbFPvSARxai4lkQh+l
         MNcw==
X-Gm-Message-State: AOJu0YyrgIR4VFAuh8FiZQ6tk7OeaTkHbveeVzl5baoVoHwLWWJiPpk3
	kja4t12om7iDXvJ5UO7WltA=
X-Google-Smtp-Source: AGHT+IEijT5IFhagvVJj2BSYxgKTlTUs0axftnkLk/i64ubFWskQfwihXRFfFN0WF38+KIQ8nTV70A==
X-Received: by 2002:a17:906:ca14:b0:a07:16e0:e0bc with SMTP id jt20-20020a170906ca1400b00a0716e0e0bcmr13673278ejb.76.1701338119585;
        Thu, 30 Nov 2023 01:55:19 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:257f:2c3:4a4d:4a99])
        by smtp.gmail.com with ESMTPSA id x24-20020a1709064a9800b00a0cd9d89a00sm485050eju.151.2023.11.30.01.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 01:55:19 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] docs: admin-guide: remove obsolete advice related to SLAB allocator
Date: Thu, 30 Nov 2023 10:55:15 +0100
Message-Id: <20231130095515.21586-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Commit 1db9d06aaa55 ("mm/slab: remove CONFIG_SLAB from all Kconfig and
Makefile") removes the config SLAB and makes the SLUB allocator the only
default allocator in the kernel. Hence, the advice on reducing OS jitter
due to kworker kernel threads to build with CONFIG_SLUB instead of
CONFIG_SLAB is obsolete.

Remove the obsolete advice to build with SLUB instead of SLAB.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 .../admin-guide/kernel-per-CPU-kthreads.rst      | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/kernel-per-CPU-kthreads.rst b/Documentation/admin-guide/kernel-per-CPU-kthreads.rst
index 993c2a05f5ee..b6aeae3327ce 100644
--- a/Documentation/admin-guide/kernel-per-CPU-kthreads.rst
+++ b/Documentation/admin-guide/kernel-per-CPU-kthreads.rst
@@ -243,13 +243,9 @@ To reduce its OS jitter, do any of the following:
 3.	Do any of the following needed to avoid jitter that your
 	application cannot tolerate:
 
-	a.	Build your kernel with CONFIG_SLUB=y rather than
-		CONFIG_SLAB=y, thus avoiding the slab allocator's periodic
-		use of each CPU's workqueues to run its cache_reap()
-		function.
-	b.	Avoid using oprofile, thus avoiding OS jitter from
+	a.	Avoid using oprofile, thus avoiding OS jitter from
 		wq_sync_buffer().
-	c.	Limit your CPU frequency so that a CPU-frequency
+	b.	Limit your CPU frequency so that a CPU-frequency
 		governor is not required, possibly enlisting the aid of
 		special heatsinks or other cooling technologies.  If done
 		correctly, and if you CPU architecture permits, you should
@@ -259,7 +255,7 @@ To reduce its OS jitter, do any of the following:
 
 		WARNING:  Please check your CPU specifications to
 		make sure that this is safe on your particular system.
-	d.	As of v3.18, Christoph Lameter's on-demand vmstat workers
+	c.	As of v3.18, Christoph Lameter's on-demand vmstat workers
 		commit prevents OS jitter due to vmstat_update() on
 		CONFIG_SMP=y systems.  Before v3.18, is not possible
 		to entirely get rid of the OS jitter, but you can
@@ -274,7 +270,7 @@ To reduce its OS jitter, do any of the following:
 		(based on an earlier one from Gilad Ben-Yossef) that
 		reduces or even eliminates vmstat overhead for some
 		workloads at https://lore.kernel.org/r/00000140e9dfd6bd-40db3d4f-c1be-434f-8132-7820f81bb586-000000@email.amazonses.com.
-	e.	If running on high-end powerpc servers, build with
+	d.	If running on high-end powerpc servers, build with
 		CONFIG_PPC_RTAS_DAEMON=n.  This prevents the RTAS
 		daemon from running on each CPU every second or so.
 		(This will require editing Kconfig files and will defeat
@@ -282,12 +278,12 @@ To reduce its OS jitter, do any of the following:
 		due to the rtas_event_scan() function.
 		WARNING:  Please check your CPU specifications to
 		make sure that this is safe on your particular system.
-	f.	If running on Cell Processor, build your kernel with
+	e.	If running on Cell Processor, build your kernel with
 		CBE_CPUFREQ_SPU_GOVERNOR=n to avoid OS jitter from
 		spu_gov_work().
 		WARNING:  Please check your CPU specifications to
 		make sure that this is safe on your particular system.
-	g.	If running on PowerMAC, build your kernel with
+	f.	If running on PowerMAC, build your kernel with
 		CONFIG_PMAC_RACKMETER=n to disable the CPU-meter,
 		avoiding OS jitter from rackmeter_do_timer().
 
-- 
2.17.1


