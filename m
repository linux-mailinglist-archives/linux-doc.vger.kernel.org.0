Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3AC36A568
	for <lists+linux-doc@lfdr.de>; Sun, 25 Apr 2021 09:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbhDYHPB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 25 Apr 2021 03:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbhDYHO7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Apr 2021 03:14:59 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD97C061756
        for <linux-doc@vger.kernel.org>; Sun, 25 Apr 2021 00:14:19 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so3413979pjh.1
        for <linux-doc@vger.kernel.org>; Sun, 25 Apr 2021 00:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5NQIABLEewgKDhqj4Cu1k3a4cKl/gjUQHTrPXMY+Vi4=;
        b=GxvFqSmI12PysPlkqX9s9D8TUgHjcgxPY7fSr/k4LNdP1t71GBs3e+PITWKN4a+WA5
         SeQj8jvWslXnqjm5k3P/0EVHOspU7fFjLovUDgQd+0QfWVYz7jDY9ySwl5Nptp++kTvf
         BU3lTaUnM5FB4Mye2tFZR53oPO6dalXK2MwBaXzbaEYrtLJNvvL/eTPZwmOnJ2IQZ6sw
         zaVw5kIDVKfs90RLD8/b8nlVFeEuyxk14m8VH0kchH26tRzwjUEL/Q3BucRlvCv7FTL8
         75KU5PXve4PFYvcOEX00M2WdEy0G7GN2Aw1d0rhwvIDV57AwbihAm2sF6d5T8rVzjn0v
         GbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5NQIABLEewgKDhqj4Cu1k3a4cKl/gjUQHTrPXMY+Vi4=;
        b=Yw6QeXgeiT/BnaFmnexIkIIp7gZWDJuoPbqNDhkse2Ck3jx8T0ej1b7TUjEvYfdHeS
         ThXc1JttzrcnT60aaUyc2xKYofuAEwvJ9KOafCx9uQK9qMtI3LPCqzPg27g3sViwZJm4
         lHOng5zF43tw68JIZ/vl3TblmcrLUQrpIxp7J3tugBtLt0SbvaFIfVrWWmOwvc3iqPTt
         xAeExO0YDBGO1PxC+6rq3kFoTPm75+EsVy9Kr4Wjd3qDk7fA0ZeDvW8Nyav9E8uQZ/eq
         6XiKYDdWwiYD3sVE3q/E0Dy5umTiKnr30TxCdy5L+12OGrDyCDw0BJWJzgb6+TDhtTwO
         Ty4w==
X-Gm-Message-State: AOAM5308WT6c15lTiRcr7onmm+GxlwAHacIn6dXOTBXcjRT0FpGffmBb
        /zLiJS1fRixTvIfqdiqEZHdr2A==
X-Google-Smtp-Source: ABdhPJzwFo7qWfly84EpUuTOi0ATPPuhKicT4TQcuPYtohi9vuDzFYewxsesUCQEzEC8eyHIEbLMOQ==
X-Received: by 2002:a17:902:cec1:b029:eb:66ee:6da0 with SMTP id d1-20020a170902cec1b02900eb66ee6da0mr12545445plg.84.1619334859473;
        Sun, 25 Apr 2021 00:14:19 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id h8sm8767125pjt.17.2021.04.25.00.14.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Apr 2021 00:14:19 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, pawan.kumar.gupta@linux.intel.com,
        rdunlap@infradead.org, oneukum@suse.com, anshuman.khandual@arm.com,
        jroedel@suse.de, almasrymina@google.com, rientjes@google.com,
        willy@infradead.org, osalvador@suse.de, mhocko@suse.com,
        song.bao.hua@hisilicon.com, david@redhat.com,
        naoya.horiguchi@nec.com, joao.m.martins@oracle.com
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        zhengqi.arch@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v21 8/9] mm: memory_hotplug: disable memmap_on_memory when hugetlb_free_vmemmap enabled
Date:   Sun, 25 Apr 2021 15:07:51 +0800
Message-Id: <20210425070752.17783-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210425070752.17783-1-songmuchun@bytedance.com>
References: <20210425070752.17783-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The parameter of memory_hotplug.memmap_on_memory is not compatible with
hugetlb_free_vmemmap. So disable it when hugetlb_free_vmemmap is
enabled.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 ++++++++
 drivers/acpi/acpi_memhotplug.c                  | 1 +
 mm/memory_hotplug.c                             | 1 +
 3 files changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 3cc19cb78b85..8181345e996a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1638,6 +1638,10 @@
 			on:  enable the feature
 			off: disable the feature
 
+			This is not compatible with memory_hotplug.memmap_on_memory.
+			If both parameters are enabled, hugetlb_free_vmemmap takes
+			precedence over memory_hotplug.memmap_on_memory.
+
 	hung_task_panic=
 			[KNL] Should the hung task detector generate panics.
 			Format: 0 | 1
@@ -2904,6 +2908,10 @@
 			Note that even when enabled, there are a few cases where
 			the feature is not effective.
 
+			This is not compatible with hugetlb_free_vmemmap. If
+			both parameters are enabled, hugetlb_free_vmemmap takes
+			precedence over memory_hotplug.memmap_on_memory.
+
 	memtest=	[KNL,X86,ARM,PPC,RISCV] Enable memtest
 			Format: <integer>
 			default : 0 <disable>
diff --git a/drivers/acpi/acpi_memhotplug.c b/drivers/acpi/acpi_memhotplug.c
index 8cc195c4c861..0d7f595ee441 100644
--- a/drivers/acpi/acpi_memhotplug.c
+++ b/drivers/acpi/acpi_memhotplug.c
@@ -15,6 +15,7 @@
 #include <linux/acpi.h>
 #include <linux/memory.h>
 #include <linux/memory_hotplug.h>
+#include <linux/hugetlb.h>
 
 #include "internal.h"
 
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 16b3a7a1db8c..6512e6f641bb 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1052,6 +1052,7 @@ bool mhp_supports_memmap_on_memory(unsigned long size)
 	 *       populate a single PMD.
 	 */
 	return memmap_on_memory &&
+	       !is_hugetlb_free_vmemmap_enabled() &&
 	       IS_ENABLED(CONFIG_MHP_MEMMAP_ON_MEMORY) &&
 	       size == memory_block_size_bytes() &&
 	       IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
-- 
2.11.0

