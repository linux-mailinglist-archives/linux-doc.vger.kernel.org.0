Return-Path: <linux-doc+bounces-73777-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKnZHbkmc2kAswAAu9opvQ
	(envelope-from <linux-doc+bounces-73777-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 08:43:53 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 487B671ECA
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 08:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CCC0C300D0C6
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 07:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1424334C1B;
	Fri, 23 Jan 2026 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BjOso4F9"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFC63168F1;
	Fri, 23 Jan 2026 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769154059; cv=none; b=XiUp+rEw9DPh8/lC1ITVpgaIf2STeIDaNqoAXVr0MURljk9AUpxVt43qZbtG4xoSmZsbeyGUit9bbY9mOI+nM3tLh/JCy8s7+iSyN3VcpdfbFV3/SVRQrvnaHemUGbcRgQ8SI/jnpMBjgF7J3/7zyfuWzcd8lj5hruDd2w4/3Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769154059; c=relaxed/simple;
	bh=9IGNDlLd9+jtX5x92W92Wl3+VxxnLQ1STaFbGHAlxf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MoI+d2YTcC4hfqaFi4jzs0PR38h8jZxibOPtE11pNmLDv85605hcBmHZud1L8TAnFmmJGVBkq5Qd9shtQEI81zJmNcVRnxjcPrxCwZCtOqWB+ASag9egsR86NN9WeURVkQFFaehQIWDukFiI2ARQs/pzvMKX4hcYyEnIAWDIBOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BjOso4F9; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=F8ZCLpVna+xpAcsE4nXLu6X6jf3LvcqAxXch9kFrxAQ=; b=BjOso4F9/d4fjJqrLxlEyusP8t
	rc71A3ptfD8hve91fd6PTCggQyawCFYYDV5e2w/CfZXsIZuib9RK+qShP7NrWMWgzkBI+cYjIXey9
	BOtBvbPSnOdzmgM7TobSJSCvKvqhWaOM+S39MBTnhzoHt28thzVnOnr35KGGT4zB7T//yUNjWBvaD
	E3zDlJ1aeqUtUgu329JijvVGyGGYcIQmjEAJ7+V7FC6IXcIzkEPPGE+oAccgmq8eERwXzk8FAEagO
	BEBcEm7GNm/4LDEyaeL3lDMqYSuz4eh5j1fD+FfcVAfRz8K0B2dHeBM5y46S5X6G7i4yUPVYoQF3S
	A1Pn+lSw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBmk-00000008NyQ-249c;
	Fri, 23 Jan 2026 07:40:50 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Marco Elver <elver@google.com>
Subject: [PATCH] docs: kdoc_parser: ignore __cond_acquires()
Date: Thu, 22 Jan 2026 23:40:49 -0800
Message-ID: <20260123074049.3912065-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73777-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,infradead.org:email,infradead.org:dkim,infradead.org:mid,linuxfoundation.org:email,lwn.net:email,auug.org.au:email]
X-Rspamd-Queue-Id: 487B671ECA
X-Rspamd-Action: no action

Drop "__cond_acquires(.*)" in function prototypes to avoid kernel-doc
warnings.

Documentation/core-api/kref:328: ../include/linux/kref.h:72: WARNING: Invalid C declaration: Expected end of definition. [error at 96]
  int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref), struct mutex *mutex) __cond_acquires(true# mutex)
  ------------------------------------------------------------------------------------------------^
Documentation/core-api/kref:328: ../include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
  int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)
  --------------------------------------------------------------------------------------------^

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20260107161548.45530e1c@canb.auug.org.au/
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
The regex is suggested by Mauro; mine was too greedy. Thanks.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Marco Elver <elver@google.com>

 tools/lib/python/kdoc/kdoc_parser.py |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20260121.orig/tools/lib/python/kdoc/kdoc_parser.py
+++ linux-next-20260121/tools/lib/python/kdoc/kdoc_parser.py
@@ -186,6 +186,7 @@ function_xforms  = [
     (KernRe(r"__sched +"), ""),
     (KernRe(r"_noprof"), ""),
     (KernRe(r"__always_unused *"), ""),
+    (KernRe(r"__cond_acquires\s*\([^\)]*\)"), ""),
     (KernRe(r"__printf\s*\(\s*\d*\s*,\s*\d*\s*\) +"), ""),
     (KernRe(r"__(?:re)?alloc_size\s*\(\s*\d+\s*(?:,\s*\d+\s*)?\) +"), ""),
     (KernRe(r"__diagnose_as\s*\(\s*\S+\s*(?:,\s*\d+\s*)*\) +"), ""),

