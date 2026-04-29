Return-Path: <linux-doc+bounces-85123-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO/aBLus8WmwjgEAu9opvQ
	(envelope-from <linux-doc+bounces-85123-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 09:01:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE284901F8
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 09:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D8E53022BAF
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 06:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AE539E6F3;
	Wed, 29 Apr 2026 06:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnVoxcCo"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4102A39DBE0
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445965; cv=none; b=l1wL56J90DEyJJPVDmlaTKw/RC54fyPrm8yDEIUHlUgs8y6mrdZrouHoTv82UsWqIj5NteQZkHApUGnL/d4335ff2P3Lu2lyuJXJIB9KyeOYGjiGz3rp1iCeK3LG5jJ2VL9vFE+hk86lHREPqgOybUn9+W+lYwi/WM6mYHLAfNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445965; c=relaxed/simple;
	bh=AscXsVQdQtSzP4LlCGAz/Bs520rvB9Y/aAxkWx2lFak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyK+S/FOPnY3iv63n5qpj5A9UZw5A0xWmX7oF83fDjYu+VGKqoayx9qANMRW5vHulYVCkPsP+Mn6izaMSxp/qAU8MTjnA8+SK+dIpYYnLNNaO9dggyWUk4twB8PL/XJOOBdml/ajE7myUyBlDyVAHtgz2VWvLcCejzzyBTb+XAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnVoxcCo; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-82d0b68837aso7235093b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445964; x=1778050764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzSUcXeQbcSyOJLVmBDEIvlXQPXERsU2BOZ+obvdQ0o=;
        b=ZnVoxcCoAveJ4rIHsBQ12JxKf+R9lgl5AhXozPQpSLLiF8+wiBEHHW0LJyxlViKYy1
         VAxJpIoy42UOkWXFdD+2e7ifiSW+OMwkY7HcsHMWb+sle2r8NJW7Lgz9QG4DxNI1NuXs
         jOIJ6IKwMpRE1SbURUdW72HbqFDVvYSKJNCvCuu19+bJ185LySuWdYFxCnz0xdHtiF7N
         cR35X9dLQPuQN/lQ4pP1zeteyWSQ+l2ZS0jBHoZ5y72PZ25GIu6ArWIhaf+YgJzDGHWp
         KNIorlgsSlCs0IeGDbqHW0ABCqFJwP2KSDBfKNomlFpyIjLtnAnBopCCi6+UePGsyPg2
         nROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445964; x=1778050764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OzSUcXeQbcSyOJLVmBDEIvlXQPXERsU2BOZ+obvdQ0o=;
        b=Koq2Os4hz3gB+T0iyCw45HVFsUGXzERWeXAMfqWVTtp89x4WDYUUs4o+pFFwA6sJPA
         0r0rb7+U1ilQBZT2tdYBzm07f0tY0kd4ttQl7IJaThFAxYaLtGm23kiCDu32dlXANWzi
         j6qvNij75cfphsTGPgsdr0VLEr0AfPUaZz2XSs1LYgDXEjv6+4dQQ8O/KPhAcwNqPlDm
         8fnMxSRvOTJvSsVEZe5fcxF82GlEMiYOpPnyTC13M7DJTWKE/UHsScJTjkh/tzIVnwqh
         pYbd9U4glYnr4ZK/l7v7PE6O3Y/BEPBqg4ywpBMadIAQpNne4fss7j03aGZQmRM9qfR4
         fYew==
X-Forwarded-Encrypted: i=1; AFNElJ/dBVSPmNwkJG2+ZwTxknz+gmye0hq54EB32iedr6h9lbdHZNlfRifguy/ktE8U1JZUoWWo6D9Pzas=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzwvIiaK6uu+EX8FM6WsfmCgbitFKKVsVuup8Tyf1bOJpT4WZT
	kLDqxTAcoR0Lq18wwYHIK0cIc+9a+dG6F4G4AW5cDotH9grZie7qrewo
X-Gm-Gg: AeBDietuncaLuuCjk3LbW+OC/m+hcsq7Qf4j3iWQNaLePdeQhbv6jrfhsFiCchoWurt
	UYjCay6Kwk0A3DWopUBRok/C2dTUyzLIWW1mPwueog+mCxGBxMvhwbvqHLOZltaNRpN1ZcmnJjo
	X43Dxeo5rhq3z8bzkz3G6E4xQtXHlD4AVfXSDGLmYAtGPGqd2k3ykVWvZpA/RdeoiLm2HYjdEsQ
	Dw1urV/dzVgOhCPs5uQkgikTZawApij9tSJ4WBwdbtqZBvxgAUr+7NsZyh2YKdhUfboHqb+r8fi
	anbMNJ9N9TzAQtmiZV7fZeA2qfobFJWRB5zxuh3+bBrfPZfzNZtuXJ8PjjTkTKyTs6njgMl35lC
	mC7+PDmiS6gaJabwsYZg5u4ms8YlsFeUaPmthaWRb11gFrDOw1qCxVYAUwHmcxGAzfOfAvT2B2Y
	FKkeH8UnxNEf8Y3zBCET/JbebQKJbhkyH+4HbMDs1Wy65KTx0m
X-Received: by 2002:a05:6a00:1c8f:b0:82f:29fe:7239 with SMTP id d2e1a72fcca58-834ddc4bf7fmr5980744b3a.50.1777445963631;
        Tue, 28 Apr 2026 23:59:23 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:23 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 04/11] of: reserved_mem: skip reserved_mem array allocation when there is nothing to save
Date: Wed, 29 Apr 2026 14:58:24 +0800
Message-ID: <20260429065831.1510858-5-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5FE284901F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-85123-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,redhat.com,kernel.org,soleen.com,linux.dev,lwn.net,linuxfoundation.org,arm.com,xen0n.name,dabbelt.com,eecs.berkeley.edu,lixiang.com,126.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[chenwandun1@gmail.com,linux-doc@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lixiang.com:mid,lixiang.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

fdt_scan_reserved_mem_late() unconditionally calls
alloc_reserved_mem_array() after confirming /reserved-memory exists.
Two issues with that:

 - When __reserved_mem_check_root() subsequently fails, the call
   returns right away, leaving the freshly allocated array unused.
 - When /reserved-memory exists but fdt_scan_reserved_mem() found no
   entries to save (total_reserved_mem_cnt stays at its freshly-set
   value of zero, e.g. empty node or all children disabled),
   alloc_reserved_mem_array() ends up calling memblock_alloc() with
   zero size, which returns NULL and logs an "Failed to allocate
   memory for reserved_mem array" error even though nothing was
   expected to be allocated.

Move alloc_reserved_mem_array() past the root-node check and gate it
on total_reserved_mem_cnt, so the array is only allocated when there
is at least one entry that needs a slot.

Fixes: 00c9a452a235 ("of: reserved_mem: Add code to dynamically allocate reserved_mem array")
Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 807b222fce5f..93585af9f8a3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -276,14 +276,22 @@ void __init fdt_scan_reserved_mem_late(void)
 		return;
 	}
 
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	alloc_reserved_mem_array();
-
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
 		return;
 	}
 
+	/*
+	 * fdt_scan_reserved_mem() sets total_reserved_mem_cnt to the
+	 * number of entries that need a slot in reserved_mem[]. If it is
+	 * zero there is nothing to allocate or save.
+	 */
+	if (!total_reserved_mem_cnt)
+		return;
+
+	/* Attempt dynamic allocation of a new reserved_mem array */
+	alloc_reserved_mem_array();
+
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
 		int i, len;
-- 
2.43.0


