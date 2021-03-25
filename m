Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2E634933D
	for <lists+linux-doc@lfdr.de>; Thu, 25 Mar 2021 14:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhCYNoR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 25 Mar 2021 09:44:17 -0400
Received: from ms.lwn.net ([45.79.88.28]:36594 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230377AbhCYNn7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 25 Mar 2021 09:43:59 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 89399381;
        Thu, 25 Mar 2021 13:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 89399381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1616679837; bh=4Gybg0bpqiuIbuByTZa77CB5FpixINX41uBSsCKEexY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Q6hSChlEcwvd4xrPY7enp+5AUU3JWCFO4xpBW2yOJK15lzhfxEyX13OARte834Jh7
         bjsM9skP77mZFboewrvX5GlWAvUreXRthKjmD+pvoNQLxBERz0BKnMioev9traujcU
         n04uF18+L0DB46DftCplu5vOVoJExqP8wTJnmDEYY1LW1jBiDzQ1TL64H928ijqJNx
         1q7GinVYSJkPl6oR2HwZB6XqWVmiARTaU3iOEeO9VOYL4cCUY9vJhOhiiWdTMB68o+
         jjjLUYYl+PaEl1tdHfUFfq9cieeeXmYeoWz3ngLdCCtnZRRxJgNqWVtFM8EkhZVXpp
         DwlrLZfkW91AA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Miroslav Benes <mbenes@suse.cz>
Cc:     jpoimboe@redhat.com, jikos@kernel.org, pmladek@suse.com,
        joe.lawrence@redhat.com, live-patching@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org
Subject: Re: [PATCH] docs: livepatch: Fix a typo
In-Reply-To: <YFxTxxOkQDr2rb/J@OpenSuse>
References: <20210325065646.7467-1-unixbhaskar@gmail.com>
 <alpine.LSU.2.21.2103250956530.30447@pobox.suse.cz>
 <YFxTxxOkQDr2rb/J@OpenSuse>
Date:   Thu, 25 Mar 2021 07:43:57 -0600
Message-ID: <877dlv4aci.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bhaskar Chowdhury <unixbhaskar@gmail.com> writes:

> On 10:05 Thu 25 Mar 2021, Miroslav Benes wrote:

>>you sent the same fix a couple of weeks ago and Jon applied it.
>>
> Ah..difficult to remember....thanks for reminding ..it seems I need to keep
> track ...which I don't do at this moment ...so the patch get duplicated ..
>
> So.do you have any better policy to keep track???

1) Look at the emails that maintainers like me send you when patches
are applied.

2) Work against linux-next.

jon
