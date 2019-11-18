Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63119100BB7
	for <lists+linux-doc@lfdr.de>; Mon, 18 Nov 2019 19:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfKRSqJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 18 Nov 2019 13:46:09 -0500
Received: from ms.lwn.net ([45.79.88.28]:60390 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726423AbfKRSqJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 18 Nov 2019 13:46:09 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D14329A8;
        Mon, 18 Nov 2019 18:46:08 +0000 (UTC)
Date:   Mon, 18 Nov 2019 11:46:07 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Kees Cook <keescook@chromium.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: Document how to get links with git am
Message-ID: <20191118114607.14158343@lwn.net>
In-Reply-To: <201911151516.94D79DFB70@keescook>
References: <20191115133021.13165-1-linus.walleij@linaro.org>
        <20191115130017.46d77037@lwn.net>
        <201911151516.94D79DFB70@keescook>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 15 Nov 2019 15:18:22 -0800
Kees Cook <keescook@chromium.org> wrote:

> >  - I wonder if the hook script should just go under tools/ somewhere for
> >    people to grab.  
> 
> Do we have anywhere to put these kinds of things, or do we need create
> something new?

I don't think there's a place now; I bet, though, if we were to create a
tools/git it would get other useful stuff before too long.

jon
