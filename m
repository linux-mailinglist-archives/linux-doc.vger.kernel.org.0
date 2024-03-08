Return-Path: <linux-doc+bounces-11815-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54017875EBC
	for <lists+linux-doc@lfdr.de>; Fri,  8 Mar 2024 08:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09FB9282A55
	for <lists+linux-doc@lfdr.de>; Fri,  8 Mar 2024 07:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BAA4F1FC;
	Fri,  8 Mar 2024 07:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="F+C7LCsu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F375651009
	for <linux-doc@vger.kernel.org>; Fri,  8 Mar 2024 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709883718; cv=none; b=GWh5cUJTG4r7BExRsP8SBwEKrLGVLDsMhNdTqNCcW8yaKLAFJz3TpskrmNPqYy+PBX4tVhLiXKUdTl1ySK5dwsaLVFONEdbFn2nLrkP/6wnFs6vWTPgFGzWyKnqiYnreucWeueVwWNAu7KuTOMXfDFI/AIL6IbzyLP5BCPcktKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709883718; c=relaxed/simple;
	bh=RUrSSDfZdXdoOCuzohNQabrDvcuHQpxtAw5TtxJARBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qyZgBQUzaQx9EFqZOHrvA8I487/UYq6BCf1uqZ9dpUa7nhOUjwmt0OFIOXgCAAPpTt9PQOUs3CxkKnwDPKt4nsYkxs4XlU2GnY0PmibeuNCLHxhEPIZy5PZgNRb5l6SuaNCze08mlQogYlwc4Lg40uSBHTYRSK8HlbO/zMSv/gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=F+C7LCsu; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dc0e5b223eso3849215ad.1
        for <linux-doc@vger.kernel.org>; Thu, 07 Mar 2024 23:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1709883716; x=1710488516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNrGqRWhmlII/lvHzTDBhDh7tBPvWjw26JA4CeTSJU8=;
        b=F+C7LCsuNYyRHgaQhLhNXqNnMkyZWF7C0AsCGeVUTquol0R9sLX8qFy1xqjZCL1jeq
         +GTlQjtRLQ3TtumB8VEtMQ2THJifRRMH11F49qfPXnFZCg/vQC/RRtn35jyBctuNPQMt
         JwWHPJyPpM7fu+mRiOZr+IGp5+EC6MQM85twpCvR0GHk0xW26tYYRdUIi7f+Kz2ZGoE6
         e3RQ8bPDDIh5+hdPhIy+JiNj0KtLVr6VNuTFWUG42s2rsK7WoxG7amPfOzx6E8rIpIhX
         cKaiIEv2g4z+r+hlCTx2sV/jM9M6/73/SPaovXd3Xy0sJWhmqVmJ7R8XGwD3Rnnj5x0N
         6Krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709883716; x=1710488516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNrGqRWhmlII/lvHzTDBhDh7tBPvWjw26JA4CeTSJU8=;
        b=Iw+RJyz4i5lcOoR37GfJladAEyLTpE5Wly/XJQEzJH4EslCy2Ef80EtxBnn6Q2yuII
         n+cJfc/u2gH1lgCDGkMj/YGHsQbYb4RMwjl4UwaE1P/zvsM5OQmSMorWVpxp7mYSgQgt
         tIviWm1IKcqVnnAIA8vJTceqhyW+YSYlhCqp7ernbtCEK3fussNlxLsHFOiqXIsrOir8
         R4mW6T+LY5osUj0fEm7VwsS+zro13QT+anSPQ0nvMHGotCAHj4mqK6DvXiQ66jTzvgzw
         kG9iiq5j8FOqhM29FzykCIpfLnQ77HwwezUA1sS/ZLjGd/BlZXWlwa27EKgrAWnF1xfB
         1TJw==
X-Forwarded-Encrypted: i=1; AJvYcCXdYyuKKcDfndhn1g+LloFb10S7ztSUknY0FPykTvIBNOvv09t7gphE0TvyLWmU+FFupma1vCBzQB8mxQNkZwHw7UR1ReSZAT2y
X-Gm-Message-State: AOJu0YwcsuQFRLQLQYooilbT+YWMdN1RFBzI86/6NbmImYZdA2zhrzuC
	0cytcxVpanhfnuDdVzTZO7+ViFjQ7KsNunklIS4HH7kSNy4vqN6aOwV3pkag3D4=
