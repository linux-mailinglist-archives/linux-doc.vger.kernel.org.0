Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 709BA3E09DE
	for <lists+linux-doc@lfdr.de>; Wed,  4 Aug 2021 23:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhHDVLe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 4 Aug 2021 17:11:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60903 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229577AbhHDVLd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Aug 2021 17:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628111480;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0aCM0sS1/kssfJvUB4gZNdTsc20oPF9++cTUI8zhW60=;
        b=CA4y1J6ULaHDSiJZppYNtte5dMEyCAWIH/8zvcc1t+BOInlXd5oqvn7wPmMzlNqNZ9p08Y
        QPe/GkiL4/Mv3cr+U9NQk84um5CaaKRjiO7x5o5LOT2HVwnYiEr6oFgo3enn89oVF+Nn8X
        JDT2tm1QwsUBNsx+8/WgJOKzY2eVwJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-AA_yMFDwMs2mLG58g3F5tw-1; Wed, 04 Aug 2021 17:11:16 -0400
X-MC-Unique: AA_yMFDwMs2mLG58g3F5tw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDC398799FF;
        Wed,  4 Aug 2021 21:11:13 +0000 (UTC)
Received: from optiplex-fbsd (unknown [10.3.128.25])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5279960BF4;
        Wed,  4 Aug 2021 21:11:09 +0000 (UTC)
Date:   Wed, 4 Aug 2021 17:11:06 -0400
From:   Rafael Aquini <aquini@redhat.com>
To:     Charan Teja Reddy <charante@codeaurora.org>
Cc:     akpm@linux-foundation.org, mcgrof@kernel.org,
        keescook@chromium.org, yzaikin@google.com,
        dave.hansen@linux.intel.com, vbabka@suse.cz,
        mgorman@techsingularity.net, nigupta@nvidia.com, corbet@lwn.net,
        rppt@kernel.org, khalid.aziz@oracle.com, rientjes@google.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        vinmenon@codeaurora.org
Subject: Re: [PATCH V5] mm: compaction: support triggering of proactive
 compaction by user
Message-ID: <YQsCasRVGoVhIvyR@optiplex-fbsd>
References: <1627653207-12317-1-git-send-email-charante@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1627653207-12317-1-git-send-email-charante@codeaurora.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 30, 2021 at 07:23:27PM +0530, Charan Teja Reddy wrote:
> The proactive compaction[1] gets triggered for every 500msec and run
> compaction on the node for COMPACTION_HPAGE_ORDER (usually order-9)
> pages based on the value set to sysctl.compaction_proactiveness.
> Triggering the compaction for every 500msec in search of
> COMPACTION_HPAGE_ORDER pages is not needed for all applications,
> especially on the embedded system usecases which may have few MB's of
> RAM. Enabling the proactive compaction in its state will endup in
> running almost always on such systems.
> 
> Other side, proactive compaction can still be very much useful for
> getting a set of higher order pages in some controllable
> manner(controlled by using the sysctl.compaction_proactiveness). So, on
> systems where enabling the proactive compaction always may proove not
> required, can trigger the same from user space on write to its sysctl
> interface. As an example, say app launcher decide to launch the memory
> heavy application which can be launched fast if it gets more higher
> order pages thus launcher can prepare the system in advance by
> triggering the proactive compaction from userspace.
> 
> This triggering of proactive compaction is done on a write to
> sysctl.compaction_proactiveness by user.
> 
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=facdaa917c4d5a376d09d25865f5a863f906234a
> 
> Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>

Acked-by: Rafael Aquini <aquini@redhat.com>

