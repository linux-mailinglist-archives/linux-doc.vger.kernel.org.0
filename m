Return-Path: <linux-doc+bounces-92250-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MMX2CfOjLGrRUAQAu9opvQ
	(envelope-from <linux-doc+bounces-92250-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 02:27:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B9367D492
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 02:27:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Q220K7Iy;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92250-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92250-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C33C32E05CE
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 00:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7746A1DDC1B;
	Sat, 13 Jun 2026 00:22:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DB81C860C;
	Sat, 13 Jun 2026 00:22:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781310137; cv=none; b=YWe3V3ffwqc33pPEDBIHVWHDOiYHv3x4onavCp+j2SVad8hk9ezbd+InDd0B9pdlyedUG2FulAUJOLt4nkAYNkvectI961M6AX9ujHxRBZXvGEDG2s2ruf/HhzTV2LTexBrvDA06Q/fGILWP+gTWKuxnHyRqMqnYs4b+KMJHZMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781310137; c=relaxed/simple;
	bh=THP6nCi9PYwer4Sr7Rv2EwEJa5ewA4YzZ6aqwBa1Mfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3MwzGgnqlFQIZGfSlDmU4pYh+oDB7FJu5gGgFGs3MHsEw1IhEuuqpccaf6cJIqQk+gGu5MVfhpuWTifH6XUlssHGjNcdJN6QrH2zMqhip6ZvPdfu2IWb5Z1zzf7pAQGEuUih69FF7OOLmxMCR1B4UM0hyRZAjASfTafENT+/OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q220K7Iy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC041F000E9;
	Sat, 13 Jun 2026 00:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781310136;
	bh=rgplnA+llGUVWp3gFIQNrGhQpQLdVeMIm1AEKwpWjRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q220K7Iy8wFQmyUhyBCCdv/fayfubm5a7CIE4/5PObfAA/WU1e1xOqUDx0VwaaAg6
	 jpxHAdlDo4giFRoHthXnNq2b+OoYgI68fbp6mUUG9TK+oftRf+FuJIxD4h7lVZVqMO
	 D+FSYd5pBWk+JOPgWSrdP01rFmtSKXfFKxACcb4gErSzZ8/ZQ3a7DIvKtcC8UBUN0u
	 u1C7Q7RwBNjRfuxTW55JMd34rEUL1AUXS7NQo2wDrwF1r9qSoN5vbANI8KC2Ejw1BB
	 JHYkkT2xYLoUwNEhjC2Q9E4i6QI9rjLfFSzn3+ufoDWVrdIg32Xk4rXO4zj4+81TT6
	 ITaAnvn/CywYw==
From: SeongJae Park <sj@kernel.org>
To: lirongqing <lirongqing@baidu.com>
Cc: SeongJae Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usama.arif@linux.dev>
Subject: Re: [PATCH v3] mm/mempool: Untangle CONFIG_SLUB_DEBUG_ON abuse and switch to static key
Date: Fri, 12 Jun 2026 17:22:06 -0700
Message-ID: <20260613002207.1198-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260604110318.2089-1-lirongqing@baidu.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92250-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lirongqing@baidu.com,m:sj@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:vbabka@kernel.org,m:harry@kernel.org,m:akpm@linux-foundation.org,m:hao.li@linux.dev,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:willy@infradead.org,m:usama.arif@linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,vger.kernel.org:from_smtp,linux.dev:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-foundation.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86B9367D492

On Thu, 4 Jun 2026 19:03:18 +0800 lirongqing <lirongqing@baidu.com> wrote:

> From: Li RongQing <lirongqing@baidu.com>
> 
> The mempool subsystem historically wrapped its debugging logic inside an
> merely defines compile-time defaults for SLUB and caused two flaws:
> 
> 1. On production kernels where CONFIG_SLUB_DEBUG=y but
>    CONFIG_SLUB_DEBUG_ON=n, mempool debugging was completely compiled out
>    at compile time.
> 2. On kernels with CONFIG_SLUB_DEBUG_ON=y, mempool debugging stayed active
>    even if a user explicitly disabled slub debugging at boot time.
> 
> Clean up this mess by removing the #ifdef and switching to a runtime static
> key (mempool_debug_enabled), allowing mempool debugging to be toggled
> cleanly via its own boot parameter.

Makes sense to me.

> 
> Suggested-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Harry Yoo <harry@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Hao Li <hao.li@linux.dev>
> Cc: Christoph Lameter <cl@gentwo.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Roman Gushchin <roman.gushchin@linux.dev>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Usama Arif <usama.arif@linux.dev>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]

