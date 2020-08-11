Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2FAF241EA1
	for <lists+linux-doc@lfdr.de>; Tue, 11 Aug 2020 18:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728970AbgHKQtJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 Aug 2020 12:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728962AbgHKQtJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Aug 2020 12:49:09 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CA1C06174A
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2020 09:49:09 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1767031A;
        Tue, 11 Aug 2020 16:49:09 +0000 (UTC)
Date:   Tue, 11 Aug 2020 10:49:07 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Billy Wilson <billy_wilson@byu.edu>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Correct the release date of 5.2 stable
Message-ID: <20200811104907.719c60c3@lwn.net>
In-Reply-To: <20200806231754.7735-1-billy_wilson@byu.edu>
References: <20200806231754.7735-1-billy_wilson@byu.edu>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  6 Aug 2020 17:17:54 -0600
Billy Wilson <billy_wilson@byu.edu> wrote:

> A table lists the 5.2 stable release date as September 15, but it was
> released on July 7. This may confuse a reader who is trying to
> understand the stable update release cycle.
> 
> Signed-off-by: Billy Wilson <billy_wilson@byu.edu>
> ---
>  Documentation/process/2.Process.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
> index 3588f48841eb..4ae1e0f600c1 100644
> --- a/Documentation/process/2.Process.rst
> +++ b/Documentation/process/2.Process.rst
> @@ -113,7 +113,7 @@ than one development cycle past their initial release. So, for example, the
>  5.2 kernel's history looked like this (all dates in 2019):
>  
>  	==============  ===============================
> -	September 15 	5.2 stable release
> +	July 7		5.2 stable release
>  	July 14		5.2.1

Applied, thanks.

jon
