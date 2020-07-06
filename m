Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F32502152F2
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2020 09:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgGFHQy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 6 Jul 2020 03:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728110AbgGFHQx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Jul 2020 03:16:53 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64359C08C5DF
        for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2020 00:16:53 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 17so40666419wmo.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2020 00:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=vLESYTwRgIEzacl15YJZpza+9kyceaKMoLaqX6m40MQ=;
        b=zw5NNvo0Eu8+IjaRXjHxdwT7ZCRIe6Hu5r+f7ZNg90MoD5ohiSJUqHDU9OIVb60+XQ
         9sUReu++a5Tt3Tss82ZcGbLj0IKCgXbaRcfjoI0tGvMB/VIBiYuw4OsJ01mSnZw7V7wk
         0O6c0nR4tqeQSRmhRfaEvPnxHCi63gP03Fa5QK7068l5Pdou723cpl/3IOY1GD89/jQc
         zmORq0LL3qzmOaTNZTjE0t+aU74ki50BSFYcihFvaYRHfAZ0ZAgzS8Be/k1OZIjS0j1W
         CCW/tW7hrDJKWK67ZG65n0D7oNmw9UNzRzIBLilvw+X5ufYy4KDirDG5Z5TqiusMo0E9
         mD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=vLESYTwRgIEzacl15YJZpza+9kyceaKMoLaqX6m40MQ=;
        b=m3kjR/GaDA5fNf8vWJOnwWz37+0WMh5COodHRUuimmT+vqw85L8UBKR6nk8Xd6AxHF
         YqmyTAPB/ip7iDgb4e5bb44b36z8qxIfIBqcGmrbJD35wqKFRBv7YHYFsmHrspQpqD5u
         5hgheVD5PvkEDaCm5ycGKOt77z0oCRLtTvQkOySexGxahMkeLdbQRJbepct6o3L55DXX
         RBcI0EdzQcKe/IIc6DIlpmhaV0heHzEA0pjPSDf6hicmq0ZVmWd+MLFPRp4T+qfthpsi
         rhjmj3o8EHEX9yAqs/IKJfrx60W7Lb2I8rQW4IPuiJvzmmsmzwEKR64ej4lTg1htWM+X
         6zFQ==
X-Gm-Message-State: AOAM531jgXrzuDrffnxSv9x8JQThcNJxXqAWFFvtSahdoNEPtk5p3Dkt
        wTklNW8VZ61VQq0i4n9ZfKzxpA==
X-Google-Smtp-Source: ABdhPJxfyyFOAUjRwqmCoAeF7td/gWS8mcZ3rJISSVH2W0WCap4JqRbYzRLfeVuu43SB0/OV5bV9zw==
X-Received: by 2002:a7b:c4d8:: with SMTP id g24mr45546915wmk.127.1594019811942;
        Mon, 06 Jul 2020 00:16:51 -0700 (PDT)
Received: from [192.168.0.13] ([83.216.184.132])
        by smtp.gmail.com with ESMTPSA id 22sm23456880wmb.11.2020.07.06.00.16.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2020 00:16:51 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] docs: block: update and fix tiny error for bfq
From:   Paolo Valente <paolo.valente@linaro.org>
In-Reply-To: <20200703061323.959519-1-yuyufen@huawei.com>
Date:   Mon, 6 Jul 2020 09:17:06 +0200
Cc:     Jens Axboe <axboe@kernel.dk>, linux-doc@vger.kernel.org,
        linux-block@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <295D7F7E-2B17-469C-B758-9A9DAEC65E66@linaro.org>
References: <20200703061323.959519-1-yuyufen@huawei.com>
To:     Yufen Yu <yuyufen@huawei.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> Il giorno 3 lug 2020, alle ore 08:13, Yufen Yu <yuyufen@huawei.com> ha =
scritto:
>=20
> The max value of blkio.bfq.weight is 1000, rather than 10000.
> And 'weights' have been remove from /sys/block/XXX/queue/iosched.
>=20
Acked-by: Paolo Valente <paolo.valente@linaro.org>

Thanks!
Paolo

> Signed-off-by: Yufen Yu <yuyufen@huawei.com>
> ---
> Documentation/block/bfq-iosched.rst | 9 +--------
> 1 file changed, 1 insertion(+), 8 deletions(-)
>=20
> diff --git a/Documentation/block/bfq-iosched.rst =
b/Documentation/block/bfq-iosched.rst
> index 0d237d402860..19d4d1570cee 100644
> --- a/Documentation/block/bfq-iosched.rst
> +++ b/Documentation/block/bfq-iosched.rst
> @@ -492,13 +492,6 @@ set max_budget to higher values than those to =
which BFQ would have set
> it with auto-tuning. An alternative way to achieve this goal is to
> just increase the value of timeout_sync, leaving max_budget equal to =
0.
>=20
> -weights
> --------
> -
> -Read-only parameter, used to show the weights of the currently active
> -BFQ queues.
> -
> -
> 4. Group scheduling with BFQ
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
> @@ -566,7 +559,7 @@ Parameters to set
> For each group, there is only the following parameter to set.
>=20
> weight (namely blkio.bfq.weight or io.bfq-weight): the weight of the
> -group inside its parent. Available values: 1..10000 (default 100). =
The
> +group inside its parent. Available values: 1..1000 (default 100). The
> linear mapping between ioprio and weights, described at the beginning
> of the tunable section, is still valid, but all weights higher than
> IOPRIO_BE_NR*10 are mapped to ioprio 0.
> --=20
> 2.25.4
>=20

