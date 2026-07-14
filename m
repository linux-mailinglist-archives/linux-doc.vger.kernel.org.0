Return-Path: <linux-doc+bounces-96819-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E3P4F2iBVmqz7gAAu9opvQ
	(envelope-from <linux-doc+bounces-96819-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 20:35:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF68757DF0
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 20:35:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=J7zLcB3w;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96819-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96819-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6A67305E39C
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 18:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C79444713;
	Tue, 14 Jul 2026 18:33:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A803D813C
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 18:33:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784054030; cv=none; b=N1VqZEde57VhSJHe6+dZlsive+KYSDuN74h92g64aH9FbTV6gzKsv5/AT7h6qafylhU4yMEyG8oKOLsPhjSsEnJpHj+lV499Xxvx/cOVPVSDmC2JD5DqbACm3/y8a+KT5oX7YJpZYeFMPpfB72xD7RHZH0gPIieiTSXeS442YyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784054030; c=relaxed/simple;
	bh=Gepv4EN5M9EKzOk4KnO+Ro5NR/FnPnIzfUYyZrSuJpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQ9TwtnHdkjzpTuz9hvO/jV7OtcaxgZjtkPmBiugIcdEKMtN29OoT70Xk716YfevJGDYJJFC4iNDd7AX6G1zWs8MzLBXmgWD7l7ZbWysPSOAu953IK9gXuodYVfOrxJA7ryMu2b2Mg8bjH5htbhvYkCkwPfHKjNrCSvzuzDAogk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7zLcB3w; arc=none smtp.client-ip=209.85.160.176
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c01089e8aso10192681cf.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 11:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784054028; x=1784658828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxRwnz/utPYkA9CVNI0v4sXDVqY3MfYAVIwDwIjJvYI=;
        b=J7zLcB3w08njHNfoJmJs+2F+DeHDSpqslYrgpytSGPrghruJaV2i2VKhG1yKkNleNT
         afZdrcAc4+Tz/yXgm5g1HEES+W/BGhXxOxlhiZytrc4Nk9vrFd09IyfPtnNuNDnNCjZg
         66/SMchkIcHCjBlXfXafuUEdrXQrjmjfty3a2wOGWBTOP86vWnpjGXytYFMClYDws2tv
         V9Gskvi4vKycPkEvXarcQzMgjGw6uSD/F2aH0JrLbMtNlHDk6Ud4PJWaXlZAVeObYa0j
         70rybAhXbKLrctSKv3eV+AJ8xNp2kHOX3zCvM3xmp4+zzzBZ1SGxF7ntvlVBYYDe5fHj
         pl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784054028; x=1784658828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GxRwnz/utPYkA9CVNI0v4sXDVqY3MfYAVIwDwIjJvYI=;
        b=JXdIO4VRp5eFG0qm6hmScs/HPyMIx/vurcgRrZ7EDqfP9GnMC6KfoZCCO8ymxFH5Tx
         tW6MzEaYVw4sQ1XX1IR9n6M8wecetPZw1gr8b53Tf76Q0l20+W+w9Avj0mZXyBrfr3jM
         xN0gfJd53P6SR7aBzQzjy9u9FOv3UPaqjZps2VB0aq1Q9R2mAvDa8wQbrmYYogTi9hWp
         MHMhjLczdUgMlasI8BJnDOLgW/R1CKOQbfRuxveue10bKINvR+/UPq9pid6FnxeoAXza
         vyzO8gzjebNsq5vyhBovIyowWB1WLTfHzuIec4wsJMIof3EERaj7GRCv3wugb5PCTyIT
         IxRg==
X-Forwarded-Encrypted: i=1; AHgh+RpT57r48S8dgRlTnqzvCULQOHHKiyG8SkdtVpxzL8kWktj/H+DOt00fbujzbFjUpTLxTDBQXzOU4cU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaQL4BrbtMFg9EvHlXVMdHsQPghPG4O7+QHF8zgm13Cdcbsc5B
	z4Q29W9+BjyzrqLBAc85DJSMTT2N9B4P0AdDjWrcVLkzFcAlZw6oAc7F
X-Gm-Gg: AfdE7cmWNseyc74W5xSuw2SD5GER+YRxa0jBgg2FHG6vUdCKKjZcy193Z5GCuDD5LWr
	NEvKeyNO+4vnRc/9zKQZ2z601/bt0hq4uSpli+xaOi8WWqMAXXW0lBUutt38UUM9Vp9J6HkX0ZA
	UdKht7YkLI9mKFfvx78nNzMQVIBsHCr0voaM0FpixEQ3eDVRTltA8HXeRpFtPvaNVeuCjnlcZA0
	7xQdEK5bRgD1LrfDrkhrErsl+Gla4XVeXnyc47B1zMjGHgsct4GLnon1z2DqA+b0bVMu0AMTF1h
	5w6L4Ly7IelrkYZMlYzeAHdzMUnuvmn5qyyGE1mutwI+RZLBwX9DPvWbAiarBvh0hT/MBKRk+s2
	VNPXf5vv5Mq7M5Kli9fESz4jG82m0PL9ltuLrOFMojL1NTvgaodRirSsGxv6jK2A5ZkE37a97FG
	xIkMPqdWgElkk/8Ib1efoTcu87TFztzcj6QJfpWtZPp0619cxI4dA=
X-Received: by 2002:a05:622a:993:b0:51b:fe7a:4eb8 with SMTP id d75a77b69052e-51cbf0e8c9emr148137331cf.35.1784054027768;
        Tue, 14 Jul 2026 11:33:47 -0700 (PDT)
Received: from localhost ([48.45.163.146])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1d22bsm173718936d6.32.2026.07.14.11.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:33:46 -0700 (PDT)
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
Subject: [RFC PATCH 12/13] mm/kwatch: add KUnit tests for the watch expression parser
Date: Wed, 15 Jul 2026 02:33:39 +0800
Message-ID: <20260714183339.13044-1-wangjinchao600@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,alien8.de,linux.intel.com,zytor.com,kernel.org,arm.com,efficios.com,lwn.net,infradead.org,vger.kernel.org,kvack.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-96819-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ABF68757DF0

Cover base anchors (stack, argN, absolute address), positive and
negative offsets, dereference chains, and rejection of malformed
expressions (missing offsets, bad argument index, junk offsets).

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kwatch/.kunitconfig |   9 +++
 mm/kwatch/Kconfig      |  10 +++
 mm/kwatch/Makefile     |   1 +
 mm/kwatch/deref_test.c | 137 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 157 insertions(+)
 create mode 100644 mm/kwatch/.kunitconfig
 create mode 100644 mm/kwatch/deref_test.c

diff --git a/mm/kwatch/.kunitconfig b/mm/kwatch/.kunitconfig
new file mode 100644
index 000000000000..7e977ddf0da1
--- /dev/null
+++ b/mm/kwatch/.kunitconfig
@@ -0,0 +1,9 @@
+CONFIG_KUNIT=y
+CONFIG_KWATCH=y
+CONFIG_KWATCH_KUNIT_TEST=y
+CONFIG_PERF_EVENTS=y
+CONFIG_HAVE_HW_BREAKPOINT=y
+CONFIG_HAVE_REINSTALL_HW_BREAKPOINT=y
+CONFIG_KPROBES=y
+CONFIG_KRETPROBES=y
+CONFIG_PRINTK=y
diff --git a/mm/kwatch/Kconfig b/mm/kwatch/Kconfig
index b1c37a829dd5..74083040a1a3 100644
--- a/mm/kwatch/Kconfig
+++ b/mm/kwatch/Kconfig
@@ -15,3 +15,13 @@ config KWATCH
 	  exact instruction causing the illegal access.
 
 	  If unsure, say N.
+
+config KWATCH_KUNIT_TEST
+	bool "KUnit tests for KWatch" if !KUNIT_ALL_TESTS
+	depends on KWATCH && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable KUnit tests for the KWatch kernel module.
+	  This suite tests the core parsing logic, the pointer-chasing
+	  finite state machine, and edge cases involving complex watchpoint
+	  expressions. If unsure, say N.
diff --git a/mm/kwatch/Makefile b/mm/kwatch/Makefile
index 02d7917602f1..1d223d73b461 100644
--- a/mm/kwatch/Makefile
+++ b/mm/kwatch/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_KWATCH) += kwatch.o
 
 kwatch-y := core.o deref.o task_ctx.o hwbp.o probe.o anchor.o
