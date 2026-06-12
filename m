Return-Path: <linux-doc+bounces-92246-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ZrVKP+ZLGqTTgQAu9opvQ
	(envelope-from <linux-doc+bounces-92246-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 01:45:03 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C9767D141
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 01:45:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=gZt+NKjA;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92246-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92246-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 894D1300D77C
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 23:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE22331ED6;
	Fri, 12 Jun 2026 23:45:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BBA33F5BF
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 23:44:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781307901; cv=none; b=fkIjjG2w1EnJn555VFYvxpoF0LlBx5DalAvJ2pQ8pdL5CrDPn5wPg2FvSI8qi6W5dIje8jEPua+CpXqe+lZpvhaSxGYqfF0AVNWOyL9rsQBSJ9veYIh/R6b0mI0724jDZyYR61qqgFcxSoLqwKYmU2pphi33Co5el3elcSJjCN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781307901; c=relaxed/simple;
	bh=iCo2373DNYWqzXVExFS1qh557JYf6/r+Hoo43HQH+D0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uL6X/vwDqPAvOdq1Jpxd20TBBMR7fUJufIQD8Wn4O3f/dBbVJgDKdon9FdlOF/uMdUizlOKJzckoSoajChzmVr/iQZJR1Y6lKEJ5S+xv3gvK6nJ++kLj152GL5fKzAy/zr/Ehu/tpaDiYPogud1089QxhQ9S6O4vLtY10aSSLeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gZt+NKjA; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=OaR4szg3hTCiTSjz207EtEIC5B9GahQqwiezvnSwekU=; b=gZt+NKjA02f2IwzEh1KqPiNI3z
	7kB/IBN88yXBAS+YORdUcKqI4JV4hrwNU4EJSCMNsHJ+TUhmvBS4nAllInDsZJDicijfwSWzdeCFh
	87Pd2fM9hshftE+zKqLOIdNTTvZ60AjlsJZsr/BI2qQfc/+Dsbq1WvAJ11s2pqkS8DMgkwYXFyTSC
	UT2BXRTZ0jx3O+4gXzioYD1Pgyy+i26LPyjQsHZH8CPMxFcqJ34GoBV/bVFhnbbeN5VqUbNZ2weBi
	MsDKC4qcoSuop9vmrUj48J4FeQCnHa0ZoYmAGUOpIa+Rc3QZWCX6KGUvWi/EdPoHhaLRMAnL2tZlf
	N2hMThsg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYBYY-0000000BlyE-3O9Y;
	Fri, 12 Jun 2026 23:44:58 +0000
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
Subject: [PATCH v2] kdoc: xforms: ignore special static/inline macros
Date: Fri, 12 Jun 2026 16:44:56 -0700
Message-ID: <20260612234458.1084156-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92246-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:linux-doc@vger.kernel.org,m:rdunlap@infradead.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mchehab@kernel.org,m:harry.wentland@amd.com,m:alex.hung@amd.com,m:ivan.lipski@amd.com,m:daniel.wheeler@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:amd-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,amd.com:email,infradead.org:dkim,infradead.org:email,infradead.org:mid,infradead.org:from_mime,lists.freedesktop.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41C9767D141

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
v2: drop an unsubmitted patch so that this one applies with no problem

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

--- linext-2026-0610.orig/tools/lib/python/kdoc/xforms_lists.py
+++ linext-2026-0610/tools/lib/python/kdoc/xforms_lists.py
@@ -102,6 +102,8 @@ class CTransforms:
         (CMatch("__no_context_analysis"), ""),
         (CMatch("__attribute_const__"), ""),
         (CMatch("__attribute__"), ""),
+        (CMatch("STATIC_IFN_KUNIT"), ""),
+        (CMatch("INLINE_IFN_KUNIT"), ""),
 
         #
         # HACK: this is similar to process_export() hack. It is meant to

