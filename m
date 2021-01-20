Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA6A2FC876
	for <lists+linux-doc@lfdr.de>; Wed, 20 Jan 2021 04:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730784AbhATDH3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jan 2021 22:07:29 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:44179 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730184AbhATDCY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 22:02:24 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UMHYx2S_1611111691;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UMHYx2S_1611111691)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 20 Jan 2021 11:01:32 +0800
Subject: Re: [PATCH 3/3] doc/zh_CN: add mips iio_configfs.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210119074617.3109276-1-siyanteng@loongson.cn>
 <20210119074617.3109276-3-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <0cdbcc21-25bd-f3bd-5bc3-493a66e609d5@linux.alibaba.com>
Date:   Wed, 20 Jan 2021 11:01:31 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210119074617.3109276-3-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/1/19 下午3:46, Yanteng Si 写道:
> This patch translates Documentation/iio/iio_configfs.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/iio/iio_configfs.rst   | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/iio/iio_configfs.rst
> 
> diff --git a/Documentation/translations/zh_CN/iio/iio_configfs.rst b/Documentation/translations/zh_CN/iio/iio_configfs.rst
> new file mode 100644
> index 000000000000..223bc732ce66
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/iio/iio_configfs.rst
> @@ -0,0 +1,102 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../iio/iio_configfs`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_iio_configfs:
> +
> +
> +=====================
> +工业 IIO configfs支持
> +=====================
> +
> +1. 概述
> +=======
> +
> +Configfs是一种内核对象的基于文件系统的管理系统，IIO使用一些可以通过
> +configfs轻松配置的对象（例如：设备，触发器）。
> +
> +关于configfs是如何运行的，请查阅Documentation/filesystems/configfs.rst
> +了解更多信息。
> +
> +2. 用法
> +=======
> +为了使configfs支持IIO，我们需要在编译时选中config的CONFIG_IIO_CONFIGFS
> +选项。
> +
> +然后，挂载configfs文件系统(通常在 /config directory目录下）：：
> +
> +  $ mkdir/config
> +  $ mount -t configfs none/config
> +
> +此时，将创建所有默认IIO组，并可以在/ config / iio下对其进行访问。 下一章
> +将介绍可用的IIO配置对象。
> +
> +3. 软件触发器
> +=============
> +
> +IIO默认configfs组之一是“触发器”组。 挂载configfs后可以自动访问它，并且可
> +以在/config/iio/triggers下找到。
> +
> +IIO软件触发器为创建多种触发器类型提供了支持。 通常在include/linux/iio
> +/sw_trigger.h：中的接口下将新的触发器类型实现为单独的内核模块：
> +::
> +
> +  /*
> +   * drivers/iio/trigger/iio-trig-sample.c
> +   * 一种新触发器类型的内核模块实例
> +   */
> +  #include <linux/iio/sw_trigger.h>
> +
> +
> +  static struct iio_sw_trigger *iio_trig_sample_probe(const char *name)
> +  {
> +	/*
> +	 * 这将分配并注册一个IIO触发器以及其他触发器类型特性的初始化。
> +	 */
> +  }
> +
> +  static int iio_trig_sample_remove(struct iio_sw_trigger *swt)
> +  {
> +	/*
> +	 * 这会废弃iio_trig_sample_probe中的操作
> +	 */
> +  }
> +
> +  static const struct iio_sw_trigger_ops iio_trig_sample_ops = {
> +	.probe		= iio_trig_sample_probe,
> +	.remove		= iio_trig_sample_remove,
> +  };
> +
> +  static struct iio_sw_trigger_type iio_trig_sample = {
> +	.name = "trig-sample",
> +	.owner = THIS_MODULE,
> +	.ops = &iio_trig_sample_ops,
> +  };
> +
> +module_iio_sw_trigger_driver(iio_trig_sample);
> +
> +每种触发器类型在/config/iio/triggers下都有其自己的目录。 加载iio-trig-sample
> +模块将创建“ trig-sample”触发器类型目录/config/iio/triggers/trig-sample.
> +
> +我们支持以下中断源（触发器类型）
> +
> +	* hrtimer, uses high resolution timers as interrupt source

Why not translate this?


> +
> +3.1 Hrtimer Hrtimer触发器创建与销毁
> +-----------------------------------
> +
> +加载iio-trig-hrtimer模块将注册hrtimer触发器类型，从而允许用户在
> +/config/iio/triggers/hrtimer下创建hrtimer触发器。
> +
> +例如::
> +
> +  $ mkdir /config/iio/triggers/hrtimer/instance1
> +  $ rmdir /config/iio/triggers/hrtimer/instance1
> +
> +每个触发器可以具有一个或多个独特的触发器类型的属性。
> +
> +3.2 "hrtimer" 触发器类型属性
> +----------------------------
> +
> +"hrtimer”触发器类型没有来自/config dir的任何可配置属性。
> +它确实将采样频率属性引入触发目录。

Any better translations?

Thanks
 
