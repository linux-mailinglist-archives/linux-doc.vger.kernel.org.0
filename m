Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFFA55FD410
	for <lists+linux-doc@lfdr.de>; Thu, 13 Oct 2022 07:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiJMFIm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Oct 2022 01:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiJMFIl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Oct 2022 01:08:41 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACADBD8EFA
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 22:08:40 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id bj12so1415429ejb.13
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 22:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wKssAxycUZVdqYlyW7XBylh/ZQdAtWozk4R8pqdfx/8=;
        b=ks1MQWQJyaHI0QuXwV2LFMDlYOPnBOKUBf/oq2e8LAfOH5bmfiIxf1g0Yw8TU8BYit
         r/ozSxUEGY56R5cA84AddDAHGT0tOydWY6qeVOISxqbuD0xLjULGXZB6xal1DZ/pVDyw
         6zXQGrZ2IhmIG4PLsqZfyngx7/Kfpol9JTomShxTGojdZlGBy8UHBrKMez3+8pMljJqN
         ZPImneRFx+Y4XsZgHBn7XJRE0X1f1aqOVWiwBwy9xET5yyEb88YchIPi8ntsN3OtTwpB
         EdIb71eTBBCSkZ+eeMdBX1WiI3tlJhiw/lZG6C3NR/q3B2cRHYPDFmSE50roii5vIorR
         nHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKssAxycUZVdqYlyW7XBylh/ZQdAtWozk4R8pqdfx/8=;
        b=POJYeIDVvEWXu1Rsjym5fL6ACjffv99yeyX7LdUhyLVoaF05ER2L4SDQ8aBIkhy5Tc
         bjv8vtelwGQVczMLIdhH6CwSawudYzTperwq2ZU4FPMHXAyS1dnIQX5z2rfZ0hb/oWjN
         OVIljW5xjRAwFNuDZPq5NuhSYh7+Epyj0juRVKHrcF1byNjr5vsASITYfMWXDJ+FIg23
         97wpBbqFUdEhTriCiUH/gPWswSeXANh6nwihVLjZiHOxFXxd+W/y3Q/JWFDKZULGIwo4
         ZJ4gE/r+YOBhmj4pfJpx3i2ik/d0zWGewb94Tul1bUyaq7E+mAERhsMZdDKmNiKwLXFi
         WRAQ==
X-Gm-Message-State: ACrzQf0WGY1JoBPVypCj1cV0cL3VgE3/5vOCopHA5P7bs9V9upSOFMQt
        X49ekjyD3JKdMHvUlgOjnN/swhWiKHAQ05KnheovMg==
X-Google-Smtp-Source: AMsMyM4UvlKR7SSKX9XkcQKXEiFgw4SDdjwmGyp9MRtR6ny/AxgfBzL0esK4jG/yMbkgHjvvMgHXLgBWomXLvr6l5s4=
X-Received: by 2002:a17:906:ee81:b0:77e:829a:76e9 with SMTP id
 wt1-20020a170906ee8100b0077e829a76e9mr25919122ejb.207.1665637719127; Wed, 12
 Oct 2022 22:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221013045619.18906-1-palmer@rivosinc.com> <20221013045619.18906-2-palmer@rivosinc.com>
In-Reply-To: <20221013045619.18906-2-palmer@rivosinc.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Thu, 13 Oct 2022 10:38:27 +0530
Message-ID: <CAAhSdy0_WaEFXgduBPKQMW20W=fQVinGZwgW8Z2jv=u4ig=rzA@mail.gmail.com>
Subject: Re: [PATCH 1/4] Documentation: RISC-V: Fix a typo in patch-acceptance
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>,
        corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
        conor.dooley@microchip.com, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 13, 2022 at 10:26 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> I just stumbled on this when modifying the docs.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me from a KVM RISC-V perspective.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  Documentation/riscv/patch-acceptance.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
> index dfe0ac5624fb..5da6f9b273d6 100644
> --- a/Documentation/riscv/patch-acceptance.rst
> +++ b/Documentation/riscv/patch-acceptance.rst
> @@ -29,7 +29,7 @@ their own custom extensions.  These custom extensions aren't required
>  to go through any review or ratification process by the RISC-V
>  Foundation.  To avoid the maintenance complexity and potential
>  performance impact of adding kernel code for implementor-specific
> -RISC-V extensions, we'll only to accept patches for extensions that
> +RISC-V extensions, we'll only accept patches for extensions that
>  have been officially frozen or ratified by the RISC-V Foundation.
>  (Implementors, may, of course, maintain their own Linux kernel trees
>  containing code for any custom extensions that they wish.)
> --
> 2.38.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
