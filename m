Return-Path: <linux-doc+bounces-94591-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id axh8NNFgRmrISAsAu9opvQ
	(envelope-from <linux-doc+bounces-94591-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 15:00:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B426F80A6
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 15:00:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=zte.com.cn (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94591-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94591-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 334FE3031CA6
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 12:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325E348B362;
	Thu,  2 Jul 2026 12:57:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048548B372;
	Thu,  2 Jul 2026 12:57:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997043; cv=none; b=ZVW+QEZ5u7m2tDXXDSn9GE74CQZPpZ5xF3QRS506gUvsXUFDKW9n8J02ahc7w+HezrDqdCW7QjnMoQAeg6vEzbQksbNofWW9nEpBGGO7wd+tWUvY6wnlL8PiHvemEOgxYWiOw7Meb2/1UlnaWY23WoSo81tmX5nFuL1Csc0dGZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997043; c=relaxed/simple;
	bh=e2CUiPwsFQzhse/XjSkwHAeMSJTGjBYL7oeWQicAi1M=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=G4F6+HSHVNUUiXvrDD0DRC5jUCfJml8tIufOqZh2ICrneTwxEDkKiDszPjxWi2e6Q0b4nvglOkwOQ78mGnrh+4c1Pr4NMH+Pp3/iQKDgFo7HLd73XVNenQIjWdU0KBplE5Qf3aSN1QHstjAp9ams4Q+/Z7VlOKt/coJqrqvcGyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4grcNP2P9Lz57KTp;
	Thu, 02 Jul 2026 20:57:09 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 662Cv1ds001426;
	Thu, 2 Jul 2026 20:57:01 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 2 Jul 2026 20:57:04 +0800 (CST)
X-Zmail-TransId: 2af96a466020718-537e2
X-Mailer: Zmail v1.0
Message-ID: <20260702205704180NZ3cu_QF04KfBIL6vjTHL@zte.com.cn>
Date: Thu, 2 Jul 2026 20:57:04 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDAvMyB2M10gZGVsYXl0b3A6IGFkZCBkZWxheSBtYXgsIHRpbWVzdGFtcCBhbmQgc29ydGluZyBmb3IgdG9wIGxhdGVuY3kgYW5hbHlzaXM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 662Cv1ds001426
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Thu, 02 Jul 2026 20:57:09 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A466025.000/4grcNP2P9Lz57KTp
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.69 / 15.00];
	SUBJ_EXCESS_BASE64(1.50)[];
	R_BAD_CTE_7BIT(1.05)[unknown,utf8];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[zte.com.cn : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wang.yaxin@zte.com.cn,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94591-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:fan.yu9@zte.com.cn,m:yang.yang29@zte.com.cn,m:corbet@lwn.net,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:xu.xin16@zte.com.cn,m:wang.yaxin@zte.com.cn,s:lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wang.yaxin@zte.com.cn,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,zte.com.cn:email,zte.com.cn:mid,zte.com.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02B426F80A6

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Previously delaytop only showed average delays. This patch adds:

1. delay_max fields to track the maximum delay value for each delay type
   (cpu, blkio, irq, swapin, freepages, thrashing, compact, wpcopy)
   per task.

2. The -t/--type option displays only the specified delay type with avg/max
   values side by side, allowing focused analysis:
     delaytop -t cpu    # Show only CPU delay with avg/max
     delaytop -t wpcopy # Show Copy-on-Write delay with avg/max

3. Wall-clock timestamp when each maximum delay occurred, displayed in the
   MAX_TIMESTAMP column when using -t/--type option. This enables:
   - Identifying the time when a process experienced an abnormal delay max
   - Correlating delay max across multiple processes at the same timestamp
   - Cross-referencing with logs, traces, or other metrics at that time

4. When using -t/--type option, tasks are sorted by maximum delay value in
   descending order (largest delay first), enabling quick identification of
   top N processes with highest delay spikes.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>

v2->v3:
[patch 1/3]
1. fix get_field_by_name() MODE_TYPE filter breaking --sort for non-type fields
2. zero-init stats struct and cap memcpy size in netlink response parsing
3. fix compare_tasks() count field read as unsigned long long for 32-bit safety
4. strcmp → offset-based access via field_desc.max_offset

[patch 2/3]
1. fix 32-bit time_t overflow check to use max representable value instead of (time_t)-1
2. fix gmtime() pointer aliasing by assigning timespec64 tv_sec to local time_t
3. dropped pre-2000 check; gmtime → localtime_r + stack struct tm

[patch 3/3]
1. fixed Y2038 overflow false negative in format_kernel_timespec()
2. switched to localtime_r() with stack `struct tm` for thread safety.
3. `field_delay_max_and_ts()` `max_ts` nullable; removed unused ts_scratch
4. `-t/--type` mode: hide `[o]sort` and `[M]memverbose`, show only `[q]quit`

Wang Yaxin (3):
  delaytop: add delay max for delaytop
  delaytop: add timestamp of delay max
  delaytop: sort by max delay to highlight top latency processes

 Documentation/accounting/delay-accounting.rst |  43 +++
 tools/accounting/delaytop.c                   | 286 +++++++++++++++---
 tools/accounting/getdelays.c                  |   5 +
 3 files changed, 296 insertions(+), 38 deletions(-)

-- 
2.25.1

