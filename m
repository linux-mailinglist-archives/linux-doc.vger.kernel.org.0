Return-Path: <linux-doc+bounces-82472-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WN20KUFu0WlKJgcAu9opvQ
	(envelope-from <linux-doc+bounces-82472-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 04 Apr 2026 22:02:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D8739C58F
	for <lists+linux-doc@lfdr.de>; Sat, 04 Apr 2026 22:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28098300C918
	for <lists+linux-doc@lfdr.de>; Sat,  4 Apr 2026 20:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76EF12BEFF5;
	Sat,  4 Apr 2026 20:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrA5QUGy"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AEA17A30A;
	Sat,  4 Apr 2026 20:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775332926; cv=none; b=ItIFJrH5f79QOyjJxeDJGPSl8WrmyKzd9vtOprp+iGS4QyWWmwiRH0h5LbDKY8QgFaRBNaC9XZtSYM+nvOpdbPvo1N3Z8UPR+95NtpTRXl+j2bOSEaeLpTXsemPkfdY5GYXU1mRPuPtHMLGO3lBjGLAYZkIai6sn4diqIPVMZUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775332926; c=relaxed/simple;
	bh=/JiyVizUMe9wSdqRZWW6fVbbnNxTVMDWZytcmkzNmcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DytGpkCNj79Kk41Udw1LYZ4R/WADtdnzZQbr1ZmDJbXxLUEFpTkIBGZPOT59hTVIq+Oqq+a4wDeVsfgUOH+o/gmTCs8Shz2FeBpi2BHvYgsritC7iMO0x9LVdKo1BCPHa22pl1chd60U1tCfrsw29yi7g4JLSoYYh2wfs72/6kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrA5QUGy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560C5C19421;
	Sat,  4 Apr 2026 20:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775332925;
	bh=/JiyVizUMe9wSdqRZWW6fVbbnNxTVMDWZytcmkzNmcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lrA5QUGyJQ8bVQcBRmkgwJI7ZwBM9sJNU5eBGGV8qZnyWKaSUSqyBzu6LpN9GvD2U
	 6PWqlaeorIT4jytNB3eRyedgLHY4vnZ6k6bamJalIPDMDVKAkMXdqMHg8VkCPk0dEQ
	 qwq2SnCL0oc8kudZeUxGXqaFCTXar2+nndGXZcRnaxRguhK5GF4JD8E9XaMQvYQqZC
	 EC3Tb2Z2do5VI+617ig9E5WWJc7V2bUnhUoVMAxoyrAwK/SW3I+5+Du2twxoMyWjf9
	 cXG8+wX5CFQV5LXDpLImwNq0Qy+fCoBrWJbb4+EMp0GEby3i0RtmKpBUCX1He7oBSi
	 jW3NCs6DwbfUA==
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
	yunjeong.mun@sk.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 1/1] mm/damon: add node_eligible_mem_bp and node_ineligible_mem_bp goal metrics
Date: Sat,  4 Apr 2026 13:01:57 -0700
Message-ID: <20260404200158.86020-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260404012215.1539-2-ravis.opensrc@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-82472-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,kvack.org,vger.kernel.org,linux-foundation.org,lwn.net,gmail.com,micron.com,sk.com,intel.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4D8739C58F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri,  3 Apr 2026 18:22:15 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:

> Add new quota goal metrics for memory tiering that track scheme-eligible
> memory distribution across NUMA nodes:
> 
> - DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP: ratio of eligible memory on a node
> - DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP: ratio of ineligible memory on a
>   node
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
> The implementation is guarded by CONFIG_DAMON_PADDR since damon_get_folio()
> is only available when physical address space monitoring is enabled.
> 
> Suggested-by: SeongJae Park <sj@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603251034.978zcsQ2-lkp@intel.com/

I think you don't need to add the Reported-by: and Closes: for bug that found
before this patch is merged.  Could you please drop those?

> Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
> ---
>  include/linux/damon.h    |   6 ++
>  mm/damon/core.c          | 186 ++++++++++++++++++++++++++++++++++++---
>  mm/damon/sysfs-schemes.c |  12 +++
>  3 files changed, 190 insertions(+), 14 deletions(-)
[...]

The code changes look good to me.  But, as I replied to the cover letter, I'd
like to get sashiko review before giving my Reviewed-by:.  Could you please
rebase this to the latest mm-new and repost for getting the sashiko review?


Thanks,
SJ

