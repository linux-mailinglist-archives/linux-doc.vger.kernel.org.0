Return-Path: <linux-doc+bounces-91183-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j9NbCNZvI2rltwEAu9opvQ
	(envelope-from <linux-doc+bounces-91183-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 02:54:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F03B64C0D8
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 02:54:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nvLlx+JX;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91183-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91183-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73B5E301DE23
	for <lists+linux-doc@lfdr.de>; Sat,  6 Jun 2026 00:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA2A1A9F96;
	Sat,  6 Jun 2026 00:54:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578271C2AA;
	Sat,  6 Jun 2026 00:54:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780707282; cv=none; b=RTvceZSwlQUvt3j2CgsbOMATO8iklkPcH63NrEriZyAHvReSB8Xn1d8g/U+o2nEzBPxvJiIGFkgJlvOOvs1s7YRYoKq6GRiKTWu+0nFG3DdTBv0HDAj7KT8RKDanlgY3C0OGY14/A1x6RkpJ5JcqcnMPEY+NmunHurLfIYMQKJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780707282; c=relaxed/simple;
	bh=SB+F5ry8r+8f9HZaAHfxQpdjMLgcjYruesr+UbHTpO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKdCQNhXWmw9WBeR2oEJRNeHR53B2QNF7zR+3BhQCysr31BJZXvNeXLN8265MsSh40QTwG+ozGhyTOCI4avIBemRxqoV+knSwuw3jrOOaZRgeC99vWFfnq64c3B0HWorJTDDDPpaysFjofKl6wr9olIfPc4IasHuWVtoongjaBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvLlx+JX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160A51F00893;
	Sat,  6 Jun 2026 00:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780707281;
	bh=bazsBwZAqXEpICcoFUWoIJvMdHrXGA7lTnnh4WSjPGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nvLlx+JXPMuOfA7Efk8lfmz0Wv93vn7jXgI+HQEq113UtqBFcb/gZip6Qi/Q/of91
	 pJKgdBlQGU8pKabFx7bzsn9GmM8xMqHgs6+BXxZsRPkSTTh9ownIcxYO1fcX8jBTS5
	 HbAF5BBlHwXil7CtDIi37axnnhhE799MEbhqz8bblYIpdb5dNv7dmSI0zMkP88D7q6
	 T+d/Lu+//IrDhyVHDgk+Gd43yYPlPPEghzMSYC/6UOlwD+2Y+USiOL8U5CpcW3QW6f
	 2MCib+KAUEsn8m33Gk5v8Z/1guRrPooOPS6B4lackZR1Vx7fKe0EpFmyOkhxUgccsC
	 P3HANo7QAA8QQ==
From: SeongJae Park <sj@kernel.org>
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Lian <lianux.mm@gmail.com>
Subject: Re: [PATCH] Docs/damon: add TLB flush policy document
Date: Fri,  5 Jun 2026 17:54:31 -0700
Message-ID: <20260606005431.89186-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260605031008.397328-1-kunwu.chan@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91183-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:kunwu.chan@gmail.com,m:sj@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:damon@lists.linux.dev,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lianux.mm@gmail.com,m:kunwuchan@gmail.com,m:lianuxmm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,infradead.org,google.com,suse.com,lwn.net,linuxfoundation.org,lists.linux.dev,kvack.org,vger.kernel.org,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,damonitor.github.io:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F03B64C0D8

Hi Kunwu and Lian,

On Fri,  5 Jun 2026 11:10:08 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrote:

> From: Kunwu Chan <kunwu.chan@gmail.com>
> 
> DAMON avoids TLB flushes after clearing PTE Accessed bits for sampling.
> The overhead was measured and found significant [1].  Production
> workloads with large working sets flush TLB buffers naturally, so
> accuracy impact is negligible.
> 
> On systems with large TLB buffers and small test workloads, stale TLB
> entries persist across sampling intervals and produce false negatives.
> This comes up repeatedly on the mailing list and in private inquiries
> [2][3].
> 
> Add a document on the design decision, trade-offs, test environment
> problems, and recommendations.
> 
> Link: https://lore.kernel.org/20200403103059.12762-1-sjpark@amazon.com [1]
> Link: https://lore.kernel.org/20260117020731.226785-3-sj@kernel.org [2]
> Link: https://lore.kernel.org/all/20260526145034.91594-1-sj@kernel.org [3]

Thank you for this great patch!

> 
> Co-developed-by: Wang Lian <lianux.mm@gmail.com>
> Signed-off-by: Wang Lian <lianux.mm@gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> ---
>  Documentation/mm/damon/index.rst     |   1 +
>  Documentation/mm/damon/tlb_flush.rst | 131 +++++++++++++++++++++++++++
>  2 files changed, 132 insertions(+)
>  create mode 100644 Documentation/mm/damon/tlb_flush.rst
> 
> diff --git a/Documentation/mm/damon/index.rst b/Documentation/mm/damon/index.rst
> index 318f6a7bfea4..5e239437dab3 100644
> --- a/Documentation/mm/damon/index.rst
> +++ b/Documentation/mm/damon/index.rst
> @@ -19,6 +19,7 @@ DAMON is a Linux kernel subsystem for efficient :ref:`data access monitoring
>  
>     faq
>     design
> +   tlb_flush
>     api
>     maintainer-profile
>  
> diff --git a/Documentation/mm/damon/tlb_flush.rst b/Documentation/mm/damon/tlb_flush.rst
> new file mode 100644
[...]

Great document!  That said, it feels like a good complete article or a paper,
rather than DAMON documentation that pursue to be short and essential.  I feel
like this fit more to be published in a blog like DAMON project blog [1], or
news site like LWN.  If you'd like to, please feel free to upload a PR or send
patch for DAMON project blog source [2].

Mainly due to the verbosity, as I above mentionedd, I'm not sure if the current
shape of this patch is the best to be merged as is.  I also find the background
part of the document is a kind of duplicate of some information in design.rst.
What about putting only essential information in a condensed way on the
design.rst?

[1] https://damonitor.github.io/site_about
[2] https://github.com/damonitor/damonitor.github.io/tree/master/blog_src


Thanks,
SJ

[...]

