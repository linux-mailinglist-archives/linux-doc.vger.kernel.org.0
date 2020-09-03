Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C6925C5F5
	for <lists+linux-doc@lfdr.de>; Thu,  3 Sep 2020 17:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728723AbgICP5k (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 3 Sep 2020 11:57:40 -0400
Received: from ms.lwn.net ([45.79.88.28]:58438 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728382AbgICP5h (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Sep 2020 11:57:37 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1692B44A;
        Thu,  3 Sep 2020 15:57:37 +0000 (UTC)
Date:   Thu, 3 Sep 2020 09:57:35 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Drew DeVault <sir@cmpwn.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/4] submitting-patches.rst: presume git will be used
Message-ID: <20200903095735.0793c054@lwn.net>
In-Reply-To: <20200902155759.55895-5-sir@cmpwn.com>
References: <20200902155759.55895-1-sir@cmpwn.com>
        <20200902155759.55895-5-sir@cmpwn.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed,  2 Sep 2020 11:57:59 -0400
Drew DeVault <sir@cmpwn.com> wrote:

> Git is fairly ubiquitous these days, and the additional information in
> this documentation for preparing patches without it is not especially
> relevant anymore and may serve to confuse new contributors.
> 
> Signed-off-by: Drew DeVault <sir@cmpwn.com>

This is generally good, but I have a comment (of course!)...

[...]

> @@ -380,13 +326,17 @@ server, and provide instead a URL (link) pointing to your patch.  But note
>  that if your patch exceeds 300 kB, it almost certainly needs to be broken up
>  anyway.
>  
> -8) Respond to review comments
> +``git request-pull`` may be used to generate an email which summarizes your changes
> +and provides a URL to fetch your tree from. See :ref:`_request_pull`.

I'm not sure we want to be suggesting pull requests in our basic document
on patch submission.  Few, if any, maintainers will pull from developers
who still need this document.

Actually, I think this whole section ("E-mail size") is wrong, now that I
look at it.  People who post patches behind a URL rarely get a favorable
response.  Maybe we should just delete that section entirely?

Thanks,

jon
