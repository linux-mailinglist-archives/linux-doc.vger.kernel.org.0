Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F29DC941B
	for <lists+linux-doc@lfdr.de>; Thu,  3 Oct 2019 00:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfJBWKJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 2 Oct 2019 18:10:09 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:37605 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbfJBWKJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Oct 2019 18:10:09 -0400
Received: by mail-io1-f66.google.com with SMTP id b19so971294iob.4
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2019 15:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=6c+UtI1uYDbyYxUQwSa9jl5b6+0JQI0MJumhi18xfQg=;
        b=kboGfl6VR6AFG/YCMnKlVG1+DLAnMRlmrb8TUPJMLPA8HrsPJg1Wv8qBfjT/1q4Bki
         bBHNbIFDJCUEivY6JcJ8nmU4c1/OM5zE+nbfYeEhQBMkd4DgnMpt27LQCB66JR4ey7Zc
         LS2WLuNO7xZj1wj/3HEnrW2rj2gpzQnUmlwALGcM0Wm9pCjPbLzsr0mq1mz7Kq+YUbob
         9ht8eU3m5L9/xHmvhA1RZaSsMCPDzEHDCd0xVDaqVHUzRaHAY/ldADDT6KFMPW0FPa54
         yvmv+K2YV95Qr4Cy6BOpBN7bF6oZcWYlKVB7T3RlKmOz/SK53j9xC0hFrC1dwk4swq6R
         0EfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=6c+UtI1uYDbyYxUQwSa9jl5b6+0JQI0MJumhi18xfQg=;
        b=Ai9GDQ+7VlJ1NPMSQexJCo4Wj/hROs0gCdY3nhnvWI8ZkKOJkH3kp6QnJsivpxkvQO
         bFCHx4OvqrQM8jXN4CodOxcWQqEZwhVaADhoCM4HoR2snGy4cIQd4c1UxShAlRzVMTo4
         7J4h+3aoyvIR8I3iY4Ehc3hWPklRbXpLdj8FufcSNexCMzbi5dwHcVA8Bi6Q4srz2e5K
         7kQiNIIAvqtTo8fWoz7N27+aZxYAVwT8kx9UFY3gr27l4tHFaVj5BafbGOiJq8YqLeSB
         Hpt/LsaTBdij+kcqcZBAl17vsLieqn/TrxNtCmPL2kd26ZJJ4vkgO4zpj5PdOfYtrh4P
         QEhg==
X-Gm-Message-State: APjAAAWIRs14ZErLxC0R/wMTA5+rqydApn8Nqw73vEAVRnIfm7+TE015
        QBFNnzsebutD0KjOXk0UA5q7IQ==
X-Google-Smtp-Source: APXvYqwYei1g/xOWE2U+PJHvvft5qrbaOfrE6nk3lP1n8pcWvN76f2qecpvDskoigtVrXYEOtuSqcA==
X-Received: by 2002:a6b:8bd4:: with SMTP id n203mr5741864iod.133.1570054206751;
        Wed, 02 Oct 2019 15:10:06 -0700 (PDT)
Received: from localhost (67-0-10-3.albq.qwest.net. [67.0.10.3])
        by smtp.gmail.com with ESMTPSA id l16sm350067ilm.67.2019.10.02.15.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 15:10:05 -0700 (PDT)
Date:   Wed, 2 Oct 2019 15:10:05 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>, corbet@lwn.net,
        Mark Rutland <mark.rutland@arm.com>,
        James Hogan <jhogan@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Palmer Dabbelt <palmer@sifive.com>, linux-mips@vger.kernel.org,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-cifs@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-rdma@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Pensando Drivers <drivers@pensando.io>,
        linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
        samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Steve French <sfrench@samba.org>,
        Paul Burton <paul.burton@mips.com>,
        Shannon Nelson <snelson@pensando.io>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/3] docs: fix some broken references
In-Reply-To: <b87385b2ac6ce6c75df82062fce2976149bbaa6b.1569330078.git.mchehab+samsung@kernel.org>
Message-ID: <alpine.DEB.2.21.9999.1910021509260.3732@viisi.sifive.com>
References: <b87385b2ac6ce6c75df82062fce2976149bbaa6b.1569330078.git.mchehab+samsung@kernel.org>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 24 Sep 2019, Mauro Carvalho Chehab wrote:

> There are a number of documentation files that got moved or
> renamed. update their references.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/devicetree/bindings/cpu/cpu-topology.txt    | 2 +-
>  Documentation/devicetree/bindings/timer/ingenic,tcu.txt   | 2 +-
>  Documentation/driver-api/gpio/driver.rst                  | 2 +-
>  Documentation/hwmon/inspur-ipsps1.rst                     | 2 +-
>  Documentation/mips/ingenic-tcu.rst                        | 2 +-
>  Documentation/networking/device_drivers/mellanox/mlx5.rst | 2 +-
>  MAINTAINERS                                               | 2 +-
>  drivers/net/ethernet/faraday/ftgmac100.c                  | 2 +-
>  drivers/net/ethernet/pensando/ionic/ionic_if.h            | 4 ++--
>  fs/cifs/cifsfs.c                                          | 2 +-
>  10 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpu/cpu-topology.txt b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
> index 99918189403c..9bd530a35d14 100644
> --- a/Documentation/devicetree/bindings/cpu/cpu-topology.txt
> +++ b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
> @@ -549,5 +549,5 @@ Example 3: HiFive Unleashed (RISC-V 64 bit, 4 core system)
>  [2] Devicetree NUMA binding description
>      Documentation/devicetree/bindings/numa.txt
>  [3] RISC-V Linux kernel documentation
> -    Documentation/devicetree/bindings/riscv/cpus.txt
> +    Documentation/devicetree/bindings/riscv/cpus.yaml
>  [4] https://www.devicetree.org/specifications/

For the RISC-V related change:

Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # RISC-V


- Paul
