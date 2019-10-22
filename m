Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7CE3DFBA2
	for <lists+linux-doc@lfdr.de>; Tue, 22 Oct 2019 04:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730494AbfJVC0a (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Oct 2019 22:26:30 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33574 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730271AbfJVC0a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Oct 2019 22:26:30 -0400
Received: by mail-pf1-f193.google.com with SMTP id c184so134275pfb.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2019 19:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jqjDyYINco5zX/3d/HD5i73gQP0vQKo5KvrXR6/+e2c=;
        b=MFs2Q0eXF9XUrND1F2MJOxBu9xbjhSqOGU6EPkNbeFMZzcJ8ae2p9HucqK9c/SVS+o
         s9u9XS0jgoNVxI8exvI1ZocmtdKZMFNQr8zzVbkZVLutxGl0ZEt2HEBoHdXIQZreO32m
         BBhw5YArtVoQltlvAofF/1y+6Z469Vkt3cQflHKgLbzOl3duane7YE2luctwK7ucxpoN
         6GrN0F42OmDekeSSR8XyJlBStdagHrxed+3gVcr9AIjyeeHZ/mqcbi+U1p19fQpzXO8w
         KPfNOkWK4sqeHb5/u6m2dletcPwH3uNOXzGt4hjXxnAMEC3W9IU1OPvMe/DDfC2YtQhV
         VKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jqjDyYINco5zX/3d/HD5i73gQP0vQKo5KvrXR6/+e2c=;
        b=fZOOvft2JPeis2qbl6ciXUZwJKAKCQOs3EWWdIPSU1m70e4wOAPYh5vnApiNtujNcC
         +aES+OBlQ3gxSrPJGEPNkXu7O3kR+hW5CZcnoNvSIE3EFHlXLUI+CXFm6e/yRFl0Tl25
         s7zR3ffsDUNZM6G6dhAnMNmRKYCU2yp817/aRfZMNH/CNm1ixrEEMdtdIf6XvWuJhqX0
         2w3pTXushn+nh+vDL+WvUwqQiZe+eAYE2fVcX3WjMke2dncOmHE5cIDFAidl98Ih5Kb7
         s9mm65qSupjYO3HWQV1kn6rUt90u9Fu/hiJ3E3fVvuDethpV/ewwJ9zmst/I05z91djm
         BdlQ==
X-Gm-Message-State: APjAAAVeLQWdph1haiVtaUsPcerajDyU9qPjmFPvX1hYt6hwl4slp9Tz
        jky8SyOnJlloen2KHHCbrJ6/Lw==
X-Google-Smtp-Source: APXvYqwVLIBMQXiqD7AfzsiN2dabnPivlCcnteH5RiUBQ7Bm5cIT/ILRYjse8rfnqU0qx22DSZak4A==
X-Received: by 2002:a62:7a8c:: with SMTP id v134mr1371160pfc.143.1571711189526;
        Mon, 21 Oct 2019 19:26:29 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id n66sm23792844pfn.90.2019.10.21.19.26.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 19:26:28 -0700 (PDT)
Date:   Tue, 22 Oct 2019 07:56:25 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: debugfs: Document debugfs helper for
 unsigned long values
Message-ID: <20191022022625.dreyswengvmpzeas@vireshk-i7>
References: <20191021150645.32440-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021150645.32440-1-geert+renesas@glider.be>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 21-10-19, 17:06, Geert Uytterhoeven wrote:
> When debugfs_create_ulong() was added, it was not documented.
> 
> Fixes: c23fe83138ed7b11 ("debugfs: Add debugfs_create_ulong()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/filesystems/debugfs.txt | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/debugfs.txt b/Documentation/filesystems/debugfs.txt
> index 9e705026ac103b6f..50e8f91f2421ec04 100644
> --- a/Documentation/filesystems/debugfs.txt
> +++ b/Documentation/filesystems/debugfs.txt
> @@ -93,8 +93,8 @@ the following functions can be used instead:
>  
>  These functions are useful as long as the developer knows the size of the
>  value to be exported.  Some types can have different widths on different
> -architectures, though, complicating the situation somewhat.  There is a
> -function meant to help out in one special case:
> +architectures, though, complicating the situation somewhat.  There are
> +functions meant to help out in such special cases:
>  
>      void debugfs_create_size_t(const char *name, umode_t mode,
>  			       struct dentry *parent, size_t *value);
> @@ -102,6 +102,12 @@ function meant to help out in one special case:
>  As might be expected, this function will create a debugfs file to represent
>  a variable of type size_t.
>  
> +Similarly, there is a helper for variables of type unsigned long:
> +
> +    struct dentry *debugfs_create_ulong(const char *name, umode_t mode,
> +					struct dentry *parent,
> +					unsigned long *value);
> +
>  Boolean values can be placed in debugfs with:
>  
>      struct dentry *debugfs_create_bool(const char *name, umode_t mode,

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
