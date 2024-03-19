Return-Path: <linux-doc+bounces-12291-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A62E87F9EE
	for <lists+linux-doc@lfdr.de>; Tue, 19 Mar 2024 09:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C67121F2214B
	for <lists+linux-doc@lfdr.de>; Tue, 19 Mar 2024 08:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA9D7CF3A;
	Tue, 19 Mar 2024 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="hBzbMK8w"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304617CF33
	for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710837078; cv=none; b=UOKdHPzoGOfW0dk6XTK07WSrxnbCepUmpqrqvEXajlHjBs4DRhgavlF5h5zS/l8QrNvRRqlKRIBwfhWvMLesCPnOhiq99LlorWxdGzpOjE2XHXzrq+21hO1ajo4+6YP8iGDBS44QaHULK8e+VJV9uKpNBhQjv6cMT/6lziBKPQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710837078; c=relaxed/simple;
	bh=J2se5fvnUGcTj0hc0l9rWZF4ioGXQ1l7de9vUtV2PYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QOEQqXM4cfLDp/mlu+AdHnTK4/4i2Ci/A2UztxtxCxaaaZwbTc7sRD4N2RURxpbiSX3os4wsN7z+riiHkcAKboBbwjdKmSe6upoAgNxHmsCvvLmH/KtL8GUgMWUIRBalou3cUgB66NZLQ6EQGp1yjoDN9wKkTvK0j4qqHfaLEYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=hBzbMK8w; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-29df3333d30so3174426a91.1
        for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 01:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1710837076; x=1711441876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+qIFovagdwOaZudBEiFBEikr4wHyxCWEpm+zwt1qQg=;
        b=hBzbMK8weHs27yZM65hMQd5OO+v3dMLv8OAUqMD2J/BFiZDfub+Zx3M+50r/QBFan3
         5cMZ7QzpCAZhKVr+RYLw2XYrckQjdD+FfUw17Wo3zUJo2VggLh56rNBu3YO6s08fksFk
         RyKO8BU9dXtCuSM2thDDsbJaFV6IIpOFpQuStW0DMlU2vsqTVg4y3+1a0TuMiPAmgEbX
         YB0xyG4ghjRXVSWfZIBb7bhC4U3B1BloRfTfV0PtHsx89f52wh2ODn/7Xnn/3hH2i/K0
         77CQm36amMkVCmTaL/bmk1qgqDNwhJ8ssk2asXbAjYJQOXhLvY66Pn5lDnB5gsXNHwzB
         S96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710837076; x=1711441876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+qIFovagdwOaZudBEiFBEikr4wHyxCWEpm+zwt1qQg=;
        b=XT4KX80LujoDLh0w3yoj5kzrvvnFT/+dNi7CZ2BkY4J5iXP6bFp9Hw1ZdN8w8p2eWp
         I2za4zUGn/8D2oMtOHKC62O2h6imYjOqm0yJhrdRpjfgsUghay4LuM98+A42o5qKOvP+
         IYalxyqNz7gaKVIaTsxEKUKoveLJ3f714UxXr0u+1WIuo0XakVvuqe+YBOTjBRlBEB53
         5Ki85FYfAaLTjIj9fgmbukZqckv/FKaLzKXiyEi8rNWbzU6XvBjnA0MYZXloeaqBryWl
         uI/2AIoxRVCQoDFx4bItgEqTEPGUb0MBr3G/XbIsupo7nQmlPQsp67e6O1zPoySnmjWO
         nh6w==
X-Forwarded-Encrypted: i=1; AJvYcCX5oXuAJ4GyfHWBMFQhn4CINaPdh2J8r6W/VBl2Oc69uqFNU3MX+366rso8tmsqGgUH2b/C4Ul8w8YmXKb0iSq1CzcU2TY3ts/D
X-Gm-Message-State: AOJu0YyAEwAHwOUW/Z2uAh3B9S1GorHzEMXvBzicsb0u8kIXHU1/ROOs
	9njhoW5wprYo6tBNPPI0fJhCw7+UXdgydfzXLgF/NXiUHnz0yMK7r9IzY3y/eHU=
X-Google-Smtp-Source: AGHT+IFex9atMmMmBhVDdqnil0ivUGoZhIUaQrm1iwnIvGqQ8WVv5b4Rs80bhy9hzT8WQ85RtyWiiA==
X-Received: by 2002:a17:90b:2d0c:b0:29f:6d8d:dacb with SMTP id sy12-20020a17090b2d0c00b0029f6d8ddacbmr5914625pjb.4.1710837076439;
        Tue, 19 Mar 2024 01:31:16 -0700 (PDT)
Received: from seacloud.vm ([143.92.64.20])
        by smtp.gmail.com with ESMTPSA id k90-20020a17090a4ce300b0029ddd0a6ed4sm9941249pjh.38.2024.03.19.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:31:16 -0700 (PDT)
From: Haifeng Xu <haifeng.xu@shopee.com>
To: reinette.chatre@intel.com,
	james.morse@arm.com
