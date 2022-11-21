Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35092632A1F
	for <lists+linux-doc@lfdr.de>; Mon, 21 Nov 2022 17:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiKUQ6d (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Nov 2022 11:58:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiKUQ6d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 11:58:33 -0500
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D800E1C
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 08:58:31 -0800 (PST)
Date:   Tue, 22 Nov 2022 00:58:01 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1669049909;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lEB5sh1/jYLycgzf6hWVQ3EeKLUvTYuUqdOi39E1eA0=;
        b=jiGbQ4uJNZ21+fNIJjIv+B2mA3lsqr/SPyq3nARdrS1nQvKMIcLo95l1g/jNScRdSx6eq9
        bGN6ihBFqSiIIP5jbIau4lq0lJzNSX4XUpwrojxf5CUWggmCbNdgiRfKqmXPBCyObzWn9R
        rPcYHVaQ+XWiuoqpCXgDykipNJHSwG0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     chenhuacai@kernel.org, corbet@lwn.net, alexs@kernel.org,
        seakeel@gmail.com, kernel@xen0n.name, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, loongarch@lists.linux.dev,
        siyanteng01@gmail.com, Xiaotian Wu <wuxiaotian@loongson.cn>,
        Yun Liu <liuyun@loongson.cn>
Subject: Re: [PATCH v1 1/2] docs/LoongArch: Add boot image header
Message-ID: <Y3uuGXo3SNtzARP0@bobwxc.mipc>
References: <cover.1669032230.git.siyanteng@loongson.cn>
 <08df007c7488b88ff5400bef6183f9cc68d87616.1669032230.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08df007c7488b88ff5400bef6183f9cc68d87616.1669032230.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

+Cc: Yun Liu <liuyun@loongson.cn>

2022-11-21 (一) 20:16:30 +0800 Yanteng Si 曰：
> Describes the meaning and value of the image header field.
> 
> Suggested-by: Xiaotian Wu <wuxiaotian@loongson.cn>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/loongarch/boot-image-header.rst | 76 +++++++++++++++++++
>  Documentation/loongarch/index.rst             |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 Documentation/loongarch/boot-image-header.rst
> 
> diff --git a/Documentation/loongarch/boot-image-header.rst b/Documentation/loongarch/boot-image-header.rst
> new file mode 100644
> index 000000000000..92a953a6f2e6
> --- /dev/null
> +++ b/Documentation/loongarch/boot-image-header.rst
> @@ -0,0 +1,76 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +====================================
> +Boot image header in LoongArch Linux
> +====================================
> +
> +:Author: Yanteng Si <siyanteng@loongson.cn>
> +:Date:   18 Nov 2022
> +
> +This document only describes the boot image header details for
> +LoongArch Linux.
> +
> +The following 64-byte header is present in decompressed Linux
> +kernel image::
> +
> +	u32	MZ_MAGIC		/* "MZ", MS-DOS header */
> +	u32	res0 = 0		/* reserved */
> +	u64	kernel_entry		/* Kernel entry point */
> +	u64	_end - _text		/* Kernel image effective size */
> +	u64	0			/* Kernel image load offset from start of RAM */
> +	u64	res1 = 0		/* reserved */
> +	u64	res2 = 0		/* reserved */
> +	u64	res3 = 0		/* reserved */
> +	u32	res4 = 0		/* reserved */
> +	u32	pe_header - _head	/* Offset to the PE header */
> +

Any code related need to be linked here?

> +
> +Header notes
> +============
> +
> +Currently, LoongArch has removed the "magic" field.
> +
> +According to the EFI specification, the PE/COFF image file header is
> +required at the beginning of the kernel image; the LoongArch kernel
> +supports the EFI stub, so the first two bytes of the kernel image header
> +are "MZ" magic characters, and 0x3c should point to the rest of the
> +PE/COFF file header, between which The kernel entry point, image
> +effectivesize, and image load offset layout are as follows::
> +
> +          +-----------------------------------------------+
> +    0x0:  |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |
> +          +-----------------------------------------------+
> +    0x8:  | MZ_MAGIC              |          res0         |
> +          +-----------------------------------------------+
> +    0x10: |                 kernel_entry                  |
> +          +-----------------------------------------------+
> +    0x18: |                  _end - _text                 |
> +          +-----------------------------------------------+
> +    0x20: |                       0                       |
> +          +-----------------------------------------------+
> +    0x28: |                      res1                     |
> +          +-----------------------------------------------+
> +    0x30: |                      res2                     |
> +          +-----------------------------------------------+
> +    0x38: |                      res3                     |
> +          +-----------------------------------------------+
> +    0x40: |          res14        |       PE header       |
> +          +-----------------------------------------------+
> +

emmm, this figure...

So MZ_MAGIC start from 0x08 ?

Or

            0     1     2     3     4     5     6     7   
         +-----------------------+-----------------------+
    0x00 |        MZ_MAGIC       |          res0         |
         +-----------------------+-----------------------+
    0x08 |                 kernel_entry                  |
         +-----------------------------------------------+
    0x10 |                  _end - _text                 |
         +-----------------------------------------------+
    0x18 |                       0                       |
         +-----------------------------------------------+
    0x20 |                      res1                     |
         +-----------------------------------------------+
    0x28 |                      res2                     |
         +-----------------------------------------------+
    0x30 |                      res3                     |
         +-----------------------+-----------------------+
    0x38 |          res14        |       PE header       |
         +-----------------------+-----------------------+

If the figure is too difficult to draw, a simple table can also be used
to instead.

Offset	Name	Size	Note
...

> +
> +All bit fields are in little endian:
> +
> +    - MZ: Effective length of 2 bytes;
> +
> +    - kernel entry point: leaving 6 bytes blank in front, starting
> +      from 0x8, with a effective length of 8 bytes;
> +
> +    - kernel image effective size: Immediately following the kernel
> +      entry point, with a effective length of 8 bytes, this field is
> +      required for the bootloader;
> +
> +    - kernel image load offset: Immediately following the kernel
> +      image effective size, with a effective length of 8 bytes;
> +
> +    - Offset to the PE header: leaving 28 bytes blank in front,
> +      starting from 0x3c, with a effective length of 4 bytes.
> diff --git a/Documentation/loongarch/index.rst b/Documentation/loongarch/index.rst
> index aaba648db907..97419821adf9 100644
> --- a/Documentation/loongarch/index.rst
> +++ b/Documentation/loongarch/index.rst
> @@ -10,6 +10,7 @@ LoongArch Architecture
>  
>     introduction
>     irq-chip-model
> +   boot-image-header
>  
>     features
>  
> -- 
> 2.31.1
> 

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

