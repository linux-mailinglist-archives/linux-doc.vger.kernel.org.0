Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97EA9205316
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2020 15:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732610AbgFWNLa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 23 Jun 2020 09:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732618AbgFWNLZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Jun 2020 09:11:25 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E56C061796
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2020 06:11:23 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y11so23370219ljm.9
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2020 06:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mlmFSSdTWebFxD2gTR/U29ddRq9uUBP28CsLIBv6hs0=;
        b=RYlKqMV3+NySqvFz+sBwz2KeTHKcjpS/dM0JwloCcBbV8uUEstmlFACm9YxX/NANg3
         Ghx3BgLjT2+w8PE2V34IwjKR3CFsGFavuzjA0zPR6mPcmeOc/+x3Q/fCfqPbTUo4whNo
         Sszc0p3cz8OpjPgoF8szHgCswA9YVRWOm7cH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mlmFSSdTWebFxD2gTR/U29ddRq9uUBP28CsLIBv6hs0=;
        b=OHoD2yZhpslG67Dkq4q7DQJF62aaZet7ZnaaWToQ0L2+lQl4Et3PDyUfZFj99QguAi
         hs8ARNonFVLutyOyx4E8a/bOzO4QKKKGg5RoNwGz8Lb3UWA5PalQFaqdpZzBSn6NN/JQ
         oS7a8tWigogXs68tZ2/quORIzeskGFSUw1HGVuxPp2hLYMseHQQmRI4QUt2Y3y4LzHbk
         SPdM1nM9VExpZCxI9fNxi2SM1OWKEEOQ/HG0wPz6EmjmZgL+0Fe5VSqhtU2aWxVQcV3L
         ruDTbe/Aas/VGaIMrPjnG3XIrQ4HkGvuwGyoNn4A8lEgRzMmiLvLRN76xu5lkg0Dh396
         6O0g==
X-Gm-Message-State: AOAM532Ua5zVMcr/DIYGAYsB+w5yxYdPpNluFYscmHfOFqxAQHKAy2lG
        59zmim1EB7iGAek2qtjV3jPWaCknGVbykA==
X-Google-Smtp-Source: ABdhPJxu21nt5X4UswcI9f1ogE/YOaFoaQd0pqW/XIjXnAoxz5Vlxfzpj+BU0iyXwf5ee3FamMHkaA==
X-Received: by 2002:a2e:8847:: with SMTP id z7mr10509130ljj.300.1592917881527;
        Tue, 23 Jun 2020 06:11:21 -0700 (PDT)
Received: from [172.21.3.181] ([87.54.42.112])
        by smtp.gmail.com with ESMTPSA id j12sm3288234ljg.15.2020.06.23.06.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 06:11:20 -0700 (PDT)
Subject: Re: [PATCH v3 bpf-next 4/8] printk: add type-printing %pT format
 specifier which uses BTF
To:     Alan Maguire <alan.maguire@oracle.com>, ast@kernel.org,
        daniel@iogearbox.net, yhs@fb.com, andriin@fb.com,
        arnaldo.melo@gmail.com
Cc:     kafai@fb.com, songliubraving@fb.com, john.fastabend@gmail.com,
        kpsingh@chromium.org, joe@perches.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        andriy.shevchenko@linux.intel.com, corbet@lwn.net,
        bpf@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <1592914031-31049-1-git-send-email-alan.maguire@oracle.com>
 <1592914031-31049-5-git-send-email-alan.maguire@oracle.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <9ff219a4-dcae-95a1-584b-054d0d5e4ebb@rasmusvillemoes.dk>
Date:   Tue, 23 Jun 2020 15:11:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1592914031-31049-5-git-send-email-alan.maguire@oracle.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 23/06/2020 14.07, Alan Maguire wrote:
> diff --git a/include/linux/printk.h b/include/linux/printk.h
> index fc8f03c..8f8f5d2 100644
> --- a/include/linux/printk.h
> +++ b/include/linux/printk.h
> @@ -618,4 +618,20 @@ static inline void print_hex_dump_debug(const char *prefix_str, int prefix_type,
>  #define print_hex_dump_bytes(prefix_str, prefix_type, buf, len)	\
>  	print_hex_dump_debug(prefix_str, prefix_type, 16, 1, buf, len, true)
>  
> +/**
> + * struct btf_ptr is used for %pT (typed pointer) display; the
> + * additional type string/BTF id are used to render the pointer
> + * data as the appropriate type.
> + */
> +struct btf_ptr {
> +	void *ptr;
> +	const char *type;
> +	u32 id;
> +};
> +
> +#define	BTF_PTR_TYPE(ptrval, typeval) \
> +	(&((struct btf_ptr){.ptr = ptrval, .type = #typeval}))
> +
> +#define BTF_PTR_ID(ptrval, idval) \
> +	(&((struct btf_ptr){.ptr = ptrval, .id = idval}))

Isn't there some better place to put this than printk.h? Anyway, you
probably want the ptr member to be "const void*", to avoid "... discards
const qualifier" warnings when somebody happens to have a "const struct
foobar *".

>  #endif
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 259e558..c0d209d 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -44,6 +44,7 @@
>  #ifdef CONFIG_BLOCK
>  #include <linux/blkdev.h>
>  #endif
> +#include <linux/btf.h>
>  
>  #include "../mm/internal.h"	/* For the trace_print_flags arrays */
>  
> @@ -2092,6 +2093,87 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
>  	return widen_string(buf, buf - buf_start, end, spec);
>  }
>  
> +#define btf_modifier_flag(c)	(c == 'c' ? BTF_SHOW_COMPACT :	\
> +				 c == 'N' ? BTF_SHOW_NONAME :	\
> +				 c == 'x' ? BTF_SHOW_PTR_RAW :	\
> +				 c == 'u' ? BTF_SHOW_UNSAFE : \
> +				 c == '0' ? BTF_SHOW_ZERO : 0)
> +
> +static noinline_for_stack
> +char *btf_string(char *buf, char *end, void *ptr, struct printf_spec spec,
> +		 const char *fmt)
> +{
> +	struct btf_ptr *bp = (struct btf_ptr *)ptr;
> +	u8 btf_kind = BTF_KIND_TYPEDEF;
> +	const struct btf_type *t;
> +	const struct btf *btf;
> +	char *buf_start = buf;
> +	const char *btf_type;
> +	u64 flags = 0, mod;
> +	s32 btf_id;
> +
> +	if (check_pointer(&buf, end, ptr, spec))
> +		return buf;
> +
> +	if (check_pointer(&buf, end, bp->ptr, spec))
> +		return buf;
> +
> +	while (isalnum(*fmt)) {
> +		mod = btf_modifier_flag(*fmt);
> +		if (!mod)
> +			break;
> +		flags |= mod;
> +		fmt++;
> +	}
> +
> +	btf = bpf_get_btf_vmlinux();

AFAICT, this function is only compiled if CONFIG_BPF=y and
CONFIG_BPF_SYSCALL=y, and I don't see any static inline stub defined
anywhere. Have you built the kernel with one or both of those turned off?

Rasmus
