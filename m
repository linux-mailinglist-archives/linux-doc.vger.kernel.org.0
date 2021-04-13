Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330D735D890
	for <lists+linux-doc@lfdr.de>; Tue, 13 Apr 2021 09:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbhDMHOD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 13 Apr 2021 03:14:03 -0400
Received: from m32-153.88.com ([43.250.32.153]:41398 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229802AbhDMHOC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 03:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=6G1brfBdOotloAww7uKHyFAi/FD8EvAERA/WF
        eku4jA=; b=eGDCYVV08qshibzfrDvvqD1y3uhqLmiS7SePC1BRiqoeDSBPATVsW
        bBLX9rHjiq8gFM0UwHIc6pVIq62o42InGWO92ovwhpsZ3zOzoBtpvtCHjXvjTTe9
        BOWHTKBPNrRrUZpjJO648tVadgw8sGdgmj5Y6okNYeStvos+VI7dyc=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgA3wyOjRHVgAyhtAA--.59784S2;
        Tue, 13 Apr 2021 15:13:41 +0800 (CST)
Date:   Tue, 13 Apr 2021 15:13:39 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v5 7/7] docs/zh_CN: Link zh_CN/doc-guide to zh_CN/index.rst
Message-ID: <8738b39c1b54e15477a937c861f114165a8c0648.1618295149.git.bobwxc@email.cn>
References: <cover.1618295149.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1618295149.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgA3wyOjRHVgAyhtAA--.59784S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr47Aw43AF1rGFWfuF1xKrg_yoWxAFc_Zw
        n7XFWkZ3y5JF92qrZ5uF1DJr1S9F4fKayj9rn8t398G345Gws8G34kXrn5ZF4DWFZI9ry5
        CFZ3Wr1fWFnrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYxYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8CwCF04k20x
        vY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7IUUrb15UUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add zh_CN/doc-guide entry in zh_CN/index.rst

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index 4fdd57417ffb..4258006f4763 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -18,6 +18,7 @@
 
    admin-guide/index
    process/index
+   doc-guide/index
    kernel-hacking/index
    filesystems/index
    arm64/index
-- 
2.20.1

