Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42BD12FD058
	for <lists+linux-doc@lfdr.de>; Wed, 20 Jan 2021 13:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731491AbhATMiK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Jan 2021 07:38:10 -0500
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:34999 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388915AbhATLOk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jan 2021 06:14:40 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UMKGob5_1611141153;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UMKGob5_1611141153)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 20 Jan 2021 19:12:35 +0800
Subject: Re: [PATCH v2 2/3] docs/zh_CN: add iio ep93xx_adc.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210120110155.405589-1-siyanteng@loongson.cn>
 <20210120110155.405589-2-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <0207817f-85e0-2aed-4fc9-c6928e767456@linux.alibaba.com>
Date:   Wed, 20 Jan 2021 19:12:33 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210120110155.405589-2-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>

在 2021/1/20 下午7:01, Yanteng Si 写道:
> This patch translates Documentation/iio/ep93xx_adc.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/iio/ep93xx_adc.rst     | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/iio/ep93xx_adc.rst
> 
> diff --git a/Documentation/translations/zh_CN/iio/ep93xx_adc.rst b/Documentation/translations/zh_CN/iio/ep93xx_adc.rst
> new file mode 100644
> index 000000000000..727a48d09090
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/iio/ep93xx_adc.rst
> @@ -0,0 +1,46 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../iio/ep93xx_adc`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_iio_ep93xx_adc:
> +
> +
> +==================================
> +思睿逻辑 EP93xx 模拟数字转换器驱动
> +==================================
> +
> +1. 概述
> +=======
> +
> +该驱动同时适用于具有5通道模拟数字转换器的低端 (EP9301, Ep9302) 设备和10通道
> +触摸屏/模拟数字转换器的高端设备(EP9307, EP9312, EP9315)。
> +
> +2. 通道编号
> +===========
> +
> +EP9301和EP9302数据表定义了通道0..4的编号方案。虽然EP9307, EP9312和EP9315多
> +了3个通道（一共8个），但是编号并没有定义。所以说最后三个通道是随机编号的。
> +
> +如果ep93xx_adc是IIO设备0，您将在以下位置找到条目
> +/sys/bus/iio/devices/iio:device0/:
> +
> +  +-----------------+---------------+
> +  | sysfs 入口      | ball/pin 名称 |
> +  +=================+===============+
> +  | in_voltage0_raw | YM            |
> +  +-----------------+---------------+
> +  | in_voltage1_raw | SXP           |
> +  +-----------------+---------------+
> +  | in_voltage2_raw | SXM           |
> +  +-----------------+---------------+
> +  | in_voltage3_raw | SYP           |
> +  +-----------------+---------------+
> +  | in_voltage4_raw | SYM           |
> +  +-----------------+---------------+
> +  | in_voltage5_raw | XP            |
> +  +-----------------+---------------+
> +  | in_voltage6_raw | XM            |
> +  +-----------------+---------------+
> +  | in_voltage7_raw | YP            |
> +  +-----------------+---------------+
> 