+kwatch-$(CONFIG_KWATCH_KUNIT_TEST) += deref_test.o
diff --git a/mm/kwatch/deref_test.c b/mm/kwatch/deref_test.c
new file mode 100644
index 000000000000..094b7afeb235
--- /dev/null
+++ b/mm/kwatch/deref_test.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <kunit/test.h>
+#include "kwatch.h"
+#include <linux/string.h>
+
+static void kwatch_test_parse_deref_chain(struct kunit *test)
+{
+	struct kwatch_config cfg;
+	int ret;
+
+	// Test 1: stack
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "stack");
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, cfg.base, KWATCH_BASE_STACK);
+	KUNIT_EXPECT_EQ(test, cfg.offset_count, 1);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[0], 0);
+
+	// Test 2: arg1
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "arg1");
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, cfg.base, KWATCH_BASE_ARG1);
+	KUNIT_EXPECT_EQ(test, cfg.offset_count, 1);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[0], 0);
+
+	// Test 3: arg6+8
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "arg6+8");
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, cfg.base, KWATCH_BASE_ARG6);
+	KUNIT_EXPECT_EQ(test, cfg.offset_count, 1);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[0], 8);
+
+	// Test 4: arg2-16
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "arg2-16");
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, cfg.base, KWATCH_BASE_ARG2);
+	KUNIT_EXPECT_EQ(test, cfg.offset_count, 1);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[0], -16);
+
+	// Test 5: arg3->8
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "arg3->8");
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, cfg.base, KWATCH_BASE_ARG3);
+	KUNIT_EXPECT_EQ(test, cfg.offset_count, 2);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[0], 0);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[1], 8);
+
+	// Test 6: arg4+8->16
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "arg4+8->16");
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, cfg.base, KWATCH_BASE_ARG4);
+	KUNIT_EXPECT_EQ(test, cfg.offset_count, 2);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[0], 8);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[1], 16);
+
+	// Test 7: arg5-8->-16
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "arg5-8->-16");
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, cfg.base, KWATCH_BASE_ARG5);
+	KUNIT_EXPECT_EQ(test, cfg.offset_count, 2);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[0], -8);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[1], -16);
+
+	// Test 8: stack->0->8
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "stack->0->8");
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, cfg.base, KWATCH_BASE_STACK);
+	KUNIT_EXPECT_EQ(test, cfg.offset_count, 3);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[0], 0);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[1], 0);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[2], 8);
+
+	// Test 9: arg1->+8
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "arg1->+8");
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, cfg.base, KWATCH_BASE_ARG1);
+	KUNIT_EXPECT_EQ(test, cfg.offset_count, 2);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[0], 0);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[1], 8);
+
+	// Test 9.1: arg1-> (implicit 0 should fail)
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "arg1->");
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+
+	// Test 9.2: stack->->8 (implicit 0 should fail)
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "stack->->8");
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+
+	// Test 10: Invalid base
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "invalid_base");
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+
+	// Test 11: Invalid offset
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "arg1+abc");
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+
+	// Test 12: Invalid arg
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "arg7");
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+
+	// Test 13: Absolute address
+	memset(&cfg, 0, sizeof(cfg));
+	ret = kwatch_deref_parse(&cfg, "0xffffffff81000000+8");
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, cfg.base, KWATCH_BASE_ABS_ADDR);
+	KUNIT_EXPECT_EQ(test, cfg.sym_addr, 0xffffffff81000000UL);
+	KUNIT_EXPECT_EQ(test, cfg.offset_count, 1);
+	KUNIT_EXPECT_EQ(test, cfg.offsets[0], 8);
+}
+
+static struct kunit_case kwatch_deref_test_cases[] = {
+	KUNIT_CASE(kwatch_test_parse_deref_chain),
+	{}
+};
+
+static struct kunit_suite kwatch_deref_test_suite = {
+	.name = "kwatch_deref",
+	.test_cases = kwatch_deref_test_cases,
+};
+
+kunit_test_suite(kwatch_deref_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for the KWatch watch expression parser");
+MODULE_LICENSE("GPL");
-- 
2.53.0


