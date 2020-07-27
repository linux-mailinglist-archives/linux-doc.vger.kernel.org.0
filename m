Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5794622FC12
	for <lists+linux-doc@lfdr.de>; Tue, 28 Jul 2020 00:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgG0WXP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Jul 2020 18:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgG0WXP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jul 2020 18:23:15 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EEFEC061794
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2020 15:23:15 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1E8706D9;
        Mon, 27 Jul 2020 22:23:15 +0000 (UTC)
Date:   Mon, 27 Jul 2020 16:23:14 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yue Hu <zbestahu@gmail.com>
Cc:     linux-doc@vger.kernel.org, huyue2@yulong.com
Subject: Re: [PATCH] Documentation/admin-guide: tainted-kernels: fix
 spelling mistake
Message-ID: <20200727162314.27d588cf@lwn.net>
In-Reply-To: <20200725022444.10976-1-zbestahu@gmail.com>
References: <20200725022444.10976-1-zbestahu@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 25 Jul 2020 10:24:44 +0800
Yue Hu <zbestahu@gmail.com> wrote:

> From: Yue Hu <huyue2@yulong.com>
> 
> Fix typo "tis" -> "this".
> 
> Signed-off-by: Yue Hu <huyue2@yulong.com>
> ---
>  Documentation/admin-guide/tainted-kernels.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
> index 71e9184..0fbaa0f 100644
> --- a/Documentation/admin-guide/tainted-kernels.rst
> +++ b/Documentation/admin-guide/tainted-kernels.rst
> @@ -38,7 +38,7 @@ either letters or blanks. In above example it looks like this::
>  
>  	Tainted: P        W  O
>  
> -The meaning of those characters is explained in the table below. In tis case
> +The meaning of those characters is explained in the table below. In this case
>  the kernel got tainted earlier because a proprietary Module (``P``) was loaded,

Applied, thanks.

jon
