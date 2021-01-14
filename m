Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F762F593C
	for <lists+linux-doc@lfdr.de>; Thu, 14 Jan 2021 04:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727728AbhANDWs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Jan 2021 22:22:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbhANDWq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 22:22:46 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7772EC0617A2
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 19:21:58 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id o19so6033219lfo.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 19:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vBKhWUt1LhGAbz4nnRDMUBnzWjuIyMjEZqvvewkWv1c=;
        b=NaIVV7JM8xDZ1C/WCKEpyacKuGqEWPxP6vpebXWTWTzzL1T6CKyVM2e5z2n7D/dkwY
         0shB76+ANbIpUlcIUeIlgXWuxwBl4Dyl25ILehT0lz0wm7yTqX9ZIbQXm/DJfYRSCTQq
         /sA0p0frlZZqD8gLu4OIEuYj/VZyM0tLnHmDr5eYJQShu0NvHJqDf+OBxKv13kzaAZYX
         BKPcpiI95E7gIXeB67td0Oc3RAzsdxKmv69JEPxyF4yL8cUJ9eCfNPAIO3k+pEHxYnVm
         SlUg67QRFzYrVnG54RRpwBYMbN+Hw0PAn/grXz5aewJztLd/C/Rs7zXzpbzCt6BKz28m
         3tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vBKhWUt1LhGAbz4nnRDMUBnzWjuIyMjEZqvvewkWv1c=;
        b=bNawxw1U2HT7EClyvVaW8thThEuRQNVk8yc46GexxGCkJpaZXtcIsMzJ8UMHhOrW2t
         aqP3XN/Sw26KNwM4bXGYA4MiUyGGSeBeBKEPI5fVwTVZPQ20/v0AagVtqyloN/nyfIHd
         qoG6J/C6PfO4xvsBkQGI+yXDZ1J/iXAuZATQwvAJAom0sQDe9NtXwUDBoKzSXMHJwIbB
         Jb5y4EM1n1QGpiN3eykBHJXNJnqFUvyuWY59aclqmNx+JmBbGbqLjyuPndeSj5o91wF8
         3FUG58xr73gDxS9rvK8fYp76G/G/2xOQy1n7glfdC5h6MKhozujDgGJamz4Q2W6m7eoB
         rscA==
X-Gm-Message-State: AOAM532ULNrQ9DnBxB/Z08cp2yzz7sUUzLTLPKjXjYpB96WCWmNh0j9Z
        JqmqNXVn7swiAs9GOx4r1KFr9FYeDXITFEqc7ETk7g==
X-Google-Smtp-Source: ABdhPJyC/YkIU5Vr2XJQiVDPrgVLFbaYhJ6+pm2t5TLIpN9FVFsVdXVKpsifVVwckoCM1Y2ngeh/f+jtPiuasry3Q0U=
X-Received: by 2002:a19:8053:: with SMTP id b80mr2516185lfd.74.1610594516694;
 Wed, 13 Jan 2021 19:21:56 -0800 (PST)
MIME-Version: 1.0
References: <20201209192839.1396820-1-mic@digikod.net> <20201209192839.1396820-12-mic@digikod.net>
In-Reply-To: <20201209192839.1396820-12-mic@digikod.net>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 14 Jan 2021 04:21:30 +0100
Message-ID: <CAG48ez2yQNvcCrmCCBZKy_cxoZzNgremxWMia1YHsgaj4edqrA@mail.gmail.com>
Subject: Re: [PATCH v26 11/12] samples/landlock: Add a sandbox manager example
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andy Lutomirski <luto@amacapital.net>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Jeff Dike <jdike@addtoit.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
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

On Wed, Dec 9, 2020 at 8:29 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> w=
rote:
> Add a basic sandbox tool to launch a command which can only access a
> whitelist of file hierarchies in a read-only or read-write way.

I have to admit that I didn't really look at this closely before
because it's just sample code... but I guess I should. You can add

Reviewed-by: Jann Horn <jannh@google.com>

if you fix the following nits:

[...]
> diff --git a/samples/Kconfig b/samples/Kconfig
[...]
> +config SAMPLE_LANDLOCK
> +       bool "Build Landlock sample code"
> +       depends on HEADERS_INSTALL
> +       help
> +         Build a simple Landlock sandbox manager able to launch a proces=
s
> +         restricted by a user-defined filesystem access control.

nit: s/filesystem access control/filesystem access control policy/

[...]
> diff --git a/samples/landlock/sandboxer.c b/samples/landlock/sandboxer.c
[...]
> +/*
> + * Simple Landlock sandbox manager able to launch a process restricted b=
y a
> + * user-defined filesystem access control.

nit: s/filesystem access control/filesystem access control policy/

[...]
> +int main(const int argc, char *const argv[], char *const *const envp)
> +{
[...]
> +       if (argc < 2) {
[...]
> +               fprintf(stderr, "* %s: list of paths allowed to be used i=
n a read-only way.\n",
> +                               ENV_FS_RO_NAME);
> +               fprintf(stderr, "* %s: list of paths allowed to be used i=
n a read-write way.\n",
> +                               ENV_FS_RO_NAME);

s/ENV_FS_RO_NAME/ENV_FS_RW_NAME/

> +               fprintf(stderr, "\nexample:\n"
> +                               "%s=3D\"/bin:/lib:/usr:/proc:/etc:/dev/ur=
andom\" "
> +                               "%s=3D\"/dev/null:/dev/full:/dev/zero:/de=
v/pts:/tmp\" "
> +                               "%s bash -i\n",
> +                               ENV_FS_RO_NAME, ENV_FS_RW_NAME, argv[0]);
> +               return 1;
> +       }
> +
> +       ruleset_fd =3D landlock_create_ruleset(&ruleset_attr, sizeof(rule=
set_attr), 0);
> +       if (ruleset_fd < 0) {
> +               perror("Failed to create a ruleset");
> +               switch (errno) {

(Just as a note: In theory perror() can change the value of errno, as
far as I know - so AFAIK you'd theoretically have to do something
like:

int errno_ =3D errno;
perror("...");
switch (errno_) {
 ...
}

I'll almost certainly work fine as-is in practice though.)
