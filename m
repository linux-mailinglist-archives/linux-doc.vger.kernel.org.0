Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE4026C743
	for <lists+linux-doc@lfdr.de>; Wed, 16 Sep 2020 20:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgIPSWV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Sep 2020 14:22:21 -0400
Received: from ms.lwn.net ([45.79.88.28]:41608 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727798AbgIPSVP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 16 Sep 2020 14:21:15 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2474B2B2;
        Wed, 16 Sep 2020 18:21:14 +0000 (UTC)
Date:   Wed, 16 Sep 2020 12:21:13 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     <keescook@chromium.org>, <anton@enomsg.org>, <ccross@android.com>,
        <tony.luck@intel.com>, <paulmck@kernel.org>, <tglx@linutronix.de>,
        <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
        <mchehab+huawei@kernel.org>, <pawan.kumar.gupta@linux.intel.com>,
        <rdunlap@infradead.org>, <mike.kravetz@oracle.com>,
        <oneukum@suse.com>, <linux-doc@vger.kernel.org>,
        <linuxarm@huawei.com>
Subject: Re: [PATCH] Documentation: arm64 also supports disable hugeiomap
Message-ID: <20200916122113.6dd18974@lwn.net>
In-Reply-To: <1599740386-47210-1-git-send-email-tiantao6@hisilicon.com>
References: <1599740386-47210-1-git-send-email-tiantao6@hisilicon.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 10 Sep 2020 20:19:46 +0800
Tian Tao <tiantao6@hisilicon.com> wrote:

> arm64 also supports disable hugeiomap,updated documentation.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 5debfe2..86a5e37 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3206,7 +3206,7 @@
>  			register save and restore. The kernel will only save
>  			legacy floating-point registers on task switch.
>  
> -	nohugeiomap	[KNL,X86,PPC] Disable kernel huge I/O mappings.
> +	nohugeiomap	[KNL,X86,PPC,ARM64] Disable kernel huge I/O mappings.
>  
Applied, thanks.

jon
