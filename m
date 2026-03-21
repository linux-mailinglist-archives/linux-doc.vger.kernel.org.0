Return-Path: <linux-doc+bounces-80491-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP7rKVLNvmn2cwMAu9opvQ
	(envelope-from <linux-doc+bounces-80491-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 17:54:42 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A65BB2E6687
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 17:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C493A3005338
	for <lists+linux-doc@lfdr.de>; Sat, 21 Mar 2026 16:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71CD303A0A;
	Sat, 21 Mar 2026 16:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGjjhQLW"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C0B2F9D82;
	Sat, 21 Mar 2026 16:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774112075; cv=none; b=hPNVa5tXr+Fu2jbP9LvasoQ924VR0OvuAgIE4WotL0VrUlixuN0KwTuoN6lL+hKaoXUL6t+tgwNpajB/sFyL8GiacE77ZV0zFgxoUGK9YqieXzWAHgSzvoXKwIhOZ/MtwZj4HEX2DAqoQAHWNvuRCoYEY9wSgK3T3u32Hd44EvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774112075; c=relaxed/simple;
	bh=/hnN+ozliJ6Px8FWlVuRJLimEx5AIwMdAryf0AjKiDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Joz1yEEW8PeJs/6+xtJUcZgGKAvDSpW8yMKBk/zNnNXfFwp59QOf/nQ2pJD4rgUS2GVLzJvB0LtSnjcSIF/wkVHLa+dgObJsu9cw/Vlbs2oRolxM0Ub84tz9y/UTplW7wNn67vEmYMZU8O2ZZQJYgSJhJpfy1Auv9XYe18G0seo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGjjhQLW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207CAC19421;
	Sat, 21 Mar 2026 16:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774112075;
	bh=/hnN+ozliJ6Px8FWlVuRJLimEx5AIwMdAryf0AjKiDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kGjjhQLWv2jKyxOybLUqwjFrv00W1DecnyBesVTCvLkNokyXcUxyVVKxtKZC1p5fF
	 1wVSSBOPq1fX9VOjAdncIH4151+mqt3hUbEdpgP1xGRxvNuvALcnSjhL2BKQ4mLTRs
	 2YGhrvQnqUenHb2g+IjRqQJBvNJMec/L9ia9jvcuuJz6ZEWucBVYgvLUVblQGOEC2q
	 p6UrKrumJvs+I2tcfOC3QDQOEMwWSB2Zw0IVqpFqNPecAv4iVu0KXeNpIAOHoI1RE9
	 qtXc2uB2IZ7bLzpe0knYZJLx9sBlNeG7P3Fh2K4GYvTmDnH+yvoKHuZ542QfD0YaJY
	 TS6HRbt3hjsSw==
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
Subject: Re: [RFC PATCH v4 1/1] mm/damon: add node_eligible_mem_bp and node_ineligible_mem_bp goal metrics
Date: Sat, 21 Mar 2026 09:54:24 -0700
Message-ID: <20260321165425.84273-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320190453.1430-2-ravis.opensrc@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80491-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,kvack.org,vger.kernel.org,linux-foundation.org,lwn.net,gmail.com,micron.com,sk.com];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A65BB2E6687
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 20 Mar 2026 12:04:53 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> Add new quota goal metrics for memory tiering that track scheme-eligible
> memory distribution across NUMA nodes:
> 
> - DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP: ratio of eligible memory on a node
> - DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP: ratio of eligible memory NOT on
>   a node

The description for the second metric should be "ratio of ineligible memory on
a node".

> 
> These complementary metrics enable push-pull migration schemes that
> maintain a target memory distribution across different NUMA nodes
> representing different memory tiers, based on access patterns defined
> by each scheme.
> 
> The metrics iterate scheme-eligible regions and use damon_get_folio()
> to determine NUMA node placement of each folio, calculating the ratio
> of eligible memory on the specified node versus total eligible memory.
> 
> Suggested-by: SeongJae Park <sj@kernel.org>
> Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
> ---
>  include/linux/damon.h    |   6 ++
>  mm/damon/core.c          | 158 ++++++++++++++++++++++++++++++++++++---
>  mm/damon/sysfs-schemes.c |  12 +++
>  3 files changed, 164 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/damon.h b/include/linux/damon.h
> index b1d8fd88a0fc..490918804f85 100644
> --- a/include/linux/damon.h
> +++ b/include/linux/damon.h
> @@ -193,6 +193,10 @@ enum damos_action {
>   * @DAMOS_QUOTA_NODE_MEMCG_FREE_BP:	MemFree ratio of a node for a cgroup.
>   * @DAMOS_QUOTA_ACTIVE_MEM_BP:		Active to total LRU memory ratio.
>   * @DAMOS_QUOTA_INACTIVE_MEM_BP:	Inactive to total LRU memory ratio.
> + * @DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP:	Scheme-eligible memory ratio of a
> + *					node.
> + * @DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP:	Scheme-ineligible memory ratio of a
> + *					node.
>   * @NR_DAMOS_QUOTA_GOAL_METRICS:	Number of DAMOS quota goal metrics.
>   *
>   * Metrics equal to larger than @NR_DAMOS_QUOTA_GOAL_METRICS are unsupported.
> @@ -206,6 +210,8 @@ enum damos_quota_goal_metric {
>  	DAMOS_QUOTA_NODE_MEMCG_FREE_BP,
>  	DAMOS_QUOTA_ACTIVE_MEM_BP,
>  	DAMOS_QUOTA_INACTIVE_MEM_BP,
> +	DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP,
> +	DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP,
>  	NR_DAMOS_QUOTA_GOAL_METRICS,
>  };
>  
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index b9e12865622c..3e0ac65e34a0 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -17,6 +17,8 @@
>  #include <linux/string.h>
>  #include <linux/string_choices.h>
>  
> +#include "ops-common.h"
> +

I don't find a reason to include this, and I'd like to avoid including that in
core.c unless it is really necessary.  Could you please remove this?

Below looks all good for RFC level code to move on to the next stage (dropping
RFC tag). :)


Thanks,
SJ

[...]

