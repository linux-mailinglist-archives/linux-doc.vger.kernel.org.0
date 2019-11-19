Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7E4102D58
	for <lists+linux-doc@lfdr.de>; Tue, 19 Nov 2019 21:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfKSUPh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Nov 2019 15:15:37 -0500
Received: from ms.lwn.net ([45.79.88.28]:40062 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726722AbfKSUPh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 19 Nov 2019 15:15:37 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AF5822B2;
        Tue, 19 Nov 2019 20:15:36 +0000 (UTC)
Date:   Tue, 19 Nov 2019 13:15:35 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2] Documentation: Document how to get links with git am
Message-ID: <20191119131535.293471da@lwn.net>
In-Reply-To: <20191118223019.81708-1-linus.walleij@linaro.org>
References: <20191118223019.81708-1-linus.walleij@linaro.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 18 Nov 2019 23:30:19 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> This adds Kees' clever apply hook to the kernel documentation so
> it can be easily references when needed.
> 
> Cc: Kees Cook <keescook@chromium.org>
> Link: https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2019-July/006608.html
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Make the document part of maintainer/configure-git.rst
> - Did not try to separate out to a standalone script file, the thing
>   needs to come with other command line interaction anyway
> ---
>  Documentation/maintainer/configure-git.rst | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

I've applied this, thanks.  It's the first docs-next commit with a shiny
new Link: tag :)

jon
