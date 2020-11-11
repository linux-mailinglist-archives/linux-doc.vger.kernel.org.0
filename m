Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4EA02AE5EB
	for <lists+linux-doc@lfdr.de>; Wed, 11 Nov 2020 02:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732086AbgKKBia (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 Nov 2020 20:38:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45826 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731610AbgKKBia (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Nov 2020 20:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605058709;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4+tvfdrkEmZTFexm1h6AxeFVxvrZtfe5vDA09cO9oSY=;
        b=ZAMZIN6mR5Hf07Y3wbAaE5Sk3UYc/wd2/ZL+0HxXrwZVnHK6OZKLzYuflUAiifezfJf1Pp
        3fYKZRTlPFjAcuuhL1vUuW8YJMQuTKrYC75SJg5wYRo7Z+7jVXJOFUNcSUA+t652x83N47
        8bjMkkBdi0Z2M/bMu2+uj8UVicsXLbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-T6GlM7k-ND20cweGeokNJw-1; Tue, 10 Nov 2020 20:38:26 -0500
X-MC-Unique: T6GlM7k-ND20cweGeokNJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EC441074656;
        Wed, 11 Nov 2020 01:38:23 +0000 (UTC)
Received: from localhost (ovpn-12-35.pek2.redhat.com [10.72.12.35])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 01D1D277D5;
        Wed, 11 Nov 2020 01:38:18 +0000 (UTC)
Date:   Wed, 11 Nov 2020 09:38:15 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Chen Zhou <chenzhou10@huawei.com>
Cc:     tglx@linutronix.de, mingo@redhat.com, dyoung@redhat.com,
        catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
        John.P.donnelly@oracle.com, bhsharma@redhat.com,
        prabhakar.pkin@gmail.com, wangkefeng.wang@huawei.com,
        arnd@arndb.de, linux-doc@vger.kernel.org, xiexiuqi@huawei.com,
        kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, horms@verge.net.au, james.morse@arm.com,
        linux-arm-kernel@lists.infradead.org, huawei.libin@huawei.com,
        guohanjun@huawei.com, nsaenzjulienne@suse.de
Subject: Re: [PATCH v13 1/8] x86: kdump: replace the hard-coded alignment
 with macro CRASH_ALIGN
Message-ID: <20201111013815.GC24747@MiWiFi-R3L-srv>
References: <20201031074437.168008-1-chenzhou10@huawei.com>
 <20201031074437.168008-2-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201031074437.168008-2-chenzhou10@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/31/20 at 03:44pm, Chen Zhou wrote:
> Move CRASH_ALIGN to header asm/kexec.h and replace the hard-coded
> alignment with macro CRASH_ALIGN in function reserve_crashkernel().

Seems you tell what you have done in this patch, but don't like adding
several more words to tell why it's done like that. Please see below
inline comments.

In other patches, I can also see this similar problem.

> 
> Suggested-by: Dave Young <dyoung@redhat.com>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> Tested-by: John Donnelly <John.p.donnelly@oracle.com>
> ---
>  arch/x86/include/asm/kexec.h | 3 +++
>  arch/x86/kernel/setup.c      | 5 +----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
> index 6802c59e8252..8cf9d3fd31c7 100644
> --- a/arch/x86/include/asm/kexec.h
> +++ b/arch/x86/include/asm/kexec.h
> @@ -18,6 +18,9 @@
>  
>  # define KEXEC_CONTROL_CODE_MAX_SIZE	2048
>  
> +/* 2M alignment for crash kernel regions */
> +#define CRASH_ALIGN		SZ_16M
> +
>  #ifndef __ASSEMBLY__
>  
>  #include <linux/string.h>
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 84f581c91db4..bf373422dc8a 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -395,9 +395,6 @@ static void __init memblock_x86_reserve_range_setup_data(void)
>  
>  #ifdef CONFIG_KEXEC_CORE
>  
> -/* 16M alignment for crash kernel regions */
> -#define CRASH_ALIGN		SZ_16M
> -
>  /*
>   * Keep the crash kernel below this limit.
>   *
> @@ -515,7 +512,7 @@ static void __init reserve_crashkernel(void)
>  	} else {
>  		unsigned long long start;
>  
> -		start = memblock_phys_alloc_range(crash_size, SZ_1M, crash_base,
> +		start = memblock_phys_alloc_range(crash_size, CRASH_ALIGN, crash_base,
>  						  crash_base + crash_size);

Here, SZ_1M is replaced with CRASH_ALIGN which is 16M. I remember I ever
commented that this had better be told in patch log.

>  		if (start != crash_base) {
>  			pr_info("crashkernel reservation failed - memory is in use.\n");
> -- 
> 2.20.1
> 
> 
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
> 

