Return-Path: <linux-doc+bounces-91853-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NbYOJEFwKWqvWwMAu9opvQ
	(envelope-from <linux-doc+bounces-91853-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 16:10:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81466A1F9
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 16:10:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bRtHvAXo;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91853-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91853-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42ED430E9D4D
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 14:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FC333120A;
	Wed, 10 Jun 2026 14:02:27 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D198231A23;
	Wed, 10 Jun 2026 14:02:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100147; cv=none; b=GEGrZYg1pdFyec48lWwBFs1iamoHH4Z7tXe/mQh2bUIOVWbPHdJg8HmVK2Q7Gh+ithKnVIow2SYNkCtpWiKSsQ9prexMHHv/HyHMQ3CM03gqAQBBTw+Jg7AfKxL/ijfxSuOkt+zMvCTINtt8YC5LaHlyWl66EruuYCUkzQZRzzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100147; c=relaxed/simple;
	bh=F3XfSddtxoKja8HU5dC27AlxrWarHb8F2+GYeSpqugM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=El+tu9lb5XiOA4cmcwCWpLclcmHPTNAOS8XDtvKiXVA6o7p5ZosDOks3VnUyflLnbJ9YbuQ8/Y3FOXFGoOQUD/OweT2cp0oLXOdZnXFqrmu2O4iafDiD0LZrPadhZePsxx6sZTRr+xo0tX8it3x0zyEJC3TkZHaCpCmBBWlKRzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRtHvAXo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3131B1F00893;
	Wed, 10 Jun 2026 14:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781100146;
	bh=kuSmwGv7M+HksYo1sSLXZGpleDXHiSTOXzJAy0Yn9NU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bRtHvAXofUN/bHMnFNyeLYvbtY2fqUAlw6qCSwASZSLvtXYAFhhF8Vn1DNQ0Cahgo
	 uF6jFNlMHncw5BRQhEl9VaM/VNceaIEo8/iKKY5eZw77YSfajtexO5ODjyR5p6J5zQ
	 OF0fFTE0dSYIaz/V9QXi2iUk4YYAu1Bzo1p8DAX7DXZhP6nymmK6QuD177j0fJeXh/
	 vuGRJYo/oT90IY4oUz5DNYWeI7NCxHRka/qMppIP7L+13+ZQ0E0/iZonlC+spi2Zfc
	 UB4kUi8bFlVE5KeTM+RPjCn390JzZs+B794BTMpNTcQSYSLjnnMcgEdQ90p+iJg7tQ
	 G0KnDIFLM1HvQ==
From: SeongJae Park <sj@kernel.org>
To: Doehyun Baek <doehyunbaek@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] Docs/{admin-guide,mm}/damon: fix DAMON documentation details
Date: Wed, 10 Jun 2026 07:02:17 -0700
Message-ID: <20260610140217.65110-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610053951.553739-1-doehyunbaek@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:doehyunbaek@gmail.com,m:sj@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:damon@lists.linux.dev,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-91853-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB81466A1F9

On Wed, 10 Jun 2026 05:39:50 +0000 Doehyun Baek <doehyunbaek@gmail.com> wrote:

> Fix minor DAMON documentation issues.  Correct the sysfs scheme file name
> apply_interval_us, the DAMON_STAT module count, a malformed reference, a
> misplaced label indentation, and a few typos.

Nice catches, thank you for fixing those!

> 
> Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>

Reviewed-by: SeongJae Park <sj@kernel.org>

I applied  this patch to damon/next [1] tree.  We are now quite close to next
merge window.  We (mm community) want to focus on making mm.git more stabilized
and therefore ready for the next merge window, rather than adding more changes
that are not really urgent.  I understand this patch is not really urgent.
Hence, Andrew might not add this patch to mm.git until next -rc1 release.  In
the case, I will request that after next -rc1 release.  So, no action from your
side is needed for now.  Let me know if you think this is really urgent or I'm
missing something, though.

[1] https://origin.kernel.org/doc/html/latest/mm/damon/maintainer-profile.html#scm-trees


Thanks,
SJ

[...]

