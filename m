Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F79A322712
	for <lists+linux-doc@lfdr.de>; Tue, 23 Feb 2021 09:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbhBWIZe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 23 Feb 2021 03:25:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231965AbhBWIZb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Feb 2021 03:25:31 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89938C06174A
        for <linux-doc@vger.kernel.org>; Tue, 23 Feb 2021 00:24:50 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id n1so24922243edv.2
        for <linux-doc@vger.kernel.org>; Tue, 23 Feb 2021 00:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=oQLeHTjUn7m4yQIpQlHbe3vp0Q+84XdJkArA5VMYvs8=;
        b=V9Hen4e8eyB6mzPc/vFGGhLk9RgLoxgHHYAWlVjci21a6AP/KPYz4QhWE3t/4bWgKe
         1CWGX8BXKhBEKr/xZF9G8FCtbf1pxqkMmpngKXn4g3WTlu+b/JzofPEjz5pdQrGVKZVp
         9hPE4q6NIXNeeISTgSVoJwGYuhlM/dNthzItlOKVAcMxfKA+ulNB/x2RdtVNgwqsKTIY
         kTem5kmHDBlnaS/Osr/CcC6EE3c7Vs5pritP7IQJBxWm5qHW0bmWKVzx1Ymu1EAi5sgc
         puo2IAuFkSMgDXNy5VmylN5JMUpFM32q1JfcslbQC7WR6Tbc1vbor3i5UR3iw3WXDzqQ
         kkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=oQLeHTjUn7m4yQIpQlHbe3vp0Q+84XdJkArA5VMYvs8=;
        b=PvHKtm8xwaeUIcuhFV69U3CEp7LhzvMjCRJsKTNJj1ZFn0hQ584q2mCFTsx1AW9HUg
         Yiwl7T1srJSIZsxBOP4dUhICoqRlnXgmmzAmu05w3LKw+dEQbhMNdc+nrpAAFFt4K705
         rgNJOnhG7BCIYgzidP3UX8C8qg/bdxRtjjJl2Sws7ttMi9eiuNnNjbFZsJgEEtCJucOW
         gukAuWhBHgtMfxsaRLGlnGgtt4nMo4lx2ZsQhCemr4xNjeEm+KIok5c1UI6HwH6rFCnb
         rp0IyWAqsfIy7h7plBJa4AiOr6BQ6JMzRVq4DY9R8lZSn/aP5vw3F9ceHY5GJWlOI0sz
         sr3w==
X-Gm-Message-State: AOAM530uTpB9QcxJfHgbdbim5vHKbKL1zVwLbOUmus+DRovqmkYLaWDd
        VVe6g/jEiAmpwY+MxavoFWdGQqrktaVHQQ==
X-Google-Smtp-Source: ABdhPJy18Sa9HgWQzAyhy+wjTgtwfPvcY7bItww9ImzAHEk3ZGrVBDUQlg+kb8D9Ab9eGDJ6QKezfw==
X-Received: by 2002:aa7:d5c4:: with SMTP id d4mr4998215eds.49.1614068689278;
        Tue, 23 Feb 2021 00:24:49 -0800 (PST)
Received: from [192.168.0.13] ([83.216.184.132])
        by smtp.gmail.com with ESMTPSA id q20sm12043187ejs.17.2021.02.23.00.24.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Feb 2021 00:24:48 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] block/bfq: update comments and default value in docs for
 fifo_expire
From:   Paolo Valente <paolo.valente@linaro.org>
In-Reply-To: <1614045328-87234-1-git-send-email-joseph.qi@linux.alibaba.com>
Date:   Tue, 23 Feb 2021 09:25:39 +0100
Cc:     Jens Axboe <axboe@kernel.dk>,
        linux-block <linux-block@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B64607F8-3E03-4EBE-B4AF-63B9F220063D@linaro.org>
References: <1614045328-87234-1-git-send-email-joseph.qi@linux.alibaba.com>
To:     Joseph Qi <joseph.qi@linux.alibaba.com>
X-Mailer: Apple Mail (2.3445.104.11)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> Il giorno 23 feb 2021, alle ore 02:55, Joseph Qi =
<joseph.qi@linux.alibaba.com> ha scritto:
>=20
> Correct the comments since bfq_fifo_expire[0] is for async request,
> while bfq_fifo_expire[1] is for sync request.
> Also update docs, according the source code, the default
> fifo_expire_async is 250ms, and fifo_expire_sync is 125ms.
>=20

Thank you!

Acked-by: Paolo Valente <paolo.valente@linaro.org>

> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> ---
> Documentation/block/bfq-iosched.rst | 4 ++--
> block/bfq-iosched.c                 | 2 +-
> 2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/block/bfq-iosched.rst =
b/Documentation/block/bfq-iosched.rst
> index 19d4d15..66c5a4e 100644
> --- a/Documentation/block/bfq-iosched.rst
> +++ b/Documentation/block/bfq-iosched.rst
> @@ -430,13 +430,13 @@ fifo_expire_async
> -----------------
>=20
> This parameter is used to set the timeout of asynchronous requests. =
Default
> -value of this is 248ms.
> +value of this is 250ms.
>=20
> fifo_expire_sync
> ----------------
>=20
> This parameter is used to set the timeout of synchronous requests. =
Default
> -value of this is 124ms. In case to favor synchronous requests over =
asynchronous
> +value of this is 125ms. In case to favor synchronous requests over =
asynchronous
> one, this value should be decreased relative to fifo_expire_async.
>=20
> low_latency
> diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
> index b398dde..2baa10b 100644
> --- a/block/bfq-iosched.c
> +++ b/block/bfq-iosched.c
> @@ -160,7 +160,7 @@
> BFQ_BFQQ_FNS(softrt_update);
> #undef BFQ_BFQQ_FNS						\
>=20
> -/* Expiration time of sync (0) and async (1) requests, in ns. */
> +/* Expiration time of async (0) and sync (1) requests, in ns. */
> static const u64 bfq_fifo_expire[2] =3D { NSEC_PER_SEC / 4, =
NSEC_PER_SEC / 8 };
>=20
> /* Maximum backwards seek (magic number lifted from CFQ), in KiB. */
> --=20
> 1.8.3.1
>=20

