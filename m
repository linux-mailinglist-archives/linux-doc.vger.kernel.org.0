Return-Path: <linux-doc+bounces-74625-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG3YFOMNfGkEKQIAu9opvQ
	(envelope-from <linux-doc+bounces-74625-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 30 Jan 2026 02:48:19 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 378F0B6437
	for <lists+linux-doc@lfdr.de>; Fri, 30 Jan 2026 02:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C627830028FB
	for <lists+linux-doc@lfdr.de>; Fri, 30 Jan 2026 01:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF082DECBD;
	Fri, 30 Jan 2026 01:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HX91BYHK"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895772BEC52;
	Fri, 30 Jan 2026 01:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769737689; cv=none; b=aVrj3xT4oGtFwkLtDhXPrHsuX1+WDQHL+3MYVVmHTQcMFfcLuPkU0/swrDfGgq6xFDqa6bJV/SxTy/OKBiSnkikC+eyzUG1a2/3o7pOeUWRCVtGIAUMGV0eDneNFKHH3yRwA4g4BZblyupZZI8dgBr7asgsEikGNWfTp2Djzu14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769737689; c=relaxed/simple;
	bh=Qp2XJsJSzR2HivcPBisgAW6pcIdQNbhAEoYuN3tXdWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PiUFOFBN8YOvf5wHxUg4FTqsB4aYLxtDNswSmvkh3289w07qe/V2NGenyZb6STlcxVn5gfQjT27DDSrAm9lmvyjFHB5BWDy5oxCm1NDPe5JXEwaP17m5JuBJuBU/UphOOHLxGiYtChC2Y+18RlOxqu8YOmMVX2UCjWWJxxXdNtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HX91BYHK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24C6C4CEF7;
	Fri, 30 Jan 2026 01:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769737689;
	bh=Qp2XJsJSzR2HivcPBisgAW6pcIdQNbhAEoYuN3tXdWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HX91BYHKqza58LPQh+8Noaz73VeKmnqk7ZH8OWntuzqueow/LiO8XZ2iInOfpOKsu
	 OHtGiYJzEWcLEFTAwLe8bLhETHiRjT3R2R+TqrcBChFR1sFNbnAQeIMJL5QG0cKbWW
	 RoA2gxzsGQbw9ILCTNjK/pl1izyLQ4anOi9CHhvMpUd6lvl7QQVPFOBtgr8YFkmBUx
	 BYHC/n/6bozMuRjn3+vGTXY7XTlojHGQj1+ENJf8l5V96LjWvqlJHJyeulptACeDMu
	 juhneVGupDYOQIG8owouYTQHKquiKdItqHRimW02gbjceL+X/dlOwSNKH21s7ivKri
	 z2Uuq/yNjSgDA==
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
Subject: Re: [RFC PATCH v2 0/3] mm/damon: Introduce node_target_mem_bp Quota Goal Metric
Date: Thu, 29 Jan 2026 17:48:06 -0800
Message-ID: <20260130014807.51302-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260129215814.1618-1-ravis.opensrc@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-74625-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 378F0B6437
X-Rspamd-Action: no action

On Thu, 29 Jan 2026 13:58:11 -0800 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> This series introduces a new DAMON quota goal metric, `node_target_mem_bp`,
> designed for controlling memory migration in heterogeneous memory systems
> (e.g., DRAM and CXL memory tiering).
> 
> v1: https://lore.kernel.org/linux-mm/20260123045733.6954-1-ravis.opensrc@gmail.com/T/#u
> 
[...]
> Two-Context Setup for Hot Page Distribution
> ===========================================
> 
> For distributing hot pages between two NUMA nodes (e.g., DRAM node 0 and
> CXL node 1), two DAMON contexts work together:
> 
>     Context 0: monitors node 0, migrate_hot -> node 1
>       goal: node_target_mem_bp, nid=0, target=6000
>       "Migrate hot pages out when node 0 exceeds 60% hot"
> 
>     Context 1: monitors node 1, migrate_hot -> node 0
>       goal: node_target_mem_bp, nid=1, target=4000
>       "Migrate hot pages out when node 1 exceeds 40% hot"
> 
> Each context migrates excess hot pages to the other node. The system
> converges when both nodes reach their target hot memory ratios.

Thank you for adding this example use case!  This is very helpful for
understanding how people can use this feature, and if there is a wrong
assumption.

I think the use case idea is nice and making sense to me.  Nonetheless, I find
a DAMON's devil in the detail.

DAMOS quota autotuning assumes applying the given scheme action more
aggressively (increasing quota) will help increasing the quota goal metric.  In
other words, it believes the aggressiveness (tuned quota size) and the metric
value are proportional.  Hence, for the first context, DAMON will migrate hot
pages of node 0 to node 1, when the hot pages in node 0 is less than 60%, and
start gradually decreasing and eventually stop the migration after hot memory
portion on node 0 reaches and exceeds 60%.  A human readable interpretation of
it would be, "Migrate hot pages out when node 0 not exceeds 60% hot", which
makes no sense for your use case.

To make it work as you described, you may implement another metric representing
the ratio of scheme-uneligible memory on the given node.  Say,
'node_ineligible_mem_bp'?  To borrow your above nice notation, it could be
calculated as below:

    (node_capacity - scheme_eligible_bytes_on_node) / node_capacity

Using this, your above use case could implemented like below:

    Context 0: monitors node 0, migrate_hot -> node 1
      goal: node_ineligible_mem_bp, nid=0, target=4000

    Context 1: monitors node 1, migrate_hot -> node 0
      goal: node_ineligible_mem_bp, nid=1, target=6000

And I'm not very sure if that is really what you want.  For example, if node 0
has 30% hot memory and node 1 has 20% hot memory, no migration will happen.

I think you might want node 0 to have more hot memory, but no more than 60% of
the node.  DAMON-based auto-tuned memory tiering [1], for example, use this
kind of approach.  If that's what you want, you could use node_target_mem_bp
together, like below.

    Context 0: monitors node 0, migrate_hot -> node 1
      goal: node_ineligible_mem_bp, nid=0, target=4000

    Context 1: monitors node 1, migrate_hot -> node 0
      goal: node_target_mem_bp, nid=0, target=6000

I'm not still very confident if I understand what you want, because you
mentioned dynamic weighted interleaving was the major motivation of this
project.  In the case, you might want only hot memory be distributed across
NUMA nodes in a specific ratio.  In the case, you may want the denominator be
"scheme-eligible memory of the system" instead of "node capacity".  To borrow
your notation again,

    scheme_eligible_bytes_on_node / scheme_eligible_bytes_on_system

Let's call this just node_target_mem_bp2.  Then, if you want node 0 and 1 to
have 60% and 40% of hot memory, you could setup DAMOS as below:

    Context 0: monitors node 0, migrate_hot -> node 1
      goal: node_target_mem_bp2, nid=1, target=4000

    Context 1: monitors node 1, migrate_hot -> node 0
      goal: node_target_mem_bp2, nid=0, target=6000

[...]
> Status
> ======
> 
> These patches have been compile-tested but have NOT been tested on actual
> hardware.

It will be very helpful!

> Feedback on the design and approach is appreciated.

So you might need to change the definition and name of the metric, and/or add
new metrics.  But the basic theory of the requirements, the design and the
implementation approach of this patch series looks good to me!

> 
> References
> ==========
> 
> [1] mm/damon/vaddr: Allow interleaving in migrate_{hot,cold} actions
>     https://lore.kernel.org/linux-mm/20250709005952.17776-1-bijan311@gmail.com/

[1] https://github.com/damonitor/damo/blob/next/scripts/mem_tier.sh


Thanks,
SJ

[...]

