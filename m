Return-Path: <linux-doc+bounces-96894-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wdXeNf4QV2pBEwEAu9opvQ
	(envelope-from <linux-doc+bounces-96894-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 06:47:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4AE75A840
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 06:47:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96894-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96894-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=zte.com.cn (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC1513048A09
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 04:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BB337E300;
	Wed, 15 Jul 2026 04:47:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AF1352009;
	Wed, 15 Jul 2026 04:47:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784090876; cv=none; b=W0A6bY3RxysdgLOVF8HgTtfaebVheIwMNg1OqW/VpS/IWZzQIi0sepkbUDRW+o1YIWiMz5AOhv6j8a2dIxuSGhNZluxht5W7RJWY7m0CT6yLYGP2wChz/aaFkvckYWhyjOADaTXVSOg5YvLfsABbfGvJU0qtoBMAIEMURw/A7oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784090876; c=relaxed/simple;
	bh=/mJ/L1nC8Anu3GtDjHiV8GRZA7nBQOxhMaVnH8zkw88=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=kF1ITsRMNroIpIxH5ZtEJX0ZgmDI/EsXlhCQVxZW6OeIt1/19+PrP2p55ZRbmt+mODP0+YuuG6RfhIicQiINloEdBVdSNxyIRf9RM4M8fTWx+FwXaAxYhI7EzzjUdIS14Itc24bvROASaSlJRoVAX5vHDzAp4A67n5VQLsC13Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4h0Nvf39BXz52SFw;
	Wed, 15 Jul 2026 12:47:42 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 66F4ldX9039071;
	Wed, 15 Jul 2026 12:47:39 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 15 Jul 2026 12:47:40 +0800 (CST)
X-Zmail-TransId: 2afa6a5710ec650-0f8a8
X-Mailer: Zmail v1.0
Message-ID: <20260715124740929HC7tDDb2SK3kRxbuPruHd@zte.com.cn>
Date: Wed, 15 Jul 2026 12:47:40 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>
Cc: <corbet@lwn.net>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <xu.xin16@zte.com.cn>,
        <wang.yaxin@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyIDAvM10gdG9vbHMvYWNjb3VudGluZzogcmVmYWN0b3IgZGVsYXkgZmllbGRzIGFuZCBzaGFyZSBmb3JtYXRfdGltZXNwZWMoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 66F4ldX9039071
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 15 Jul 2026 12:47:42 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A5710EE.001/4h0Nvf39BXz52SFw
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.64 / 15.00];
	SUBJ_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[zte.com.cn : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:fan.yu9@zte.com.cn,m:yang.yang29@zte.com.cn,m:corbet@lwn.net,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:xu.xin16@zte.com.cn,m:wang.yaxin@zte.com.cn,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-96894-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[wang.yaxin@zte.com.cn,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wang.yaxin@zte.com.cn,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F4AE75A840

From: Wang Yaxin <wang.yaxin@zte.com.cn>

- Convert per-field delay members in struct task_info to an array indexed
  by enum delay_type, eliminating offsetof() pointer arithmetic.

- Factor out a common format_timespec() implementation shared by getdelays
  and delaytop, using strftime for cleaner timestamp formatting.

- Replace the complex sizeof/ULL/shift Y2038 guard with a direct narrowing
  truncation check ((long long)time_sec != ts->tv_sec).

Change Log
==========
v1->v2:
Only update patch 2/3 according to the suggestion:
https://sashiko.dev/#/patchset/20260711173112482SCQEM08VED2PT1pxUYOXk@zte.com.cn

1. tools/include/uapi/linux/time_types.h: expand stub to full set of
  6 structs from kernel UAPI to avoid shadowing system header
2. tools/accounting/Makefile: add $(LDFLAGS), $(LDLIBS), $(CPPFLAGS)
  to restore compatibility with standard build variables

Wang Yaxin (3):
  delaytop: refactor repetitive delay fields into array with enum
  tools/accounting: factor out shared format_timespec() implementation
  tools/accounting: simplify 32-bit time_t overflow check in
    format_timespec()

 tools/accounting/Makefile             |  12 +-
 tools/accounting/delaytop.c           | 261 +++++++++-----------------
 tools/accounting/format_timespec.c    |  37 ++++
 tools/accounting/format_timespec.h    |   9 +
 tools/accounting/getdelays.c          |  32 +---
 tools/include/uapi/linux/time_types.h |  46 +++++
 6 files changed, 197 insertions(+), 200 deletions(-)
 create mode 100644 tools/accounting/format_timespec.c
 create mode 100644 tools/accounting/format_timespec.h
 create mode 100644 tools/include/uapi/linux/time_types.h

-- 
2.27.0

