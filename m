Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC61740306
	for <lists+linux-doc@lfdr.de>; Tue, 27 Jun 2023 20:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjF0SQI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 27 Jun 2023 14:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbjF0SPt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jun 2023 14:15:49 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B662510D7
        for <linux-doc@vger.kernel.org>; Tue, 27 Jun 2023 11:15:46 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-991aac97802so370196066b.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Jun 2023 11:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687889745; x=1690481745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ndCPpqDgwou489KjC0kIekAZ9rKZJd9NKLRwxqa3kWo=;
        b=ixA0x2iljcmjaL4fSY7co3wMQ1r+EcKo28vas1Oo0TPGMSLfOyNZHZ7Kz4Mu5+UQm+
         rkB5Xj7WJJ/8/up5pGueSbFBIUHcEqYhUZuJW18ZhNWzD8QW4h7+Pt4s20nEUDeSRODj
         Ck8XcFg71kWOkxPboWcMoMIbIZRvYHQvd9m8rxyp1wGO1BroJO0VcWofO9rcT2uV9698
         IuQ7sBRVAiZj2dXeG6nqLmT22K3n/qXtYGVbK3wOjkLdyzt/8IkMTPj+yIa7WZcPhTng
         eu/wphKjcdTKt47a4CYvSNkK0SrwSIq+k1ioBdVc6wt8/JhtDV6vJAs4xKClUl/fgmpE
         L/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687889745; x=1690481745;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndCPpqDgwou489KjC0kIekAZ9rKZJd9NKLRwxqa3kWo=;
        b=AkqvPBAqmp0rnfN50F7kg0pGCEVEjie11+duyje1oo7ByzaAMvtnRlxAQpWSz8HO9+
         L0KjEbVHz33Ws2kXAqYcevObk0lngIKSPj/MRhEH9o8bX5mTFXDa6Hw/1hC9i94JsBUN
         3GF8XNFU18yvlRWXNn9NaEZ4wVoYAAjuXCchlwq0AFbckTxz5ZgoGRan8W4DSPZD/cGk
         GYg3fjOvgfds4XROCCwnqSHBCjE/nZBqJlN5mebjA99TEeXawNfO+ystHAwyc81N1Izj
         CbRoMgGWIVlUTv+bzf4aCOawMJoQL2lJxa0uxTcYwnsT5boo5zDVOLS/JgNDIlIYCj2F
         wdnw==
X-Gm-Message-State: AC+VfDzlftxRz81Ik5k95b+gO7gnDD1u2mMxo8+IomCqMlqvi7NlHOHe
        wyiAGswkjhpOJ/Egmm81iw2aamtTsjDxckhkEEU0vw==
X-Google-Smtp-Source: ACHHUZ5mDR3zHCNEIaXf+4bc2+481wuGeRiTY9bqKnQ2FgfAM2kBtsZ4ibLCMT4pX+mRBbPPZnG6v6jNKX9b241X0pM=
X-Received: by 2002:a17:907:26ca:b0:98d:fc51:b3dd with SMTP id
 bp10-20020a17090726ca00b0098dfc51b3ddmr9919666ejc.41.1687889744959; Tue, 27
 Jun 2023 11:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230627120058.2214509-1-matteorizzo@google.com>
 <20230627120058.2214509-2-matteorizzo@google.com> <e8924389-985a-42ad-9daf-eca2bf12fa57@acm.org>
In-Reply-To: <e8924389-985a-42ad-9daf-eca2bf12fa57@acm.org>
From:   Matteo Rizzo <matteorizzo@google.com>
Date:   Tue, 27 Jun 2023 20:15:33 +0200
Message-ID: <CAHKB1wJANtT27WM6hrhDy_x9H9Lsn4qRjPDmXdKosoL93TJRYg@mail.gmail.com>
Subject: Re: [PATCH 1/1] Add a new sysctl to disable io_uring system-wide
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        io-uring@vger.kernel.org, jordyzomer@google.com, evn@google.com,
        poprdi@google.com, corbet@lwn.net, axboe@kernel.dk,
        asml.silence@gmail.com, akpm@linux-foundation.org,
        keescook@chromium.org, rostedt@goodmis.org,
        dave.hansen@linux.intel.com, ribalda@chromium.org,
        chenhuacai@kernel.org, steve@sk2.org, gpiccoli@igalia.com,
        ldufour@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 27 Jun 2023 at 19:10, Bart Van Assche <bvanassche@acm.org> wrote:
> I'm using fio + io_uring all the time on Android devices. I think we need a
> better solution than disabling io_uring system-wide, e.g. a mechanism based
> on SELinux that disables io_uring for apps and that keeps io_uring enabled
> for processes started via 'adb root && adb shell ...'

Android already uses seccomp to prevent untrusted applications from using
io_uring. This patch is aimed at server/desktop environments where there is
no easy way to set a system-wide seccomp policy and right now the only way
to disable io_uring system-wide is to compile it out of the kernel entirely
(not really feasible for e.g. a general-purpose distro).

I thought about adding a capability check that lets privileged processes
bypass this sysctl, but it wasn't clear to me which capability I should use.
For userfaultfd the kernel uses CAP_SYS_PTRACE, but I wasn't sure that's
the best choice here since io_uring has nothing to do with ptrace.
If anyone has any suggestions please let me know. A LSM hook also sounds
like an option but it would be more complicated to implement and use.
