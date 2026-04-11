Return-Path: <linux-doc+bounces-83105-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJiQEsna2mlr6wgAu9opvQ
	(envelope-from <linux-doc+bounces-83105-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 12 Apr 2026 01:35:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E0E3E1F0C
	for <lists+linux-doc@lfdr.de>; Sun, 12 Apr 2026 01:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 006AD3016904
	for <lists+linux-doc@lfdr.de>; Sat, 11 Apr 2026 23:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3DD31A556;
	Sat, 11 Apr 2026 23:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fjCloWAE"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B809286D7D;
	Sat, 11 Apr 2026 23:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775950533; cv=none; b=IPiiDfYCljets3XbcdC5qy/NYyUCR92tsEXBXdc67AACwJev3yhN0brP61xs2uZBxtQe3SIcDDzX3bNG5/Iafe4yob3jUDMfMm1AealmWp9WCNxvTo9QRtTy6RhVvuBmoCrsvZLdISkwfnoGZQPPAAfmNxqRcUHfBWBq8o5CXIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775950533; c=relaxed/simple;
	bh=DqO+XOI8pYzQm4e0Z0NuWIEMWYt8aAUQWj2vrSlSnx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dgtzR2U/EJuORYpw1dAr+Ku4H4OKqQODShw971c/hxHY/VJ38BeHnpSqHG4OhnS6+9s9LZWMuAWv1cnccq9mTL6IR+nABsggzd/1ZV2JjxuOw/BmIicbQ2VGzk3grvqX1LkRBeD+SyAo8FBubnvYPL/FMS2QFSisd6mdgc96V0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fjCloWAE; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=RLUIOyxX2de8r+zPiqqA7BPRUPEx7oW+o7y8CDbrVys=; b=fjCloWAEudUH/NPhkWjJbl/fzy
	qIY1EqyoRO3LdH1VyELEsEgPUszFkIveqr/i9XtLZNPHqR4vpOYELRfFnqbbSotTJHoxB4OD8wIjy
	MkPgW75AIHAJ56Q3gnsDkzZT1V8iYJJe0v2ypKcW3QQsemP3fHKdvoXFQCC3U23RrxcoPS26Kfl5p
	nVVU8W6CJqOf+Vm9uhlvdTwiZot/NU9Af3Uo2hDWDplVA+D87T78VtLf3eusfuHG4bK9wx3TGV1/1
	D/0rsqKL+T7miQK/zrJEFFxjQYfOdlOgTu9B/xys2B+EL/JW2PXAhzE9Kxb9n6Rj/GEQBbWGGpmPo
	DV4k9gKw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBhrL-0000000Dsnk-22bs;
	Sat, 11 Apr 2026 23:35:27 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	kernel test robot <lkp@intel.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] docs: xforms_lists: allow __maybe_unused in func parameters
Date: Sat, 11 Apr 2026 16:35:26 -0700
Message-ID: <20260411233526.3909303-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83105-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 90E0E3E1F0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Bart has a patch (not yet merged) that causes kernel-doc warnings:

WARNING: ./include/linux/highmem.h:235 function parameter '__maybe_unused' not described in 'clear_user_pages'
Documentation/mm/highmem:211: ./include/linux/highmem.h:222: WARNING: Error in declarator or parameters

Handle this by adding "__maybe_unused" to the list of known function
parameter modifiers.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604120025.jtlnpWff-lkp@intel.com/
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Bart Van Assche <bvanassche@acm.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

 tools/lib/python/kdoc/xforms_lists.py |    1 +
 1 file changed, 1 insertion(+)

--- linext-2026-0410.orig/tools/lib/python/kdoc/xforms_lists.py
+++ linext-2026-0410/tools/lib/python/kdoc/xforms_lists.py
@@ -93,6 +93,7 @@ class CTransforms:
         (CMatch("__weak"), ""),
         (CMatch("__sched"), ""),
         (CMatch("__always_unused"), ""),
+        (CMatch("__maybe_unused"), ""),
         (CMatch("__printf"), ""),
         (CMatch("__(?:re)?alloc_size"), ""),
         (CMatch("__diagnose_as"), ""),

