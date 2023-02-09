Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2BD69052A
	for <lists+linux-doc@lfdr.de>; Thu,  9 Feb 2023 11:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbjBIKmT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Feb 2023 05:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjBIKmE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 05:42:04 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D472D1ABD6
        for <linux-doc@vger.kernel.org>; Thu,  9 Feb 2023 02:41:41 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id x4so1851664ybp.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Feb 2023 02:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tNSj88tAbE2c6y06Ms9sAOyNH2UyWm+Nrt13hPQ8iWI=;
        b=CTfWL8pjm8f2MrW7uavUbnvldEyg0bhDjX9kzmJAomtRXVNHa/aGLoocEdHD0fyy/Y
         fEKylqcVs1Rm6vCkJ86UCaYPU6SgxWlbi4HnnDcv7Bz22EuLo8VnW5wtx9Bdq3ozCs7A
         lZNkMVc+naW+d5b+0eDsi+iQsjJg8Q3YhD4iP1td0QgnSPS70YmDicHTJMzjun3aNplC
         sZJW9L4XCkQP1k06jvz134a+Cjmc7KfiYD3pjsjNdX3Y/BgLss5Jg+vJgVWN5BpvDERW
         BN28nTKVj1O3Zhkbf2gj8UPBUdyuQZp8hD6GqbCQ1PcojQJtzxTJ1vptev4FdI5FrQI1
         Ewyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNSj88tAbE2c6y06Ms9sAOyNH2UyWm+Nrt13hPQ8iWI=;
        b=k9ikCTCiPvYy2jE7sPky1PqOeSvQ7fo3VJSHChMdea7w3qS7o/4E29U2Uy6GPA6L1v
         67h5H+DjVx9cQReAEmzdjbUUybHjF+q8t8BV5Mpl3VXm6984gP3YdXMRxLtwbSqxR7Tu
         ElaiGUPndE3NpcUN7mtWz/uTuSZ+POrrytpD1+o3a17TF5rvr2BlG7HZFBSEuE6W5gVv
         ESAevZ/67b48YQoPfVmc0RLSdDZZpSxyJUwQG4CMgoJqFqoeM0z0D2Q1bhPFYD4rbEjg
         sZ9v27TB24TzMrLt7asStFOP9YP/x9k4VlHddSArDnbyiTQ0Sw09uVSbW0/Lx9BC+yM5
         CeLw==
X-Gm-Message-State: AO0yUKW78qut7sQCixRkvqXZyLjksCl2ogI/HxwaSGwYSKaz3E2kfNcN
        WLFeoRV1mM4MLdS6hLlLrByxCg9FMxugT/X0/yAEKQ==
X-Google-Smtp-Source: AK7set8zUBoMuKEkh07dateX8DXDKQwFdadaIyfZa9ErQD4UXOsRHzHAgRvHHkEB2ER9MGhyrUUFZo9EgHYFwleS790=
X-Received: by 2002:a5b:6c5:0:b0:88f:946:bd98 with SMTP id r5-20020a5b06c5000000b0088f0946bd98mr1338256ybq.24.1675939286984;
 Thu, 09 Feb 2023 02:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com> <20230208173343.37582-15-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230208173343.37582-15-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Feb 2023 11:41:15 +0100
Message-ID: <CACRpkdbyosRgubdbNDiHZddK-hPAX7C2MV26eaeKnPO5xy+=Eg@mail.gmail.com>
Subject: Re: [PATCH v4 14/18] gpio: regmap: Add missing header(s)
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
        Devarsh Thakkar <devarsht@ti.com>,
        Michael Walle <michael@walle.cc>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-input@vger.kernel.org, linux-media@vger.kernel.org,
        linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        SHA-cyfmac-dev-list@infineon.com, linux-arch@vger.kernel.org,
        devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Russell King <linux@armlinux.org.uk>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Mun Yew Tham <mun.yew.tham@intel.com>,
        Keerthy <j-keerthy@ti.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexander Aring <alex.aring@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Arend van Spriel <aspriel@gmail.com>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Kalle Valo <kvalo@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
        Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 8, 2023 at 6:34 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
>
> While at it, split out the GPIO group of headers.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
