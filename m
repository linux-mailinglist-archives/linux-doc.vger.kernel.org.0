Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3AFC277728
	for <lists+linux-doc@lfdr.de>; Thu, 24 Sep 2020 18:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgIXQsk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Sep 2020 12:48:40 -0400
Received: from ms.lwn.net ([45.79.88.28]:59276 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbgIXQsk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 Sep 2020 12:48:40 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8D8C6382;
        Thu, 24 Sep 2020 16:48:39 +0000 (UTC)
Date:   Thu, 24 Sep 2020 10:48:37 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/admin-guide: kernel-parameters:
 capitalize Korina
Message-ID: <20200924104837.0cbd74a6@lwn.net>
In-Reply-To: <20200918054722.28713-1-rdunlap@infradead.org>
References: <20200918054722.28713-1-rdunlap@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 17 Sep 2020 22:47:22 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Fix typo, capitalize Korina proper noun.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/admin-guide/kernel-parameters.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20200917.orig/Documentation/admin-guide/kernel-parameters.txt
> +++ linux-next-20200917/Documentation/admin-guide/kernel-parameters.txt
> @@ -2194,7 +2194,7 @@
>  	kgdbwait	[KGDB] Stop kernel execution and enter the
>  			kernel debugger at the earliest opportunity.
>  
> -	kmac=		[MIPS] korina ethernet MAC address.
> +	kmac=		[MIPS] Korina ethernet MAC address.

Applied, thanks.

jon
