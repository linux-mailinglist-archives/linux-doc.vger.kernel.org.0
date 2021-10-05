Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF30B422D57
	for <lists+linux-doc@lfdr.de>; Tue,  5 Oct 2021 18:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236227AbhJEQHf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 Oct 2021 12:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234416AbhJEQHf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 12:07:35 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72EAC06174E
        for <linux-doc@vger.kernel.org>; Tue,  5 Oct 2021 09:05:44 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id 145so17804581pfz.11
        for <linux-doc@vger.kernel.org>; Tue, 05 Oct 2021 09:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0RdVfqFSq5wXHZuicTJy3YcQDgpH/n78CpgNWIuQCUc=;
        b=mJNlyIULPcE0SuzMKt+dkqTfWXZOGHpZWYpFTFy5pGmoUE+qlxo5F0Ae3Ff5J/YZ6a
         lUNoUlSB4buIfF8NjPxdaVzhlqcu/i6hG+DyU33CZS0qEFb7d+EaBKoPOlScDCFucuAb
         cWL7Z0kzpYtXR15MzhoIuQLpsVvo9C5/adTwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0RdVfqFSq5wXHZuicTJy3YcQDgpH/n78CpgNWIuQCUc=;
        b=FUog1t/Epvg5bVmqpFuaFQjdAb4MArwZFAp/GOQwe/d+t9IbuDBWMJkZyA8vYDaZ/s
         XxZXcobK+TnPudE9C0F6okhCVdnwMvmr77wJ5UAmLSxocQ5YZJytyVQoQI1CwlQoyKYC
         /w3TbFxfbD6ALCgnsJz+4QaqT3fIr121XBCi8pByLh7XrFHEXjVky2bmWKOPAXyW0UFK
         XGSJ0PxjMTNU3vNYayiXmnjud4SlI+JWPNMKFwxyXaSSOwpOd4g1MG1AtTjUH8gmWQvc
         4m342/vCnb+z7mqitFiKAOYdZMazpaN5xIghwrDMAaLLmeTQfQF5FlGeyOcK/4KWo52K
         CZiw==
X-Gm-Message-State: AOAM533sCKADQ91+foO5GmIb9ZdBa8u6llx64dHXq6Ue8F0+f0BZGtzG
        thCcNwWT7Ab//ATwPh9/CMx0ew==
X-Google-Smtp-Source: ABdhPJwElO40SyVAefyn8InNKMvbBcvu4Lgc1+V1oePKOe7yj8Cwg2fuZ9uRihllZJfsf6twgQeR2w==
X-Received: by 2002:a63:f346:: with SMTP id t6mr16272636pgj.345.1633449942855;
        Tue, 05 Oct 2021 09:05:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d7sm18205368pfq.43.2021.10.05.09.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 09:05:42 -0700 (PDT)
Date:   Tue, 5 Oct 2021 09:05:41 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     tj@kernel.org, gregkh@linuxfoundation.org,
        akpm@linux-foundation.org, minchan@kernel.org, jeyu@kernel.org,
        shuah@kernel.org, bvanassche@acm.org, dan.j.williams@intel.com,
        joe@perches.com, tglx@linutronix.de, rostedt@goodmis.org,
        linux-spdx@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 08/12] fs/sysfs/dir.c: replace S_IRWXU|S_IRUGO|S_IXUGO
 with 0755 sysfs_create_dir_ns()
Message-ID: <202110050903.2BD0F9B@keescook>
References: <20210927163805.808907-1-mcgrof@kernel.org>
 <20210927163805.808907-9-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927163805.808907-9-mcgrof@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 27, 2021 at 09:38:01AM -0700, Luis Chamberlain wrote:
> If one ends up expanding on this line checkpatch will complain that the
> combination S_IRWXU|S_IRUGO|S_IXUGO should just be replaced with the
> octal 0755. Do that.
> 
> This makes no functional changes.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

It could be helpful to add a link too:
https://www.kernel.org/doc/html/latest/dev-tools/checkpatch.html?highlight=non_octal#permissions

Reviewed-by: Kees Cook <keescook@chromium.org>

> ---
>  fs/sysfs/dir.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/sysfs/dir.c b/fs/sysfs/dir.c
> index 59dffd5ca517..b6b6796e1616 100644
> --- a/fs/sysfs/dir.c
> +++ b/fs/sysfs/dir.c
> @@ -56,8 +56,7 @@ int sysfs_create_dir_ns(struct kobject *kobj, const void *ns)
>  
>  	kobject_get_ownership(kobj, &uid, &gid);
>  
> -	kn = kernfs_create_dir_ns(parent, kobject_name(kobj),
> -				  S_IRWXU | S_IRUGO | S_IXUGO, uid, gid,
> +	kn = kernfs_create_dir_ns(parent, kobject_name(kobj), 0755, uid, gid,
>  				  kobj, ns);
>  	if (IS_ERR(kn)) {
>  		if (PTR_ERR(kn) == -EEXIST)
> -- 
> 2.30.2
> 

-- 
Kees Cook
