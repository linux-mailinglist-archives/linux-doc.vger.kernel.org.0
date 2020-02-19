Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1D1016430E
	for <lists+linux-doc@lfdr.de>; Wed, 19 Feb 2020 12:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgBSLLF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 19 Feb 2020 06:11:05 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44096 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbgBSLLE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Feb 2020 06:11:04 -0500
Received: by mail-pf1-f194.google.com with SMTP id y5so12338464pfb.11
        for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2020 03:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ESbz0AHqkMkTdB+sm3A0cQw3C+xELGa4YT13KhKcyQY=;
        b=dKSW1O83OHUoh3eB3zqtzzYhLBGu/uU8CecBtF/JpiDAAb0bw1vR82BllvLQadxvcM
         t2kyayKnNMDBRkFnz1H+T52vkxBuBI1I0rIhSN4tx1ParfzXIVObPqaAf7cgJSHeyBlo
         j1sOGVR/0gy1CqcVquqWJsEClFkaUOCiDqjCKhh/H8uxODWlSVQvDhV9pwgF25XbzBPe
         zdywucFIpUVSfj5zhwFJaUKY4J5gAErDw9bhzsMfjozezU8Yy4kic8ZiF8mUgz7jO7jg
         ct2M7yeGSMu6eqoXnNpS2fAtwBnAwPfe46wpP2Go/NsGdTp3TOHrlCX2N/U0I8HocubT
         wFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ESbz0AHqkMkTdB+sm3A0cQw3C+xELGa4YT13KhKcyQY=;
        b=e5isuE0Pc/OWsw96U0V0lBgBYEyBfM6xrK+VoSh2rsJSbzOGCeHcxJrgxa3vUAeELe
         N+Vg/WEQDO7cYE+OuBlg7YSeh2AshFSb+n10kL4teeh6gumVXNjRxWFz5dIreoL3dS+O
         Kyd1Lixr20lFvgKYuwMocHwRNtHh9TlniHE0UipzksLKK5Xf/g7iuQXLXH1bS0FH0BYu
         W9tzuiRM8b236I+rgUGVDY7Pv3O3dqizDs85GO+Ei454lIemucyinGm02pSosIYv0mQS
         Koi92y3eHe1a7dPhBERmQBm7fuSGUWfZ6fONeviqDDEHj6OCZ7nQc+Wmawo0Hmw3TicO
         q33Q==
X-Gm-Message-State: APjAAAWhENYkXtaZ/60ybn3796Wu234JLx7mvzAlLpNuiA0mpd5uRuiD
        SFFKrBzswArAZNYhJmOBbl/Z
X-Google-Smtp-Source: APXvYqyLAI4XBQFxi1l3Ey7NIzZu20kpSxmX5q9ISWSfgd94tdbrz+7en3ypXsKTzdl0k2IdFp233Q==
X-Received: by 2002:a63:34b:: with SMTP id 72mr26464313pgd.278.1582110662513;
        Wed, 19 Feb 2020 03:11:02 -0800 (PST)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id w17sm2468320pfi.56.2020.02.19.03.11.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 03:11:01 -0800 (PST)
Date:   Wed, 19 Feb 2020 16:40:55 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: kref: Clarify the use of two kref_put() in example
 code
Message-ID: <20200219111055.GA4552@mani>
References: <20200213125311.21256-1-manivannan.sadhasivam@linaro.org>
 <20200219035818.08ad246f@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219035818.08ad246f@lwn.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On Wed, Feb 19, 2020 at 03:58:18AM -0700, Jonathan Corbet wrote:
> On Thu, 13 Feb 2020 18:23:11 +0530
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> 
> > Eventhough the current documentation explains that the reference count
> > gets incremented by both kref_init() and kref_get(), it is often
> > misunderstood that only one instance of kref_put() is needed in the
> > example code. So let's clarify that a bit.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  Documentation/kref.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/kref.txt b/Documentation/kref.txt
> > index 3af384156d7e..c61eea6f1bf2 100644
> > --- a/Documentation/kref.txt
> > +++ b/Documentation/kref.txt
> > @@ -128,6 +128,10 @@ since we already have a valid pointer that we own a refcount for.  The
> >  put needs no lock because nothing tries to get the data without
> >  already holding a pointer.
> >  
> > +In the above example, kref_put() will be called 2 times in both success
> > +and error paths. This is necessary because the reference count got
> > +incremented 2 times by kref_init() and kref_get().
> 
> Out of curiosity, where have you seen this misunderstanding happening?
> I'm not really opposed to this change, but I don't understand why it's
> really needed.
>

Jakub mistakenly spotted one refcounting issue in one of my patchset:
https://lkml.org/lkml/2020/2/3/926

Then I tried to show him the kernel doc for kref and that's where I got this
example code slightly confusing. And while looking into the log, I noticed that
someone deleted the kref_put in error path mistakenly and that commit got
reverted after that. This issue was even discussed in stack overflow.

http://stackoverflow.com/questions/20093127/why-kref-doc-of-linux-kernel-omits-kref-put-when-kthread-run-fail

So I thought about making it more clear of why the kref_put is needed in error
path.

Thanks,
Mani
 
> Thanks,
> 
> jon
