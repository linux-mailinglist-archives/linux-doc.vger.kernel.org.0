Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC5ED3613BC
	for <lists+linux-doc@lfdr.de>; Thu, 15 Apr 2021 22:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbhDOUzD (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 15 Apr 2021 16:55:03 -0400
Received: from ms.lwn.net ([45.79.88.28]:58432 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234879AbhDOUzD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Apr 2021 16:55:03 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D0F0680F;
        Thu, 15 Apr 2021 20:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D0F0680F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1618520080; bh=Hb6qdecxJk4fd7tCiWQ1NkAwMFtoKzrHaK/EvhBRwvI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QnMra4IMFdqDevemikE7OQswJ+jsIoE0/ulmmYMDIWSrl4H3OxnwF9LfQ54xdf6yX
         mvABMbkc0xbhv8Emi4/4imFV68IsMor61MdxkCtXWQX3w3YSqscCbLqbC5bSRaPSgI
         yIQAg+KO7L6+6GPnuW3JPaCcMlE7HneAm4jer1FOUthvWTubf0pEZpe3x6HixITILF
         Vckc26D3qU4QCFnwXZmw6oznntegKPwj8mHwseWH5n05VlH9ud+AKYQQxBfbiJQEGy
         w32IYSkB84GL0oGtXpgFy0P9aZfzzqGog0KoArbCIfaxRhaMgartzP0hfxNp79WaLs
         d/9L8ff3yr2dQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [docs-next PATCH] docs/zh_CN: two minor fixes in zh_CN/doc-guide/
In-Reply-To: <20210414033435.GA27907@bobwxc.top>
References: <20210414033435.GA27907@bobwxc.top>
Date:   Thu, 15 Apr 2021 14:54:39 -0600
Message-ID: <874kg7i7zk.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> zh_CN/doc-guide/kernel-doc.rst
>   replace a ref tag to solve docs-next warning
>
> zh_CN/doc-guide/parse-headers.rst
>   fix an unperfect word
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
> Rust part in doc-guide/kernel-doc.rst is from rust-next, I'll solve that 
> tag there.
>
>  Documentation/translations/zh_CN/doc-guide/kernel-doc.rst    | 3 +--
>  Documentation/translations/zh_CN/doc-guide/parse-headers.rst | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)

Applied, thanks.

jon
