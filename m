Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93B49E3A8C
	for <lists+linux-doc@lfdr.de>; Thu, 24 Oct 2019 20:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407831AbfJXSC3 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Oct 2019 14:02:29 -0400
Received: from ms.lwn.net ([45.79.88.28]:42554 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406106AbfJXSC3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 Oct 2019 14:02:29 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 85371736;
        Thu, 24 Oct 2019 18:02:28 +0000 (UTC)
Date:   Thu, 24 Oct 2019 12:02:27 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] docs/core-api: memory-allocation: remove uses of
 c:func:
Message-ID: <20191024120227.0bd1ae92@lwn.net>
In-Reply-To: <20191022211438.3938-2-chris.packham@alliedtelesis.co.nz>
References: <20191022211438.3938-1-chris.packham@alliedtelesis.co.nz>
        <20191022211438.3938-2-chris.packham@alliedtelesis.co.nz>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 23 Oct 2019 10:14:37 +1300
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> These are no longer needed as the documentation build will automatically
> add the cross references.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     It should be noted that kvmalloc() and kmem_cache_destroy() lack a
>     kerneldoc header, a side-effect of this change is that the :c:func:
>     fallback of making them bold is lost. This is probably best fixed by
>     adding a kerneldoc header to their source.
>     
>     Changes in v2:
>     - new
> 
>  Documentation/core-api/memory-allocation.rst | 49 +++++++++-----------
>  1 file changed, 23 insertions(+), 26 deletions(-)

So I can't get this patch to apply, and I can't even figure out why.  If
you take the patch from the list, can you apply it to a docs-next (or
mainline) branch?

Thanks,

jon
