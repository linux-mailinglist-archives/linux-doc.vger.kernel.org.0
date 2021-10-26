Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C95843B5E7
	for <lists+linux-doc@lfdr.de>; Tue, 26 Oct 2021 17:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235162AbhJZPpR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 26 Oct 2021 11:45:17 -0400
Received: from ms.lwn.net ([45.79.88.28]:53324 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232651AbhJZPpR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 26 Oct 2021 11:45:17 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 124E25ED5;
        Tue, 26 Oct 2021 15:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 124E25ED5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1635262973; bh=3gc4vV+tU4bNJypurxjSBfHk40yL80BPXB366nAZYxc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=p/RS7LSjDYY8ixyq7Lqx5M1pNLg2lOimIP6f77kiQWRNtZggyxzLlWYtQWxU8XcCi
         d/mIA7FxyHZ+2xHBot2fiUs85ryBlu5wK2Yb/sLg2Ma7SwrRlC/U+xYbaOXZTejhCm
         FWKrkoK5eyC+ZRka6XL30ni72U3cmHt9cmMWnPmAa+TcbZVVhRtuMnzgN189jfaRgL
         xJptnngsPIqNZN692wFpye+bbwgSPvzeDXx5HKqG0JPc+Mx66OwmZXEwnxtbsyqqz/
         ZfNocUipElHn/OYv5NiRCkBUXy5tbysF25yf4gII+CNg/qcDVl8mYifAuAAyT8SpTc
         ifPj2Mn0P2mpA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        bpf@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 0/2] Two fixes for documentation-file-ref-check
In-Reply-To: <cover.1634629094.git.mchehab+huawei@kernel.org>
References: <cover.1634629094.git.mchehab+huawei@kernel.org>
Date:   Tue, 26 Oct 2021 09:42:52 -0600
Message-ID: <875ytjg5c3.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This small series contain two fixes for  documentation-file-ref-check,
> in order to remove some (false) positives.
>
> The first one makes it to ignore files that start with a dot. It
> prevents the script to try parsing hidden files. 
>
> The second one shuts up (currently) two false-positives for some
> documents under:
>
> 	tools/bpf/bpftool/Documentation/
>
> Mauro Carvalho Chehab (2):
>   scripts: documentation-file-ref-check: ignore hidden files
>   scripts: documentation-file-ref-check: fix bpf selftests path
>
>  scripts/documentation-file-ref-check | 4 ++++
>  1 file changed, 4 insertions(+)

Set applied, thanks.

jon
