Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9E72FD057
	for <lists+linux-doc@lfdr.de>; Wed, 20 Jan 2021 13:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388949AbhATMiF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Jan 2021 07:38:05 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:60319 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388919AbhATLOC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jan 2021 06:14:02 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UMKKYNx_1611141172;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UMKKYNx_1611141172)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 20 Jan 2021 19:12:52 +0800
Subject: Re: [PATCH v2 3/3] docs: zh_CN: add iio index.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210120110155.405589-1-siyanteng@loongson.cn>
 <20210120110155.405589-3-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <177e32a3-8f0a-379c-b0fc-10d741b0ed0b@linux.alibaba.com>
Date:   Wed, 20 Jan 2021 19:12:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210120110155.405589-3-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>

在 2021/1/20 下午7:01, Yanteng Si 写道:
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
> +.. _cn_iio_index:
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
> 
