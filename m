Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1983A63CE7B
	for <lists+linux-doc@lfdr.de>; Wed, 30 Nov 2022 05:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbiK3Ew2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 29 Nov 2022 23:52:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232707AbiK3Ew1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Nov 2022 23:52:27 -0500
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9510970444
        for <linux-doc@vger.kernel.org>; Tue, 29 Nov 2022 20:52:26 -0800 (PST)
Received: by mail-vk1-xa2c.google.com with SMTP id n191so3057200vkf.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Nov 2022 20:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ze9YGMwqSnvvkjU5+Ntfdyx7nkP/I6B9Z3IIebf8Omw=;
        b=K8WFiEpfxUwtkS5KhNenVrX3XqJfi8oh9RWBzNuqMJQ1mZ5kNzeWA3DDXY7F60/zvp
         6mIwWm4Je6u1RY0Bh74JtkT5TZs/JkRg00cvZB+MCv+pIneeQvPZ4L68z+AQEexd0OWf
         g2pdyuTn0H+j9WbeQ1RUOAo5KcU5kINjYXeo30Z/+NZLePFbhAMnIZpChMKyjxAm5CZW
         j9HO8LSiVVrqfpbnRI8Doq+HOWHDuLXUvJ01H5nl/pkzxXZctZcbC1szsVj07Dr84FzS
         URY4yp30L4rLg65KAzzJjsrw849xomY4T3bIwTAEP7gRsCLdhH9O9+5bi0c3KeMkBHy0
         BkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ze9YGMwqSnvvkjU5+Ntfdyx7nkP/I6B9Z3IIebf8Omw=;
        b=GYHrhWIKGsTtu/pqRvCcpStxSeDFFmeJSL4a4Cz6MVi7E5lASxJk/43eGbgMZvy+5J
         lmNiui+jpKLxSmSPQ8Xv/ZoH6Ao4cPWi7pMi3STlIFNAyCBVwx/DXTChMrbUsQK+MZUH
         wBAW2/hQ9GAdoWXDnZlStM9muNisza59cLc6suzYaOwePJmVFxQCjmRlhUlwLZorwcfy
         epl6xaY/l0ZTwWyCT9VPJSCjBqEGSfbC591HxSKUrkArBkURRHc+YWnbEWsBzd0b4UVX
         TPJgJtAmVkZAHR9RE8vfwoQUkHqZRFJc3ZSWj35gMzy6Q0BZNanoizLr8jTKIJ6WyIM+
         Rivw==
X-Gm-Message-State: ANoB5pmWNiEqXaL/bLVkf6ACMcSbSynRxk3EXCfEA2oLxo+zs0RJ0bar
        VAHFS0N+E8/9hl/sSGWR8E2z05lOikzhCWe0Jr0=
X-Google-Smtp-Source: AA0mqf5K2MUb1PO+zaLxLnhEFl+/wGZwDtHXCw67b1IplfPG0/f9ipzANckA1zL8VOvzIGBtt45QfiHiYA+Zb1QNauk=
X-Received: by 2002:a1f:de84:0:b0:3bc:e3ce:a02d with SMTP id
 v126-20020a1fde84000000b003bce3cea02dmr6768628vkg.12.1669783945702; Tue, 29
 Nov 2022 20:52:25 -0800 (PST)
MIME-Version: 1.0
References: <CAH+toHVj-SFWy_iy8NHNhxaN=5__FCncorefbEDF99Eh4hL86g@mail.gmail.com>
In-Reply-To: <CAH+toHVj-SFWy_iy8NHNhxaN=5__FCncorefbEDF99Eh4hL86g@mail.gmail.com>
From:   Darvis <obianujurollers@gmail.com>
Date:   Wed, 30 Nov 2022 05:52:13 +0100
Message-ID: <CAH+toHXXC3rT7mPJiva_BpFUAyVYL-NZb0nGOzz6eUSZYBtUww@mail.gmail.com>
Subject: How are you
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_SCAM,
        LOTS_OF_MONEY,MILLION_HUNDRED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a2c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [obianujurollers[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  1.3 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.0 HK_SCAM No description available.
        *  3.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is Darvis, an auditor
     I need to share business opportunity with you
 and I assure you that you can never regret it.
About the transfer of a million three hundred thousand dollars left by
our late client.
 A citizen of your country with a resemblance name in the next of kin
document I have with me
              please reply back. I have everything needed to execute this

Regards
Darvis Ganego
