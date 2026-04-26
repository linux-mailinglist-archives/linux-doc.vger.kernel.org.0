Return-Path: <linux-doc+bounces-84652-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +tT8Ec2Z7mmHvwAAu9opvQ
	(envelope-from <linux-doc+bounces-84652-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 01:03:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A08A46B67A
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 01:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BBD0E3001A53
	for <lists+linux-doc@lfdr.de>; Sun, 26 Apr 2026 23:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3D62F8BF0;
	Sun, 26 Apr 2026 23:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlJWjHgt"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989B12459CF;
	Sun, 26 Apr 2026 23:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777244612; cv=none; b=UfxxWrRRtp4FdXjTFdoGACCYvKXBo+s2GdeV9P/TLJuLXuWXtxyZRPudtkF2n6M3ZUq4xzCnWBo4AIj+SnxlyTjnyVRaiOWMYiHehZAmaAxIRZ3mGWFgPDz3Kby/tzd7ofPvuMX6CTJU0wZ2treqL2qoyBBSUmXRbI07T3p/pAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777244612; c=relaxed/simple;
	bh=Pssmh29rua0G3vOV364oBo0PTZnVdOappMtfzOGeM9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNmuuqRk2MvNDvCS5TbE7nPGEb3TLH/+3BsjsikTaAB6cK8BUszYqYrgTUjsfU/KIcSCS/O59LvJyd3CvF2DDLtDdJIREMJ8zpaO7ftOCj59DSVi0FmbdR2kPDhIVF8S2dc7aYRigfStXMHaq6BjBbcl6/L/aJBjARAbL6FzyF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlJWjHgt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CB1C2BCAF;
	Sun, 26 Apr 2026 23:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777244612;
	bh=Pssmh29rua0G3vOV364oBo0PTZnVdOappMtfzOGeM9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YlJWjHgty3V7f+TFjCTTSoMO9eVq3QxibsfL3USNcWt+m+mQAw0V8oHOQzF0NPdmx
	 E2JVEskMw3+0fcgpc/QzkABNkw7Oc7NFMr9C3iSy25Mb2/V1YLUIvv3NlhnEJlNQWA
	 zDfMnJxeNCWoPFUfrmoF6v/dyU7TuuXs4Abuq6u+GH8gtF1qivbcte7fnARGBTkAQd
	 Y5YxBmUkfsRFqdtGX3hLjg5ED4NV8p0RinkPlujKnO3XOJf7G6kmudkV9GuvdR20Va
	 1XlX14eFJWaUwyp4+9Ib6VuwoXDZPyevcvENziMot7yITaYyKgpl34QUguPdS3oqvI
	 HWV0rdIX11X3w==
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
Subject: Re: [PATCH v9] mm/damon: add node_eligible_mem_bp goal metric
Date: Sun, 26 Apr 2026 16:03:21 -0700
Message-ID: <20260426230322.106206-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260426213859.1835-1-ravis.opensrc@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3A08A46B67A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84652-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

[...]
> Changes since v8:
> =================
> https://lore.kernel.org/linux-mm/20260426003245.2687-1-ravis.opensrc@gmail.com/
> 
> - Removed unnecessary casts in mult_frac() call to fix potential
>   divide-by-zero on 32-bit PAE systems (Sashiko/SJ review)
> - Kept original parameter name 'ctx' in damos_set_effective_quota()
>   to avoid unnecessary diff (SJ review)
[...]
> +static unsigned long damos_get_node_eligible_mem_bp(struct damon_ctx *c,
> +		struct damos *s, int nid)
> +{
> +	phys_addr_t total_eligible = 0;
> +	phys_addr_t node_eligible;
> +
> +	if (c->ops.id != DAMON_OPS_PADDR)
> +		return 0;
> +
> +	if (nid < 0 || nid >= MAX_NUMNODES || !node_online(nid))
> +		return 0;
> +
> +	node_eligible = damos_calc_eligible_bytes(c, s, nid, &total_eligible);
> +
> +	if (!total_eligible)
> +		return 0;
> +
> +	return mult_frac(node_eligible, 10000, total_eligible);
> +}

Sashiko found [1] this can cause __udivdi3 linking issue on 32bit machine with
CONFIG_PHYS_ADDR_T_64BIT.  Seems that is correct to me.  I believe below
attaching fixup can fix it?

Ravi, if my fixup looks good to you, could you please post another version
(say, v9.1) for another Sashiko review round?

[1] https://lore.kernel.org/20260426220409.95B26C2BCAF@smtp.kernel.org


Thanks,
SJ

[...]

=== >8 ===
From 828ddfdfa3a996efc4620919a3cc77d55088c466 Mon Sep 17 00:00:00 2001
From: SeongJae Park <sj@kernel.org>
Date: Sun, 26 Apr 2026 15:54:48 -0700
Subject: [PATCH] mm/damon/core: avoid __udivdi3 linking issue

On 32bit machines having PHYS_ADDR_T_64BIT, mult_frac() with phys_addr_t
will cause __udivdi3 linking issue.  Cast values to 'unsigned long'
before calling mult_frac().  This could cause divide-by-zero if the
denominator becomes zero by casting.  Avoid it by checking the zero case
with the casted value.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/damon/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 0ea747d487465..aec43314fc4a9 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2921,10 +2921,11 @@ static unsigned long damos_get_node_eligible_mem_bp(struct damon_ctx *c,

        node_eligible = damos_calc_eligible_bytes(c, s, nid, &total_eligible);

-       if (!total_eligible)
+       if (!(unsigned long)total_eligible)
                return 0;

-       return mult_frac(node_eligible, 10000, total_eligible);
+       return mult_frac((unsigned long)node_eligible, 10000,
+                       (unsigned long)total_eligible);
 }
 #else /* CONFIG_DAMON_PADDR */
 static unsigned long damos_get_node_eligible_mem_bp(struct damon_ctx *c,
--
2.47.3


