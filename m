Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B75AD6B034A
	for <lists+linux-doc@lfdr.de>; Wed,  8 Mar 2023 10:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbjCHJoF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Mar 2023 04:44:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjCHJnW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Mar 2023 04:43:22 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19522B8554
        for <linux-doc@vger.kernel.org>; Wed,  8 Mar 2023 01:42:35 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id m8-20020a17090a4d8800b002377bced051so1731459pjh.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Mar 2023 01:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678268548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WeyXTaxIbnTtJMJY1WVjvmFvuqO6VxWCdTywZ3qjmjc=;
        b=n19N1ItnjPvh9iP26Vx0UZP/KArrNNMG94GZuR8mS/tDTeBG74rDgw9u7y5NSKMAxa
         N8T7/pad1hrGdZPAkFYO8BWjvljobo4Vd4pnJgaFW6hph6NxN9zq13ilOudxDglUgLXh
         fk6nXHin/D4RH1o+SbYagfOu0R4+mVsxr63AMC9VlrhQgZ0nhQEtPW2vnUK79r1ooNYr
         aeIUhoSQXDTY+W7XRR0O/I2FMM2gthmpiiErv/IDsTNyMimqr0eYyuXQdaNnugSRfERa
         HmIM3CFVGZ35HDm7jiGcmQfl4UQ1ugTd96CRoBQIEZUudgFC1g0e2AFr+R10a0Ew3G83
         upFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678268548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeyXTaxIbnTtJMJY1WVjvmFvuqO6VxWCdTywZ3qjmjc=;
        b=vCA+ShqNdZpimmOzHuPsPzf+i5ENgQbeGmVykzWmdpTlaxutXdDQ1KeHeVMbcfqUXf
         IbCL0ymKDtCFUPdoLdU29legRkt1E22HbtSt8mVsGlPD3rtb4IY828OTd54EUHfrGc5n
         j5wGgQEMCOOPgGg77LqoA7uDrKES8H/+B8ZMpMTQribfBM4HygrkkKrwMdY/TGzLRe1S
         c+WfEtEilT1MIMdqVfbw9ag42vCbg0gs8bAGxkcpPpRFtL8W8m6y+jj8okSPeYqYFNIL
         FW0y19qdkgoYQy9Sh213bCT0iq9R3pUbMgATZ6XCKJAJCgsCD0mkQ0w1dwhajqY7gZrp
         MIuA==
X-Gm-Message-State: AO0yUKVC/qAR7wJxsawgFzgz5O7NAxecnA1mst7BNaB0XD/4xHbGDasR
        bCJ6DKzoAo9nR1gWHGer6M7mqw==
X-Google-Smtp-Source: AK7set8V5GISDP4tsHoQrXeDFegGCmaiNN9OIPiKSFZyFFeqKHd6Ec8vSl5y8GKubvU3UDmDbFUQXQ==
X-Received: by 2002:a05:6a20:8b21:b0:c7:23ad:63eb with SMTP id l33-20020a056a208b2100b000c723ad63ebmr14871284pzh.10.1678268548257;
        Wed, 08 Mar 2023 01:42:28 -0800 (PST)
Received: from sunil-laptop ([49.206.8.117])
        by smtp.gmail.com with ESMTPSA id g5-20020aa78745000000b0058a3d8eab6asm9082552pfo.134.2023.03.08.01.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 01:42:27 -0800 (PST)
Date:   Wed, 8 Mar 2023 15:12:18 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Conor Dooley <conor@kernel.org>
Cc:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Anup Patel <apatel@ventanamicro.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        'Conor Dooley ' <conor.dooley@microchip.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 18/20] RISC-V: Add ACPI initialization in setup_arch()
Message-ID: <ZAhYeuCmdYAnanNv@sunil-laptop>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-19-sunilvl@ventanamicro.com>
 <b38179fe-f1b8-4146-ae22-11e8bbbd500e@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b38179fe-f1b8-4146-ae22-11e8bbbd500e@spud>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 06, 2023 at 09:17:34PM +0000, Conor Dooley wrote:
> On Fri, Mar 03, 2023 at 07:06:45PM +0530, Sunil V L wrote:
> > Initialize the ACPI core for RISC-V during boot.
> > 
> > ACPI tables and interpreter are initialized based on
> > the information passed from the firmware and the value of
> > the kernel parameter 'acpi'.
> > 
> > With ACPI support added for RISC-V, the kernel parameter 'acpi'
> > is also supported on RISC-V. Hence, update the documentation.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> 
> > +static int __init acpi_fadt_sanity_check(void)
> > +{
> > +	struct acpi_table_header *table;
> > +	struct acpi_table_fadt *fadt;
> > +	acpi_status status;
> > +	int ret = 0;
> > +
> > +	/*
> > +	 * FADT is required on riscv; retrieve it to check its presence
> > +	 * and carry out revision and ACPI HW reduced compliancy tests
> > +	 */
> > +	status = acpi_get_table(ACPI_SIG_FADT, 0, &table);
> > +	if (ACPI_FAILURE(status)) {
> > +		const char *msg = acpi_format_exception(status);
> > +
> > +		pr_err("Failed to get FADT table, %s\n", msg);
> > +		return -ENODEV;
> > +	}
> > +
> > +	fadt = (struct acpi_table_fadt *)table;
> > +
> > +	/*
> > +	 * Revision in table header is the FADT Major revision, and there
> > +	 * is a minor revision of FADT.
> 
> What is the point of this part of the comment? Isn't it obvious from the
> below code that you expect a major and minor revision?
> If feel like you're trying to make a point in it, but the point has been
> lost :/
> 
It just highlights that major and minor revision fields are in two
different places. Let me remove this comment since it is part of the
spec anyway.

Thanks,
Sunil