Cc: fenghua.yu@intel.com,
	babu.moger@amd.com,
	bp@alien8.de,
	tglx@linutronix.de,
	mingo@redhat.com,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	peternewman@google.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Haifeng Xu <haifeng.xu@shopee.com>
Subject: [PATCH v6 2/2] x86/resctrl: Add tracepoint for llc_occupancy tracking
Date: Tue, 19 Mar 2024 16:30:39 +0800
Message-Id: <20240319083039.223088-3-haifeng.xu@shopee.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240319083039.223088-1-haifeng.xu@shopee.com>
References: <20240319083039.223088-1-haifeng.xu@shopee.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In our production environment, after removing monitor groups, those unused
RMIDs get stuck in the limbo list forever because their llc_occupancy are
always larger than the threshold. But the unused RMIDs can be successfully
freed by turning up the threshold.

In order to know how much the threshold should be, perf can be used to
acquire the llc_occupancy of RMIDs in each rdt domain.

Instead of using perf tool to track llc_occupancy and filter the log
manually, it is more convenient for users to use tracepoint to do this
work. So add a new tracepoint that shows the llc_occupancy of busy RMIDs
when scanning the limbo list.

Signed-off-by: Haifeng Xu <haifeng.xu@shopee.com>
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Suggested-by: James Morse <james.morse@arm.com>
Reviewed-by: James Morse <james.morse@arm.com>
---
 Documentation/arch/x86/resctrl.rst    |  6 ++++++
 arch/x86/kernel/cpu/resctrl/monitor.c | 11 +++++++++++
 arch/x86/kernel/cpu/resctrl/trace.h   | 16 ++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index a6279df64a9d..bcdbd23cd8a7 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -446,6 +446,12 @@ during mkdir.
 max_threshold_occupancy is a user configurable value to determine the
 occupancy at which an RMID can be freed.
 
+The mon_llc_occupancy_limbo tracepoint gives the precise occupancy in bytes
+for a subset of RMID that are not immediately available for allocation.
+This can't be relied on to produce output every second, it may be necessary
+to attempt to create an empty monitor group to force an update. Output may
+only be produced if creation of a control or monitor group fails.
+
 Schemata files - general concepts
 ---------------------------------
 Each line in the file describes one resource. The line starts with
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index c34a35ec0f03..2345e6836593 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -24,6 +24,7 @@
 #include <asm/resctrl.h>
 
 #include "internal.h"
+#include "trace.h"
 
 /**
  * struct rmid_entry - dirty tracking for all RMID.
@@ -354,6 +355,16 @@ void __check_limbo(struct rdt_domain *d, bool force_free)
 			rmid_dirty = true;
 		} else {
 			rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
+
+			/*
+			 * x86's CLOSID and RMID are independent numbers, so the entry's
+			 * CLOSID is an empty CLOSID (X86_RESCTRL_EMPTY_CLOSID). On Arm the
+			 * RMID (PMG) extends the CLOSID (PARTID) space with bits that aren't
+			 * used to select the configuration. It is thus necessary to track both
+			 * CLOSID and RMID because there may be dependencies between them
+			 * on some architectures.
+			 */
+			trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid, d->id, val);
 		}
 
 		if (force_free || !rmid_dirty) {
diff --git a/arch/x86/kernel/cpu/resctrl/trace.h b/arch/x86/kernel/cpu/resctrl/trace.h
index 495fb90c8572..2a506316b303 100644
--- a/arch/x86/kernel/cpu/resctrl/trace.h
+++ b/arch/x86/kernel/cpu/resctrl/trace.h
@@ -35,6 +35,22 @@ TRACE_EVENT(pseudo_lock_l3,
 	    TP_printk("hits=%llu miss=%llu",
 		      __entry->l3_hits, __entry->l3_miss));
 
+TRACE_EVENT(mon_llc_occupancy_limbo,
+	    TP_PROTO(u32 ctrl_hw_id, u32 mon_hw_id, int domain_id, u64 llc_occupancy_bytes),
+	    TP_ARGS(ctrl_hw_id, mon_hw_id, domain_id, llc_occupancy_bytes),
+	    TP_STRUCT__entry(__field(u32, ctrl_hw_id)
+			     __field(u32, mon_hw_id)
+			     __field(int, domain_id)
+			     __field(u64, llc_occupancy_bytes)),
+	    TP_fast_assign(__entry->ctrl_hw_id = ctrl_hw_id;
+			   __entry->mon_hw_id = mon_hw_id;
+			   __entry->domain_id = domain_id;
+			   __entry->llc_occupancy_bytes = llc_occupancy_bytes;),
+	    TP_printk("ctrl_hw_id=%u mon_hw_id=%u domain_id=%d llc_occupancy_bytes=%llu",
+		      __entry->ctrl_hw_id, __entry->mon_hw_id, __entry->domain_id,
+		      __entry->llc_occupancy_bytes)
+	   );
+
 #endif /* _TRACE_RESCTRL_H */
 
 #undef TRACE_INCLUDE_PATH
-- 
2.25.1


