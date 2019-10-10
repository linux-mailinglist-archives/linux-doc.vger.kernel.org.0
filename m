Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E001D30D6
	for <lists+linux-doc@lfdr.de>; Thu, 10 Oct 2019 20:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfJJSse (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Oct 2019 14:48:34 -0400
Received: from ms.lwn.net ([45.79.88.28]:33022 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbfJJSse (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 Oct 2019 14:48:34 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E8F262BD;
        Thu, 10 Oct 2019 18:48:33 +0000 (UTC)
Date:   Thu, 10 Oct 2019 12:48:32 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Kees Cook <keescook@chromium.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Sphinx parallel build errors
Message-ID: <20191010124832.23bc4362@lwn.net>
In-Reply-To: <201910091929.0C058BB@keescook>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
        <201910091929.0C058BB@keescook>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 9 Oct 2019 19:30:56 -0700
Kees Cook <keescook@chromium.org> wrote:

> I'm wondering if it's actually the addition of
> the MAINTAINERS file parsing -- that's a really big parse and maybe that
> pushed things over the edge?

That does seem like a likely culprit, doesn't it?  Watching a build here,
though, I don't see that any one of the sphinx-build processes balloons to
a horrific size, which is what I would expect if one file were causing the
problem.

In general, the sphinx build doesn't really begin to approach the memory
requirements of, say, firefox or my mail client on my system.

Randy, I'd be curious to know if you see the same behavior with current
mainline.  Also, can you see how many sphinx-build processes you have
running?

Thanks,

jon