> ---
>  Changes in V5:
>  	-- Avoid unnecessary wakeup of proactive compaction when it is disabled.
> 	-- No changes in the logic of triggering the proactive compaction.
> 
>  Changes in V4:
> 	-- Changed the code as the 'proactive_defer' counter is removed.
> 	-- No changes in the logic of triggering the proactive compaction.
> 	-- https://lore.kernel.org/patchwork/patch/1448777/
> 
>  Changes in V3:
>         -- Fixed review comments from Valstimil and others.
>         -- https://lore.kernel.org/patchwork/patch/1438211/
> 
>  Changes in V2:
> 	-- remove /proc/../proactive_compact_memory interface trigger for proactive compaction
>         -- Intention is same that add a way to trigger proactive compaction by user.
>         -- https://lore.kernel.org/patchwork/patch/1431283/
> 
>  changes in V1:
> 	-- Created the new /proc/sys/vm/proactive_compact_memory in
> 	   interface to trigger proactive compaction from user 
>         -- https://lore.kernel.org/lkml/1619098678-8501-1-git-send-email-charante@codeaurora.org/
> 
>  Documentation/admin-guide/sysctl/vm.rst |  3 ++-
>  include/linux/compaction.h              |  2 ++
>  include/linux/mmzone.h                  |  1 +
>  kernel/sysctl.c                         |  2 +-
>  mm/compaction.c                         | 38 +++++++++++++++++++++++++++++++--
>  5 files changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 003d5cc..b526cf6 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -118,7 +118,8 @@ compaction_proactiveness
>  
>  This tunable takes a value in the range [0, 100] with a default value of
>  20. This tunable determines how aggressively compaction is done in the
> -background. Setting it to 0 disables proactive compaction.
> +background. On write of non zero value to this tunable will immediately
> +trigger the proactive compaction. Setting it to 0 disables proactive compaction.
>  
>  Note that compaction has a non-trivial system-wide impact as pages
>  belonging to different processes are moved around, which could also lead
> diff --git a/include/linux/compaction.h b/include/linux/compaction.h
> index c24098c..34bce35 100644
> --- a/include/linux/compaction.h
> +++ b/include/linux/compaction.h
> @@ -84,6 +84,8 @@ static inline unsigned long compact_gap(unsigned int order)
>  extern unsigned int sysctl_compaction_proactiveness;
>  extern int sysctl_compaction_handler(struct ctl_table *table, int write,
>  			void *buffer, size_t *length, loff_t *ppos);
> +extern int compaction_proactiveness_sysctl_handler(struct ctl_table *table,
> +		int write, void *buffer, size_t *length, loff_t *ppos);
>  extern int sysctl_extfrag_threshold;
>  extern int sysctl_compact_unevictable_allowed;
>  
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 4610750..6a1d79d 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -853,6 +853,7 @@ typedef struct pglist_data {
>  	enum zone_type kcompactd_highest_zoneidx;
>  	wait_queue_head_t kcompactd_wait;
>  	struct task_struct *kcompactd;
> +	bool proactive_compact_trigger;
>  #endif
>  	/*
>  	 * This is a per-node reserve of pages that are not available
> diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> index 82d6ff6..65bc6f7 100644
> --- a/kernel/sysctl.c
> +++ b/kernel/sysctl.c
> @@ -2871,7 +2871,7 @@ static struct ctl_table vm_table[] = {
>  		.data		= &sysctl_compaction_proactiveness,
>  		.maxlen		= sizeof(sysctl_compaction_proactiveness),
>  		.mode		= 0644,
> -		.proc_handler	= proc_dointvec_minmax,
> +		.proc_handler	= compaction_proactiveness_sysctl_handler,
>  		.extra1		= SYSCTL_ZERO,
>  		.extra2		= &one_hundred,
>  	},
> diff --git a/mm/compaction.c b/mm/compaction.c
> index f984ad0..fbc60f9 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -2700,6 +2700,30 @@ static void compact_nodes(void)
>   */
>  unsigned int __read_mostly sysctl_compaction_proactiveness = 20;
>  
> +int compaction_proactiveness_sysctl_handler(struct ctl_table *table, int write,
> +		void *buffer, size_t *length, loff_t *ppos)
> +{
> +	int rc, nid;
> +
> +	rc = proc_dointvec_minmax(table, write, buffer, length, ppos);
> +	if (rc)
> +		return rc;
> +
> +	if (write && sysctl_compaction_proactiveness) {
> +		for_each_online_node(nid) {
> +			pg_data_t *pgdat = NODE_DATA(nid);
> +
> +			if (pgdat->proactive_compact_trigger)
> +				continue;
> +
> +			pgdat->proactive_compact_trigger = true;
> +			wake_up_interruptible(&pgdat->kcompactd_wait);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * This is the entry point for compacting all nodes via
>   * /proc/sys/vm/compact_memory
> @@ -2744,7 +2768,8 @@ void compaction_unregister_node(struct node *node)
>  
>  static inline bool kcompactd_work_requested(pg_data_t *pgdat)
>  {
> -	return pgdat->kcompactd_max_order > 0 || kthread_should_stop();
> +	return pgdat->kcompactd_max_order > 0 || kthread_should_stop() ||
> +		pgdat->proactive_compact_trigger;
>  }
>  
>  static bool kcompactd_node_suitable(pg_data_t *pgdat)
> @@ -2895,9 +2920,16 @@ static int kcompactd(void *p)
>  	while (!kthread_should_stop()) {
>  		unsigned long pflags;
>  
> +		/*
> +		 * Avoid the unnecessary wakeup for proactive compaction
> +		 * when it is disabled.
> +		 */
> +		if (!sysctl_compaction_proactiveness)
> +			timeout = MAX_SCHEDULE_TIMEOUT;
>  		trace_mm_compaction_kcompactd_sleep(pgdat->node_id);
>  		if (wait_event_freezable_timeout(pgdat->kcompactd_wait,
> -			kcompactd_work_requested(pgdat), timeout)) {
> +			kcompactd_work_requested(pgdat), timeout) &&
> +			!pgdat->proactive_compact_trigger) {
>  
>  			psi_memstall_enter(&pflags);
>  			kcompactd_do_work(pgdat);
> @@ -2932,6 +2964,8 @@ static int kcompactd(void *p)
>  				timeout =
>  				   default_timeout << COMPACT_MAX_DEFER_SHIFT;
>  		}
> +		if (unlikely(pgdat->proactive_compact_trigger))
> +			pgdat->proactive_compact_trigger = false;
>  	}
>  
>  	return 0;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member of the Code Aurora Forum, hosted by The Linux Foundation
> 
> 

