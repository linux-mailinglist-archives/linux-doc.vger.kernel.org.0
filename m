Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0758A74A35F
	for <lists+linux-doc@lfdr.de>; Thu,  6 Jul 2023 19:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232454AbjGFRot (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 6 Jul 2023 13:44:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbjGFRor (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jul 2023 13:44:47 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FF01994
        for <linux-doc@vger.kernel.org>; Thu,  6 Jul 2023 10:44:46 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-55bc22375b9so581862a12.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Jul 2023 10:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688665486; x=1691257486;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfYRKCkv+gbg/zmvX1wLdSt8ijBVRQ6VquwWC9KA3kQ=;
        b=C4mwKsaMcsbSZodT7VZnm8QwFrJs06bzy388YbWZdogdsmfGt5LNIkaHBuTsGvIzIn
         A/GSyopYeSjDGTSgvQRL11tq239hkjmi1X1howOZZarXqZRoKZ4hM4qWIZcbPqaJdGSj
         7T40Z3nIvQobo8Ue2LW7YTfkLH+/YYbHgjHaGz3q6flKtnhcACoIDXKsgs15K71KP+Rv
         VbgjeQSk1F8SsiHUwET04wziTeKhZqGkj3O+SXuZHSH9hk3V5ZPf1e0hTqM9Js5Gt90x
         zrUXFsGhWjhm+0rGcLWpYTik0wLaW4W5JK763C7ajXyAJzviYKiljbnZIAkDLc83Duif
         RnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688665486; x=1691257486;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfYRKCkv+gbg/zmvX1wLdSt8ijBVRQ6VquwWC9KA3kQ=;
        b=f4x9F9Q+otSga4h69o0kgATM91RIWNhelJfDGVhhvQwnTmz9rWqxefLepl120oYown
         8CSz0KeJuno+pOS9SLMPFwdEYsqJ4UUVeSD5fiQTVJ2vp/obyGc6hkt9qOHyl48qyVxF
         0hc2ro1mlBfSlTHZrVRaL4488VlKAokbyKS+JE08hxqHldwMbSZK2vKVs+zBt0kwveiy
         dYJxc5mfWrxO1dAP0HfiKhM7rkn4AzgXxXb38OGsOx5tiPHTz5EpWddfw9IYgy+xF5Dp
         T9Z7e7+iHTxvIuH8pXBgbfg/3F0WoIC6/fKtTMFqApySWlRO/Iyar+pgcD1wLK95tEPG
         Od2w==
X-Gm-Message-State: ABy/qLbgpOTKa8fpdP/nqmrqeWqOl0AtQrRmSRB3ALLQwt97jrXs0O2M
        OunUChohyaofMRYFzXPp9y3M2g==
X-Google-Smtp-Source: APBJJlFnomCmLEilYSJ1Ue2aIpvmBLQ2tQs0xQTD0WmZD/JaC91EmCyAZpiw2E/gPXgLu0l3eDpbiw==
X-Received: by 2002:a05:6a20:4284:b0:11e:e940:441e with SMTP id o4-20020a056a20428400b0011ee940441emr2424000pzj.25.1688665485725;
        Thu, 06 Jul 2023 10:44:45 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id j13-20020a170902c3cd00b001b86deba2f9sm1678817plj.284.2023.07.06.10.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 10:44:44 -0700 (PDT)
Date:   Thu, 06 Jul 2023 10:44:44 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 10:43:52 PDT (-0700)
Subject:     Re: [PATCH v4 3/3] Documentation: riscv: Update boot image header since EFI stub is supported
In-Reply-To: <20230626143626.106584-3-alexghiti@rivosinc.com>
CC:     corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, Bjorn Topel <bjorn@rivosinc.com>,
        ajones@ventanamicro.com, Conor Dooley <conor.dooley@microchip.com>,
        sunilvl@ventanamicro.com, songshuaishuai@tinylab.org,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, alexghiti@rivosinc.com,
        Atish Patra <atishp@rivosinc.com>
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     alexghiti@rivosinc.com
Message-ID: <mhng-b66ccc17-f397-47ba-8aba-2c71ab901f72@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 26 Jun 2023 07:36:26 PDT (-0700), alexghiti@rivosinc.com wrote:
> The EFI stub is supported on RISC-V so update the documentation that
> explains how the boot image header was reused to support it.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  Documentation/riscv/boot-image-header.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/riscv/boot-image-header.rst b/Documentation/riscv/boot-image-header.rst
> index a4a45310c4c4..df2ffc173e80 100644
> --- a/Documentation/riscv/boot-image-header.rst
> +++ b/Documentation/riscv/boot-image-header.rst
> @@ -28,11 +28,11 @@ header in future.
>  Notes
>  =====
>
> -- This header can also be reused to support EFI stub for RISC-V in future. EFI
> -  specification needs PE/COFF image header in the beginning of the kernel image
> -  in order to load it as an EFI application. In order to support EFI stub,
> -  code0 should be replaced with "MZ" magic string and res3(at offset 0x3c) should
> -  point to the rest of the PE/COFF header.
> +- This header is also reused to support EFI stub for RISC-V. EFI specification
> +  needs PE/COFF image header in the beginning of the kernel image in order to
> +  load it as an EFI application. In order to support EFI stub, code0 is replaced
> +  with "MZ" magic string and res3(at offset 0x3c) points to the rest of the
> +  PE/COFF header.
>
>  - version field indicate header version number

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
