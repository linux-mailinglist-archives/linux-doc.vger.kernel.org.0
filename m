Return-Path: <linux-doc+bounces-12290-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CAF87F9EB
	for <lists+linux-doc@lfdr.de>; Tue, 19 Mar 2024 09:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D83BC1C2119D
	for <lists+linux-doc@lfdr.de>; Tue, 19 Mar 2024 08:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA677C09A;
	Tue, 19 Mar 2024 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="UpSlbMZ3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35A47C092
	for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710837073; cv=none; b=r4UvJT827h/zXHMXiZyAX4pR86GXOIpQIDVAaWdV8aIEP2IUKPph5JGi9jvlUWU51tSlh+iZO0n4ukLjrhZYVOBAYR8j2tLD18YJ2e34dfTlnNm2QJcML/3I3s2SaFT1cSw/utxs+NXt5HEmPA+2XY9kEFH7Wi44YjtBjCRfzdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710837073; c=relaxed/simple;
	bh=fmOWfAiXn5JgIfZTOxYLm6UhsznWCAvx11y3kFTcU98=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HyY0tq61aFmUEyKhQKADW5dHjmFBZJ3pET+9ZnKtzhVtG9Zepk/5pV/FWx8T+7Cpe1H7JwfavaXXk8f+Eh9+Ek5rf0QmVs3MaGhwXDp1Ez48kWIyhd0fBOEuPGobe23U1Nz5dMu1Kuaw9KnC74JpKass/FZBorwzQQKk9eic3iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com; spf=pass smtp.mailfrom=shopee.com; dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b=UpSlbMZ3; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5cdbc4334edso2899536a12.3
        for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1710837071; x=1711441871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhlePUyQMcGbwxIcmHkKRTvaFKRtl8DibzkuUhf5pmI=;
        b=UpSlbMZ3bsa73I1F1Clvrs9HnTxaAGsG5tUOy35eO7XEgAUitq9HGPMQWY/6dFwGwa
         YRI0kuSIp3fgOJ7HJklgcDU+wnucZQJeoFANQzBuxG1ldzwL5TzpKcrdJ9LoLvy0hg9w
         +FFexWnuP9OkDTqSVgy3yQvZUtnr5FYiQph7WjpYsIxZ2B5y9nz+wNed17ur3yst2H65
         UZTYRhQ8hQIF0jxB+6jCm4mo6Ad178ttFi5oSj2L3R2KzhZmnsmIIhYmAWwnAkXw5gMw
         CjvwhsX9KYSYuof7d/bQP8opl4EoIceUypee670YhoVUaYlQ3FRI/N4OrbynecLezWsB
         uU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710837071; x=1711441871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhlePUyQMcGbwxIcmHkKRTvaFKRtl8DibzkuUhf5pmI=;
        b=I5lTsJEpqgfRNVlM0GQUHNDURYyLUJito2Qalt8PjVfuy5sGpG8GAJenAF+SWoy19j
         Rx8cQxGDbzqZWqL3BBeWjvWwofdnCBWRkZWoA5dX3Pdj11CNEoPBefWX4pbEhPkiBvdt
         /Wc9bd94+lhA9NOuIBo1eHn8Ec/dgng5RyJDuNHrFDgiYHzG+KWWDmaWkKu+mYr72YO8
         9qB4zL7wp7kWyvKreMfd2xkj5T43k+juSYSf6HTTC5P8/KpLBqRJ7t0fMOeNYy6GGN4g
         dtpXqbuRQgfEszVT0KHhpoPr86VSKf9aC153JNANfT24MCuKVvlz8S/dxlxCzTByND1T
         dbUw==
