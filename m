Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80CE1FF795
	for <lists+linux-doc@lfdr.de>; Sun, 17 Nov 2019 05:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbfKQE6B (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 16 Nov 2019 23:58:01 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36288 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfKQE6B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Nov 2019 23:58:01 -0500
Received: by mail-pg1-f193.google.com with SMTP id k13so7924142pgh.3
        for <linux-doc@vger.kernel.org>; Sat, 16 Nov 2019 20:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=jEgcbLffHvInuudf1yxHrJupAep1eByuwcjffM5aOvc=;
        b=a/3JWGztuOAbEsz9msqcvd9nTRMEET4rlDcOuI2gbNGMsUc12lezwTIotPcZPOfSto
         WDi5TpG/Dhh3/PhkjsSe8K0caDhzTdWV9Ir3B2mTcbDgcN1gP5L8a2a/PS28n1mLqGIb
         E9XApBJBUbMjJDcX/eMUarB1Kq+0ywGsq056YIUuRivb8eah0lfGIw/Tv5L8De3BPQq/
         Sq3E34e12B05O3owK+5JN4t70jRFeU7aphHF66OaAXuF/z6vKcEyq4xax3RxrLBllcLa
         r32x8vNm73s5/CYifOwU370+nfyeFLqm6o67TT9FvgcfAJELoLuIZXY2W2eo5sVVAjrD
         vjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=jEgcbLffHvInuudf1yxHrJupAep1eByuwcjffM5aOvc=;
        b=f0suna0OXkFfQ1siTm+YbWnqtqY31BRZ2IkKYg+ojYJV4HBccLt/wf1MrZRbRypmTt
         M7RneCJKa+nlHSCkMPY7fDbv39wxEP/GW65KBVDdqSuLNpNogzdOXkGKpHpJkRcH7wpg
         TFv6jfqag9qgydCI9dyTvYbhZn92fMz7uzboROEitwY/dddzijhB+MYDwC37CeJo0qs/
         WsaI+k+efuvyEOlNMWqNu1z1/VkXC9F3O2uxDpxV+5smu12hbXVQGv3lK51/reV9oxVV
         sBRVCmccslfaLz8pO5hdyQkTFArB7koQg/4c/UGJOUQoTUaisFcw8vcMeTysApitnloP
         7zCw==
X-Gm-Message-State: APjAAAUwhnrQOrCL7TY/7t+a1hN+OEXSIQfzBqrx0q2/HhcDb1y5pe01
        30jD7K+THQgxGf9WFbLhfDTS8w==
X-Google-Smtp-Source: APXvYqw/trc/1O1AypH6tmLPpsAPixu8z/SqLT0y6hDUX8FDf31UAw3DYcCxUKNNRS/lE8JtSappkQ==
X-Received: by 2002:a63:1f08:: with SMTP id f8mr8309321pgf.145.1573966680566;
        Sat, 16 Nov 2019 20:58:00 -0800 (PST)
Received: from localhost ([2600:1011:b043:4c6e:3bc6:3ed3:dc27:5ef3])
        by smtp.gmail.com with ESMTPSA id j20sm15436653pff.182.2019.11.16.20.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 20:58:00 -0800 (PST)
Date:   Sat, 16 Nov 2019 20:57:55 -0800 (PST)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     dvyukov@google.com, glider@google.com, aryabinin@virtuozzo.com
cc:     Nick Hu <nickhu@andestech.com>, corbet@lwn.net, palmer@sifive.com,
        aou@eecs.berkeley.edu, tglx@linutronix.de,
        gregkh@linuxfoundation.org, alankao@andestech.com,
        Anup.Patel@wdc.com, atish.patra@wdc.com,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-mm@kvack.org, green.hu@gmail.com
Subject: Re: [PATCH v4 1/3] kasan: No KASAN's memmove check if archs don't
 have it.
In-Reply-To: <20191028024101.26655-2-nickhu@andestech.com>
Message-ID: <alpine.DEB.2.21.9999.1911162055490.21209@viisi.sifive.com>
References: <20191028024101.26655-1-nickhu@andestech.com> <20191028024101.26655-2-nickhu@andestech.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Andrey, Alexander, Dmitry,

On Mon, 28 Oct 2019, Nick Hu wrote:

> If archs don't have memmove then the C implementation from lib/string.c is used,
> and then it's instrumented by compiler. So there is no need to add KASAN's
> memmove to manual checks.
> 
> Signed-off-by: Nick Hu <nickhu@andestech.com>

If you're happy with this revision of this patch, could you please ack it 
so we can merge it as part of the RISC-V KASAN patch set? 

Or if you'd prefer to take this patch yourself, please let me know.


- Paul

> ---
>  mm/kasan/common.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 6814d6d6a023..897f9520bab3 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -107,6 +107,7 @@ void *memset(void *addr, int c, size_t len)
>  	return __memset(addr, c, len);
>  }
>  
> +#ifdef __HAVE_ARCH_MEMMOVE
>  #undef memmove
>  void *memmove(void *dest, const void *src, size_t len)
>  {
> @@ -115,6 +116,7 @@ void *memmove(void *dest, const void *src, size_t len)
>  
>  	return __memmove(dest, src, len);
>  }
> +#endif
>  
>  #undef memcpy
>  void *memcpy(void *dest, const void *src, size_t len)
> -- 
> 2.17.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


- Paul
