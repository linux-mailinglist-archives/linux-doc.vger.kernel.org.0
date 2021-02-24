Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7E2323622
	for <lists+linux-doc@lfdr.de>; Wed, 24 Feb 2021 04:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233284AbhBXDop (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 23 Feb 2021 22:44:45 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:38866 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232779AbhBXDon (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Feb 2021 22:44:43 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UPPcEOr_1614138239;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UPPcEOr_1614138239)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 24 Feb 2021 11:44:00 +0800
Subject: Re: [PATCH v2 2/5] docs/zh_CN: add riscv features.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210224031149.15179-1-siyanteng@loongson.cn>
 <20210224031149.15179-3-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <4b70f2e1-a690-fce9-ed7c-9acd193b809d@linux.alibaba.com>
Date:   Wed, 24 Feb 2021 11:43:59 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210224031149.15179-3-siyanteng@loongson.cn>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Do we need this file?


ÔÚ 2021/2/24 ÉÏÎç11:11, Yanteng Si Ð´µÀ:
> This patch translates Documentation/riscv/features.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/riscv/features.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/riscv/features.rst
> 
> diff --git a/Documentation/translations/zh_CN/riscv/features.rst b/Documentation/translations/zh_CN/riscv/features.rst
> new file mode 100644
> index 000000000000..37f557c38047
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/riscv/features.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../riscv/features`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_features.rst:
> +
> +
> +.. kernel-feat:: $srctree/Documentation/features riscv
> 
