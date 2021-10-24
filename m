Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C6F438C33
	for <lists+linux-doc@lfdr.de>; Sun, 24 Oct 2021 23:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbhJXVzk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 24 Oct 2021 17:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbhJXVzh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Oct 2021 17:55:37 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01FFC061745
        for <linux-doc@vger.kernel.org>; Sun, 24 Oct 2021 14:53:15 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id c28so3876600lfv.13
        for <linux-doc@vger.kernel.org>; Sun, 24 Oct 2021 14:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OCe0C38fT/kjcWKnylTYXQCSW3wPWJJn9qerDUdWPA4=;
        b=RdsbFeOAN7H7FCGjOiLjXY3mbNobsJINfQEVwig0b9iBnXbjJiyemNruC/+xJJ7K5m
         J96V7Y4HuhkgC3+9A+nBGNDTiCGRGxWx76vrlVBqexhCnuj7ScHtzVjZjRlO/1vggWd5
         UpV3eDrjA+OiatDrTE41TK1K87dTD9xGzuf3LFc0XiOSL1CnQCDoPV/e6cmVqA4qND9x
         4Onp6y9QboGi2TRRTO/qJzkR3azyqOWgZkK3Hv2T+qthMHcOnkm9FIfdFcHbeyu4wkWp
         I4uxw/fq4K2XUTbX1ak1UCTdukCUKxw0SU6N6dqTQP2hAtRUmgOD9Wi+4spPu5dN7KJi
         kx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OCe0C38fT/kjcWKnylTYXQCSW3wPWJJn9qerDUdWPA4=;
        b=V02kf1Fjy/YyGCF2EKeYHaTmYlYjSGgHiotg83RssPQcXwJzs/eUnbUuTugdAOdkfI
         OTy2d4um7FDbGspn2hswNcu8rvY491ovlEQagLyfFkYhvH7tP41E7zDINpfGCMRHS2WW
         EJNnl7FKvsRC6WofONINfij5B+iez28HGm6AEKoS+L8JqqYBsnBqG1v5l79X9kT0AdE/
         fMyNK1IMVjhTPFPy37Sn64mzNCdIrun7eqnn/FjJFmZw5jJvpuTdXodoAo1G1yT595VA
         YgU8Z69RldQ/lGYajSXIfOdEXpAmPPq/2cNDotFNu24UpmwHmp8aCSYiocpyOriepghQ
         yyng==
X-Gm-Message-State: AOAM533UT9JgDxfAOk1p9eYQJOKOKROskOlP1L5OfnqYX0nxx69GVNzF
        peGsD8hTy3JfCLBGl2MEDVV797UaNZg9ByHaiOmlpw==
X-Google-Smtp-Source: ABdhPJwEfh3Rak5a8MZbd+yCsPIoKTClSmHbqRas1ZN2JcICovgsXjjwaXCumpUtGG7KN593teakShze2hWH8T/epZQ=
X-Received: by 2002:a19:6717:: with SMTP id b23mr8411598lfc.95.1635112394252;
 Sun, 24 Oct 2021 14:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634630485.git.mchehab+huawei@kernel.org> <cdf3891ef686eca67c6072da8c1d027eedc1ef3e.1634630486.git.mchehab+huawei@kernel.org>
In-Reply-To: <cdf3891ef686eca67c6072da8c1d027eedc1ef3e.1634630486.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Oct 2021 23:53:03 +0200
Message-ID: <CACRpkda9fWmbmyibWgMzr1D6T_uS_KrLLHs6uxoE8TgVT1_-Zw@mail.gmail.com>
Subject: Re: [PATCH v3 12/23] MAINTAINERS: update mtd-physmap.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 19, 2021 at 10:04 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> Changeset 63f8e9e0ac65 ("dt-bindings: mtd: Convert mtd-physmap to DT schema")
> renamed: Documentation/devicetree/bindings/mtd/arm-versatile.txt
>     and: Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
> to: Documentation/devicetree/bindings/mtd/mtd-physmap.yaml.
>
> Update their cross-references accordingly.
>
> Fixes: 63f8e9e0ac65 ("dt-bindings: mtd: Convert mtd-physmap to DT schema")
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
