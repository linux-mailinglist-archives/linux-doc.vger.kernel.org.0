Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A625167879
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2020 09:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbgBUIst (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 Feb 2020 03:48:49 -0500
Received: from ms.lwn.net ([45.79.88.28]:54224 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728259AbgBUIss (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 21 Feb 2020 03:48:48 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D3C77382;
        Fri, 21 Feb 2020 08:48:46 +0000 (UTC)
Date:   Fri, 21 Feb 2020 01:48:41 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [Regression] Docs build broken by commit 51e46c7a4007
Message-ID: <20200221014841.3137229d@lwn.net>
In-Reply-To: <CAJZ5v0gu_2wkncukKK7u340KLzSCVL_7F9cJTz3wVhxfogR8NQ@mail.gmail.com>
References: <CAJZ5v0he=WQ6159fyaYYffdi66y596rVo7z1yLyGFcH45PXNUg@mail.gmail.com>
        <202002201158.2911CE2388@keescook>
        <CAJZ5v0hkKUi7FUOneEy2nO-=RM8ZbcoG1uHRYNWzrjONEhKYxQ@mail.gmail.com>
        <202002201448.62894C394@keescook>
        <CAJZ5v0gu_2wkncukKK7u340KLzSCVL_7F9cJTz3wVhxfogR8NQ@mail.gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 21 Feb 2020 09:40:01 +0100
"Rafael J. Wysocki" <rafael@kernel.org> wrote:

> 1.6.5 (I realize that it is older than recommended, but it had been
> working fine before 5.5-rc1 :-)).

We still intend to support back to 1.4; this version should work.

> I've tried that too, but most often I do something like "make
> O=../build/somewhere/ htmldocs".
> 
> But I can do "make O=../build/somewhere/ -j 2 htmldocs" too just fine. :-)

I suspect that the O= plays into this somehow; that's not something I do
in my own testing.  I'll try to take a look at this, but I'm on the road
and somewhat distracted at the moment...

Thanks,

jon