X-Google-Smtp-Source: AGHT+IGCVOX2dS+oesgdXsRfCPAaxLMcC+YIAMryrPhNotPHSiHKpq4CgI2THzQSxRG8H3mqIrdXUw==
X-Received: by 2002:a17:903:288:b0:1dc:418f:890b with SMTP id j8-20020a170903028800b001dc418f890bmr11319568plr.40.1709883716447;
        Thu, 07 Mar 2024 23:41:56 -0800 (PST)
Received: from seacloud.vm ([143.92.64.18])
        by smtp.gmail.com with ESMTPSA id f6-20020a170902ce8600b001db45bae92dsm15769210plg.74.2024.03.07.23.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 23:41:56 -0800 (PST)
From: Haifeng Xu <haifeng.xu@shopee.com>
To: reinette.chatre@intel.com,
	james.morse@arm.com
Cc: fenghua.yu@intel.com,
	babu.moger@amd.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	peternewman@google.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Haifeng Xu <haifeng.xu@shopee.com>
Subject: [PATCH v5 2/2] x86/resctrl: Add tracepoint for llc_occupancy tracking
Date: Fri,  8 Mar 2024 15:41:32 +0800
Message-Id: <20240308074132.409107-3-haifeng.xu@shopee.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308074132.409107-1-haifeng.xu@shopee.com>
References: <20240308074132.409107-1-haifeng.xu@shopee.com>
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
 Documentation/arch/x86/resctrl.rst    |  8 ++++++++
 arch/x86/kernel/cpu/resctrl/monitor.c |  9 +++++++++
 arch/x86/kernel/cpu/resctrl/trace.h   | 16 ++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index a6279df64a9d..dd3507dc765c 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -478,6 +478,14 @@ if non-contiguous 1s value is supported. On a system with a 20-bit mask
 each bit represents 5% of the capacity of the cache. You could partition
 the cache into four equal parts with masks: 0x1f, 0x3e0, 0x7c00, 0xf8000.
 
+Tracepoint - mon_llc_occupancy_limbo
+------------------------------------
+This tracepoint gives you the precise occupancy values for a subset of RMID
+that are not immediately available for allocation. This can't be relied on
+to produce output every second, it may be necessary to attempt to create an
+empty monitor group to force an update. Output may only be produced if creation
+of a control or monitor group fails.
+
 Memory bandwidth Allocation and monitoring
 ==========================================
 
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index c34a35ec0f03..60b6a29a9e29 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -24,6 +24,7 @@
 #include <asm/resctrl.h>
 
 #include "internal.h"
+#include "trace.h"
 
 /**
  * struct rmid_entry - dirty tracking for all RMID.
@@ -354,6 +355,14 @@ void __check_limbo(struct rdt_domain *d, bool force_free)
 			rmid_dirty = true;
 		} else {
 			rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
+
+			/* x86's CLOSID and RMID are independent numbers, so the entry's
+			 * closid is a invalid CLOSID. But on arm64, the RMID value isn't
+			 * a unique number for each CLOSID. It's necessary to track both
+			 * CLOSID and RMID because there may be dependencies between each
+			 * other on some architectures.
+			 */
+			trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid, d->id, val);
 		}
 
 		if (force_free || !rmid_dirty) {
diff --git a/arch/x86/kernel/cpu/resctrl/trace.h b/arch/x86/kernel/cpu/resctrl/trace.h
index ed5c66b8ab0b..b310b4985b94 100644
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
+	    TP_printk("ctrl_hw_id=%u mon_hw_id=%u domain_d=%d llc_occupancy_bytes=%llu",
+		      __entry->ctrl_hw_id, __entry->mon_hw_id, __entry->domain_id,
+		      __entry->llc_occupancy_bytes)
+	   );
+
 #endif /* _TRACE_RESCTRL_H */
 
 #undef TRACE_INCLUDE_PATH
-- 
2.25.1


