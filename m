Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7386694B28
	for <lists+linux-doc@lfdr.de>; Mon, 13 Feb 2023 16:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjBMP3Y (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Feb 2023 10:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbjBMP3V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Feb 2023 10:29:21 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537DC659E
        for <linux-doc@vger.kernel.org>; Mon, 13 Feb 2023 07:29:20 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so12576296pjp.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Feb 2023 07:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qbx6U9Foe7itForTQRSH0M7JhXvGqxUzThvPIJqkyvQ=;
        b=Rnl3Q3GV0vBzq01wIsrOiPoNkt2sS6amDjnqvSgMSp9EoYYFanD3kywD/bwcZgYhoQ
         iVEdy7M8w2cPp9GB74lylljDVWceNHNSwjlUvikxU/4IjY6msLBIfUWgE7GM+DnUE5q1
         lS0ID3bmvbUJk5Cjtw+psctgIuiIJfLunxFW/o8e0d9HBwM8cdMSU3vDRwXFi1L8M/I6
         H4xrCraBChDTOrKb51DHZBEO7Ghu6bKHtHiXNg/2i9KwXHLKkJk4Ze2qE2BQ7smSgvnd
         7qsLNU6V8jWQTwZ4z2gFtrWxvLPiX9Cd+rzHG9EprjgGLUcoiJqVszh/WSxJ7aCL8X34
         7t3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbx6U9Foe7itForTQRSH0M7JhXvGqxUzThvPIJqkyvQ=;
        b=gaayWZUwNOyingqWLA9nbwWFf1KGmzIhtwCgLUaE8OYAtvMV40q+GmfDGB/7qRb3qA
         3q0pXt5dRodBWy7GrGRgoNaJuK3FuBYkGlCzFZnq1hkFEHi6mZUtwFqB+hyVjPxcd3Sa
         iuBcJhubFax2PH0OhDMsmFZTlGgtgkGMS18CEmbrPYlH9AozAPidWk51lvYaCXmdH1XA
         TGelZEuxNznMuVKnNjV3pUzBTCmSxdPIlYuZ9RoQV8fLpyCtw6ImE+endJTCkd0YxAvi
         hTxGj4lXaGdIM5OBo622TjXVcqYzYTxKYPXsM/IoXXtqdtvK7/e2Bks9yLBoUkHaJAZz
         ulRA==
X-Gm-Message-State: AO0yUKUNuHDWRZNds+cqmHlVDVN3r0FBoUt8I0Wl4Tz3G7cZJfxWUKCP
        DQAdNgnk542JmL+9XSOjaoVa3g==
X-Google-Smtp-Source: AK7set/mryfi/4lQw9+pQX73qq0JKVDVfPvKiwXT+/N3NEyBCwVEejzOlKDAEyuzTferOF+iIfbrvQ==
X-Received: by 2002:a17:90b:3ec1:b0:22b:f208:aeed with SMTP id rm1-20020a17090b3ec100b0022bf208aeedmr27624409pjb.30.1676302159895;
        Mon, 13 Feb 2023 07:29:19 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id l21-20020a17090aec1500b00230a3b016fcsm5157808pjy.10.2023.02.13.07.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 07:29:19 -0800 (PST)
Date:   Mon, 13 Feb 2023 20:59:11 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Anup Patel <apatel@ventanamicro.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 24/24] Documentation/kernel-parameters.txt: Add RISC-V
 for ACPI parameter
Message-ID: <Y+pXR29U9divDWAo@sunil-laptop>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-25-sunilvl@ventanamicro.com>
 <Y+RUPcCgH48XdbBB@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+RUPcCgH48XdbBB@debian.me>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 09, 2023 at 09:02:37AM +0700, Bagas Sanjaya wrote:
> On Mon, Jan 30, 2023 at 11:52:25PM +0530, Sunil V L wrote:
> >  			For ARM64, ONLY "acpi=off", "acpi=on" or "acpi=force"
> >  			are available
> > +			For RISC-V, ONLY "acpi=off", "acpi=on" or "acpi=force"
> > +			are available
> >  
> 
> Something repetitive here. What about "For ARM64 and RISC-V, the
> available options are only "acpi=off", "acpi=on", and "acpi=force""?
> 
> Thanks.
> 
Hi Sanjaya,
-Sunil


