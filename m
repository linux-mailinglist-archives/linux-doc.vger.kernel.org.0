Return-Path: <linux-doc+bounces-84784-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGFuL/J472n9BgEAu9opvQ
	(envelope-from <linux-doc+bounces-84784-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 16:55:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDE7474C15
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 16:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EB31305863E
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 14:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0539A36E468;
	Mon, 27 Apr 2026 14:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYMuM5TF"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C683A9D8B;
	Mon, 27 Apr 2026 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301365; cv=none; b=k1yaMvrwTcgBaa18dCfWoxfx6wptxgrsY/gWWgNVZh7NzwHFRRH0607CvrFLJXJ4uhtjV05cwUNutUZtXNP/nYvygOQMckYKSi6p8FGuQI4p8dGlLBE4NYuvjzsCROYwTHLT20cqye/BjHis42Yu/NqS2NnvcvydBFezT3V5lh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301365; c=relaxed/simple;
	bh=Pie6H9kqpjFwLcPtbrm+7WML7Q1A98k1SS00JCWV22g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxnnwlU6khcadKJTA/3yq+Qmho7mW9miki8NwU259a03SXEXce7+JTUZprwJCEUBBJyuv5oudHEhhOHtjIvy4dVnHHnldxdXT0asjCcrcUIRWsQOC0JYgnKu2hVIJy18zhpGV4HIGWdDRUaxPeMADJFLR03ZTfHeMv5UAyqdzHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYMuM5TF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F271AC19425;
	Mon, 27 Apr 2026 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777301365;
	bh=Pie6H9kqpjFwLcPtbrm+7WML7Q1A98k1SS00JCWV22g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SYMuM5TFKXTJ6aCxcFBt93wMfV9JuHwsLvhTYblz2FPcqf2pCbAtc6mF0vovH3sRO
	 d97a2kliIigXgAOmBV1dSVNdDki1NFxWsNx+br6CEN+P0r+v05nmfz2D1jm/qwqN/g
	 Bka0Kb68aOjHfApRXOEcOhdBIJihZW1JaIew4Lt438T6le8Qz1kfzUcvtCaTxYwAU0
	 i6PZdY9fgU9hnZZkI2JA4uFJ+ubmpwm87J26kiNfT6gqVD9x6RetS80mVUpbgZPr5I
	 2fPEig6U/gMRQ0xU/ImslkSjgwwSG0pjh+EhuI0QsemcInFfMjxs4kSHuJvBwFqozo
	 g22bxt4NjwXeg==
From: SeongJae Park <sj@kernel.org>
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com
Subject: Re: [PATCH v9.1] mm/damon: add node_eligible_mem_bp goal metric
Date: Mon, 27 Apr 2026 07:49:13 -0700
Message-ID: <20260427144914.112106-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427010209.843-1-ravis.opensrc@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1EDE7474C15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84784-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,kvack.org,vger.kernel.org,linux-foundation.org,lwn.net,gmail.com,micron.com,sk.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Sun, 26 Apr 2026 18:02:09 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:
[...]
> +static phys_addr_t damos_calc_eligible_bytes(struct damon_ctx *c,
> +		struct damos *s, int nid, phys_addr_t *total)
> +{
> +	struct damon_target *t;
> +	struct damon_region *r;
> +	phys_addr_t total_eligible = 0;
> +	phys_addr_t node_eligible = 0;
> +
> +	damon_for_each_target(t, c) {
> +		damon_for_each_region(r, t) {
> +			phys_addr_t addr, end_addr;
> +
> +			if (!__damos_valid_target(r, s))
> +				continue;
> +
> +			/* Convert from core address units to physical bytes */
> +			addr = (phys_addr_t)r->ar.start * c->addr_unit;
> +			end_addr = (phys_addr_t)r->ar.end * c->addr_unit;
> +			while (addr < end_addr) {
> +				struct folio *folio;
> +				phys_addr_t folio_start, folio_end;
> +				phys_addr_t overlap_start, overlap_end;
> +				phys_addr_t counted;
> +
> +				folio = damon_get_folio(PHYS_PFN(addr));
> +				if (!folio) {
> +					addr = PAGE_ALIGN_DOWN(addr + PAGE_SIZE);
> +					continue;
> +				}

Sashiko found this could result in an infinite loop if 'addr + PAGE_SIZE'
overflows.  The probability is quite low, but could we fix this?  Maybe like
below?

'''
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2349,7 +2349,10 @@ static phys_addr_t damos_calc_eligible_bytes(struct damon_ctx *c,

                                folio = damon_get_folio(PHYS_PFN(addr));
                                if (!folio) {
-                                       addr = PAGE_ALIGN_DOWN(addr + PAGE_SIZE);
+                                       addr = PAGE_ALIGN_DOWN(addr +
+                                                       PAGE_SIZE);
+                                       if (!addr)
+                                               break;
                                        continue;
                                }
'''

Ravi, could you please post one more version (maybe v9.2) with the abive fix if
it looks good to you?

[1] https://lore.kernel.org/20260427012429.D25C2C2BCAF@smtp.kernel.org


Thanks,
SJ

[...]

