Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 987DD5980D7
	for <lists+linux-doc@lfdr.de>; Thu, 18 Aug 2022 11:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241952AbiHRJdR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 18 Aug 2022 05:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241906AbiHRJdQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Aug 2022 05:33:16 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA2C01AF1A
        for <linux-doc@vger.kernel.org>; Thu, 18 Aug 2022 02:33:13 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id i14so2174497ejg.6
        for <linux-doc@vger.kernel.org>; Thu, 18 Aug 2022 02:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=lNkwc/mVYl5zhZCnfILTVnkAJhpHpkpeN6USQ5l2Exk=;
        b=h3d+8hwJhEG7EaO8QJTr5CbSPJrJ9j7aiRcbvgMRvJNVmnZDQMetcty1p/W1Eb9wPL
         icgGdcIlWPp8pc83H/ZYZ/VwprIE9VD/MKGWy/BS5WzV3ov05boquCuLkZz6tRqvfZlg
         qOJY756WmSqcbSMUggqdbyKvFLmzYz6YyhY3/U1x6Tf/tn2jbshL5fEhxAb07m57HuV4
         9ZrGLNWBZz7nDxgZxVS5QjG3dvqyt8VId3k98hQpaYstfA1Ap1Y0pYk8QQa81v96tkHJ
         MQwQwc126xDjMYNthi06Wy8S7brXp3aas0hHC3dijePWPsA2NuB78J0mwrKjv5OK9YaX
         FDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=lNkwc/mVYl5zhZCnfILTVnkAJhpHpkpeN6USQ5l2Exk=;
        b=nxqjU5igB6ViefW8Kp4sdhd6eHwvjxA1HXNll7MaFXvkImHF/PrdsjgoMdWrEYAaFr
         Zaz/+3xH9ELMInblBEaLoI47Ap824jUXgS9yPiPEQmlhNRKixuqMcNU787yZujwqmlnb
         E1dZshUQSJkr8iDtytFDodJsoCXDg+CIa6Sx5dC3tpYzAJ7uOADDosQjN71wLaJcN6VU
         L8S3bG95EJzacvbaMwdDzyuRKhn7qx2ceA4uOU5BfU6CFh8cmaePn4REGgxG1pKsn74G
         GrDc31Xgai/0LmdigOE55a5ZHVUTYqVElQzYAXkjTaBTN4LuQ2hedYXltHowBkbYzUcA
         RGgw==
X-Gm-Message-State: ACgBeo2G7qAnAdtWZiDYlHcwRP2yLRdglYD3SCKlTdXjqidzeVvZJIZa
        tlc0gKjJIWpodH/VPakT0jGbHE4dsVuCyt1PL6NKQA==
X-Google-Smtp-Source: AA6agR4bxVNxsCDVOCHM/BOnShAbzXwKgql72h0RYIw5KqHSKPniV5WlS0EoWj8j9kkQwQk82uJmagSLmLgY+dAW0AQ=
X-Received: by 2002:a17:907:6d98:b0:731:2bb3:8e17 with SMTP id
 sb24-20020a1709076d9800b007312bb38e17mr1380725ejc.203.1660815192380; Thu, 18
 Aug 2022 02:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <f31b818cf8d682de61c74b133beffcc8a8202478.1660041358.git.christophe.leroy@csgroup.eu>
In-Reply-To: <f31b818cf8d682de61c74b133beffcc8a8202478.1660041358.git.christophe.leroy@csgroup.eu>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 18 Aug 2022 11:33:01 +0200
Message-ID: <CACRpkdY53c0qXx24Am1TMivXr-MV+fQ8B0CDjtGi6=+2tn4-7A@mail.gmail.com>
Subject: Re: [PATCH] gpio: Allow user to customise maximum number of GPIOs
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:GENERIC INCLUDE/ASM HEADER FILES" 
        <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 9, 2022 at 12:41 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:

> At the time being, the default maximum number of GPIOs is set to 512
> and can only get customised via an architecture specific
> CONFIG_ARCH_NR_GPIO.
>
> The maximum number of GPIOs might be dependent on the number of
> interface boards and is somewhat independent of architecture.
>
> Allow the user to select that maximum number outside of any
> architecture configuration. To enable that, re-define a
> core CONFIG_ARCH_NR_GPIO for architectures which don't already
> define one. Guard it with a new hidden CONFIG_ARCH_HAS_NR_GPIO.
>
> Only two architectures will need CONFIG_ARCH_HAS_NR_GPIO: x86 and arm.
>
> On arm, do like x86 and set 512 as the default instead of 0, that
> allows simplifying the logic in asm-generic/gpio.h
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I see what you're trying to do and this might be a possible interim solution.

I would like some comments sprinkled into the patched sites that this is
supposed to go away.

The GPIO descriptor refactoring which has been ongoing for a few
years, see drivers/gpio/TODO (please read), has the end goal of making
descriptor allocation fully dynamic. Once we free ourselves from
the fixed GPIO numberspace, there is nothing preventing us from
just kmalloc() ing a new descriptor whenever one is needed.

Help with rooting out the remaining fixed GPIO number clients
is much appreciated!

The per-arch GPIO number only exist for one reason: embedded
GPIOs (think SoC:s) that refer to fixed numbers in numberspace in
the board support code. This makes it necessary to allocate
descriptors up front in some compiled-in GPIO chips.

Yours,
Linus Walleij
