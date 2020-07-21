Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFA722742B
	for <lists+linux-doc@lfdr.de>; Tue, 21 Jul 2020 02:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgGUAyy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Jul 2020 20:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgGUAyx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Jul 2020 20:54:53 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFB2C0619D5
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2020 17:54:53 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id o22so799058pjw.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2020 17:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=M1/nNQUlC3p1OgwkpyQMYQP0TLTmza76AXl+zBZku18=;
        b=gaSWRhfTKtLQiNJjcQdeA8o8zWYk7T1qmERoxtWZ4kx2XqxX2PHeXC9tQqb8Lwu1Mn
         HwrWeUUsrqKzehQCx0iXEIbK+5s9luPoI7jFJ8fOxWwIm0rhLcwlX/r8FGoP/W34Edb6
         vQVYh5SYDHXPUn20krgDRHnSi9/F8rkV98jYLieD/akpgVmFJo3bLWpIyYs08VeEHmZm
         e1jQ3OYUsd29inRPKUQSj0nS+WNXKpMpDXinQOdhfX4iVxMYtg/moc5G686ZiQIDB7KQ
         KItkjj/rTc4C11rDxhbnpg58LdtKhsQdEJH3036P3JAiJSve/n3W6OZNymEeWAXuF/cc
         Hx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=M1/nNQUlC3p1OgwkpyQMYQP0TLTmza76AXl+zBZku18=;
        b=PWO38RV/n6RZtfMyIkrOjDbNZBGIPWUDHndz2R4Q/y1BZnpi/YS+uXapfeWw1kbYAb
         bWgvTPzdHDQomX2ktFzr9wPCiiruDQ+1bm8phly6R2ivurhJi8znO3dp8lD0PMeMcHEf
         4rbgwe2fmsiAhmXTwFIn56kO6jtZDqYY2IGaT/Qrdsm7CmPp9qOuM2193p+ac7UM92Gi
         ZHidnd/1iVgD80rnMp8jBDp/YxM89e31kflK5/ijuNR9pqGuhJXkU2pLfMI1zc22Pt6L
         b2GlepZZg8CYrchxQXfenq9fUwE/WjKi0voK4Qff+nuxqiv7vcIuTgQXfIy1X1PmjTuT
         TW6w==
X-Gm-Message-State: AOAM533NboK6et8eNzKivgCHFn+uaH78RpxbOqQq1CXiIilfpvsq2PgI
        tD5RJPFHiu69ORMkyj+ykuhCHw==
X-Google-Smtp-Source: ABdhPJwG0ruIrvDBUX0N5KwKDNj5fAcarRafFRT8Y5sq9niXCCoRfkgVAm6ZnFu8qeqEW3bd0bTjvQ==
X-Received: by 2002:a17:90a:cf:: with SMTP id v15mr1933321pjd.14.1595292892778;
        Mon, 20 Jul 2020 17:54:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id u188sm18429358pfu.26.2020.07.20.17.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 17:54:52 -0700 (PDT)
Date:   Mon, 20 Jul 2020 17:54:52 -0700 (PDT)
X-Google-Original-Date: Mon, 20 Jul 2020 17:51:57 PDT (-0700)
Subject:     Re: [PATCH v3 1/2] riscv: Support R_RISCV_ADD64 and R_RISCV_SUB64 relocs
In-Reply-To: <20200714074044.10031-1-kernel@esmil.dk>
CC:     linux-riscv@lists.infradead.org, kernel@esmil.dk,
        Bjorn Topel <bjorn.topel@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     kernel@esmil.dk
Message-ID: <mhng-958787bd-3f34-43eb-b2fd-3eeb7ff325bd@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 14 Jul 2020 00:40:43 PDT (-0700), kernel@esmil.dk wrote:
> These are needed for the __jump_table in modules using
> static keys/jump-labels with the layout from
> HAVE_ARCH_JUMP_LABEL_RELATIVE on 64bit kernels.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Reviewed-by: Björn Töpel <bjorn.topel@gmail.com>
> Tested-by: Björn Töpel <bjorn.topel@gmail.com>

These are on for-next.  Thanks!

> ---
> Tested on the HiFive Unleashed board.
>
> No changes since v2.
>
> This patch is new in v2. It fixes an error loading modules
> containing static keys found by Björn Töpel.
>
>  arch/riscv/kernel/module.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 7191342c54da..104fba889cf7 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -263,6 +263,13 @@ static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
>  	return 0;
>  }
>
> +static int apply_r_riscv_add64_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u64 *)location += (u64)v;
> +	return 0;
> +}
> +
>  static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
>  				    Elf_Addr v)
>  {
> @@ -270,6 +277,13 @@ static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
>  	return 0;
>  }
>
> +static int apply_r_riscv_sub64_rela(struct module *me, u32 *location,
> +				    Elf_Addr v)
> +{
> +	*(u64 *)location -= (u64)v;
> +	return 0;
> +}
> +
>  static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
>  				Elf_Addr v) = {
>  	[R_RISCV_32]			= apply_r_riscv_32_rela,
> @@ -290,7 +304,9 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
>  	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
>  	[R_RISCV_ALIGN]			= apply_r_riscv_align_rela,
>  	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
> +	[R_RISCV_ADD64]			= apply_r_riscv_add64_rela,
>  	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
> +	[R_RISCV_SUB64]			= apply_r_riscv_sub64_rela,
>  };
>
>  int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
