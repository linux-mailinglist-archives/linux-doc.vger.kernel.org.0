Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3010B676C97
	for <lists+linux-doc@lfdr.de>; Sun, 22 Jan 2023 12:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjAVL6P (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 22 Jan 2023 06:58:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbjAVL6P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 Jan 2023 06:58:15 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A4B1631A
        for <linux-doc@vger.kernel.org>; Sun, 22 Jan 2023 03:58:13 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so8747751wml.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Jan 2023 03:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YjGs/N459uaRgS5yJ3WFfESguZ4NHWx9awwoiEeB780=;
        b=RLa/BKWA8cCsFwOonds12wldvySF169J5xS3g1ZjPouXbBwg8nfDLWmWirXdCeITBU
         JtxN07A1N9YTmSjdTqk69MmJEpCDGKsTc8PGV1JapOqPfZipKYIgUID+ocuZtC1YJbIc
         CvIffWSaZOZXF4bb6gHjgaCjI1TcGvc0yfNNiFmjbhGo1nbZS+GLGdhLVrZqRKv6ZJKT
         0R2jibeRxSxBa/ZobR7DcntMpt7XQrQWRGm5M4XEE/1v92ryG/PrXn4cN1IFRzsddNIe
         fj2LW7ED9Xg7L0NXTAqnircEmI6Sxni0pP6pu3K6YaM7JEYEyj0r+5ovDanE7hInQqTq
         obPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjGs/N459uaRgS5yJ3WFfESguZ4NHWx9awwoiEeB780=;
        b=62n2kSBmcp/adTr78dIdXrYNxhuRuJY9iQNuBs8Z+4fyou54sZt7gLUhzNx+5Z6Qql
         rgEpKur9EDWpUHOQ+p5NKHZ3iyxVk1IRXmhleSlG+YBIBsVwtaL7VhJykNgyoGmjynlp
         349vam2WUCHWFvzq1Qk6Yi6InWC1s2KGAu2PraQOlVIqQjNDveEREtqbM33kAfMJSaso
         PaAbL9Hc96DTv+efPREoo+Im8m57Ta6NbkA4WkgB+sVxEODzTDpx5YfrqSRirp3rGYpx
         3b6XqUDeb3AtXmaped+2Q299SLdwv0EhS8YsG9GIcuFXL75y7Cpg2+9D6RFKuL984esx
         zyPg==
X-Gm-Message-State: AFqh2ko3C40ARvgyIjDYk7eTacZXF1KuxezYI8x5NJ7SNEphFrA2lr4C
        YKN6RxjC8AfxA5diG2pP7EboWw==
X-Google-Smtp-Source: AMrXdXtq5Rph9UIfC3hB2PBgU4uL+k5CyKLEV85gy72Xc9vXVhqLaj7EC+pHgTHApG8hI/7ahj3Ing==
X-Received: by 2002:a05:600c:540d:b0:3d9:fb59:c16b with SMTP id he13-20020a05600c540d00b003d9fb59c16bmr17056417wmb.36.1674388691612;
        Sun, 22 Jan 2023 03:58:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003a84375d0d1sm8262888wmq.44.2023.01.22.03.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 03:58:11 -0800 (PST)
Message-ID: <9becf3e0-19cc-8924-6da9-8f62f8f8636c@linaro.org>
Date:   Sun, 22 Jan 2023 12:58:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 27/31] kvx: Add kvx default config file
Content-Language: en-US
To:     Yann Sionneau <ysionneau@kalray.eu>, Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Kees Cook <keescook@chromium.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Ingo Molnar <mingo@redhat.com>,
        Waiman Long <longman@redhat.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Piggin <npiggin@gmail.com>,
        Paul Moore <paul@paul-moore.com>,
        Eric Paris <eparis@redhat.com>,
        Christian Brauner <brauner@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jules Maselbas <jmaselbas@kalray.eu>,
        Guillaume Thouvenin <gthouvenin@kalray.eu>,
        Clement Leger <clement@clement-leger.fr>,
        Vincent Chardon <vincent.chardon@elsys-design.com>,
        =?UTF-8?Q?Marc_Poulhi=c3=a8s?= <dkm@kataplop.net>,
        Julian Vetter <jvetter@kalray.eu>,
        Samuel Jones <sjones@kalray.eu>,
        Ashley Lesdalons <alesdalons@kalray.eu>,
        Thomas Costis <tcostis@kalray.eu>,
        Marius Gligor <mgligor@kalray.eu>,
        Jonathan Borne <jborne@kalray.eu>,
        Julien Villette <jvillette@kalray.eu>,
        Luc Michel <lmichel@kalray.eu>,
        Louis Morhet <lmorhet@kalray.eu>,
        Julien Hascoet <jhascoet@kalray.eu>,
        Jean-Christophe Pince <jcpince@gmail.com>,
        Guillaume Missonnier <gmissonnier@kalray.eu>,
        Alex Michon <amichon@kalray.eu>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <git@xen0n.name>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        John Garry <john.garry@huawei.com>,
        Guangbin Huang <huangguangbin2@huawei.com>,
        Bharat Bhushan <bbhushan2@marvell.com>,
        Bibo Mao <maobibo@loongson.cn>,
        Atish Patra <atishp@atishpatra.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Qi Liu <liuqi115@huawei.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Janosch Frank <frankja@linux.ibm.com>,
        Alexey Dobriyan <adobriyan@gmail.com>
