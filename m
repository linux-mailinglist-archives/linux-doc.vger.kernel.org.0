Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8EAC29FC07
	for <lists+linux-doc@lfdr.de>; Fri, 30 Oct 2020 04:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgJ3DIN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Oct 2020 23:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgJ3DIM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Oct 2020 23:08:12 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 166ACC0613D2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 20:08:12 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id i6so6042857lfd.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 20:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zehjsoI4/E9mlHSzS3GihRUsNzlSRlM3AQ/tc2JFGWU=;
        b=q9NaR3BRuvTzXjW1tFWJC7ghaDMvWYJV4F/R/sfglQ1Do9mBfL2N70a3GMysG9ufy0
         u543bRU8Q+xerhl0QLubqtnupkWBP51hSdP6NGnIl1X+ZkNPyDykSBY9poLAPBpDjUaq
         0s/iVSYcxsg8yKonlY/PJPY/jry+VmI1lRRiHS3TdiNh6LhgQu6AH1HsJODK3KCF2zbN
         XVJIkv9q1FDLnxGo0lUOJKAN5HFGYiHMifoR0MiKuttOYdJ8iNLqqbr7jNQUtCT2HPv6
         PpvSh6aIPeBUKzLXaKv3qj2zy2CI2ktJbdFRW/aJd/vL4/1EkohKJVopAvgKPxXjiB09
         YJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zehjsoI4/E9mlHSzS3GihRUsNzlSRlM3AQ/tc2JFGWU=;
        b=mCAuZJRqlTlBW7JdkaskWHYog+Pzqw1tiYxJXFRv7St2jea73UJW3WyERvZMBDd+CE
         dKhuVDG2tQbQYcebpcbsM47D78FfIuYMVHMMOQ1KdUq0SkevrMmo3FsAd8nqkttIP1ZY
         Fu7GpWwydKt1DgnaF8zEInl405BYGiSoYQjpVTz7E0K1vpTQjHhP77eTy2rqQed040i7
         d1YlCKyUUtIBtVmbXpsqtXflkxQZZXrWPReTtjqhwo/3PMKgsiixMuGUkMn3kziVOfV1
         kbK/zCO7CVAIUZRosJbDNi7Pu+yg9VQdpbPlOaicJG9hu7+RFleUfMmr5GcPTtWlSIZb
         jCCA==
X-Gm-Message-State: AOAM5326RBd8z+uCmDaqXqSJ4YUUlhPnBuQiv2QLrFHyHu04UJlHvcAn
        CIazrZPqIvhpsy6JE9Mox5abXL/DrrFTXLdUJ4ke+w==
X-Google-Smtp-Source: ABdhPJwFhikEezi6cK75+Nh1jGpDUQvWygSxV/rVzK4JtvxTrHv+oYrN72yFW4FSMWmsrMzt7Jt48+wkeRxq1/Q08TY=
X-Received: by 2002:a19:e308:: with SMTP id a8mr30300lfh.573.1604027290187;
 Thu, 29 Oct 2020 20:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201027200358.557003-1-mic@digikod.net> <20201027200358.557003-9-mic@digikod.net>
 <CAG48ez1San538w=+He309vHg4pBSCvAf7e5xeHdqeOHA6qwitw@mail.gmail.com> <de287149-ff42-40ca-5bd1-f48969880a06@digikod.net>
In-Reply-To: <de287149-ff42-40ca-5bd1-f48969880a06@digikod.net>
From:   Jann Horn <jannh@google.com>
Date:   Fri, 30 Oct 2020 04:07:44 +0100
Message-ID: <CAG48ez1FQVkt78129WozBwFbVhAPyAr9oJAHFHAbbNxEBr9h1g@mail.gmail.com>
Subject: Re: [PATCH v22 08/12] landlock: Add syscall implementations
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>,
        Kees Cook <keescook@chromium.org>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andy Lutomirski <luto@amacapital.net>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Jeff Dike <jdike@addtoit.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Shuah Khan <shuah@kernel.org>,
        Vincent Dagonneau <vincent.dagonneau@ssi.gouv.fr>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        Linux API <linux-api@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 29, 2020 at 12:30 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>=
 wrote:
> On 29/10/2020 02:06, Jann Horn wrote:
> > On Tue, Oct 27, 2020 at 9:04 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.n=
et> wrote:
> >> These 3 system calls are designed to be used by unprivileged processes
> >> to sandbox themselves:
[...]
> >> +       /*
> >> +        * Similar checks as for seccomp(2), except that an -EPERM may=
 be
> >> +        * returned.
> >> +        */
> >> +       if (!task_no_new_privs(current)) {
> >> +               err =3D security_capable(current_cred(), current_user_=
ns(),
> >> +                               CAP_SYS_ADMIN, CAP_OPT_NOAUDIT);
> >
> > I think this should be ns_capable_noaudit(current_user_ns(), CAP_SYS_AD=
MIN)?
>
> Right. The main difference is that ns_capable*() set PF_SUPERPRIV in
> current->flags. I guess seccomp should use ns_capable_noaudit() as well?

Yeah. That seccomp code is from commit e2cfabdfd0756, with commit date
in April 2012, while ns_capable_noaudit() was introduced in commit
98f368e9e263, with commit date in June 2016; the seccomp code predates
the availability of that API.

Do you want to send a patch to Kees for that, or should I?
