Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C726D76FD26
	for <lists+linux-doc@lfdr.de>; Fri,  4 Aug 2023 11:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbjHDJXW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 4 Aug 2023 05:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjHDJWo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Aug 2023 05:22:44 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D495584
        for <linux-doc@vger.kernel.org>; Fri,  4 Aug 2023 02:20:46 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-686b643df5dso1410631b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Aug 2023 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691140845; x=1691745645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p2ObDLhJobQ9FX8zrDm+LEp86QCexPfSdnjmPctJdSo=;
        b=F4/McMixxcOMhEI5apZ4RiT+M6GQ3Y1FulhZiK9GD9FMHjwnXxiH1LCf65R0H6ghim
         181Yd5r0KpK7HXoP32NBwHOYeWls/+uSmkIpeDfegw8IW8DZfjy03nWwt9rgWRIyuI7K
         k0FfY0LXSfohvE+hpFPhEQIto13y1R6sxgyePSF4Wb6uS3VoXHeJc5Ik9Ef3JLKkAkbo
         MKYwmaVdVpb54LANPaVIcAm3fzWPKuymwQfADR5qJvbx/m+63ttr9aehvptKX7mRMI4n
         wCCoonjfQkU0eK2kop4Az5gc3o07/UL/tdLRdyIXTHzwD+QkF8LxjejSrhXoajObwFiJ
         ZWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691140845; x=1691745645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2ObDLhJobQ9FX8zrDm+LEp86QCexPfSdnjmPctJdSo=;
        b=ZrG+a+Kxf8iSjS5zG6Hwa2/jAlr0Q1w7eIyzZER6GKnHmUFNZoi9F5YggHIjV5oZkS
         Kju2ipMojC884TCZkwtznYjyCvdCywedCMsT0FEUlME6cT/4n7KNw7mSvQtE/p2dQBIs
         eUPn3wyl/q5Sxdnpsi82h5brHWsfN86WPelLNMXl+jhXK7xjJPiVe6SguM7xpy/opemr
         D8HOKSTxOfSMk6iRIm/WFJMUGypA42GuR6iiUVk1VvMO9EvF5tcXUjKcp8zrKqBZjPZp
         Wki8GjGdS64m6DvO1KTQTVDLQ1tBWFO8ExNXOe9hpDecxu0U7E8HpIma8HvTynVKlDI7
         CAtg==
X-Gm-Message-State: AOJu0YxhF7MJ3p5E5cHMAQ0qTQ5P0EWDI0dfroWh7ppGQNcXcpEJZNit
        3J7kRsJQfWTEcKTv1i5qB4qtUw==
X-Google-Smtp-Source: AGHT+IH2yLk3kVTwlVX2pFEM7MDeX5YS0pIZvWjo5KAsJ2OCrs9SAbu2ByBxMEsWLIv7WIsy+kk+YA==
X-Received: by 2002:a05:6a00:1252:b0:687:9a0b:9265 with SMTP id u18-20020a056a00125200b006879a0b9265mr1122535pfi.29.1691140845486;
        Fri, 04 Aug 2023 02:20:45 -0700 (PDT)
Received: from sunil-laptop ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id u2-20020aa78482000000b00666b3706be6sm1171935pfn.107.2023.08.04.02.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 02:20:45 -0700 (PDT)
Date:   Fri, 4 Aug 2023 14:50:34 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Anup Patel <anup@brainfault.org>,
        Marc Zyngier <maz@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Robert Moore <robert.moore@intel.com>,
        Haibo Xu <haibo1.xu@intel.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [RFC PATCH v1 09/21] RISC-V: cacheflush: Initialize CBO
 variables on ACPI systems
Message-ID: <ZMzC4nHOJOfp0vaa@sunil-laptop>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-10-sunilvl@ventanamicro.com>
 <ZMyTDcffqXYT29JX@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMyTDcffqXYT29JX@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 04, 2023 at 08:56:29AM +0300, Andy Shevchenko wrote:
> On Thu, Aug 03, 2023 at 11:29:04PM +0530, Sunil V L wrote:
> > Using new interface to get the CBO block size information in
> > RHCT, initialize the variables on ACPI platforms.
> 
> ...
> 
> >  #include <linux/of.h>
> > +#include <linux/acpi.h>
> 
> Can you keep it sorted (to some extent)?
> 
Sure.

> > +#include <asm/acpi.h>
> 
> What do you need this for?
> 
> >  #include <asm/cacheflush.h>
> 
When CONFIG_ACPI is disabled, this include is required to get
acpi_get_cbo_block_size().

Thanks,
Sunil
