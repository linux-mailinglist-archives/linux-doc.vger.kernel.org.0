Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F712607FB
	for <lists+linux-doc@lfdr.de>; Tue,  8 Sep 2020 03:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbgIHBWE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Sep 2020 21:22:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47288 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726918AbgIHBWB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Sep 2020 21:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599528120;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DHDE04dL1iLzt4kSE7d4cxDF7AqyqCPfXkT2zvDozX0=;
        b=Wz4151RKbAI6P6g7aw7d0rPTg4+dL1lGFrSmOxbBVgdF7nmpUOvFenya260KDfKPvBydMm
        7GaeTIqRsY2DQvOrzztHUGH1GyNJY/YvnRfhE0pwiuyfCjGzAxKI7FrOHit3Gve/pWx7hH
        qHBudt88yRxYdrmcteK/W3DZ9YZCq5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-jhaIh8w3Oxuqg_riZU2Gew-1; Mon, 07 Sep 2020 21:21:57 -0400
X-MC-Unique: jhaIh8w3Oxuqg_riZU2Gew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47AB71005E5B;
        Tue,  8 Sep 2020 01:21:55 +0000 (UTC)
Received: from dhcp-128-65.nay.redhat.com (ovpn-12-252.pek2.redhat.com [10.72.12.252])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 99F611002D40;
        Tue,  8 Sep 2020 01:21:42 +0000 (UTC)
Date:   Tue, 8 Sep 2020 09:21:38 +0800
From:   Dave Young <dyoung@redhat.com>
To:     Chen Zhou <chenzhou10@huawei.com>
Cc:     catalin.marinas@arm.com, will@kernel.org, james.morse@arm.com,
        tglx@linutronix.de, mingo@redhat.com, bhe@redhat.com,
        corbet@lwn.net, John.P.donnelly@oracle.com,
        prabhakar.pkin@gmail.com, bhsharma@redhat.com, horms@verge.net.au,
        robh+dt@kernel.org, arnd@arndb.de, nsaenzjulienne@suse.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        guohanjun@huawei.com, xiexiuqi@huawei.com, huawei.libin@huawei.com,
        wangkefeng.wang@huawei.com
Subject: Re: [PATCH v12 1/9] x86: kdump: move CRASH_ALIGN to 2M
Message-ID: <20200908012138.GA3058@dhcp-128-65.nay.redhat.com>
References: <20200907134745.25732-1-chenzhou10@huawei.com>
 <20200907134745.25732-2-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907134745.25732-2-chenzhou10@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 09/07/20 at 09:47pm, Chen Zhou wrote:
> CONFIG_PHYSICAL_ALIGN can be selected from 2M to 16M and default
> value is 2M, so move CRASH_ALIGN to 2M, with smaller value reservation
> can have more chance to succeed.

Seems still some misunderstanding about the change :(  I'm sorry if I
did not explain it clearly.

Previously I missed the PHYSICAL_ALIGN can change according to .config
I mean we should change the value to CONFIG_PHYSICAL_ALIGN for X86
And I suggest to move back to keep using 16M.  And do not change it in
this series.

> And replace the hard-coded alignment with macro CRASH_ALIGN in function
> reserve_crashkernel().
> 
> Suggested-by: Dave Young <dyoung@redhat.com>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> ---
>  arch/x86/include/asm/kexec.h | 3 +++
>  arch/x86/kernel/setup.c      | 5 +----
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
> index 6802c59e8252..83f200dd54a1 100644
> --- a/arch/x86/include/asm/kexec.h
> +++ b/arch/x86/include/asm/kexec.h
> @@ -18,6 +18,9 @@
>  
>  # define KEXEC_CONTROL_CODE_MAX_SIZE	2048
>  
> +/* 2M alignment for crash kernel regions */
> +#define CRASH_ALIGN		SZ_2M
> +
>  #ifndef __ASSEMBLY__
>  
>  #include <linux/string.h>
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 3511736fbc74..296294ad0dd8 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -402,9 +402,6 @@ static void __init memblock_x86_reserve_range_setup_data(void)
>  
>  #ifdef CONFIG_KEXEC_CORE
>  
> -/* 16M alignment for crash kernel regions */
> -#define CRASH_ALIGN		SZ_16M
> -
>  /*
>   * Keep the crash kernel below this limit.
>   *
> @@ -530,7 +527,7 @@ static void __init reserve_crashkernel(void)
>  
>  		start = memblock_find_in_range(crash_base,
>  					       crash_base + crash_size,
> -					       crash_size, 1 << 20);
> +					       crash_size, CRASH_ALIGN);
>  		if (start != crash_base) {
>  			pr_info("crashkernel reservation failed - memory is in use.\n");
>  			return;
> -- 
> 2.20.1
> 

Thanks
Dave

