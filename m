Return-Path: <linux-doc+bounces-3669-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E81E7FFD2A
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 21:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C47F1B21119
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 20:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AB953E10;
	Thu, 30 Nov 2023 20:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bK4Dsi5x"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5FB510FF;
	Thu, 30 Nov 2023 12:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701377847; x=1732913847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nZp68kSo4khIjDFdfC/kambEYsk334VjZ7kEwMSlwtM=;
  b=bK4Dsi5xhh8MEok1N/SYl9mNtQaHQShYTVzbJssYy4tI/vs6HE2/GNLU
   6zZxJiDAhMmJES+vl+EpQy+SWISeuwYUnrwqbOW/sjY5ZymjzbitpSA+G
   tDQIbRv9R+TWBGKFclAApUU7xFPyp3ojP6Exq/eGIyKdsAqgnpjzQc5Wk
   gASUBkSjouwkNa3I5TJx08hXT/3G+E29jXZP69eInfN+2s79AiRLif6a8
   1VXf0RMhYbQxLvo+Bf1R6ZaBltBXW9MXxIquVFVqQE7QHlKhGc2r5tSBl
   IYFRY+YsrvF8f51HRxHbiXC3/PKZz1qRryan84GCijXXU/1Lwo2T/aVRv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="393128811"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="393128811"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 12:57:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="17519396"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.74])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 12:57:26 -0800
Date: Thu, 30 Nov 2023 12:57:25 -0800
From: Tony Luck <tony.luck@intel.com>
To: Fam Zheng <fam@euphon.net>
Cc: Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Peter Newman <peternewman@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	Babu Moger <babu.moger@amd.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, patches@lists.linux.dev,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: Re: [PATCH v12 7/8] x86/resctrl: Sub NUMA Cluster detection and
 enable
Message-ID: <ZWj3NdI/qLNOgyg0@agluck-desk3>
References: <20231109230915.73600-1-tony.luck@intel.com>
 <20231130003418.89964-1-tony.luck@intel.com>
 <20231130003418.89964-8-tony.luck@intel.com>
 <ZWjOBw0Ygyw226Cc@dell>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWjOBw0Ygyw226Cc@dell>

On Thu, Nov 30, 2023 at 06:02:42PM +0000, Fam Zheng wrote:
> > +static __init int snc_get_config(void)
> > +{
> > +	unsigned long *node_caches;
> > +	int mem_only_nodes = 0;
> > +	int cpu, node, ret;
> > +	int num_l3_caches;
> > +
> > +	if (!x86_match_cpu(snc_cpu_ids))
> > +		return 1;
> > +
> > +	node_caches = bitmap_zalloc(nr_node_ids, GFP_KERNEL);
> > +	if (!node_caches)
> > +		return 1;
> > +
> > +	cpus_read_lock();
> > +
> > +	if (num_online_cpus() != num_present_cpus())
> > +		pr_warn("Some CPUs offline, SNC detection may be incorrect\n");
> > +
> > +	for_each_node(node) {
> > +		cpu = cpumask_first(cpumask_of_node(node));
> > +		if (cpu < nr_cpu_ids)
> > +			set_bit(get_cpu_cacheinfo_id(cpu, 3), node_caches);
> 
> Are we sure get_cpu_cacheinfo_id() is an valid index here? Looking at
> the function it could be -1 or larger than nr_node_ids.

Fam,

Return -1 is possible (in the case where first CPU on a node doesn't
have an L3 cache). Larger than nr_node_ids seems a bit more speculative.
It would mean a system with multiple L3 cache instances per node. I
suppose that's theoretically possible. In the limit case every CPU may
have its own personal L3 cache, but still have multiple CPUs grouped
together on a node.

Patch below (to be folded into part7 of next version). Increases the
size of the bitmap. Checks for get_cpu_cacheinfo_id() returning -1.
Patch just ignores the node in this case. I'm never quite sure how much
code to add for "Can't happen" scenarios.

-Tony


diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 3293ab4c58b0..85f8a1b3feaf 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -1056,12 +1056,13 @@ static __init int snc_get_config(void)
 	unsigned long *node_caches;
 	int mem_only_nodes = 0;
 	int cpu, node, ret;
+	int cache_id;
 	int num_l3_caches;
 
 	if (!x86_match_cpu(snc_cpu_ids))
 		return 1;
 
-	node_caches = bitmap_zalloc(nr_node_ids, GFP_KERNEL);
+	node_caches = bitmap_zalloc(num_online_cpus(), GFP_KERNEL);
 	if (!node_caches)
 		return 1;
 
@@ -1072,10 +1073,13 @@ static __init int snc_get_config(void)
 
 	for_each_node(node) {
 		cpu = cpumask_first(cpumask_of_node(node));
-		if (cpu < nr_cpu_ids)
-			set_bit(get_cpu_cacheinfo_id(cpu, 3), node_caches);
-		else
+		if (cpu < nr_cpu_ids) {
+			cache_id = get_cpu_cacheinfo_id(cpu, 3);
+			if (cache_id != -1)
+				set_bit(cache_id, node_caches);
+		} else {
 			mem_only_nodes++;
+		}
 	}
 	cpus_read_unlock();
 
-- 
2.41.0


