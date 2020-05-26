Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 232681D2E2E
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2020 13:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgENLXs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 14 May 2020 07:23:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENLXr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 May 2020 07:23:47 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 586D7C061A0F
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2020 04:23:47 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id v5so2260570lfp.13
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2020 04:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=52Rzrrj4E2al2tTGlHFyR6M/8l4BjJi9pTbsEHvkafw=;
        b=AQB8AjMyAZSGOL4e97UU90oVl9kAMguV5p4dTDDqcw0/yek+GT5FWuN2tscAVlKFEs
         EGzg8HjoW6dtHzhFbCevirz+96qH21ZW9fHpy2kzigcrKVJlygWbNXwPaiOUs6uFh063
         aPAdVZthuA7Y6Oqs1VLm4MDl2Ymqdb56dcWwjCBZ0og7DZpzl8xsqkqa05M1swjos7Gz
         BvCnthOJZ3OAhbZMPq0iz6CbKdHXINgpBnT6TT6KscyzM/JwxVG6ZXzKdHQmih4z9i43
         mHHs4GZHjvk6LTACjAngtXARfd2tJBCvG7KpSeW1akMKIkbng2rYc0JDaLTV5N6BoPB4
         oObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=52Rzrrj4E2al2tTGlHFyR6M/8l4BjJi9pTbsEHvkafw=;
        b=ENi5QEs4UNlV4Dznx/DBiwrG2W8c3zrkkbNTk2s5fyomQs+aHqz7smTtK++AFV7Ojx
         DOBnodxgab9XS5V7cQuKSSWYntVuM6U0/D71JBZckaeEEgzGqeB+Q5oC1nTBmOpnwFzz
         kne7T+Aj5//a+4FLl/DprVt31AfM46Bri2mcm13TQTS28SVPYP4MolyqcN9+4hoqrGod
         SmlRkFxm2EUzPedQo/j1PgBWMoOrcHLqmF1lgrGEhrsEZYcJQGs4H43rc4LmRnSUVtMx
         DiskxkEW1isID0GCbKyY6l3QyHBxhMO06q/Fy8KBWzIr8Y7gbqgg3dYQ/DdPz+tJClby
         /z1Q==
X-Gm-Message-State: AOAM533GGG2jWH4U19S+yVzxfvXSa+vz892GPjzrKgvptBNX/MPDRgsn
        dTVpcvnQrRu5JV2zPKsooxBgj5bQAPPhvuYa8pMB7g==
X-Google-Smtp-Source: ABdhPJyJHVIeFpsuP6hWyR4T3t3i5l95UvM1ck7qhqVExGI1lWc37GndFTYXCpQQGciey+GLFpqutzOT/FYhOL3syjg=
X-Received: by 2002:ac2:44bb:: with SMTP id c27mr3095483lfm.40.1589455425658;
 Thu, 14 May 2020 04:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <1588758017-30426-1-git-send-email-sumit.garg@linaro.org>
 <1588758017-30426-2-git-send-email-sumit.garg@linaro.org> <07bb6080f8be9f6613f460e2d6e19f3d456e219c.camel@linux.intel.com>
In-Reply-To: <07bb6080f8be9f6613f460e2d6e19f3d456e219c.camel@linux.intel.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Thu, 14 May 2020 16:53:34 +0530
Message-ID: <CAFA6WYMciZ=qkG3N_9YWzt_DJr2dGwdAy9diMXCJSNjr2o5ONA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] KEYS: trusted: Add generic trusted keys framework
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Mimi Zohar <zohar@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>, dhowells@redhat.com,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Janne Karhunen <janne.karhunen@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Markus Wamser <Markus.Wamser@mixed-mode.de>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        op-tee@lists.trustedfirmware.org,
        "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 14 May 2020 at 05:55, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Wed, 2020-05-06 at 15:10 +0530, Sumit Garg wrote:
> > Current trusted keys framework is tightly coupled to use TPM device as
> > an underlying implementation which makes it difficult for implementations
> > like Trusted Execution Environment (TEE) etc. to provide trusked keys
> > support in case platform doesn't posses a TPM device.
> >
> > So this patch tries to add generic trusted keys framework where underlying
> > implemtations like TPM, TEE etc. could be easily plugged-in.
> >
> > Suggested-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> I tend to agree how this is implemented and could merge it as such.
>
> I'm just thinking if we could refine this patch in a way that instead of
> copying TRUSTED_DEBUG macro we could just replace pr_info() statements
> with pr_debug()?

AFAIU, TRUSTED_DEBUG being a security sensitive operation is only
meant to be used in development environments and should be strictly
disabled in production environments. But it may not always be true
with pr_debug() with CONFIG_DYNAMIC_DEBUG=y which allows the debug
paths to be compiled into the kernel which can be enabled/disabled at
runtime.

IMO we should keep this TRUSTED_DEBUG macro, so that users are aware
of its security sensitive nature and need to explicitly enable it to
debug.

-Sumit

>
> /Jarkko
>
