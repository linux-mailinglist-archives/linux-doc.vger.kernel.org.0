Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5076411BA90
	for <lists+linux-doc@lfdr.de>; Wed, 11 Dec 2019 18:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730496AbfLKRpT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 Dec 2019 12:45:19 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46395 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730461AbfLKRpS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Dec 2019 12:45:18 -0500
Received: by mail-pf1-f195.google.com with SMTP id y14so2137203pfm.13
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2019 09:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f0OGrv7lx+Zl9WZjIpgsG/9JjtlvMsK6Onor4QOzhiU=;
        b=dSFm1czu+pm7SIs0bP6i1otiKyGyBdfhEZRT7//ic7M+oipYjchAdycG1x8Z9Lu4V+
         CQIuES31Slfjt0oRLUO+N4wfsvQmw7z6HF0Q6B/x/jGGum093H02AtsWXp/SWE1/SZ3m
         SOGhNmVT/p2ON2mW07FTcZt7wgkCkY2I5OW0mJHzLGmQc1yHrKBZRcMylRkRYmdHQdJp
         ML2ECNENZdF+ZFsQaQbzGxQoMHmGMQ8O/hu7wQnu/HPzT5TQ5oK7OM/hBGBTeOyWdNxj
         vrEkCrGLZq1wTc3b8hEXEHk5ry9DTB04uS/3b8511yyi647gaQ2rSBsvLjObpWfyL2vw
         w+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f0OGrv7lx+Zl9WZjIpgsG/9JjtlvMsK6Onor4QOzhiU=;
        b=ckZ68Ln99qjDK4YYLNA+zuJeUSKiMtnoEDXdKtTw3dR8LG7DkcQGUnaDYc6pbRRB4p
         QLwrlm04jSMA/czDSdH/lFOp1kcJL9HOiOaTVoVBjcETEDNSOL63NFmJS08S/rT3+vIx
         3V0UFA+d6M3LGaLfTI7OXPPry/dIQQkOt80mYEnRafEJMzFBLJUQXPtImKJwE8X1dg3/
         wulGdCU9ToW9YKQ8A2AaQX56Jg/NZalAH7KD6hELV7GXAyKEDeebGCqz5S/Itx1KU+h/
         0PPpkWyLCIyvmoR9n1T1wZPmOfNo4FJ0uNB45Pa+r8rLf4PEtbkSjn88TwMfOgVFrCkO
         2rIA==
X-Gm-Message-State: APjAAAWxfRoRnSVXuJyozv9ADmSj8Geug8v138kohpsxRntRznXIU8rY
        KRLYbVqrBYS8VeFC8bmXCXinGABSDjsYq/P2vAPzdQ==
X-Google-Smtp-Source: APXvYqz7XjlAgHjobYmSc6XZ3IV9j5m9Gn/I2mq5n5sH6vxlj2+haEA9q7qO4eY1S7TizEeFPgB0uvoPBvBL9nZ6eVo=
X-Received: by 2002:aa7:961b:: with SMTP id q27mr5064829pfg.23.1576086317561;
 Wed, 11 Dec 2019 09:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20191211163310.4788-1-sj38.park@gmail.com> <3dab421e-6aa5-90e4-791e-53482f5c1fe8@kernel.org>
 <CAEjAshqjjVgtf_JxNvi3WOvkrjOp_-YjK=rY7GE0Mt40Y1EMqQ@mail.gmail.com>
In-Reply-To: <CAEjAshqjjVgtf_JxNvi3WOvkrjOp_-YjK=rY7GE0Mt40Y1EMqQ@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 11 Dec 2019 09:45:07 -0800
Message-ID: <CAFd5g4649_C0tSy3W-KzN05Y8K5zZtGUGVYFA9iAKvaXsPentw@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Fix nits in the kunit
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     shuah <shuah@kernel.org>, SeongJae Park <sjpark@amazon.com>,
        Jonathan Corbet <corbet@lwn.net>,
        KUnit Development <kunit-dev@googlegroups.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 11, 2019 at 9:40 AM SeongJae Park <sj38.park@gmail.com> wrote:
>
> On Wed, Dec 11, 2019 at 6:22 PM shuah <shuah@kernel.org> wrote:
> >
> > On 12/11/19 9:33 AM, SeongJae Park wrote:
> > > May I ask some comments?
> > >
> > >
> > > Thanks,
> > > SeongJae Park
> > >
> >
> > + Brendan
> >
> > > On Thu, 5 Dec 2019 10:34:34 +0100 SeongJae Park <sjpark@amazon.com> wrote:
> > >
> > >>
> > >> This patchset contains trivial fixes for the kunit documentations and
> > >> the wrapper python scripts.
> > >>
> > >> This patchset is based on 'kselftest/test' branch of linux-kselftest[1]
> > >> and depends on Heidi's patch[2].  A complete tree is available at my repo:
> > >> https://github.com/sjp38/linux/tree/kunit_fix/20191205_v5
> > >>
> > >> Changes from v4
> > >> (https://lore.kernel.org/linux-doc/1575490683-13015-1-git-send-email-sj38.park@gmail.com/):
> > >>   - Rebased on Heidi Fahim's patch[2]
> > >>   - Fix failing kunit_tool_test test
> > >>   - Add 'build_dir' option test in 'kunit_tool_test.py'
> > >>
> >
> > Please include Brendana Higgins on kunit patches.
>
> Not sure how I could forgot adding him.  I will never forget from next time.

No worries. I still got the email from the list :-)

I think I reviewed all the patches in this series; I just need to test
them. I will try to have that done later today or tomorrow.

Cheers!
