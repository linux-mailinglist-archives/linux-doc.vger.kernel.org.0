Return-Path: <linux-doc+bounces-84985-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEBgKsDS8GnDYwEAu9opvQ
	(envelope-from <linux-doc+bounces-84985-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 17:31:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5C2487DDB
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 17:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26EC630055B7
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 15:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F282C3AE71B;
	Tue, 28 Apr 2026 15:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1VUL26b"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AFF3A6F16;
	Tue, 28 Apr 2026 15:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390269; cv=none; b=uTW5Dt/jifFxY2Gq8/FJmuzJyfgDhjVWAU8lhK1OsXhjVEv6dY0WnoUpfp77khWlv6qm+Sry+/g31aJFkeU0xfxwsQPP3HJ74OS9RIt3GMCelgrtB4swaiY+UZ3a5EovZt/tyJl+jmXk1IWy7Xcl/hArABKS7wuX+qm9oW03S4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390269; c=relaxed/simple;
	bh=dCSRhnFrakZnTo4Xpc4kvr9Rlo4/ax/YxLWl2hghJ5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EkqaOfeJxMLeqElJ9E/xHI4XDrNH5u3ki4UexBti/wpjqQWMSEi+fcJT+gH8K6ezYbLJTdQqXFywVlAkdYpBEE6vI/mC3gbQOWAqj4IPK2q3V9HnxZ0bdOv4/RUkPvXSK1qTMvEpmaMXQWl2KHpj9bn0wKhEf8n9hydt33TiF/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1VUL26b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67AEC2BCAF;
	Tue, 28 Apr 2026 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777390269;
	bh=dCSRhnFrakZnTo4Xpc4kvr9Rlo4/ax/YxLWl2hghJ5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N1VUL26bqPJE+qR9QHl9MpzVHe7s19tUMLOM8oSd8Aw7sdJz1FDoc68i9hMQ3btSp
	 zOSQbpUuv57a4Yp64721BiKjJdrI7j7yaVbzWOeIoXSwT7ONxBz8BYbqSzUIkooYJG
	 i1vTzHIb3DxBarHHVeS1CVAiXEmuGRxhq9Y6H+NfZmyLYankMFdBVfz7D3amrDck67
	 UvEtzDxk9uNfY8ZXZ6JCZswnapzu1XOewROvNrnfELHl+z8Gv99PVgJid1nsmZ3mKA
	 fn6PDn0XItXI7YHh0q4kKSHukMAc3ZJ5hXNuJYFrNI1OGkqKrio93OZsrKC+t3XXFk
	 DrBnA06ssbDGA==
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
Subject: Re: [PATCH v9.2] mm/damon: add node_eligible_mem_bp goal metric
Date: Tue, 28 Apr 2026 08:31:06 -0700
Message-ID: <20260428153106.125910-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260428030520.701-1-ravis.opensrc@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3E5C2487DDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84985-lists,linux-doc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.929];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Mon, 27 Apr 2026 20:05:20 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> Background and Motivation
> =========================
> 
> In heterogeneous memory systems, controlling memory distribution across
> NUMA nodes is essential for performance optimization. This patch enables
> system-wide page distribution with target-state goals such as "maintain
> 60% of scheme-eligible memory on DRAM" using PA-mode DAMON schemes.
> 
> Rather than using absolute thresholds, this metric tracks the ratio of
> memory that matches each scheme's access pattern filters on a target
> node, enabling the quota system to automatically adjust migration
> aggressiveness to maintain the desired distribution.
> 
> What This Metric Measures
> =========================
> 
> node_eligible_mem_bp:
>     scheme_eligible_bytes_on_node / total_scheme_eligible_bytes * 10000
> 
> Two-Scheme Setup for Hot Page Distribution
> ==========================================
> 
> For maintaining 60% of hot memory on DRAM (node 0) and 40% on CXL
> (node 1):
> 
>     PULL scheme: migrate_hot to node 0
>       goal: node_eligible_mem_bp, nid=0, target=6000
>       addr filter: node 1 address range (only migrate FROM CXL)
>       "Move hot pages to DRAM if less than 60% of hot data is in DRAM"
> 
>     PUSH scheme: migrate_hot to node 1
>       goal: node_eligible_mem_bp, nid=1, target=4000
>       addr filter: node 0 address range (only migrate FROM DRAM)
>       "Move hot pages to CXL if less than 40% of hot data is in CXL"
> 
> Each scheme independently measures its own eligible memory and adjusts
> its quota to achieve its target ratio. The schemes work in concert
> through DAMON's unified monitoring context, with the quota autotuner
> balancing their relative aggressiveness.
> 
> Implementation Details
> ======================
> 
> The implementation adds a new quota goal metric type
> DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP to the existing DAMOS quota goal
> framework. When this metric is configured for a scheme:
> 
> 1. During each quota adjustment cycle, damos_get_node_eligible_mem_bp()
>    is called to calculate the current memory distribution.
> 
> 2. The function iterates through all regions that match the scheme's
>    access pattern (via __damos_valid_target()) and calculates:
>    - Total eligible bytes across all nodes
>    - Eligible bytes specifically on the target node (goal->nid)
> 
> 3. For each eligible region, damos_calc_eligible_bytes() walks through
>    the physical address range, using damon_get_folio() to look up
>    each folio and determine its NUMA node via folio_nid().
> 
> 4. Large folios are handled by calculating the exact overlap between
>    the region boundaries and folio boundaries, ensuring accurate
>    byte counts even when regions partially span folios.
> 
> 5. The ratio (node_eligible / total_eligible * 10000) is returned
>    as basis points, which the quota autotuner uses to adjust the
>    scheme's effective quota size (esz).
> 
> The implementation requires CONFIG_DAMON_PADDR since damon_get_folio()
> is only available for physical address space monitoring.
> 
> Testing Results
> ===============
> 
> Functionally tested on a two-node heterogeneous memory system with DRAM
> (node 0) and CXL memory (node 1). A PUSH+PULL scheme configuration using
> migrate_hot actions was used to reach a target hot memory ratio between
> the two tiers.
> 
> With the TEMPORAL tuner, the system converges quickly to the target
> distribution. The tuner drives esz to maximum when under goal and to
> zero once the goal is met, forming a simple on/off feedback loop that
> stabilizes at the desired ratio.
> 
> With the CONSIST tuner, the scheme still converges but more slowly, as
> it migrates and then throttles itself based on quota feedback. The time
> to reach the goal varies depending on workload intensity.
> 
> Note: This metric works with both TEMPORAL and CONSIST goal tuners.
> 
> Suggested-by: SeongJae Park <sj@kernel.org>
> Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
> Reviewed-by: SeongJae Park <sj@kernel.org>

So, this looks good to me.  I find no blocker [1] from Sashiko review, too.  I
added this to damon/next tree.  Unless others find concerns or this is added to
mm-new by Andrew soon, I will repost this for mm-new merge.

[1] https://lore.kernel.org/20260428035754.116202-1-sj@kernel.org


Thanks,
SJ

[...]

