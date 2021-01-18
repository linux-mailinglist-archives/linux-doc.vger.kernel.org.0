Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C86422FAB68
	for <lists+linux-doc@lfdr.de>; Mon, 18 Jan 2021 21:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437571AbhARU0N (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 Jan 2021 15:26:13 -0500
Received: from ms.lwn.net ([45.79.88.28]:40716 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437922AbhARUZk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 18 Jan 2021 15:25:40 -0500
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9A3C78B2;
        Mon, 18 Jan 2021 20:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9A3C78B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1611001495; bh=OWu6Pp4WhgIoko06ozeKrdKQCT/oM4dAh+U9RrjoJGU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lyI8/6PhiyAJ6NOKEmplkr1gp7im5YfAUOlMCUkhm+W2TsO/suTJ1n/86W6Y8PFz0
         k9qs/NmlPFXPVK9gaWGKWZYUfwcv4wMeIQajOC45n8T0Y29cHRd7Vp2xnbYE9gm9Oj
         x8MmcrRpBWC4iyGY66BWhjykr0NVlpI8OM9nd4CXZ/WY/DoGv9XrcHiigQXzdzqEpB
         L/uuwHboscna9Yu53zujvrn9/MZD/yL+2NY3Ujb72u0Ppliv4WSm5tjnIKKs+w5vrZ
         6lwNxMHYtCniNx+810oaDvBhqpr7duwvcSQX2LoUdvzqrDh8jaGQxSVL3p0MZEglwA
         2FYsIJtvbHWSA==
Date:   Mon, 18 Jan 2021 13:24:53 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Marc Koderer <marc@koderer.com>
Cc:     linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH] samples/kprobes: Add ARM support
Message-ID: <20210118132453.723843bc@lwn.net>
In-Reply-To: <20210112154054.17138-1-marc@koderer.com>
References: <20210112154054.17138-1-marc@koderer.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 12 Jan 2021 16:40:54 +0100
Marc Koderer <marc@koderer.com> wrote:

> Plenty of architectures are already supported and this adds ARM
> support.
> 
> Signed-off-by: Marc Koderer <marc@koderer.com>
> ---
>  samples/kprobes/kprobe_example.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied, thanks.

jon
