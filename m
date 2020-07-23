Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F82022B70C
	for <lists+linux-doc@lfdr.de>; Thu, 23 Jul 2020 21:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgGWT6b (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Jul 2020 15:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgGWT6b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jul 2020 15:58:31 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C3BC0619DC;
        Thu, 23 Jul 2020 12:58:31 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 929862BA;
        Thu, 23 Jul 2020 19:58:30 +0000 (UTC)
Date:   Thu, 23 Jul 2020 13:58:29 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jiri Slaby <jslaby@suse.cz>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH -resend] Documentation: fb, fix path to modedb.c
Message-ID: <20200723135829.35b44922@lwn.net>
In-Reply-To: <20200723103454.26167-1-jslaby@suse.cz>
References: <20200723103454.26167-1-jslaby@suse.cz>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 23 Jul 2020 12:34:54 +0200
Jiri Slaby <jslaby@suse.cz> wrote:

> modedb.c was moved twice since the modedb documentation was written.
> Update the path to the current one.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/fb/modedb.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/fb/modedb.rst b/Documentation/fb/modedb.rst
> index 624d08fd2856..4d2411e32ebb 100644
> --- a/Documentation/fb/modedb.rst
> +++ b/Documentation/fb/modedb.rst
> @@ -152,7 +152,7 @@ To specify a video mode at bootup, use the following boot options::
>      video=<driver>:<xres>x<yres>[-<bpp>][@refresh]
>  
>  where <driver> is a name from the table below.  Valid default modes can be
> -found in linux/drivers/video/modedb.c.  Check your driver's documentation.
> +found in drivers/video/fbdev/core/modedb.c.  Check your driver's documentation.
>  There may be more modes::

"resend" but I've never seen it before...in any case I've applied it now.

Thanks,

jon
