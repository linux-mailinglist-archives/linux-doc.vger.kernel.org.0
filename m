Return-Path: <linux-doc+bounces-96814-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cRe7KKSAVmpb7gAAu9opvQ
	(envelope-from <linux-doc+bounces-96814-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 20:32:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B67B757D8B
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 20:32:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MU2gdJms;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96814-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96814-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC1DD304C358
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 18:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE294156E8;
	Tue, 14 Jul 2026 18:32:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF523CF207
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 18:31:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784053921; cv=none; b=pr8w3XP9C9Oo+Kv1zfOI4jfZa2ziOqpKs8WRMfCw1Vp7PFbKWJD98mV3WNJujGwbpKefdfRO1LkXjiHToo9bbQs1HSlI1wKXFzHYVqHDWLDkJKE17w5vHtBVzgfwgjr3guXsUXu805KwDSjgxn5iRJ3hA2uG9+J0WNUYJpXaSaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784053921; c=relaxed/simple;
	bh=VjO/40vwtlEqoqa0MWjtEwISafs1DuSDXBphWFAVeM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JXVlZaU8kzrEz7BcxNYuFbE3CcQ5CaToBLnAMr36+70GENqQ021cTXxx4fW79mLw5akcyvxdV1F1pvMZamg8hu1+hBiXiG1F3BSdFS6Zh33D8Ru2Ra5gsPHpH6WR65AEbbhr4FAayEE9Ralbsrw4bUoa+OCwNcmW1ES2takd5u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MU2gdJms; arc=none smtp.client-ip=209.85.219.50
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8efef6533aaso13628296d6.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 11:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784053919; x=1784658719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KwQ36ycy2027O2OnXTT+jaKQ0lX0IY/IjFba+f+HbbQ=;
        b=MU2gdJmsxzKlkum3NlI0Bt6u3MFh3Ge5SRJ6lQACJSbB9X94H807fYOy5FY9pHzcLk
         FAPshpyZbymGqiTrfInEYL+xJM6h/oaOOpjzr1etSvudNc5wz42NKh2EA02P52g8NJ/X
         Vz8ujfqLmPfBh3LaLE/6h9bj/JEwNDdrLPpoFVuoZiGB2o/izJeNX70lG6X6gJsBGKQG
         oO+O2JmhN7hUbkx/eE6O3VuTqbwhj0OotnbPsIYddQnQu7cNIj+14bmB7zPHDYpY569J
         aaDJHcM0taT1bB8QAmbad63CSfgofVa6PXb0YdjckVRWTbaSsv/euNsp6FtUFy6fywaj
         dD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784053919; x=1784658719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KwQ36ycy2027O2OnXTT+jaKQ0lX0IY/IjFba+f+HbbQ=;
        b=FvMKzIf1nPkudGRNrSOG9jvCXoedoRld9bouf6a67D1ES6jLZIuTBTSgemoMa471hg
         U7pvjzUd9ooCwVOVRzwa4eVzWyrkfqrrh4VeBkxONy8Qz+YoV637fGB2UBaVepyvyIPH
         U94CAdAI90xvbd1+zMV7Wc78E2SfS9PLEQe9O9SWIh0j6l8ozT782Hv00qml7rmfoNAR
         q8muAdFMYNTCE1hgWeMpk2G6x/rfEgRlSudcfWr6CxzJnSttaeh/HezGOJvoD4Gu0phc
         IMr7Iltupo4ddcTG03HSsUP0WF7ILvNeqzOpKycb2ISOv6aPhOOlhUiV5MUTSwED+ihQ
         CvHA==
X-Forwarded-Encrypted: i=1; AHgh+Rqt+r3m1gDTv3OYoN2d3jfUPRQ6h3ZxUnlXdNA6uKLsLRdv/zR+ZeGyB5BSfx/Novg3/sjn6b0CRDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfPSUneXAph1rL7XDuKSFthAtZsLF4PrNBRj1Os8MkcY3ANduJ
	Z5yr52MuVJQUonL9Kc7SebxldaOyoZzIrpOh36mnDcXKsihLLbxiRnxZ
X-Gm-Gg: AfdE7ckkOcWllKJRdcG15sY5uztDONtE4wRuCPETLRHiri+EJgWYugAIZuPH7MRe/BP
	TKGM/23Lri1Fb4L5jnxq/sg+v5Vn6untMzm7IsDp1o3hj262IYaFMBN635CVjz7tpeFh4glUqfp
	3A+zEb7Ogk77LGAMRkTeXNtrFuv/AEYQF96Y/y8l5p9DgOklTKS6k3gxCYgUKTrcRDK42qbaXtx
	Qe390LL2oRU/syAC0fzNdaD2vmqUjw78x8z4nqnLDJmkdMVDsArL75SUUAcjK3kwiFjOuZpoOlw
	zcgnmITCvqq4/AFZ1Mhha9tdAfXVRnOXWjg22BKN0PETz3+9cPzvPIKD0S/H2VT2MRCDD2OXg1X
	FRuqh2i+0NE1zubUPSNPT+GDnji/j12p9uAPuvHLzYG04yOsVqWL21wcZoijDE7SofhWm8LvUw8
	En/DSSQl1NMBMCbuHT/iil3zWRehxDTRmgHeI5x0miVmZAlgM6SjqFB/NpZwrLkQ==
X-Received: by 2002:a05:6214:3d0f:b0:8cc:ea7f:d3c8 with SMTP id 6a1803df08f44-90401578bbbmr161798496d6.30.1784053918640;
        Tue, 14 Jul 2026 11:31:58 -0700 (PDT)
Received: from localhost ([48.45.163.146])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd87cacb8sm178386286d6.49.2026.07.14.11.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:31:58 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Matthew Wilcox <willy@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jinchao Wang <wangjinchao600@gmail.com>
Subject: [RFC PATCH 07/13] stacktrace: export stack_trace_save_regs()
Date: Wed, 15 Jul 2026 02:31:46 +0800
Message-ID: <20260714183146.12598-1-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714182243.10687-1-wangjinchao600@gmail.com>
References: <20260714182243.10687-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,alien8.de,linux.intel.com,zytor.com,kernel.org,arm.com,efficios.com,lwn.net,infradead.org,vger.kernel.org,kvack.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-96814-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:peterz@infradead.org,m:tglx@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:x86@kernel.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mark.rutland@arm.com,m:mathieu.desnoyers@efficios.com,m:david@kernel.org,m:corbet@lwn.net,m:willy@infradead.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-trace-kernel@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-doc@vger.kernel.org,m:wangjinchao600@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wangjinchao600@gmail.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjinchao600@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B67B757D8B

The other stack_trace_save_*() flavours are exported, but the regs
variant is not, so no module can capture a stack trace for a given
pt_regs. KWatch, which may be built as a module, uses it to record
who wrote to a watched address from the hardware breakpoint handler.
Export it like its siblings.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 kernel/stacktrace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/stacktrace.c b/kernel/stacktrace.c
index afb3c116da91..d853c40f916b 100644
--- a/kernel/stacktrace.c
+++ b/kernel/stacktrace.c
@@ -175,6 +175,7 @@ unsigned int stack_trace_save_regs(struct pt_regs *regs, unsigned long *store,
 	arch_stack_walk(consume_entry, &c, current, regs);
 	return c.len;
 }
+EXPORT_SYMBOL_GPL(stack_trace_save_regs);
 
 #ifdef CONFIG_HAVE_RELIABLE_STACKTRACE
 /**
@@ -325,6 +326,7 @@ unsigned int stack_trace_save_regs(struct pt_regs *regs, unsigned long *store,
 	save_stack_trace_regs(regs, &trace);
 	return trace.nr_entries;
 }
+EXPORT_SYMBOL_GPL(stack_trace_save_regs);
 
 #ifdef CONFIG_HAVE_RELIABLE_STACKTRACE
 /**
-- 
2.53.0


