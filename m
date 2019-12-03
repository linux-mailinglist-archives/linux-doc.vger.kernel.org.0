Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA741103CB
	for <lists+linux-doc@lfdr.de>; Tue,  3 Dec 2019 18:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbfLCRpo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 3 Dec 2019 12:45:44 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:41597 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfLCRpo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Dec 2019 12:45:44 -0500
Received: by mail-pj1-f65.google.com with SMTP id ca19so1798116pjb.8
        for <linux-doc@vger.kernel.org>; Tue, 03 Dec 2019 09:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z7N6iQZ6w+KnK1x580YAK+IgWlbj+L7z26/RNYAhP3E=;
        b=QpxjuqLNn8DPHEmW8Mne7bHFbkHFrWcadhd3+9wt8gWJJIslzBTmim1TD5pOW0dvaA
         bC76EQ7govwprkNb75aGyD6KHY8ymXR5N5w6Caa7L8wSLQ8o6YSIh5c8qGyJKwLNR5rV
         6tCVzWrx/V9AD8Wf/hpe4/4M2sZYDEa5fP87n24haNU0l1cBwtmastId7QhfBbfz8tpB
         nWWGDUBjCE44/t64p3fJ3FPUQNbKUKjxqw+zdrcFFOL8bd+Lh7WxRAF0+EazzRUNLgF8
         4eSmnS+upC3AWrGrfZYAOw40jtAJYKZ0evSwDw4C01BQqyVmi2IWQBkkHsc/FPsTTzL+
         PB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z7N6iQZ6w+KnK1x580YAK+IgWlbj+L7z26/RNYAhP3E=;
        b=cYZ7jlSuXYy4bjxyIeHKXTDK5cPBvTwyRQ+g91kJnqY3vNJ7P7+H4wOWOvYUamTDnL
         xkQ1V+XRh+JTKCglpM74V+7cUkO1UMeuAgzLADgBkPKSkeR2IRysGlbcVRMoyNGgUW68
         ZxS23C6ChajoUuEmcqsidqZvlXfaM8KK5KAfhYBAeTaKmslEXSFRdlSPoHPEIkaU9M17
         fV5k2HCJazYNPGhkAskdsqbY2RHd7jHA8u/D0WvAv0gd12BSBg5G9Z5/+QoucpNhpZ4N
         Jk+JWbqafwMVbFhmYSxHaFN1z7sjIfMUtvIO/t3v6J9OgYqbyLa+nL3kIhsjJqmuXiGb
         0TtA==
X-Gm-Message-State: APjAAAUitIkN0AAp03eRm6PqH4+zFpu6pIYjH0O4alMPChIVgeeCBhgZ
        4YD4RIX5sptk7XFiHs6bVPOubxpaFwKs2gNBDK9kZQ==
X-Google-Smtp-Source: APXvYqykkKXbum3SSjV3LDPg92I2gZuwgqFvaKWHVvCaYAZ8GyCh+gaXA/1WQQhyvLYBi43QZL+p4VYGPLTqotMNZac=
X-Received: by 2002:a17:90a:ff12:: with SMTP id ce18mr4019224pjb.117.1575395143149;
 Tue, 03 Dec 2019 09:45:43 -0800 (PST)
MIME-Version: 1.0
References: <1575242724-4937-1-git-send-email-sj38.park@gmail.com>
 <20191203070025.GA4206@google.com> <CAEjAshraUy20gEEaff69=b11DhB7zbz8WHT=6wOuw6C2FyJwYA@mail.gmail.com>
 <CAEjAsho98ER1RQ6=++ECmoCJxw2mMrGqV4jAgW5wgfb8eEM9eQ@mail.gmail.com>
In-Reply-To: <CAEjAsho98ER1RQ6=++ECmoCJxw2mMrGqV4jAgW5wgfb8eEM9eQ@mail.gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 3 Dec 2019 09:45:31 -0800
Message-ID: <CAFd5g46qPPsKJFqs07Eiea0Nim=YDWbOUndJu=JbW--VcTb-ww@mail.gmail.com>
Subject: Re: [PATCH 0/6] Fix nits in the kunit
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 3, 2019 at 12:26 AM SeongJae Park <sj38.park@gmail.com> wrote:
>
> You're right, the error was due to the assumption of the existence of the
> build_dir.  The "kunit: Create default config in '--build_dir'" patch made the
> bug.  I fixed it in the second version patchset[1].
>
> [1] https://lore.kernel.org/linux-doc/1575361141-6806-1-git-send-email-sj38.park@gmail.com/

After trying your new patches, I am still getting the
"FileNotFoundError" when the given build_dir has not been created.

> Thanks,
> SeongJae Park
>
> On Tue, Dec 3, 2019 at 8:10 AM SeongJae Park <sj38.park@gmail.com> wrote:
> >
> > On Tue, Dec 3, 2019 at 8:00 AM Brendan Higgins
> > <brendanhiggins@google.com> wrote:
> > >
> > > On Mon, Dec 02, 2019 at 08:25:18AM +0900, SeongJae Park wrote:
> > > > From: SeongJae Park <sjpark@amazon.de>
> > > >
> > > > This patchset contains trivial fixes for the kunit documentations and the
> > > > wrapper python scripts.
> > > >
> > > > SeongJae Park (6):
> > > >   docs/kunit/start: Use in-tree 'kunit_defconfig'
> > > >   docs/kunit/start: Skip wrapper run command
> > > >   kunit: Remove duplicated defconfig creation
> > > >   kunit: Create default config in 'build_dir'
> > > >   kunit: Place 'test.log' under the 'build_dir'
> > > >   kunit: Rename 'kunitconfig' to '.kunitconfig'
> > > >
> > > >  Documentation/dev-tools/kunit/start.rst | 19 +++++--------------
> > > >  tools/testing/kunit/kunit.py            | 10 ++++++----
> > > >  tools/testing/kunit/kunit_kernel.py     |  6 +++---
> > > >  3 files changed, 14 insertions(+), 21 deletions(-)
> > >
> > > I applied your patchset to torvalds/master, ran the command:
> > >
> > > tools/testing/kunit/kunit.py run --timeout=60 --jobs=8 --defconfig --build_dir=.kunit
> > >
> > > and got the error:
> > >
> > > Traceback (most recent call last):
> > >   File "tools/testing/kunit/kunit.py", line 140, in <module>
> > >     main(sys.argv[1:])
> > >   File "tools/testing/kunit/kunit.py", line 123, in main
> > >     create_default_kunitconfig()
> > >   File "tools/testing/kunit/kunit.py", line 36, in create_default_kunitconfig
> > >     kunit_kernel.KUNITCONFIG_PATH)
> > >   File "/usr/lib/python3.7/shutil.py", line 121, in copyfile
> > >     with open(dst, 'wb') as fdst:
> > > FileNotFoundError: [Errno 2] No such file or directory: '.kunit/.kunitconfig'
> > >
> > > It seems that it expects the build_dir to already exist; however, I
> > > don't think this is clear from the error message. Would you mind
> > > addressing that here?
> >
> > Thank you for sharing this.  I will take a look!
> >
> >
> > Thanks,
> > SeongJae Park
> > >
> > > Cheers!
