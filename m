Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3795B3491D1
	for <lists+linux-doc@lfdr.de>; Thu, 25 Mar 2021 13:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhCYMXl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 25 Mar 2021 08:23:41 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:59508 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230317AbhCYMXU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 08:23:20 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0UTH2Nd0_1616674997;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UTH2Nd0_1616674997)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 25 Mar 2021 20:23:17 +0800
Subject: Re: [PATCH 0/8] docs/zh_CN: add cpu-freq translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>
References: <20210324150731.4512-1-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <e3a1546e-070b-c9d4-0dc9-e8bc6d67b1ab@linux.alibaba.com>
Date:   Thu, 25 Mar 2021 20:23:16 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210324150731.4512-1-siyanteng@loongson.cn>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Cc Wu Xiangcheng,

Hi Yanteng,

Thanks for your work! believe we active translators could review
for each other. :)

Thanks!


�� 2021/3/24 ����11:07, Yanteng Si д��:
> This series of patches:
>  translates Documention/cpu-freq/* into Chinese.
>  add .../zh_CN/mips to zh_CN index
>  add .../zh_CN/iio to zh_CN index
>  add .../zh_CN/riscv to zh_CN index
> 
> Yabteng Si(8):
> docs/zh_CN: add cpu-freq core.rst translation
> docs/zh_CN: add cpu-freq cpu-drivers.rst translation
> docs/zh_CN: add cpu-freq cpufreq-stats.rst translation
> docs/zh_CN: add cpu-freq index.rst translation
> docs/zh_CN: add cpu-freq to zh_CN index
> docs/zh_CN: add mips to zh_CN index
> docs/zh_CN: add iio to zh_CN index
> docs/zh_CN: add riscv to zh_CN index
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/cpu-freq/core.rst          | 105
> +++++++++++++++++++++++++++++++++++++++++++++
>  Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst   | 259
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst | 130
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  Documentation/translations/zh_CN/cpu-freq/index.rst         |  45
> ++++++++++++++++++++
>  Documentation/translations/zh_CN/index.rst                  |   4 ++
>  5 files changed, 543 insertions(+)
> 
