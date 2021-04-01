Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1899E350E2C
	for <lists+linux-doc@lfdr.de>; Thu,  1 Apr 2021 06:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhDAEiT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 1 Apr 2021 00:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhDAEiG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 00:38:06 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A26BAC0613E6
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:38:06 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id l1so363658plg.12
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 21:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Fp65qiKGlP5NcZe6Yh5DZabx+jBcd8OlqB5O4x4dwT0=;
        b=XQexjE5jLOZcu8/76XH47NQ8s8UeZatoAThTMHBDuMdhSNEvpEhaMy8IuBZgr/rY3A
         VHdtZzYYDdM28UekttGSibREv+SsmTi/uhl4OpfIiQMzRkdK6+vf5I4Cr1HMsYE/7fdv
         WIKJ+vLnmyj9UMmqvyjbWUG1CjIpEg+4TxNuhM4GKBEGbqFc2ukz7c1PcS/INMbbatOq
         oUwGuqUA3H/3fLNg1uwPFtAhHwfyIjop+swoZWyUQmxIAXpCvWHD9NyhNyNdDXdR9CXR
         TG8jX148L8tlGlNWXcoqsDMaH7IYkYXOsSG1/ji4H8gC4PHZ17YaFVpawjXvCFaRceIc
         T+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fp65qiKGlP5NcZe6Yh5DZabx+jBcd8OlqB5O4x4dwT0=;
        b=nKGViNJOvvBEG5EKi5Yd7NqYc1kMIeTNbwZkJvDrR8nE6a41d3N7izuQYor3jZqDWr
         mVZxVeU2DqX7o3wIwGdQYTJNpGWrggey6JufJXF69zclDSOHTpiACLVAiUJ9gNCxWQhI
         PGLzDjGGY/FdYjd+pJCRz+F+SRB5RuWfZMuHTdt2vbCYkQl2geMmgauf2zW0KMexd9L6
         60LVvYVKstRL37mmIILjanUzf3owU6alY/+j+MzBpqfKihwudfm7V6sWxFF9PoKSw7yl
         HckWRSdDGBR7DJfc05eSI/rxcaXnJyaWDzBLKPXfkzNxklfqGe1JEajBRjc0WznI6pmD
         iB4g==
X-Gm-Message-State: AOAM532JFdWau4jPqSQd7U/Eewev0FSQR7/gqSteJnH48agGsAW7Br32
        XrP3vggx472tdoM5xxCvZ3A=
X-Google-Smtp-Source: ABdhPJwAeygviFugM5XG0OUt0KfuSYiPeuYF2VPJKpMHXa5EyoyzS1gTZL6VozHiMLqgA1eqYxVnxw==
X-Received: by 2002:a17:90a:ab09:: with SMTP id m9mr7226182pjq.122.1617251886081;
        Wed, 31 Mar 2021 21:38:06 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id t16sm3870565pfc.204.2021.03.31.21.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 21:38:05 -0700 (PDT)
Subject: Re: [PATCH v3 0/8] docs/zh_CN: add cpu-freq translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, "Wu X.C." <bobwxc@email.cn>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
References: <20210330114728.2680-1-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <b2dc70c8-4794-cfe1-6873-eb8246e93f8f@gmail.com>
Date:   Thu, 1 Apr 2021 12:38:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210330114728.2680-1-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Cc: bobwxc@email.cn

All looks fine for me.

On 2021/3/30 下午7:47, Yanteng Si wrote:
> This series of patches:
>  translates Documention/cpu-freq/* into Chinese.
>  add .../zh_CN/mips to zh_CN index
>  add .../zh_CN/iio to zh_CN index
>  add .../zh_CN/riscv to zh_CN index
> 
> v1 -> v2:
> 
> Correction of some errata;
> Thanks to Jiaxun and Xiangcheng for their
> help,:)
> 
> v2 -> v3:
> 
> Correction of a small number of errata;
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
