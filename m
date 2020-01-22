Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7493145F53
	for <lists+linux-doc@lfdr.de>; Thu, 23 Jan 2020 00:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgAVXqM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 22 Jan 2020 18:46:12 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:49570 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgAVXqM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jan 2020 18:46:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ab8v0lJ+LX9opn2zqbm2giBYF7DWqV5s6d4Mqh1taMo=; b=OUh++q8MlY1Py3Upfg5WRxtNT
        3u71wmZS2UW0sWpWvRL+lBXdAZhw1jPubbBzzl3kSaa3WKZWKbbBG9AWiDC42/ku0/Ef+AAG1LP+M
        7Ro2Les24l5T9Lg+tURWUgopbFEMR/AzvLxMFOyI977z+VeWxRL9gkWZmun4HCgqL6ZOnixUc73d5
        +AsXGEmY2Pgq9lHkGFPyEyhcbO4wCxUNnWCS0yMX/LpwNAxYYy9KLMYbntqk1KUa5bM6Z0/jUAR6E
        wif1bR0MgTV/5yV2LzE4UY8Lrw4ElFB3VQDt+Mm4EXJvliLScFoXCtIlxRNYo/U/fVvZZxLdFltsy
        bLgyC94vw==;
Received: from [2603:3004:32:9a00::c7a3]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iuPhM-0006Zh-Ar; Wed, 22 Jan 2020 23:46:12 +0000
Subject: Re: [PATCH] Add a document on how to contribute to the documentation
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20200122162030.5b789232@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7684ef2c-27a5-4a6c-d97a-89d99a4f6eb1@infradead.org>
Date:   Wed, 22 Jan 2020 15:46:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200122162030.5b789232@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/22/20 3:20 PM, Jonathan Corbet wrote:
> This is mostly a collection of thoughts for how people who want to help out
> can make the docs better.  Hopefully the world will respond with a flurry
> of useful patches.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/doc-guide/contributing.rst | 272 +++++++++++++++++++++++
>  Documentation/doc-guide/index.rst        |   1 +
>  2 files changed, 273 insertions(+)
>  create mode 100644 Documentation/doc-guide/contributing.rst

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
