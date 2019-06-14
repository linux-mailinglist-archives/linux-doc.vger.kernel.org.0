Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD862463D8
	for <lists+linux-doc@lfdr.de>; Fri, 14 Jun 2019 18:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbfFNQSk (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 14 Jun 2019 12:18:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:52794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725801AbfFNQSk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 14 Jun 2019 12:18:40 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4178721841;
        Fri, 14 Jun 2019 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560529119;
        bh=dE90nthqMENvAzRAL+ZRMLD+AqNO90WL38msCIgtbPA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NK2lJvEV1z5bNiYfVSO330B3jUXdaXrzTocVp67nWE5GzYVehzCymhsfoVkICdAwA
         hc1/moHRv7T2JHXvRk/7fooH0TgvtqI08UDrKYk2CWw+HyYXfc8OxlnI80grAu963P
         TK4fEOaqTsAES2HHc7SbYx/rKcjfAqaixxCXL9RM=
Date:   Fri, 14 Jun 2019 18:18:37 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 14/14] docs: sphinx/kernel_abi.py: fix UTF-8 support
Message-ID: <20190614161837.GA25206@kroah.com>
References: <cover.1560477540.git.mchehab+samsung@kernel.org>
 <62c8ffe86df40c90299e80619a1cb5d50971c2c6.1560477540.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62c8ffe86df40c90299e80619a1cb5d50971c2c6.1560477540.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 13, 2019 at 11:04:20PM -0300, Mauro Carvalho Chehab wrote:
> The parser breaks with UTF-8 characters with Sphinx 1.4.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/sphinx/kernel_abi.py | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
> index 7fa7806532dc..460cee48a245 100644
> --- a/Documentation/sphinx/kernel_abi.py
> +++ b/Documentation/sphinx/kernel_abi.py
> @@ -1,4 +1,5 @@
> -# -*- coding: utf-8; mode: python -*-
> +# coding=utf-8
> +#

Is this an emacs vs. vim fight?

Why change this?

thanks,

greg k-h
