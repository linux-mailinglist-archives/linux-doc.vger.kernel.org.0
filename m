Return-Path: <linux-doc+bounces-2296-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A5E7EAD34
	for <lists+linux-doc@lfdr.de>; Tue, 14 Nov 2023 10:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE57A280FEF
	for <lists+linux-doc@lfdr.de>; Tue, 14 Nov 2023 09:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451FC168C6;
	Tue, 14 Nov 2023 09:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D37168C3
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 09:44:20 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCDB191;
	Tue, 14 Nov 2023 01:44:19 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so8294666a12.0;
        Tue, 14 Nov 2023 01:44:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699955058; x=1700559858;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUNzJ2edP92bJxD8AgDGlr8qj4Lt1Mw4NxCr0R4hJ8c=;
        b=PFZAdWoGiBU60YgLbOPTF80ovOjP63SajKy6iT8O4jOeqKXrHR0LGg+P4SWMzVUVJx
         sv8SulPwz9tYkLoJMuoIlYPiNlaPDEO1DlUU6LZKj3N/dLB9TsZ5wHscpgoJKPVVfzJy
         8nSnK6ddI9NIUk0pCqACUgOlgS1IJkQjc8G4nwOkYvIw3xVGyH/rCK3UWHXk4plEaA4C
         +ttKTvYf+MTXOMU8aoF7FVk2rwvuTaBxKFieKobxcqoy0OpEpWmBp5jhfh4BomolwLbu
         XdwAkN0SebsbtM4cg2vqoGhtJjn5pUGDFW8jcO7M/4IXZhZHIkNuU+tuuWAuTB4/Eu/Q
         Rzuw==
X-Gm-Message-State: AOJu0Yym3zHTAgQ9C+A8p+mYI8ipwUso+tvu42He/21Y96i7hfr9ut1h
	dvYF1ZphkH4piP2Yk/hJseE=
X-Google-Smtp-Source: AGHT+IEQfONUWB4cDTMK0qP+dDw3hIEqdKbiG9dDjY4qhssIKf+Hxz+moOfEQRVmW2C98IIqhpsZQQ==
X-Received: by 2002:a17:906:141b:b0:9e0:727a:e491 with SMTP id p27-20020a170906141b00b009e0727ae491mr6096699ejc.35.1699955057467;
        Tue, 14 Nov 2023 01:44:17 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id z9-20020a170906714900b0099d804da2e9sm5285960ejj.225.2023.11.14.01.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 01:44:17 -0800 (PST)
Message-ID: <c1100a92-90de-4029-bb9c-8f4b6ee2c552@kernel.org>
Date: Tue, 14 Nov 2023 10:44:16 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] /proc/sysrq-trigger: accept multiple keys at once
Content-Language: en-US
To: Tomas Mudrunka <tomas.mudrunka@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 corbet@lwn.net, linux-doc@vger.kernel.org
References: <2023111330-headstone-pyromania-c57e@gregkh>
 <20231114093525.71871-1-tomas.mudrunka@gmail.com>
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20231114093525.71871-1-tomas.mudrunka@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14. 11. 23, 10:35, Tomas Mudrunka wrote:
> Just for convenience.
> This way we can do:
> `echo _reisub > /proc/sysrq-trigger`
> Instead of:
> `for i in r e i s u b; do echo "$i" > /proc/sysrq-trigger; done;`
> 
> This can be very useful when trying to execute sysrq combo remotely
> or from userspace. When sending keys in multiple separate writes,
> userspace can be killed before whole combo is completed.
> Therefore putting all keys in single write is more robust approach.
> 
> Signed-off-by: Tomas Mudrunka <tomas.mudrunka@gmail.com>
> ---
>   Documentation/admin-guide/sysrq.rst |  4 ++++
>   drivers/tty/sysrq.c                 | 17 ++++++++++++++---
>   2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin-guide/sysrq.rst
> index 51906e473..9d46a33e5 100644
> --- a/Documentation/admin-guide/sysrq.rst
> +++ b/Documentation/admin-guide/sysrq.rst
> @@ -79,6 +79,10 @@ On all
>   
>   		echo t > /proc/sysrq-trigger
>   
> +	Alternatively write key combo prepended by underscore. e.g.::
> +
> +		echo _reisub > /proc/sysrq-trigger
> +
>   The :kbd:`<command key>` is case sensitive.
>   
>   What are the 'command' keys?
> diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> index 6b4a28bcf..3455e6dd3 100644
> --- a/drivers/tty/sysrq.c
> +++ b/drivers/tty/sysrq.c
> @@ -1150,16 +1150,27 @@ EXPORT_SYMBOL(unregister_sysrq_key);
>   #ifdef CONFIG_PROC_FS
>   /*
>    * writing 'C' to /proc/sysrq-trigger is like sysrq-C
> + * If first character in write is underscore, all characters are interpreted.
>    */
>   static ssize_t write_sysrq_trigger(struct file *file, const char __user *buf,
>   				   size_t count, loff_t *ppos)
>   {
> -	if (count) {
> +	char bulk = false;

bool

> +	size_t i;
> +
> +	for (i = 0; i < count; i++) {
>   		char c;
>   
> -		if (get_user(c, buf))
> +		if (get_user(c, buf+i))

spaces around +

>   			return -EFAULT;
> -		__handle_sysrq(c, false);
> +
> +		if (c == '_')
> +			bulk = true;
> +		else
> +			__handle_sysrq(c, false);
> +
> +		if (!bulk)
> +			break;
>   	}
>   
>   	return count;

-- 
js
suse labs


