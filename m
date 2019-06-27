Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2AE058B07
	for <lists+linux-doc@lfdr.de>; Thu, 27 Jun 2019 21:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfF0ToM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 27 Jun 2019 15:44:12 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36808 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfF0ToM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jun 2019 15:44:12 -0400
Received: by mail-ot1-f66.google.com with SMTP id r6so3532236oti.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2019 12:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dg1R5Uo32WYkkl3u1ix25+2ks+vFMVLaKn6JsNIbvzk=;
        b=ADujp90SmUPcFGS9mqRIeJ31riDOHSFmqqsPgEW35NxBXOqkUTJmxkbDTDrxVpuPs+
         foj05KsSjZSsrJlrZ2kJbJiA7SVzaHc453oD5Mn4aGeGDRtcMimDHYpf7gxb+OPcGXQL
         NGkOCQRHra+m8ZFYd/zRammMH0zbVKw0tCNSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dg1R5Uo32WYkkl3u1ix25+2ks+vFMVLaKn6JsNIbvzk=;
        b=Ez7ccLXQzxHHNCj5ms9a016axoAPFQd1jRvFNVIRO+kDaVOpDFce874jjN7VyPOqlV
         EZQ5Incc5/AwVaroScyziAPrDs33tTE8vbg4M0lLNzl6fhzP1CyR3bgQWIAAUSqIFX8S
         LIy0PoTIf3xtvHreuCs3pS6B6jPTCnQcIs2aXGVGmkjmfZeYYMrCa8rHSbOk8xkLsWgN
         8niFF4xIB3sah25YnqnCW474NjJw9sqRKlQlS13zkUA1rmDxm5r0JPQybixvlMRG9C6Z
         caG6N/E4jAV3kfWFaQM4dWRSKN9Y9WCoCLJjiVP1YNRAjeoaHB2xKKcDGrFUd3+tVK8E
         GbEg==
X-Gm-Message-State: APjAAAWw4oCz4mW1tNd+bfuvQTys5wI8xEdGTPMO1NyhQfouu5eic/32
        Vva6r5hg6XZ2BqabRm1B5+U9Zg/8BT0mCc4Ch3EDmg==
X-Google-Smtp-Source: APXvYqy8d5D0lTl2v+MH7FMTmjk/5LP/GDPtK/KvswFJia8XMylNu7kDUlfYn7kVgH+/KXfJHiKJKN36WrVTMaVZggo=
X-Received: by 2002:a05:6830:4b:: with SMTP id d11mr4771408otp.106.1561664651379;
 Thu, 27 Jun 2019 12:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <699d7618720e2808f9aa094a13ab2f3545c3c25c.1561565652.git.mchehab+samsung@kernel.org>
 <20190626212735.GY12905@phenom.ffwll.local> <20190627113122.34b46ee2@lwn.net>
In-Reply-To: <20190627113122.34b46ee2@lwn.net>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 27 Jun 2019 21:43:59 +0200
Message-ID: <CAKMK7uGU1X-KvuZGMj3GHNOiqYOuvwq-12o91kBj7JeOf3gjvw@mail.gmail.com>
Subject: Re: [PATCH] drm: fix a reference for a renamed file: fb/modedb.rst
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 27, 2019 at 7:31 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Wed, 26 Jun 2019 23:27:35 +0200
> Daniel Vetter <daniel@ffwll.ch> wrote:
>
> > On Wed, Jun 26, 2019 at 01:14:13PM -0300, Mauro Carvalho Chehab wrote:
> > > Due to two patches being applied about the same time, the
> > > reference for modedb.rst file got wrong:
> > >
> > >     Documentation/fb/modedb.txt is now Documentation/fb/modedb.rst.
> > >
> > > Fixes: 1bf4e09227c3 ("drm/modes: Allow to specify rotation and reflection on the commandline")
> > > Fixes: ab42b818954c ("docs: fb: convert docs to ReST and rename to *.rst")
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> >
> > What's the merge plan here? doc-next? If so:
> >
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> It doesn't really apply to docs-next, so that's probably not the best
> path unless I hold it until after the merge window.  Seems like it needs
> to go through the DRM tree to me.

fbdev isn't in drm (yet), so I don't think it applies here eithe. I
guess we need to wait until after -rc1 with this one. Topic
branch/merge seems a bit overkill here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
