Return-Path: <linux-doc+bounces-90434-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FDYB3tKHmq+iQkAu9opvQ
	(envelope-from <linux-doc+bounces-90434-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 05:14:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C917627991
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 05:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D5BA301496F
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 03:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BD22C234A;
	Tue,  2 Jun 2026 03:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kWD9rCZs"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949D633BBBD
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 03:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780369938; cv=none; b=T30AgbbTOrm97v8MWiRDP5LsZ/oFvuRTrlTjT9iYacPfjT37olI7NO7PdgBHjikhmDzsy21W8fe6QdyPNCYHc6NL/1fVPAlE134rjKONz/iLzbvEygA9016/A0qspZEZzP1kI0fe1PH6NaD6mo7eYF0PsMWiXXRkRBwJldrb/1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780369938; c=relaxed/simple;
	bh=6MGQSajH/OFnvX+n2HHxrJIuB048d2AdiirGhdfKFtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uunMrJyD4O8v+AjyyEFP4PhZasSxVqrpaoIhjFEyvqwaWUp9UI1BCtF6ZBncMHBdX9GxS5s8Wnen23A+YBAtTMLj01qmm1bToIN7oSy5tdpHUFf6khTUZ6u8+fc7ULBFNbbR2XMYAWBuJhCyHxsFnnuZYs+CDjuAi7yJrmI5qnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kWD9rCZs; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=I4gGLAdNf52WPFFAYkC6rriPGKuD0scRD8vqOYbdLQc=; b=kWD9rCZsI9ykxKpUQbSM5exlqD
	c9Is3RG5x/xo6zEVXgsfJdgEAtw4754gR0HOPzyG71eC9E00/HXmVcpW+VxVIL1r3Vm2LkQOEUr90
	XwI7gASIVM6BHh4+BuYza+GZt8h755WUttSHiXuDAO3c7E48kfoZiKh0m969A7DuF49eV0pner7Zc
	e+EJ86FpIqeD34Ct4THRPF2UAV3tLZ93dKtHCcU8Moa7P061higGUbuiWOH4gCOARzzh/Y0Z3CEjQ
	3fB8NT8re6jbXbA1pMnOChw5FTrSkQ1FfcLzIhS510jTHcKO6z0tFu/K9PF4ffIrAyqOMAOb6jKJd
	cgLkgtOA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFY8-0000000CD2c-2YA2;
	Tue, 02 Jun 2026 03:12:16 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Harry Wentland <harry.wentland@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	Ivan Lipski <ivan.lipski@amd.com>,
	Dan Wheeler <daniel.wheeler@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] kdoc: xforms: ignore special static/inline macros
Date: Mon,  1 Jun 2026 20:12:13 -0700
Message-ID: <20260602031214.2817411-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90434-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,infradead.org:mid,infradead.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7C917627991
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c contains 7 (for
now) functions that use STATIC_IFN_KUNIT or INLINE_IFN_KUNIT macros for
function qualifiers (static or not, inline or not).

These cause parse warnings from kernel-doc:
Invalid C declaration: Expected identifier in nested name, got keyword:
  struct [error at 29]
STATIC_IFN_KUNIT const struct drm_color_lut * __extract_blob_lut (const
  struct drm_property_blob *blob, uint32_t *size)

Handle these in kernel-doc to prevent multiple warnings.

Fixes: 647d1fd04652 ("drm/amd/display: Add KUnit test for color helpers")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Ivan Lipski <ivan.lipski@amd.com>
Cc: Dan Wheeler <daniel.wheeler@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org

 tools/lib/python/kdoc/xforms_lists.py |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20260601.orig/tools/lib/python/kdoc/xforms_lists.py
+++ linux-next-20260601/tools/lib/python/kdoc/xforms_lists.py
@@ -104,6 +104,8 @@ class CTransforms:
         (CMatch("__context_unsafe"), ""),
         (CMatch("__attribute_const__"), ""),
         (CMatch("__attribute__"), ""),
+        (CMatch("STATIC_IFN_KUNIT"), ""),
+        (CMatch("INLINE_IFN_KUNIT"), ""),
 
         #
         # HACK: this is similar to process_export() hack. It is meant to

