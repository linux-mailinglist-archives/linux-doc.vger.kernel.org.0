Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 155556D7A83
	for <lists+linux-doc@lfdr.de>; Wed,  5 Apr 2023 12:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237680AbjDEK63 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Apr 2023 06:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237478AbjDEK62 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Apr 2023 06:58:28 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4762113
        for <linux-doc@vger.kernel.org>; Wed,  5 Apr 2023 03:58:27 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id kq3so34019493plb.13
        for <linux-doc@vger.kernel.org>; Wed, 05 Apr 2023 03:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680692306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gzqvLefolrwy3WdKYUZXiVUA/OQTcVAscLkW8tJWOwA=;
        b=jO0Y2EOFEKMw2F8LH2z0jbWyH6iiWiC/WyITb2ZxshiuO7irSikeEstwWIMuLeE5yA
         BPh+X2qBVfn2w7PNRyONoDHq4qyuphVGfxsKV3e/0QU3AOf+JDEg5UjfGkf7x9y//lfd
         95o8tRXJFCbhxM6DMHsP9/3yvlAGjZaoH2DIzAlWnd11KLPiFpyJ9BLtFvkpmEe1t9lL
         IRvUmgSle+koJjWBDlPqB4K5Vf1nadckacYET91rTHhrtwJd8l73IWetohGmCobodQ4Q
         MyttWJtt1sliGHRvEc0zh9Ef2SlGnYje0yYqq69dzGW8capGmFjaQtDzTEhvIFF8mCV8
         PCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680692306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzqvLefolrwy3WdKYUZXiVUA/OQTcVAscLkW8tJWOwA=;
        b=mvWAMttTHz22b9uCIpKyboYycqoB4Kr6NioBweqiCsuZZeGHEZfwh2onJS557TjAOb
         74qXoqChhRo3DYDv6iph40VmFf9iClR8sPAUv9wjYm6+yh6EXcoXdWjya3EFzscOX2Os
         a3NJFN/GLO0/P7fhUVscwbD7nyRFVjHMCF4dKuJ6AlTgvanuRdL3DRKMlvLhmGlpSZ12
         XqLbKWrfMxAf6tllOIMlHLYVLbIZhxR3RS8pCumrpXq+jIpHR90ELh6sQu56UM+KAFsN
         ITM7gkNJV2iLfgbzADRQMxToqKH+GlCEz41d8tsB8AWoqCoYwny9Trb/06MffxtARyxb
         AUSQ==
X-Gm-Message-State: AAQBX9dAEyjBs1Qhcf5/O1eQ3a23/jAMdW4vdpdy5RQVd4Rzv6U01318
        xumSxIbZvz/TgX6/zPtGauUJow==
X-Google-Smtp-Source: AKy350Z45D9tpgWEug4uJiwUcpQ/wzKxDo0vLJTHod9wnTI8mK/+badfYEZMzMbpbs5SYRl87Y9j8w==
X-Received: by 2002:a17:90b:388b:b0:241:13bb:8303 with SMTP id mu11-20020a17090b388b00b0024113bb8303mr6409630pjb.42.1680692306536;
        Wed, 05 Apr 2023 03:58:26 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id on13-20020a17090b1d0d00b0023493354f37sm1123694pjb.26.2023.04.05.03.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 03:58:26 -0700 (PDT)
Date:   Wed, 5 Apr 2023 16:28:13 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Conor Dooley <conor@kernel.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Tom Rix <trix@redhat.com>, Weili Qian <qianweili@huawei.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Jones <ajones@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Len Brown <lenb@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH V4 20/23] RISC-V: Enable ACPI in defconfig
Message-ID: <ZC1URXKq7rrUlrXl@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-21-sunilvl@ventanamicro.com>
 <20230404-dimmed-verbally-3597dcaaf106@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404-dimmed-verbally-3597dcaaf106@spud>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 04, 2023 at 10:43:02PM +0100, Conor Dooley wrote:
> On Tue, Apr 04, 2023 at 11:50:34PM +0530, Sunil V L wrote:
> > Add support to build ACPI subsystem in defconfig.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Dropped another R-b?
> https://lore.kernel.org/linux-riscv/91cf4ebd-f22c-4cf9-9fb4-fa6349ea00ab@spud/
> 
Yeah, missed updating....

> That said...
> 
> > ---
> >  arch/riscv/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index d98d6e90b2b8..8822b49ddb59 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -238,3 +238,4 @@ CONFIG_RCU_EQS_DEBUG=y
> >  # CONFIG_FTRACE is not set
> >  # CONFIG_RUNTIME_TESTING_MENU is not set
> >  CONFIG_MEMTEST=y
> > +CONFIG_ACPI=y
> 
> ...this is not where savedefconfig puts this for me.
> Please move it there & then:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
Okay. Will update.

Thanks!
Sunil
