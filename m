Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F722FC88B
	for <lists+linux-doc@lfdr.de>; Wed, 20 Jan 2021 04:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbhATDNL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jan 2021 22:13:11 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:59780 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387911AbhATC6j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 21:58:39 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UMHYwRH_1611111469;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UMHYwRH_1611111469)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 20 Jan 2021 10:57:51 +0800
Subject: Re: [PATCH 1/3] docs: zh_CN: add mips index.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210119074617.3109276-1-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <5f3b32da-1b4a-23dc-ab50-7eed17b3196f@linux.alibaba.com>
Date:   Wed, 20 Jan 2021 10:57:48 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210119074617.3109276-1-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/1/19 下午3:46, Yanteng Si 写道:
> This patch translates Documentation/iio/index.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/iio/index.rst          | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/iio/index.rst
> 
> diff --git a/Documentation/translations/zh_CN/iio/index.rst b/Documentation/translations/zh_CN/iio/index.rst
> new file mode 100644
> index 000000000000..88b6ba5f233b
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/iio/index.rst
> @@ -0,0 +1,20 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../iio/index`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_index:

the tag is unique in Docs, so you'd better use cn_iio_index
here and also cn_mips_index for mips Chinese doc.



> +
> +
> +========
> +工业 I/O
> +========
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   iio_configfs
> +
> +   ep93xx_adc

since your docs are not here now. this should be added after patches 2/3.

Thanks
Alex

> 
