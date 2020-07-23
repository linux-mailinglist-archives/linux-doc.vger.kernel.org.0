Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E7822B71C
	for <lists+linux-doc@lfdr.de>; Thu, 23 Jul 2020 22:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgGWUDX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Jul 2020 16:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgGWUDX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jul 2020 16:03:23 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FE6C0619DC
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2020 13:03:23 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3C27D2CD;
        Thu, 23 Jul 2020 20:03:23 +0000 (UTC)
Date:   Thu, 23 Jul 2020 14:03:22 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     rppt@linux.ibm.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH V2] docs/mm: concepts.rst: remove unnecessary word
Message-ID: <20200723140322.60d1c497@lwn.net>
In-Reply-To: <20200721112251.6100-1-unixbhaskar@gmail.com>
References: <20200721112251.6100-1-unixbhaskar@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 21 Jul 2020 16:52:51 +0530
Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:

> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
> Mike,
>  I have made the change to the subject line as you mentioned in previous
>  mail.
> 
>  Documentation/admin-guide/mm/concepts.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/mm/concepts.rst b/Documentation/admin-guide/mm/concepts.rst
> index c2531b14bf46..fa0974fbeae7 100644
> --- a/Documentation/admin-guide/mm/concepts.rst
> +++ b/Documentation/admin-guide/mm/concepts.rst
> @@ -35,7 +35,7 @@ physical memory (demand paging) and provides a mechanism for the
>  protection and controlled sharing of data between processes.
>  
>  With virtual memory, each and every memory access uses a virtual
> -address. When the CPU decodes the an instruction that reads (or
> +address. When the CPU decodes an instruction that reads (or
>  writes) from (or to) the system memory, it translates the `virtual`

Applied, thanks.

jon
