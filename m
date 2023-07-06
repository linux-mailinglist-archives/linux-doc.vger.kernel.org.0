Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C16574A35A
	for <lists+linux-doc@lfdr.de>; Thu,  6 Jul 2023 19:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbjGFRol (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 6 Jul 2023 13:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbjGFRol (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jul 2023 13:44:41 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C724D10F5
        for <linux-doc@vger.kernel.org>; Thu,  6 Jul 2023 10:44:39 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-55bc22375b9so581810a12.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Jul 2023 10:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688665479; x=1691257479;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfF1jRH7aHQy9FSffMrQi5NkhhBXF9P96GbSB0389a8=;
        b=U+JZ8OVOhUHhhceqKYWTVBrIHn6UtLeIEG6Q7nf4dC1UN8/pUjqmTW0y+BR+jwZbgx
         rtWGW9GC1DCMnq+KMhakuvIIZqotZE4sokbBgFKaDKJrAh4RRUAzCGtVRsVBJhNsxCId
         vfjVIGJT/VZOZSJ4dJ9V8F9r1+w87YjT41xnrbHdJwlLDbUBooHJzEP2nG8pNyLC+Fh7
         bowbcEMAGXzF5RXsm+1jFHA0q7W0y9O1fy4gqpZafyFzplTAgAe1xfqiGGkKLQM9yKcu
         X/n2C//6Zl7nOghlc7fhkHBfda++BManKZyDWhTiYIdptXLTS+Jux8nPcK3LJzLziWtD
         64Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688665479; x=1691257479;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfF1jRH7aHQy9FSffMrQi5NkhhBXF9P96GbSB0389a8=;
        b=Ta7Fw/QcL8mFHlkCYuZk3Zi/ukLf6J9FSZQfyC/V5GXZ2VH+P9OhVI1EZbNgfJWVM9
         FGAdhmFup59jOc2L+WhDjM/G0PURBrBrO9P8uZiOs48hTv9FtWCz0H64/baJWNJOhlgv
         d2vxqdw+w+XA8WjFVZGTbVeqGb91Hzo9N6tKSaO4WUotGVtR57IZmp0cTzpc7nVpHwT6
         WKX1aAt4IlfxppfurOUmeCtBzAhBfpSsWYE/cLFNlFK7t4F6kC/rAjJtfE/TxgGc+9VG
         nWgh1AlBvPeJrb8SMGZ2WzinefS9+s1nHaMqNWNYbNN/RwWY34yPae1jjCsyBSEc7kMf
         74Nw==
X-Gm-Message-State: ABy/qLaOCwuOk3dBXe85FNgLnQXvmCH1ukOVj3yTpR+xG7q8yzUCy2fK
        l794P81332XjgLtEItecX029MQ==
X-Google-Smtp-Source: APBJJlGpz76Tp+WAN3pXir1S2kWCrsdFR7fMg40AiERweMiTin1jjRYi/Gqve0X/5P7NartrS2YMSg==
X-Received: by 2002:a05:6a20:497:b0:125:5bf3:f62f with SMTP id 23-20020a056a20049700b001255bf3f62fmr2257182pzc.8.1688665479149;
        Thu, 06 Jul 2023 10:44:39 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y20-20020aa78054000000b0064d45eea573sm1545943pfm.41.2023.07.06.10.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 10:44:38 -0700 (PDT)
Date:   Thu, 06 Jul 2023 10:44:38 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 10:43:38 PDT (-0700)
Subject:     Re: [PATCH v4 1/3] Documentation: arm: Add bootargs to the table of added DT parameters
In-Reply-To: <20230626143626.106584-1-alexghiti@rivosinc.com>
CC:     Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
        Bjorn Topel <bjorn@rivosinc.com>, ajones@ventanamicro.com,
        Conor Dooley <conor.dooley@microchip.com>,
        sunilvl@ventanamicro.com, songshuaishuai@tinylab.org,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, alexghiti@rivosinc.com,
        Atish Patra <atishp@rivosinc.com>
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     alexghiti@rivosinc.com, corbet@lwn.net,
        Ard Biesheuvel <ardb@kernel.org>
Message-ID: <mhng-d434d878-03d5-4962-88fa-7fb0a72cb983@palmer-ri-x1c9a>
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

On Mon, 26 Jun 2023 07:36:24 PDT (-0700), alexghiti@rivosinc.com wrote:
> The bootargs node is also added by the EFI stub in the function
> update_fdt(), so add it to the table.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Song Shuai <songshuaishuai@tinylab.org>
> ---
>  Documentation/arm/uefi.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/arm/uefi.rst b/Documentation/arm/uefi.rst
> index baebe688a006..2b7ad9bd7cd2 100644
> --- a/Documentation/arm/uefi.rst
> +++ b/Documentation/arm/uefi.rst
> @@ -50,7 +50,7 @@ The stub populates the FDT /chosen node with (and the kernel scans for) the
>  following parameters:
>
>  ==========================  ======   ===========================================
> -Name                        Size     Description
> +Name                        Type     Description
>  ==========================  ======   ===========================================
>  linux,uefi-system-table     64-bit   Physical address of the UEFI System Table.
>
> @@ -67,4 +67,6 @@ linux,uefi-mmap-desc-ver    32-bit   Version of the mmap descriptor format.
>
>  kaslr-seed                  64-bit   Entropy used to randomize the kernel image
>                                       base address location.
> +
> +bootargs                    String   Kernel command line
>  ==========================  ======   ===========================================

I remember having said this somewhere, but it's not on lore for this 
version.  This touches Arm stuff, so I'd prefer an Ack from someone 
before touching it.

Also: it looks like this missed e790a4ce5290 ("arm: docs: Move Arm 
documentation to Documentation/arch/").
