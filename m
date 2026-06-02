Return-Path: <linux-doc+bounces-90555-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2K3wE4QOH2o5ewAAu9opvQ
	(envelope-from <linux-doc+bounces-90555-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 19:10:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E68BD6308BB
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 19:10:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Vgo5MSpd;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90555-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90555-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1557A3080E69
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 17:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4CA3F39FB;
	Tue,  2 Jun 2026 17:06:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AAF3EDE7D;
	Tue,  2 Jun 2026 17:06:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419991; cv=none; b=QxHqq1Y6BYKE+pBd0hiyJ7zPKhLng/aKbssN2tolCPK1nf5xEqUTLXGYqanRFoDIGaVB4xdiZ+ULxYqNri7WWFx7tis9WiUYL6Zwv4VTwrCEVkRuEc18qSX784oxF8s1K5KoutKu+YNNMbkAURQggJVw+Jh61+4Y9ztfQBfEsiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419991; c=relaxed/simple;
	bh=byyupzdxxdd2pvtAWbSSc2h4bzNgnqk18bDo+TJptXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=amORoNZI3EUWfgIxRcc59DEU/45hnUoHreqZB62qXkwEUDPeVM0lEI+uLPmpSq5TgCQp+Aj3zE1f2U2Jd9JEmh5Jrgv0gAqjXMYOZu4Twfv6PjlMOeRqKgv0RytbtNa6uTyDmUuGc82SDrfV6D6p6opblL4Gqxi8CJHVNNoFl7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vgo5MSpd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DDD1F00893;
	Tue,  2 Jun 2026 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780419989;
	bh=0ukUSWAZT5k7G7XbzmUvOStOIMgWiMG+ApVUWmOXYOU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Vgo5MSpd5rLUICJbwSXXMHlNmtOE98kKio8rRf5wUvLCLyHS64u01h5uZF23YS35Y
	 ul23hEGvUhCtar+qiJ8TDD0D/rb//t/aJ5trAIHCY70bhUOKdEuH+hRiD8YDcjiWZT
	 dTHQQnx0Olyuc2ChrMBZn+VGnoUSWkc8GoSr5jw/RXHv8bo1SMy1jEUdLuU52Nibei
	 khBSic3ISmOTQ7SYPfSHyNNnjeHN8cbs3C6YSjFY4eeCU4lWx9JihATLPpPW3ytYgL
	 jAPs1BmEuxsiiYf8dHovSR7nOwG1R7v6QZgPCsEH6zfrWECQAgq5NchWuIbFMdEexY
	 JhISPenXLwOVg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  skhan@linuxfoundation.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  corbet@lwn.net,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH v5 08/13] liveupdate: defer session block allocation and
 PA setting
In-Reply-To: <20260602031717.197696-9-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Tue, 2 Jun 2026 03:17:12 +0000")
References: <20260602031717.197696-1-pasha.tatashin@soleen.com>
	<20260602031717.197696-9-pasha.tatashin@soleen.com>
Date: Tue, 02 Jun 2026 19:06:25 +0200
Message-ID: <2vxzv7c0dg8e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90555-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:pasha.tatashin@soleen.com,m:linux-kselftest@vger.kernel.org,m:rppt@kernel.org,m:shuah@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:dmatlack@google.com,m:kexec@lists.infradead.org,m:pratyush@kernel.org,m:skhawaja@google.com,m:graf@amazon.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,soleen.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E68BD6308BB

On Tue, Jun 02 2026, Pasha Tatashin wrote:

> Currently, luo_session_setup_outgoing() allocates the session block and
> sets its physical address in the header immediately. With upcoming
> dynamic block-based session management, this makes the first block
> different from the rest. Move the allocation to where it is first needed.
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  include/linux/kho_block.h        | 22 +++++++++++
>  kernel/liveupdate/luo_core.c     |  4 +-
>  kernel/liveupdate/luo_internal.h |  2 +-
>  kernel/liveupdate/luo_session.c  | 68 ++++++++++++++++++++------------
>  4 files changed, 67 insertions(+), 29 deletions(-)
>
> diff --git a/include/linux/kho_block.h b/include/linux/kho_block.h
> index 505bf78409f2..0a8cda2cbfb5 100644
> --- a/include/linux/kho_block.h
> +++ b/include/linux/kho_block.h
> @@ -70,6 +70,28 @@ int kho_block_set_restore(struct kho_block_set *bs, u64 head_pa);
>  void kho_block_set_destroy(struct kho_block_set *bs);
>  void kho_block_set_clear(struct kho_block_set *bs);
>  
> +/**
> + * kho_block_set_head_pa - Get the physical address of the first block header.
> + * @bs: The block set.
> + *
> + * Return: The physical address of the first block header, or 0 if empty.
> + */
> +static inline u64 kho_block_set_head_pa(struct kho_block_set *bs)
> +{
> +	return bs->head_pa;
> +}
> +
> +/**
> + * kho_block_set_is_empty - Check if the block set has no allocated blocks.
> + * @bs: The block set.
> + *
> + * Return: True if there are no blocks in the set, false otherwise.
> + */
> +static inline bool kho_block_set_is_empty(struct kho_block_set *bs)
> +{
> +	return list_empty(&bs->blocks);
> +}
> +

Are these intended to be here or should they go in patch 7?

>  void kho_block_it_init(struct kho_block_it *it, struct kho_block_set *bs);
>  void *kho_block_it_reserve_entry(struct kho_block_it *it);
>  void *kho_block_it_read_entry(struct kho_block_it *it);
[...]

-- 
Regards,
Pratyush Yadav

