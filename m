Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD8116A1C49
	for <lists+linux-doc@lfdr.de>; Fri, 24 Feb 2023 13:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjBXMh7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Feb 2023 07:37:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjBXMh7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Feb 2023 07:37:59 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08BC212BD1
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 04:37:58 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id q31-20020a17090a17a200b0023750b69614so2548605pja.5
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 04:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D5cdK82uYYWIkMpYOxPb+LiZ+QZGBRA1VBR3+aMujYg=;
        b=cC2qAF4jOGUX/vmGUCUQNb2G05k02Hy6IUMPzKnWHG+TFFoluwLfg5ooCUzQXLR9Py
         ZVl4JZ4i6W9qK2CihvOj9q4hJF88V8eBBrltKOD9MaYvoCyvO2bvO4UiI6aNWkmNJMKY
         vC/JYJyn8YIj9xWuJopjfxJH54fPWVO+yQ8XEC9J63bSd+rVtSYNZvRa71spmyrfLG4w
         //UUsTiSnXgW6s8TGKzE0Vl00UigDqakMeyMZ9DpFgZzxWajuJHV+P7lvoGjML77gAJF
         ncBmyPr5evHqoQ/zoy6/sjiFq5gKFpzjJCsBZz+gB84rzWYq2FAlQUO+1FekkMWeDlGF
         cW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5cdK82uYYWIkMpYOxPb+LiZ+QZGBRA1VBR3+aMujYg=;
        b=QkvZVDQExKWCDvA+0C8w8Bn0slf8E86pyD2qpQiEjzJoYVbb8JEQJ5A9wfurw9QVwR
         PbGI8BqKm6rRD5XGK4/6/K466/oxdalU43U4uWgS8y+cA/iKJQG/aUsZ47HFzVpb0ffF
         MhmG3INyUzvHFaYdJpt//KU8s63LlsOGxq/i3azQoFegkfccKDM8Tv+UEbvedNsh7+ZU
         4jWda928PbgVVeW/3cHx1RNBMYa9kgLQToK3aNFNosVoO/IkXLdfoHgNDE9Q4bqoPpTV
         5lbuiGQpswmHGzZbwX9tQfw/suN5beg65uXycLeUzBeUkOU96ryyCE/bP0G0oyI9Yg/a
         1yVg==
X-Gm-Message-State: AO0yUKVrqmwtipAgQnmhyhKxM5e/wn/aOMZbj0mfK0IlAeJ7ix3L75+v
        dia51SPgIC2LfE5ehlN/5dZYSA==
X-Google-Smtp-Source: AK7set+n8H0sjTNOAzuYeNksjuz1vlAaBpY0t2F3L1sUMLaPKnrtXpH5OEf5yUzRpzs0fZkCR1zrNA==
X-Received: by 2002:a05:6a20:914e:b0:cc:7967:8a75 with SMTP id x14-20020a056a20914e00b000cc79678a75mr2021251pzc.46.1677242277425;
        Fri, 24 Feb 2023 04:37:57 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id e4-20020aa78c44000000b005aa80fe8be7sm4841450pfd.67.2023.02.24.04.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 04:37:57 -0800 (PST)
Date:   Fri, 24 Feb 2023 18:07:47 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Andrew Jones <ajones@ventanamicro.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 21/21] Documentation/kernel-parameters.txt: Add RISC-V
 for ACPI parameter
Message-ID: <Y/ivm3YDi4SL6nGd@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-22-sunilvl@ventanamicro.com>
 <20230220201556.i3dihi3oj2lwckno@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220201556.i3dihi3oj2lwckno@orel>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 20, 2023 at 09:15:56PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 11:50:43PM +0530, Sunil V L wrote:
> > With ACPI support added for RISC-V, this kernel parameter is also
> > supported on RISC-V. Hence, update the documentation.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 6cfa6e3996cf..b3a5a5844daa 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -1,17 +1,17 @@
> > -	acpi=		[HW,ACPI,X86,ARM64]
> > +	acpi=		[HW,ACPI,X86,ARM64,RISC-V]
> >  			Advanced Configuration and Power Interface
> >  			Format: { force | on | off | strict | noirq | rsdt |
> >  				  copy_dsdt }
> >  			force -- enable ACPI if default was off
> > -			on -- enable ACPI but allow fallback to DT [arm64]
> > +			on -- enable ACPI but allow fallback to DT [arm64,riscv]
> >  			off -- disable ACPI if default was on
> >  			noirq -- do not use ACPI for IRQ routing
> >  			strict -- Be less tolerant of platforms that are not
> >  				strictly ACPI specification compliant.
> >  			rsdt -- prefer RSDT over (default) XSDT
> >  			copy_dsdt -- copy DSDT to memory
> > -			For ARM64, ONLY "acpi=off", "acpi=on" or "acpi=force"
> > -			are available
> > +			For ARM64 and RISC-V, ONLY "acpi=off", "acpi=on" or
> > +			"acpi=force" are available
> >  
> >  			See also Documentation/power/runtime_pm.rst, pci=noacpi
> >  
> > -- 
> > 2.34.1
> >
> 
> I'd squash this into patch 18, "RISC-V: Add ACPI initialization in
> setup_arch()"
> 
Sure. Let me squash in the next revision.

Thanks,
Sunil
