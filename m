Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1F3D5549F0
	for <lists+linux-doc@lfdr.de>; Wed, 22 Jun 2022 14:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235815AbiFVMTc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 22 Jun 2022 08:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234927AbiFVMTb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 08:19:31 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889D11A3AF
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 05:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=ZLUvWECnBQY8oyulUDPGfBq2SU7mGKV9E7wak
        wgedcY=; b=Z09aWLuUOS2h11KkLfUJ/NaOcfSY97ez3sOYKmqFdhO8Qc45AF/yf
        iMsRrJbfL53bhPcP65vaxxjrAf91Lgsw5Xfexs3vUNmeDzGmatjwobIskFQmh5IB
        gbh0SLek+TU1jmr4PGPX1jNKNUZFUNYoDWDauWva5QfRVbve3WuOeI=
Received: from bobwxc.mipc (unknown [120.242.68.233])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgC3Z2TLCLNiPboAAA--.2331S2;
        Wed, 22 Jun 2022 20:19:24 +0800 (CST)
Date:   Wed, 22 Jun 2022 20:19:21 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/9] docs/zh_CN: core-api: Update the translation of
 cpu_hotplug.rst to 5.19-rc3
Message-ID: <YrMIyWLHUrOqaNfZ@bobwxc.mipc>
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <9a123a1938a09f883db0b429396954e0792c84c1.1655863769.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9a123a1938a09f883db0b429396954e0792c84c1.1655863769.git.zhoubinbin@loongson.cn>
X-CM-TRANSID: LCKnCgC3Z2TLCLNiPboAAA--.2331S2
X-Coremail-Antispam: 1UD129KBjvdXoWruryxJw1DAFW8CF17uw4rZrb_yoW3Crg_Xa
        1vqFWvyw1xZFyxKayrXryDXr18ua1FkFWFg3WDta9xt34DKwsruryDX3s5ZayUWFs8ur43
        CF9rZr1SvrnxJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbn8YjsxI4VW7JwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRRlkVUUUU
        U
X-Originating-IP: [120.242.68.233]
X-CM-SenderInfo: pere453f6hztlloou0/
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 22, 2022 at 06:18:48PM +0800, Binbin Zhou wrote:
> Synchronous translation from upstream commit c9871c800f65
> ("Documentation: core-api/cpuhotplug: Rewrite the API section")
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../zh_CN/core-api/cpu_hotplug.rst            | 435 +++++++++++++++---
>  1 file changed, 377 insertions(+), 58 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst b/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
> index 85a264287426..4772a900c37a 100644
> --- a/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
> +++ b/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst

