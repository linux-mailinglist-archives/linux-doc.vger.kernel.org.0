Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D757E69D471
	for <lists+linux-doc@lfdr.de>; Mon, 20 Feb 2023 21:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbjBTUJO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 20 Feb 2023 15:09:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbjBTUJN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Feb 2023 15:09:13 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106C1449E
        for <linux-doc@vger.kernel.org>; Mon, 20 Feb 2023 12:09:12 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id h32so9148623eda.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Feb 2023 12:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/xGe4mebBQ0nWK8rCTkmQKbrlei4F3Kt8g8YlyA/ybk=;
        b=lasXdPytIvbjQiTIEAuPcfQDtdZsoQYBqVi2/m0sliI7QTUmra2OGkLun2CHaGGoDU
         pBoBIMsQGyMaCkx71n5AzQO/9QcNoM7fkL4cjUGD2Z73rSYx4uDSGnz6jgbBvqeX5Ud7
         rHksQlUnUhbK8GxQlIZzdgyuHfj+ZPOSmvzRJBrtrC2ZRqXM5ETKJlOvR1dEvC+g4/3r
         5q8odgj74SNeLlMyYbvPGZ3YythtJH5cGeZTubqJJM3omOCk3ouzyt6GV/kuMpi6Vnu7
         rN0o+R+hFOmYPvX0X4ix2IIyfg3dsALU+0wgN1RcLGFAE4nYAf+0SYVaYpi3Z1rFVYz/
         ZFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xGe4mebBQ0nWK8rCTkmQKbrlei4F3Kt8g8YlyA/ybk=;
        b=tQqcjR5QmdBL5LtvoMFizfhK3x0dX9BrBcdmydCZF6VkwTM1jaEMn16Ky859mt1VE1
         iFhVAHebUvqOQIfzyYkMVqUjVWcUmieQfuRwjf795oYGesmGxp3vl12FIbpCumD/6ybb
         5+3PdinKz6lAByGBLp3HlaYzfQN3SJLmDXlRpSOPlPosNqvMDxq3wwqqHWLmrktXZugY
         At/R605ySHqfbM8akrBrGALIgYDtuFN4OkHRBq+wIjwClXAHK8yZMQ1iTMFNkZel226J
         aPjRNQ4Rd/lZDElq8Ss2PTMIH1VZmy9P1+DtKCBGeBhXJGz1em5TE4/pBwKZhzDPXRqc
         HQAg==
X-Gm-Message-State: AO0yUKVsSacZilreLTDVaVidVKtdOhmnZeaq9aZ/EE2pStJQBOsDhQkk
        EvoikoVvY7q+/YnfKCpiV+2voA==
X-Google-Smtp-Source: AK7set+r29107e+CGfLvIFcDLBZy4icJyDxUSNp6aM2m9tGe84VSuCgyhF9xEnrpWfVclnnxniyPBg==
X-Received: by 2002:a17:907:8a02:b0:8b3:1e35:8f1c with SMTP id sc2-20020a1709078a0200b008b31e358f1cmr16184714ejc.39.1676923750575;
        Mon, 20 Feb 2023 12:09:10 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id gf4-20020a170906e20400b008b14060f58asm6224415ejb.50.2023.02.20.12.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 12:09:10 -0800 (PST)
Date:   Mon, 20 Feb 2023 21:09:09 +0100
From:   Andrew Jones <ajones@ventanamicro.com>
To:     Sunil V L <sunilvl@ventanamicro.com>
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
Subject: Re: [PATCH V2 19/21] RISC-V: Enable ACPI in defconfig
Message-ID: <20230220200909.gkwmpklocw36632w@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-20-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-20-sunilvl@ventanamicro.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 16, 2023 at 11:50:41PM +0530, Sunil V L wrote:
> Add support to build ACPI subsystem in defconfig.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 128dcf4c0814..f89f79294b34 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -218,3 +218,5 @@ CONFIG_RCU_EQS_DEBUG=y
>  # CONFIG_FTRACE is not set
>  # CONFIG_RUNTIME_TESTING_MENU is not set
>  CONFIG_MEMTEST=y
> +CONFIG_ACPI=y
> +# CONFIG_PCI_QUIRKS is not set

I'm guessing the addition of the CONFIG_PCI_QUIRKS line wasn't
intentional?

> -- 
> 2.34.1
>

Thanks,
drew
