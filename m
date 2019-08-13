Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 147188AE94
	for <lists+linux-doc@lfdr.de>; Tue, 13 Aug 2019 07:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfHMFJj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 13 Aug 2019 01:09:39 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40339 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfHMFJj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Aug 2019 01:09:39 -0400
Received: by mail-pf1-f193.google.com with SMTP id p184so50888747pfp.7
        for <linux-doc@vger.kernel.org>; Mon, 12 Aug 2019 22:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uLkfmiy/QyxG+42Kpd1Hh2gG09JBSRi1kuJ0irEOT+Q=;
        b=blOJdc2kt55ZqQDvPUZbAMrG0e9V6Lpz+glDC3wqeZ0WFkpdzH+BHVuWLKpOnhb42G
         g/4gIqAUYUWwrSZVnoWlA0+3BTuFFHTn4QIkPhZ/yY/qHdFseTm5A1T8f5E1IwOIGPkQ
         NjL2X3JkoAgV9wX66vJ01slCy0p6rnZ7bkyjxanoLsFcwNNC9ezGHFtGPQthuBsXEPdD
         Vzi/25vZpUBOV4gIKVVTs3IY9Dq9AiSUtfWFy0iWSPQYG787ViekPjFY+1C9grp4yxiQ
         WMAj2QOcebo3fC3yliGOOPA8v9/MAYuJN9q8LYDdlO8ROvEqJbK4dyCfU63RlOwjE9t3
         XXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uLkfmiy/QyxG+42Kpd1Hh2gG09JBSRi1kuJ0irEOT+Q=;
        b=cD+/WBpc5wXti/y99R+cu3o1dtt73UhmlegWiI4iV6LOa9UJ1X8hmPQAjmRAQq3b7K
         a8iU99H4w/0Wrh0uMULvEMkuRTlAvMLNUTlugqtoUZ1lE2eMywntrbaffTn7WbCImaQI
         UMPyPjwA3XmWn1OSBi2OBc791LgXd6VluSGfQR8dwHy28MLB3rG8vcw9GXbhCJASByEW
         KNjOPIME5wi50n960LXeejxYwRWRwpD4L6Epr8tlTcZ4ahyRYwfBYJVQG3AP2Ac34Hu1
         Ltt7lCQOAEnY7M6cXOuSzzcYGuEUbbGPHONdegVJMkwKaNH8Mb3hZ+9m8m+h4bRBfmJw
         dpXA==
X-Gm-Message-State: APjAAAWRfY8r19RpQqdT8Cb9bfbABZ2iZ9OYBYSmrWLqBdz//hxNfBFX
        SjCGDCXpGOTQLOIwUxqMki4S4SzrybaVJKXS8jPcGw==
X-Google-Smtp-Source: APXvYqwuRvdkQRBufOH1je8RsECuoe8PsScuGBBjY118Ufh882DHOjHaTVKhOCRIYEV6VNsZUpt68lWBTKVfNRYZXa8=
X-Received: by 2002:a17:90a:c391:: with SMTP id h17mr524990pjt.131.1565672978100;
 Mon, 12 Aug 2019 22:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-12-brendanhiggins@google.com> <20190813045510.C1D6E206C2@mail.kernel.org>
In-Reply-To: <20190813045510.C1D6E206C2@mail.kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 12 Aug 2019 22:09:26 -0700
Message-ID: <CAFd5g47jrUd+ES4AaWsLDRCfsGiKDB-rOP6TR-NdymCeVAK3Kg@mail.gmail.com>
Subject: Re: [PATCH v12 11/18] kunit: test: add the concept of assertions
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Herring <robh@kernel.org>, shuah <shuah@kernel.org>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        devicetree <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kunit-dev@googlegroups.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-um@lists.infradead.org,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        "Bird, Timothy" <Tim.Bird@sony.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Lawall <julia.lawall@lip6.fr>,
        Kevin Hilman <khilman@baylibre.com>,
        Knut Omang <knut.omang@oracle.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Petr Mladek <pmladek@suse.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Richard Weinberger <richard@nod.at>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 12, 2019 at 9:55 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Brendan Higgins (2019-08-12 11:24:14)
> > Add support for assertions which are like expectations except the test
> > terminates if the assertion is not satisfied.
> >
> > The idea with assertions is that you use them to state all the
> > preconditions for your test. Logically speaking, these are the premises
> > of the test case, so if a premise isn't true, there is no point in
> > continuing the test case because there are no conclusions that can be
> > drawn without the premises. Whereas, the expectation is the thing you
> > are trying to prove. It is not used universally in x-unit style test
> > frameworks, but I really like it as a convention.  You could still
> > express the idea of a premise using the above idiom, but I think
> > KUNIT_ASSERT_* states the intended idea perfectly.
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>
> > + * Sets an expectation that the values that @left and @right evaluate to are
> > + * not equal. This is semantically equivalent to
> > + * KUNIT_ASSERT_TRUE(@test, strcmp((@left), (@right))). See KUNIT_ASSERT_TRUE()
> > + * for more information.
> > + */
> > +#define KUNIT_ASSERT_STRNEQ(test, left, right)                                \
> > +               KUNIT_BINARY_STR_NE_ASSERTION(test,                            \
> > +                                             KUNIT_ASSERTION,                 \
> > +                                             left,                            \
> > +                                             right)
> > +
> > +#define KUNIT_ASSERT_STRNEQ_MSG(test, left, right, fmt, ...)                  \
> > +               KUNIT_BINARY_STR_NE_MSG_ASSERTION(test,                        \
> > +                                                 KUNIT_ASSERTION,             \
> > +                                                 left,                        \
> > +                                                 right,                       \
> > +                                                 fmt,                         \
>
> Same question about tabbing too.

Yep. WIll fix.

> > diff --git a/kunit/test-test.c b/kunit/test-test.c
> > index 88f4cdf03db2a..058f3fb37458a 100644
> > --- a/kunit/test-test.c
> > +++ b/kunit/test-test.c
> > @@ -78,11 +78,13 @@ static int kunit_try_catch_test_init(struct kunit *test)
> >         struct kunit_try_catch_test_context *ctx;
> >
> >         ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> > +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
>
> Ah ok. Question still stands if kunit_kzalloc() should just have the
> assertion on failure.

Right. In the previous patch KUNIT_ASSERT_* doesn't exist yet, so I
can't use it. And rather than fall back to return -ENOMEM like I
should have, I evidently forgot to do that.

> >         test->priv = ctx;
> >
> >         ctx->try_catch = kunit_kmalloc(test,
> >                                        sizeof(*ctx->try_catch),
> >                                        GFP_KERNEL);
> > +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->try_catch);
> >