Cc:     Benjamin Mugnier <mugnier.benjamin@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-audit@redhat.com,
        linux-riscv@lists.infradead.org, bpf@vger.kernel.org
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-28-ysionneau@kalray.eu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120141002.2442-28-ysionneau@kalray.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 20/01/2023 15:09, Yann Sionneau wrote:
> Add a default config file for kvx based Coolidge SoC.
> 
> Co-developed-by: Ashley Lesdalons <alesdalons@kalray.eu>
> Signed-off-by: Ashley Lesdalons <alesdalons@kalray.eu>
> Co-developed-by: Benjamin Mugnier <mugnier.benjamin@gmail.com>
> Signed-off-by: Benjamin Mugnier <mugnier.benjamin@gmail.com>
> Co-developed-by: Clement Leger <clement@clement-leger.fr>
> Signed-off-by: Clement Leger <clement@clement-leger.fr>
> Co-developed-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
> Signed-off-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Co-developed-by: Julian Vetter <jvetter@kalray.eu>
> Signed-off-by: Julian Vetter <jvetter@kalray.eu>
> Co-developed-by: Samuel Jones <sjones@kalray.eu>
> Signed-off-by: Samuel Jones <sjones@kalray.eu>
> Co-developed-by: Thomas Costis <tcostis@kalray.eu>
> Signed-off-by: Thomas Costis <tcostis@kalray.eu>
> Co-developed-by: Vincent Chardon <vincent.chardon@elsys-design.com>
> Signed-off-by: Vincent Chardon <vincent.chardon@elsys-design.com>
> Co-developed-by: Yann Sionneau <ysionneau@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
> 
> Notes:
>     V1 -> V2: default_defconfig renamed to defconfig
> 
>  arch/kvx/configs/defconfig | 127 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 arch/kvx/configs/defconfig
> 
> diff --git a/arch/kvx/configs/defconfig b/arch/kvx/configs/defconfig
> new file mode 100644
> index 000000000000..960784da0b1b
> --- /dev/null
> +++ b/arch/kvx/configs/defconfig
> @@ -0,0 +1,127 @@
> +CONFIG_DEFAULT_HOSTNAME="KVXlinux"
> +CONFIG_SERIAL_KVX_SCALL_COMM=y
> +CONFIG_CONFIGFS_FS=y
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_INFO=y
> +CONFIG_DEBUG_INFO_DWARF4=y
> +CONFIG_PRINTK_TIME=y
> +CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
> +CONFIG_MESSAGE_LOGLEVEL_DEFAULT=7
> +CONFIG_PANIC_TIMEOUT=-1
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_GDB_SCRIPTS=y
> +CONFIG_FRAME_POINTER=y
> +CONFIG_HZ_100=y
> +CONFIG_SERIAL_EARLYCON=y
> +CONFIG_HOTPLUG_PCI_PCIE=y
> +CONFIG_PCIEAER=y
> +CONFIG_PCIE_DPC=y
> +CONFIG_HOTPLUG_PCI=y
> +CONFIG_SERIAL_8250=y

Are you sure this is the result of savedefconfig? Order looks a bit odd
in several places, so I want to double check.

Best regards,
Krzysztof

