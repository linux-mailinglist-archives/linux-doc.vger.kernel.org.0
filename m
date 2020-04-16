Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F491ABEAF
	for <lists+linux-doc@lfdr.de>; Thu, 16 Apr 2020 13:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505970AbgDPLAC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Apr 2020 07:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505949AbgDPK7v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Apr 2020 06:59:51 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B845CC03C1AB
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2020 03:52:19 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u6so5690139ljl.6
        for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2020 03:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YqF+/z+LBaU8X8GuG/beRb7kQZb2oP+PKGTiqRFntc4=;
        b=O61jTEnjgd/MFLC0C7gD3v1f1K7hyNHbLJ95BLTIPmXhpMdq8JPWImgV01LKxrHzWm
         igTpaZEUPXh7MExhOaBMX5tEjxpldqlveCYsKibvzkrPDDL06Ziieaj1qJ7z+ZUrqp4i
         uCjsUClcCcMwMaVHft8rA5XJkEcLdYMkYvKfZMSVYCDsQdNkPVGCCxjxIUv8h0nKSeJm
         Uk69cVP7q6OIVern4CJxyHsctCSRUd7O8kNGCbCe7tflbdhqHJwibVNgjk7z6H6Uhf9M
         hYPA9tDCf6KamVuL+lF+bE9gSfx38ZsvU3mkfA6aWhuQxlie52caYXgMBN7Vg0SIRZn+
         uJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YqF+/z+LBaU8X8GuG/beRb7kQZb2oP+PKGTiqRFntc4=;
        b=HHG36sYECnVOFkmc34PN2+bOdvvQWP8SowoQnKBQbP/+xoiG9hKc1ldKVkUkB1als/
         I6tIowfkgxLImUtGJHlAZhlA9U9+K7guAS24vUeNYzfHWh5XjNpxIIx5kVhT30HfXAwX
         5Qv4DhPMqKHEbhQFiV46cQjkY43/hy9gR4xR8e1SKehk8AqPcx8DlnwA9cLGMeqm412f
         FHeTclpwmxeCzw1JCbtk421Mw6CFzBPsz5n1cgreWHrFRCpVlmLY3BMPw1fFUsctzIYi
         txDiyCKLLnqq2cC/DwrttxvySOOZ0wXpd/U8GLK7l6k/zjTqW2FeJkBDUW79e6UK0jIA
         ZAZA==
X-Gm-Message-State: AGi0Pua7SoNUX8fe+A1aRlvnJBeF8aHR8aYMhmLdp77mFoEz6x7/avq6
        c1K5wj83DKKs01lEJEbJq/vwxj/rFei5I2bw1xpt7Q==
X-Google-Smtp-Source: APiQypJDV4zLPL0CbEVbqxkKUu4/iTCpV9lW81D7Y7R39PbjZq6AW9MqfediIKTHTI1HTYan1cmCNF4yfqCv5rHzELk=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr2581058ljh.223.1587034338213;
 Thu, 16 Apr 2020 03:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586359676.git.mchehab+huawei@kernel.org> <d8b0656cb3f1eacb10ca6168babb235d59a853a1.1586359676.git.mchehab+huawei@kernel.org>
In-Reply-To: <d8b0656cb3f1eacb10ca6168babb235d59a853a1.1586359676.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 12:52:07 +0200
Message-ID: <CACRpkda+5VET+dyyQZk4GKjKCDNDYMP43VXL=0u5FOhEd0C=ww@mail.gmail.com>
Subject: Re: [PATCH 29/35] MAINTAINERS: dt: fix pointers for ARM Integrator,
 Versatile and RealView
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 8, 2020 at 5:46 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> There's a conversion from a plain text binding file into 4 yaml ones.
> The old file got removed, causing this new warning:
>
>         Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm-boards
>
> Address it by replacing the old reference by the new ones
>
> Fixes: 2d483550b6d2 ("dt-bindings: arm: Drop the non-YAML bindings")
> Fixes: 33fbfb3eaf4e ("dt-bindings: arm: Add Integrator YAML schema")
> Fixes: 4b900070d50d ("dt-bindings: arm: Add Versatile YAML schema")
> Fixes: 7db625b9fa75 ("dt-bindings: arm: Add RealView YAML schema")
> Fixes: 4fb00d9066c1 ("dt-bindings: arm: Add Versatile Express and Juno YAML schema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
