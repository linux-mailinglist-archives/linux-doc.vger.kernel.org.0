Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBF96D89B
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jul 2019 03:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbfGSBvL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 18 Jul 2019 21:51:11 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34263 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbfGSBvK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Jul 2019 21:51:10 -0400
Received: by mail-pg1-f194.google.com with SMTP id n9so7485131pgc.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2019 18:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bM1qPXQ6CfVnEn3vvRy+9HqmrOIsqvvQngomqNMnrWk=;
        b=XoO09VHsUOiyoqC1hxSshQ5pzepYo4VADK/vAtt6XAEixB+KpBSbA7+7c9pRSidhBY
         3stikz00gxTehYr2mkuXXr1YTgqN75mM/XN2pdZRybxoXrzeLh3s200cI/ZyUZpyPdtn
         PYp6gX756L18o31tEe1HqkISrF7Ku98WVpNVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bM1qPXQ6CfVnEn3vvRy+9HqmrOIsqvvQngomqNMnrWk=;
        b=LddHi85vWfr+85wqSZJ/oHrC4WuV/votNiIdKPWRyonaAk8P+a9atSQx2UCM7fodR+
         89Z1ahxJsadmC2J0WjrGbsO/fvzNhaPITrV7iWm08feHAkSjJrKN9t3CmIQ1TpIMwm4q
         Q3YPDs+eingQVRXrtC++lgS3xDxH7LrKVhgMbGOd5dq+rY6lqtHTBw2OG0jdRhHPkD0m
         mE/MyFrgiMg29HEMwSSnqv8RygjcT6TjOhgJUeMwGrDI24oT5lBJ5CmgQeNh3HlYost6
         8I3t3jus3RkfbtElfbS+FOiFngFMXWmrp/rqD6oevUElSotvwr6DaBWYCHIqCDE1TzR7
         l96g==
X-Gm-Message-State: APjAAAUovP9cGviC9MVcX1TpLNNNiFvF/ZFE2yabFeT/L5WTsahJQi8i
        i+9d1iOafsHfPs8RAvSx6aolkg==
X-Google-Smtp-Source: APXvYqxpfT2jLVHsNB0Lnykz1fcfrhTIyUgCLIOl/5FtTh2jioiUC7eBHXYrjErptll9twIwC8R9UA==
X-Received: by 2002:a63:6f41:: with SMTP id k62mr5055937pgc.32.1563501069756;
        Thu, 18 Jul 2019 18:51:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h129sm27209190pfb.110.2019.07.18.18.51.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2019 18:51:08 -0700 (PDT)
Date:   Thu, 18 Jul 2019 18:51:07 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     corbet@lwn.net, solar@openwall.com, will@kernel.org,
        peterz@infradead.org, gregkh@linuxfoundation.org,
        tyhicks@canonical.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/security-bugs: provide more information
 about linux-distros
Message-ID: <201907181833.EF0D93C@keescook>
References: <20190717231103.13949-1-sashal@kernel.org>
 <201907181457.D61AC061C@keescook>
 <20190719003919.GC4240@sasha-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719003919.GC4240@sasha-vm>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 18, 2019 at 08:39:19PM -0400, Sasha Levin wrote:
> On Thu, Jul 18, 2019 at 03:00:55PM -0700, Kees Cook wrote:
> > On Wed, Jul 17, 2019 at 07:11:03PM -0400, Sasha Levin wrote:
> > > Provide more information about how to interact with the linux-distros
> > > mailing list for disclosing security bugs.
> > > 
> > > Reference the linux-distros list policy and clarify that the reporter
> > > must read and understand those policies as they differ from
> > > security@kernel.org's policy.
> > > 
> > > Suggested-by: Solar Designer <solar@openwall.com>
> > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > 
> > Sorry, but NACK, see below...
> > 
> > > ---
> > > 
> > > Changes in v2:
> > >  - Focus more on pointing to the linux-distros wiki and policies.
> > 
> > I think this is already happening in the text. What specifically do you
> > want described differently?
> 
> The main issue was that there isn't anything pointing to the
> linux-distros policies. The current text outlines a few of them ("add
> [vs]", and "there should be an embargo period"), but it effectively just
> gives out the linux-distros mailing address and tells the reporter to
> contact it.

The current text includes the wiki link, but yes, the anchor tag is not
present at the wiki anymore. I would agree that's due for updating.

I think reinforcing information to avoid past mistakes is appropriate
here. Reports have regularly missed the "[vs]" detail or suggested
embargoes that ended on Fridays, etc.

> > >  - Remove explicit linux-distros email.
> > 
> > I don't like this because we had past trouble with notifications going
> > to the distros@ list and leaking Linux-only flaws to the BSDs. As there
> > isn't a separate linux-distros wiki, the clarification of WHICH list is
> > needed.
> 
> Why would removing the explicit linux-distros email encourage people to
> send reports to it?

What? No, I'm saying we should _keep_ linux-distros@... in our text so
that people don't send to the wrong list.

> I also don't understand what you mean by "there isn't a separate
> linux-distros wiki"? There is one, and I want to point the reporter
> there.

That URL is a combined page for two lists. The very fact that it's
not obvious that there are two lists described there is exactly why I
think we need to keep an explicit mention of which to use. There are
two mailing lists described at the wiki URL:

	      distros@lists.openwall.com
	linux-distros@lists.openwall.com

Sending to the distros@ list risks exposing Linux-only flaws to non-Linux
distros. This has caused leaks in the past, and we do not want people
guessing at which list they should use.

Also note that nowhere on the openwall wiki is the email address
actually spelled out; this is another reason to spell it out in our
documentation: no misunderstanding.

(And historically there WAS a specific linux-distros wiki:
https://oss-security.openwall.org/wiki/mailing-lists/linux-distros
but it redirects to the combined one now...)

> > >  - Remove various explanations of linux-distros policies.
> > 
> > I don't think there's value in removing the Tue-Thu comment, nor
> > providing context for why distros need time. This has been a regular
> > thing we've had to explain to researchers that aren't familiar with
> > update procedures and publication timing.
> 
> To be fair, the Tue-Thu comment is listed in the section describing how
> to do coordination with linux-distros, and linux-distros don't have a
> Tue-Thu policy. If it's a security@kernel.org policy then let's list it
> elsewhere.

It's a distro preference. Many researchers aren't thinking about the
larger Linux ecosystem that has to consume fixes. It's not a _policy_,
but it makes the researchers understand how to construct better embargoes.

> If you feel that there is a consensus around Tue-Thu let's just add it
> to the linux-distros policy wiki, there's no point in listing random
> policies from that wiki.

I think it'd be a good idea to add that note also to the wiki, but I
don't want it removed from our text because I have had to repeat that
information regularly in the past.

-- 
Kees Cook
