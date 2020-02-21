Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2C331689CB
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2020 23:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgBUWKq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 Feb 2020 17:10:46 -0500
Received: from mail-pf1-f174.google.com ([209.85.210.174]:38758 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgBUWKq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Feb 2020 17:10:46 -0500
Received: by mail-pf1-f174.google.com with SMTP id x185so1983335pfc.5
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2020 14:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7vKq81cD/QN29xYHn6q6pJWs0yVIhFoN9EiGZra3Ihw=;
        b=XYQ6WQet1tacXR1VZfT7hTWyzI8rHIS8e6kJpBHmweWfwysSxzwwZv1FlW0mZAAA+S
         Q8RKr3SEZ0MdVEiqis1bDZKsAlRSEYCjfHJ+yc8t8exywStwLFFFveNLM7mvEB2wtWmm
         Ohdqgk5YfUSCkVSUnlm4LlNyKpU7bzOvffvFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7vKq81cD/QN29xYHn6q6pJWs0yVIhFoN9EiGZra3Ihw=;
        b=tSrtoX48eTPm82RGUJEdFHWnn2HJsvUzQcIwVEP5FKiomqzEBR6y78sh+C/Igcpa7L
         ZNMZjuZ/KxU3hFOPS/ChWggd6Y9zsbiNwK7AGcawJ1lOGsRYgQ+2KtJ/IzSm5ozp7jIB
         7SIAJBzvVCxz6iX0kqaTs59RMZKpFeK/Fwm0RYHz27f506wGtuE6jqJTRN58jmYFwsVE
         6yhVmtCOo0Hk27BkxGIIaL1GBA6wcpyuzEof0JGeo3JB8k3Bu+IiNft0a9CNay2rlslO
         wy35O7hRqwRfhdGMXQqv4Wjrc82U7mtRp1fPRCDbbU9/vrtE1Bd5D7FmYzaCbSuRm7gD
         dKJw==
X-Gm-Message-State: APjAAAWCP4iN21zbvk7ppI+jAwUd9ikWRrl4E1cijIVXCHHCFfPYI1L7
        bIEzftWFFx/15k/odRG/FP8bYE0bYmw=
X-Google-Smtp-Source: APXvYqw1OjW+NvIwbFd4uPw3koB9DcsYvuSNcix0/b9rql+L6DY8NMjXU0Ynp257vp3bAlge4aSuxQ==
X-Received: by 2002:aa7:9f47:: with SMTP id h7mr37799596pfr.13.1582323045355;
        Fri, 21 Feb 2020 14:10:45 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b25sm3816338pfo.38.2020.02.21.14.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 14:10:43 -0800 (PST)
Date:   Fri, 21 Feb 2020 14:10:42 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [Regression] Docs build broken by commit 51e46c7a4007
Message-ID: <202002211406.69D0BAFD@keescook>
References: <CAJZ5v0he=WQ6159fyaYYffdi66y596rVo7z1yLyGFcH45PXNUg@mail.gmail.com>
 <202002201158.2911CE2388@keescook>
 <CAJZ5v0hkKUi7FUOneEy2nO-=RM8ZbcoG1uHRYNWzrjONEhKYxQ@mail.gmail.com>
 <202002201448.62894C394@keescook>
 <CAJZ5v0gu_2wkncukKK7u340KLzSCVL_7F9cJTz3wVhxfogR8NQ@mail.gmail.com>
 <20200221014841.3137229d@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221014841.3137229d@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 21, 2020 at 01:48:41AM -0700, Jonathan Corbet wrote:
> On Fri, 21 Feb 2020 09:40:01 +0100
> "Rafael J. Wysocki" <rafael@kernel.org> wrote:
> 
> > 1.6.5 (I realize that it is older than recommended, but it had been
> > working fine before 5.5-rc1 :-)).
> 
> We still intend to support back to 1.4; this version should work.
> 
> > I've tried that too, but most often I do something like "make
> > O=../build/somewhere/ htmldocs".
> > 
> > But I can do "make O=../build/somewhere/ -j 2 htmldocs" too just fine. :-)
> 
> I suspect that the O= plays into this somehow; that's not something I do
> in my own testing.  I'll try to take a look at this, but I'm on the road
> and somewhat distracted at the moment...

Ah! Yes, I've not used O= before. I bet it's something weird between the
parallelism detection of a pre-1.7 version and the O=. I'll see if I can
find the problem...

-- 
Kees Cook
