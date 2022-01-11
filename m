Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77FC548AFE5
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jan 2022 15:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242631AbiAKOue (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 11 Jan 2022 09:50:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242627AbiAKOue (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jan 2022 09:50:34 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B4BC061748
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 06:50:33 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id r6so18519076qvr.13
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 06:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ovolvUsascnevhDKjeXUk8JnrR7qw0Sy1rTIWP6UURw=;
        b=SXDaUER4SjZRivKmWriruCdvqGXQdX/I+B+csGE9hO34rlL3Q4sO68h1VphU/1ou70
         jYa30oqAkwBW8rj2wX3ihaJZ8bNkP4BKWvRBxHdy1Xsha8BTO05P+1nGQXDgS8EN48sD
         xx+Pt3b+EeTq/3bMINQ1UYpDVCbgY/I86YZoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ovolvUsascnevhDKjeXUk8JnrR7qw0Sy1rTIWP6UURw=;
        b=sw7KPuBVcWD53Hi707RZWzQaNAyQ0h1yuDcQbbZuWS/ZXZVMO3R+AS+xgNiBkhZEyy
         Y56CbKM7JepUD8oTb4tM1458uoe1RV0MZAx9z7bOPtq8B02rM3Z+9XgkFnde+NsKzOkm
         JKt+fss2V54AkKi1Lpj/iXzbZPHbiGe5i9HFtfHvBljl3lDHAy6P+yfAcSmcwm78KbEA
         ngU0LUVd5/DBdf/y3oMYGvgp0E/srT3iNW6Fe9p9IVAGYxxyFmhnAoRQtUmEovtvXUax
         ZdkWRxxQucSHvAVv11YpNY3z3Qg04u93HQa93qOrPQsI+oWm7bKwMZxHBLJa6UxC07hz
         hCyg==
X-Gm-Message-State: AOAM531l6aFYz9AWwHQpTdDgW/rE78P5aHgbVAuSRccuFIsMgr1M3S1g
        ymsO4EHZAfwlIYhEPBG4pCA0K5GhrwvaKg==
X-Google-Smtp-Source: ABdhPJz+EU85bHG07gUWz9RVNgCZdK/NpBXsxtsizfS2xx0ovkmREI9GrrVurUMtCh2l8eWZefX0/w==
X-Received: by 2002:ad4:5dc6:: with SMTP id m6mr4256075qvh.74.1641912633140;
        Tue, 11 Jan 2022 06:50:33 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id g13sm2474704qko.34.2022.01.11.06.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 06:50:32 -0800 (PST)
Date:   Tue, 11 Jan 2022 09:50:31 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: Add a few more FAQs to the [kernel.org] releases page
Message-ID: <20220111145031.cfkyxffmps3swakv@meerkat.local>
References: <51654a51-4264-c333-40d5-4f755e69d54b@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51654a51-4264-c333-40d5-4f755e69d54b@leemhuis.info>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 11, 2022 at 07:32:46AM +0100, Thorsten Leemhuis wrote:
> * you added two sections that use the term "LTS", which is not explained
> on that page and wasn't used on it earlier. I wonder if it might be
> better to use "Longterm series" or something like that instead, as that
> it the term used on the page (and the official one afaics).

Thanks for the feedback, I switched to using "longterm" uniformly on that
page.

> This was also added:
> 
> > Does the odd-even number still mean anything?
> > 
> > Not since 2.5 days.
> 
> I guess a lot of users won't known how long ago that was, so how about
> using an answer like this instead:
> 
> "Not since December 2003, when Linux 2.6 got released."

I've expanded a bit more on that topic, just to avoid confusion.

Best regards,
-K
