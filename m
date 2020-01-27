Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC0114A1F9
	for <lists+linux-doc@lfdr.de>; Mon, 27 Jan 2020 11:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729714AbgA0Kam (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Jan 2020 05:30:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28239 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726858AbgA0Kal (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jan 2020 05:30:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580121040;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=B5seMdInBob5KBB/Ici0anA5L1DZMOsToJq/Z5iUw2E=;
        b=ZaRBVqh53GrDj+2qvr883CdRc2tEezHo0rjXuh+gBGc3uOpmL5sjBD9zmtEKNRdRHGLnAP
        S9BP09vUXKIrHZjyIDDU46pmNjpquuxPBgRoOOY1r14LEYETfdM+m66g9Ifar6WgEK/R0n
        iVnbx5jQTAyqibCaIekSI6F0ruFNktU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-52SD_Vv2PrmA9UmnPvmHxg-1; Mon, 27 Jan 2020 05:30:37 -0500
X-MC-Unique: 52SD_Vv2PrmA9UmnPvmHxg-1
Received: by mail-wm1-f72.google.com with SMTP id 7so1185348wmf.9
        for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2020 02:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B5seMdInBob5KBB/Ici0anA5L1DZMOsToJq/Z5iUw2E=;
        b=eU9BCkwyJTFJ7Q4BY5WV7OPicbc4LShYmLwCL8HY81xmQZ17267tuULTHEta/aOVnW
         dYnjIxHMxZEvsm3vDCIT+BjZ9L9fTsoKX3G5t0dvHw2830hatrzdZ5guK+aGseaf0PJa
         oVZBu3TpUgjKsjAHNtO/c07NM99pW2VLiHC2XdbMFknoQWvffGuOKY446c/qs3ZdTQbD
         GqDGoKLZF/Is2rznXFnVzfiDCgrFS3odRa7V9GtVj7ekp7MlkGxHVyyyND8qygotPPzU
         jLYL+kXtYEz0dNyBOYj142vIE1b8TeZioC/JBrSgYHT9tgpRe52mCEc0PcJ7USBieqhj
         f+rw==
X-Gm-Message-State: APjAAAWMMoKFcswBv9a3THx5DcnzAS2YWv1jNWGYdoumI+6Jwg9+Xn51
        uKTEupPcM0NOSnZtRU+ZVE5+RcTakrOX2BF5U/0zCHFuyLTknvOwKifsS81DhPh+5o9Az8qC+M+
        1Ak+MDu6y/NgP/dpL16c=
X-Received: by 2002:a05:600c:20c1:: with SMTP id y1mr5646032wmm.164.1580121036577;
        Mon, 27 Jan 2020 02:30:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNP1yLOiuz11SqkgN+NSgVx33ZKZPJzCymBsy7575Ijof+Xt9mNxslTm1pwcw9yz9/cYbQrg==
X-Received: by 2002:a05:600c:20c1:: with SMTP id y1mr5646000wmm.164.1580121036206;
        Mon, 27 Jan 2020 02:30:36 -0800 (PST)
Received: from localhost (cpc111743-lutn13-2-0-cust844.9-3.cable.virginm.net. [82.17.115.77])
        by smtp.gmail.com with ESMTPSA id w22sm17514661wmk.34.2020.01.27.02.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 02:30:35 -0800 (PST)
Date:   Mon, 27 Jan 2020 10:30:34 +0000
From:   Aaron Tomlin <atomlin@redhat.com>
To:     Grzegorz Halat <ghalat@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        ssaner@redhat.com, oleksandr@redhat.com, vbendel@redhat.com,
        kirill@shutemov.name, khlebnikov@yandex-team.ru,
        borntraeger@de.ibm.com, Andrew Morton <akpm@linux-foundation.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Kees Cook <keescook@chromium.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 1/1] mm: sysctl: add panic_on_mm_error sysctl
Message-ID: <20200127103034.lb2piuvtohwqysbs@atomlin.usersys.com>
References: <20200127101100.92588-1-ghalat@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200127101100.92588-1-ghalat@redhat.com>
X-PGP-Key: http://pgp.mit.edu/pks/lookup?search=atomlin%40redhat.com
X-PGP-Fingerprint: 7906 84EB FA8A 9638 8D1E  6E9B E2DE 9658 19CC 77D6
User-Agent: NeoMutt/20180716-1637-ee8449
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon 2020-01-27 11:11 +0100, Grzegorz Halat wrote:
> Memory management subsystem performs various checks at runtime,
> if an inconsistency is detected then such event is being logged and kernel
> continues to run. While debugging such problems it is helpful to collect
> memory dump as early as possible. Currently, there is no easy way to panic
> kernel when such error is detected.
> 
> It was proposed[1] to panic the kernel if panic_on_oops is set but this
> approach was not accepted. One of alternative proposals was introduction of
> a new sysctl.
> 
> The patch adds panic_on_mm_error sysctl. If the sysctl is set then the
> kernel will be crashed when an inconsistency is detected by memory
> management. This currently means panic when bad page or bad PTE
> is detected(this may be extended to other places in MM).
> 
> Another use case of this sysctl may be in security-wise environments,
> it may be more desired to crash machine than continue to run with
> potentially damaged data structures.
> 
> [1] https://marc.info/?l=linux-mm&m=142649500728327&w=2
> 
> Signed-off-by: Grzegorz Halat <ghalat@redhat.com>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 12 ++++++++++++
>  include/linux/kernel.h                      |  1 +
>  kernel/sysctl.c                             |  9 +++++++++
>  mm/memory.c                                 |  7 +++++++
>  mm/page_alloc.c                             |  4 +++-
>  5 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index def074807cee..2fecd6b2547e 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -61,6 +61,7 @@ show up in /proc/sys/kernel:
>  - overflowgid
>  - overflowuid
>  - panic
> +- panic_on_mm_error
>  - panic_on_oops
>  - panic_on_stackoverflow
>  - panic_on_unrecovered_nmi
> @@ -611,6 +612,17 @@ an IO error.
>     and you can use this option to take a crash dump.
>  
>  
> +panic_on_mm_error:
> +==============
> +
> +Controls the kernel's behaviour when inconsistency is detected
> +by memory management code, for example bad page state or bad PTE.
> +
> +0: try to continue operation.
> +
> +1: panic immediately.
> +
> +
>  panic_on_oops:
>  ==============
>  
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index 0d9db2a14f44..5f9d408512ff 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -518,6 +518,7 @@ extern int oops_in_progress;		/* If set, an oops, panic(), BUG() or die() is in
>  extern int panic_timeout;
>  extern unsigned long panic_print;
>  extern int panic_on_oops;
> +extern int panic_on_mm_error;
>  extern int panic_on_unrecovered_nmi;
>  extern int panic_on_io_nmi;
>  extern int panic_on_warn;
> diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> index 70665934d53e..6477e1cce28b 100644
> --- a/kernel/sysctl.c
> +++ b/kernel/sysctl.c
> @@ -1238,6 +1238,15 @@ static struct ctl_table kern_table[] = {
>  		.extra1		= SYSCTL_ZERO,
>  		.extra2		= SYSCTL_ONE,
>  	},
> +	{
> +		.procname	= "panic_on_mm_error",
> +		.data		= &panic_on_mm_error,
> +		.maxlen		= sizeof(int),
> +		.mode		= 0644,
> +		.proc_handler	= proc_dointvec_minmax,
> +		.extra1		= SYSCTL_ZERO,
> +		.extra2		= SYSCTL_ONE,
> +	},
>  #if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
>  	{
>  		.procname	= "timer_migration",
> diff --git a/mm/memory.c b/mm/memory.c
> index 45442d9a4f52..cce74ff39447 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -71,6 +71,7 @@
>  #include <linux/dax.h>
>  #include <linux/oom.h>
>  #include <linux/numa.h>
> +#include <linux/module.h>
>  
>  #include <trace/events/kmem.h>
>  
> @@ -88,6 +89,8 @@
>  #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid.
>  #endif
>  
> +int panic_on_mm_error __read_mostly;
> +
>  #ifndef CONFIG_NEED_MULTIPLE_NODES
>  /* use the per-pgdat data instead for discontigmem - mbligh */
>  unsigned long max_mapnr;
> @@ -543,6 +546,10 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
>  		 vma->vm_ops ? vma->vm_ops->fault : NULL,
>  		 vma->vm_file ? vma->vm_file->f_op->mmap : NULL,
>  		 mapping ? mapping->a_ops->readpage : NULL);
> +
> +	print_modules();
> +	if (panic_on_mm_error)
> +		panic("Bad page map detected");
>  	dump_stack();
>  	add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
>  }
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index d047bf7d8fd4..2ea6a65ba011 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -643,9 +643,11 @@ static void bad_page(struct page *page, const char *reason,
>  	if (bad_flags)
>  		pr_alert("bad because of flags: %#lx(%pGp)\n",
>  						bad_flags, &bad_flags);
> -	dump_page_owner(page);
>  
> +	dump_page_owner(page);
>  	print_modules();
> +	if (panic_on_mm_error)
> +		panic("Bad page state detected");
>  	dump_stack();
>  out:
>  	/* Leave bad fields for debug, except PageBuddy could make trouble */

Reviewed-by: Aaron Tomlin <atomlin@redhat.com>

-- 
Aaron Tomlin

