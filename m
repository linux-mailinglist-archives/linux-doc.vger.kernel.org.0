Return-Path: <linux-doc+bounces-895-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEF97D4634
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 05:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF01FB21042
	for <lists+linux-doc@lfdr.de>; Tue, 24 Oct 2023 03:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E72DF45;
	Tue, 24 Oct 2023 03:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="XNc3KcIb"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E0C79F4
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 03:52:32 +0000 (UTC)
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61CE810EB
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:52:31 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4196ae80fc3so23840151cf.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 20:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1698119550; x=1698724350; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HLvkudqanD7ho/JohV3yYMvdl0m/YZEqjpT0bM0Y7Gw=;
        b=XNc3KcIb+IR8QS+MHo1fOpYYF218BMMpw9ZcQas/Zpj/xANT2PzcX4M5DsFY6GkHqo
         GerPdig2n7O8sfAn0qDHvpz7jzGrLAenJNm2fMLtJgW6GHMP1BM/mocMG5qmzrI00V8z
         OD2X/6lxilvyC0tlj2dWBsJrLgBQnunzBka62gH08EiefGgRKntxbfvMO3yzbVXTldlr
         QPnp2txrzw92B0Cicpf2FTbrf7sRyc3NGEdJdeTq2R4bArrNpYRBleLaA/LChZocuWuk
         pjqLpKlaAh+qrOCmUZL5tI60SseyZxjXGmoEe6jGKxvMeejw6mSyHUDZQTDbWUQwK6Hr
         j0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698119550; x=1698724350;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLvkudqanD7ho/JohV3yYMvdl0m/YZEqjpT0bM0Y7Gw=;
        b=HGd18TCSQyxZ9+QzuvlRG2Iicx5SslXVbt/Le02msdKpHb8iBmn+vw7zw+7ix7Mc1e
         RAaAHwRPp2LaEfVM3Tlo4QE5JDFgxzl8qQx1tUPFVRWL59wrYvM+Wg0yg7zPt405IOhc
         9/kB1T8DFhiE4CNIPEJJvz2VpSibtH8QSPiIyj+awt4zV2dXe2s7fMtAE9LrtP5oesgo
         BrRlLaoyCnkn0+farpebw1Sh5rwj6alQWHA8w8bT4EfNhS4QxyiO1qTbfTVLad82V82f
         dITJOYJz2zLyl6f9YD3Cjt3ng/FQiKBJFBk9ZtXN+lTZXhdQamuxAGP0xdGvvvGg660W
         FvpQ==
X-Gm-Message-State: AOJu0YwuIMrfj7TU+nfbEJ7u101DycRXjhIN0+2QS3P6316iOLvOP/gN
	mvlLtTFL6LVK52nQAS/I71bs
X-Google-Smtp-Source: AGHT+IHxiDP0oQS0IHZl9PGSzz8xG4YIOPId7UdDJm7uyxgqMm7h4born+PADWw4P1qOvg39+RCjvw==
X-Received: by 2002:ac8:5c08:0:b0:41b:ff51:4e72 with SMTP id i8-20020ac85c08000000b0041bff514e72mr11390786qti.48.1698119550281;
        Mon, 23 Oct 2023 20:52:30 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id kr25-20020ac861d9000000b004181c32dcc3sm3179140qtb.16.2023.10.23.20.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 20:52:29 -0700 (PDT)
Date: Mon, 23 Oct 2023 23:52:29 -0400
Message-ID: <85311850a862fe6ccb946634429b890a.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, eparis@redhat.com
Cc: linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org, dm-devel@redhat.com, audit@vger.kernel.org, roberto.sassu@huawei.com, linux-kernel@vger.kernel.org, Fan Wu <wufan@linux.microsoft.com>
Subject: Re: [PATCH RFC v11 11/19] dm verity: set DM_TARGET_SINGLETON feature  flag
References: <1696457386-3010-12-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1696457386-3010-12-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

On Oct  4, 2023 Fan Wu <wufan@linux.microsoft.com> wrote:
> 
> The device-mapper has a flag to mark targets as singleton, which is a
> required flag for immutable targets. Without this flag, multiple
> dm-verity targets can be added to a mapped device, which has no
> practical use cases and will let dm_table_get_immutable_target return
> NULL. This patch adds the missing flag, restricting only one
> dm-verity target per mapped device.
> 
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> ---
> v1-v10:
>   + Not present
> ---
>  drivers/md/dm-verity-target.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This seems reasonable to me and matches with other users of
DM_TARGET_IMMUTABLE.

Alasdair, Mike, can we get an ACK on this?

> diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
> index 26adcfea0302..80673b66c194 100644
> --- a/drivers/md/dm-verity-target.c
> +++ b/drivers/md/dm-verity-target.c
> @@ -1503,7 +1503,7 @@ int dm_verity_get_root_digest(struct dm_target *ti, u8 **root_digest, unsigned i
>  
>  static struct target_type verity_target = {
>  	.name		= "verity",
> -	.features	= DM_TARGET_IMMUTABLE,
> +	.features	= DM_TARGET_SINGLETON | DM_TARGET_IMMUTABLE,
>  	.version	= {1, 9, 0},
>  	.module		= THIS_MODULE,
>  	.ctr		= verity_ctr,
> -- 
> 2.25.1

--
paul-moore.com