X-Forwarded-Encrypted: i=1; AJvYcCVT1x0BoZ2rAQpOEFK3OcRHkwsTj+C8lJ23uuUsQR58HRc28i/lGXghf/ERTkArgaqo5D31c0ZRSgUS2mLAPj+P7mrSmTdR+x8H
X-Gm-Message-State: AOJu0Yw2oOVdZEm+YkauhhLFuN5j9kbImLg1hzes9h5ZgpfDuLFGdJDO
	MtW3e5aLKE464miyHJObDZoqz9WbsUc2iDk5NbKrKXOxOOfEwL6gDK+AV6W0N3c=
X-Google-Smtp-Source: AGHT+IEEOx1QN+FnvnNHyn5wv9Yey+cdtr0ZipoHpMBzfmj2SYIVkorS1uiwzI7pKA3FF5HOyUnCJQ==
X-Received: by 2002:a17:90b:4c06:b0:29f:e024:8f48 with SMTP id na6-20020a17090b4c0600b0029fe0248f48mr456943pjb.35.1710837071435;
        Tue, 19 Mar 2024 01:31:11 -0700 (PDT)
Received: from seacloud.vm ([143.92.64.20])
        by smtp.gmail.com with ESMTPSA id k90-20020a17090a4ce300b0029ddd0a6ed4sm9941249pjh.38.2024.03.19.01.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:31:11 -0700 (PDT)
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
Subject: [PATCH v6 1/2] x86/resctrl: Rename pseudo_lock_event.h to trace.h
Date: Tue, 19 Mar 2024 16:30:38 +0800
Message-Id: <20240319083039.223088-2-haifeng.xu@shopee.com>
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

Now only pseudo-locking part uses tracepoints to do event tracking, but
other parts of resctrl may need new tracepoints. It is unnecessary to
create separate header files and define CREATE_TRACE_POINTS in different
c files which fragments the resctrl tracing.

Therefore, give the resctrl tracepoint header file a generic name to
support its use for tracepoints that are not specific to pseudo-locking.

No functional change.

Signed-off-by: Haifeng Xu <haifeng.xu@shopee.com>
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
---
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c                 | 2 +-
 .../kernel/cpu/resctrl/{pseudo_lock_event.h => trace.h}   | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename arch/x86/kernel/cpu/resctrl/{pseudo_lock_event.h => trace.h} (86%)

diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
index 884b88e25141..492c8e28c4ce 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
+++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
@@ -31,7 +31,7 @@
 #include "internal.h"
 
 #define CREATE_TRACE_POINTS
-#include "pseudo_lock_event.h"
+#include "trace.h"
 
 /*
  * The bits needed to disable hardware prefetching varies based on the
diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock_event.h b/arch/x86/kernel/cpu/resctrl/trace.h
similarity index 86%
rename from arch/x86/kernel/cpu/resctrl/pseudo_lock_event.h
rename to arch/x86/kernel/cpu/resctrl/trace.h
index 428ebbd4270b..495fb90c8572 100644
--- a/arch/x86/kernel/cpu/resctrl/pseudo_lock_event.h
+++ b/arch/x86/kernel/cpu/resctrl/trace.h
@@ -2,8 +2,8 @@
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM resctrl
 
-#if !defined(_TRACE_PSEUDO_LOCK_H) || defined(TRACE_HEADER_MULTI_READ)
-#define _TRACE_PSEUDO_LOCK_H
+#if !defined(_TRACE_RESCTRL_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_RESCTRL_H
 
 #include <linux/tracepoint.h>
 
@@ -35,9 +35,9 @@ TRACE_EVENT(pseudo_lock_l3,
 	    TP_printk("hits=%llu miss=%llu",
 		      __entry->l3_hits, __entry->l3_miss));
 
-#endif /* _TRACE_PSEUDO_LOCK_H */
+#endif /* _TRACE_RESCTRL_H */
 
 #undef TRACE_INCLUDE_PATH
 #define TRACE_INCLUDE_PATH .
-#define TRACE_INCLUDE_FILE pseudo_lock_event
+#define TRACE_INCLUDE_FILE trace
 #include <trace/define_trace.h>
-- 
2.25.1


