Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E6632361F
	for <lists+linux-doc@lfdr.de>; Wed, 24 Feb 2021 04:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbhBXDoN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 23 Feb 2021 22:44:13 -0500
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:49352 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232779AbhBXDoN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Feb 2021 22:44:13 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UPPcELd_1614138209;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UPPcELd_1614138209)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 24 Feb 2021 11:43:30 +0800
Subject: Re: [PATCH v2 5/5] docs/zh_CN: add riscv index.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210224031149.15179-1-siyanteng@loongson.cn>
 <20210224031149.15179-6-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <a6ca67f0-cc30-a5a0-133e-9e91391fccab@linux.alibaba.com>
Date:   Wed, 24 Feb 2021 11:43:29 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210224031149.15179-6-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>


在 2021/2/24 上午11:11, Yanteng Si 写道:
> This patch translates Documentation/riscv/index.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/riscv/index.rst        | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/riscv/index.rst
> 
> diff --git a/Documentation/translations/zh_CN/riscv/index.rst b/Documentation/translations/zh_CN/riscv/index.rst
> new file mode 100644
> index 000000000000..ea360da28d38
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/riscv/index.rst
> @@ -0,0 +1,29 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../riscv/index`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_riscv_index:
> +
> +
> +===============
> +RISC-V 体系结构
> +===============
> +
> +.. toctree::
> +    :maxdepth: 1
> +
> +    boot-image-header
> +    pmu
> +    patch-acceptance
> +
> +    features
> +
> +.. only::  subproject and html
> +
> +   目录
> +   ====
> +
> +   * :ref:`genindex`
> 
