Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373E36FD490
	for <lists+linux-doc@lfdr.de>; Wed, 10 May 2023 05:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235284AbjEJDrI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 9 May 2023 23:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjEJDrG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 May 2023 23:47:06 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114312106
        for <linux-doc@vger.kernel.org>; Tue,  9 May 2023 20:47:05 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1929818d7faso42137733fac.0
        for <linux-doc@vger.kernel.org>; Tue, 09 May 2023 20:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683690424; x=1686282424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ifGsiDNA4DSRmYfOgUypvWteVU13/UhrU3vLKCdk6uY=;
        b=gpu59KdBTaV2y1OrztVKMXiHwwwuoI3UpLzcobU/TQ2lpWwCXqfQeLrRAXWEPGtJSt
         tm1d0OXblLRJdNQRMO2buSn3nl1xIhAN8Kauc/LZVWUMo8CXL0iFI3d6DEDxF1ycqWDw
         r1rHmplIjra3BgAkeBX8t7EOBIdRohvoIDuRjqlOuvOXLOP6YOeNU2ZpS5MKq642wdhX
         GfNYlzC0XytTFCaerhonm26O9xJ9/8MhM6sd7/oIFtzgrZQLfmX3yglSVV8N/PhPQkiH
         i7/Yi2ApjQ0JBdYqdm0OldmwCNu0AoOvfYm4ktvDPD+BwoUqLs1zBdJSVi+IJmJVihcs
         6wRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683690424; x=1686282424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifGsiDNA4DSRmYfOgUypvWteVU13/UhrU3vLKCdk6uY=;
        b=bk9H2ozw/TQ/y9BsNsRiIC4g+OiY2m+HaBYHs9SKYShfHgpqYW6IVoqJLTWnd2ouYO
         soIwtnPjbaeeL5z2eK+LeT9ioHPK4SFnVyBv8rQMKZPdz3lf928l67TvoBKVVqi/zWio
         9Vg/8UGKqoldWzStoMO8c7HHWjtDhJ46vAzIBuy1p67WRpsEhwGopkcdPz+bcWsoP8QU
         5qg9gkXKhX4Q8TP2dHRm/7a9oMWP/96z3oGtA2MzXF4m24AMw2VA+/7lJFOW7+95/N5Z
         IaYTv+6vCFs0KDrU6dIEbg/p3uu11Sj7IOVlCxT1xznVr+IGhXA6DSRgXI8QGEeIeRyp
         SVZQ==
X-Gm-Message-State: AC+VfDwjKcXNFmfzWPaa9zXmuvLGlBAMBAznqAjb3tnMt6KJXsuEIaIX
        ehShknHWrCSGu71wTDcam7ggymgKt0wb5JRkPdQ=
X-Google-Smtp-Source: ACHHUZ4YePMDzR3NxPf56dWWs0438cRvarCHuKqCLPxWMl4dytqu+RlEXReFpB+kOAyPzW2K5KhhxQ==
X-Received: by 2002:a05:6830:6081:b0:6ab:1aa5:1634 with SMTP id by1-20020a056830608100b006ab1aa51634mr2429359otb.10.1683690424388;
        Tue, 09 May 2023 20:47:04 -0700 (PDT)
Received: from sunil-laptop ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id j16-20020a9d7690000000b006a6558ef17fsm5865716otl.30.2023.05.09.20.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 20:47:04 -0700 (PDT)
Date:   Wed, 10 May 2023 09:16:47 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Conor Dooley <conor@kernel.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Weili Qian <qianweili@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Marc Zyngier <maz@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V5 08/21] RISC-V: ACPI: Cache and retrieve the RINTC
 structure
Message-ID: <ZFsTp/cbuPFauDui@sunil-laptop>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
 <20230508115237.216337-9-sunilvl@ventanamicro.com>
 <20230509-atlantic-writing-3ceea38e050e@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509-atlantic-writing-3ceea38e050e@spud>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Conor,

On Tue, May 09, 2023 at 06:50:07PM +0100, Conor Dooley wrote:
> Hey Sunil,
> 
> On Mon, May 08, 2023 at 05:22:24PM +0530, Sunil V L wrote:
> > RINTC structures in the MADT provide mapping between the hartid
> > and the CPU. This is required many times even at run time like
> > cpuinfo. So, instead of parsing the ACPI table every time, cache
> > the RINTC structures and provide a function to get the correct
> > RINTC structure for a given cpu.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> From this patch until "RISC-V: Add ACPI initialization in
> setup_arch()" (which is 19/21), the series fails to build.
> 
> allmodconfig, clang-16:
> ../arch/riscv/include/asm/acpi.h:22:23: error: unknown type name 'acpi_physical_address'; did you mean 'efi_physical_addr_t'?
> ../arch/riscv/include/asm/acpi.h:22:51: error: unknown type name 'acpi_size'
> 
> rv32_defconfig, clang-16:
> arch/riscv/kernel/setup.c:297:7: error: use of undeclared identifier 'acpi_disabled'; did you mean '__cpu_disable'?
> arch/riscv/kernel/setup.c:297:7: warning: address of function '__cpu_disable' will always evaluate to 'true' [-Wpointer-bool-conversion]
>
> I ballsed up a toolchain upgrade to gcc-13, so the whole series is
> showing build issues on patchwork for the gcc configurations:
> https://patchwork.kernel.org/project/linux-riscv/list/?series=745787
> 
> However, I suspect that the same patches that fail for clang-16 will
> fail for gcc-13 too, once I have fixed that!
> 
My bad. It is a commit order issue. Let me fix it.

Thanks!
Sunil 
