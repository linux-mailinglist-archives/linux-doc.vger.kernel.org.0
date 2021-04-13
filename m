Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7BD35E76D
	for <lists+linux-doc@lfdr.de>; Tue, 13 Apr 2021 22:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbhDMUKb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 13 Apr 2021 16:10:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232023AbhDMUKa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 16:10:30 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C041C061574
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 13:10:08 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id p16so4884966plf.12
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 13:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=bT1Jyj66FdCfJu1FlYtYups20jQTNM9EzOFbZ1NHvy8=;
        b=hi65XnjF+JQ24zVAQKgWhAwOtDOr1gBnA4cJf3KuTHhOJX5rx+qXIdbWXxCiOhthGZ
         CPvYaexH3FAuNAg13WF7T9ianDfTLkG6HHUOkHUdIDg9P88TWjhhoP1fk2buvgFW2+Ml
         ryl2sRos3Kkv9jLazUmsuDBP+EgNZ68AqHCvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=bT1Jyj66FdCfJu1FlYtYups20jQTNM9EzOFbZ1NHvy8=;
        b=Sgbv9DqmPtkPk8Mmyw9Ufj2nVZ+aSC1Yo0Cl2vct7PGUxtudJ92PfBvfCDmuwLeemb
         0yw7DztGIe4jasBNFzjGzZ4x+XDknV5WxTDn9w2zUBWC857ReAzOqn5px1U11lOTz5Ol
         qEvYgbxTRhnXjr88alEiWkXopSXKOb9YUmFg53h7dA42IXxTUcqxN1Drf96tv9yQ4WNe
         ILpqfBAah4tNyz4hVkOREIBuh6vHpUSAhybr2dcxmMvRNpj77Os3XF9GH+zK/PXvkQ6N
         0mwyuakjt5cin4IgEmgWuhCJt4zyaqvvBHwWuVJS3tb2fgKT/fMtUtMi8x5LEOUtpXdv
         KOSQ==
X-Gm-Message-State: AOAM531V3jo37OBxRikxCuRapBU6aS68qUt9SGOAsaASZldUqhwgh15l
        v3xYih75Eo5s4tzAHIL0jMz6gQ==
X-Google-Smtp-Source: ABdhPJxyVstLEvjuGnOSloBWW6OTIXXlv2UwiuWrJaglDT8b+OrdTcR3YSC9zx4Ya2qHLj11+p18/Q==
X-Received: by 2002:a17:902:8d98:b029:eb:43c2:d294 with SMTP id v24-20020a1709028d98b02900eb43c2d294mr1826968plo.49.1618344608043;
        Tue, 13 Apr 2021 13:10:08 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1d18:a339:7993:e548])
        by smtp.gmail.com with ESMTPSA id r5sm2870360pjd.38.2021.04.13.13.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 13:10:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YHW1xBvOeHrAHWkK@alley>
References: <20210410015300.3764485-1-swboyd@chromium.org> <20210410015300.3764485-6-swboyd@chromium.org> <YHQ1yqVkweZeN5+1@smile.fi.intel.com> <161825574550.3764895.4387100574176584209@swboyd.mtv.corp.google.com> <YHV4369VJAGpfW/c@smile.fi.intel.com> <YHW1xBvOeHrAHWkK@alley>
Subject: Re: [PATCH v4 05/13] module: Add printk formats to add module build ID to stacktraces
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Petr Mladek <pmladek@suse.com>
Date:   Tue, 13 Apr 2021 13:10:05 -0700
Message-ID: <161834460576.3764895.758141455860109099@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Petr Mladek (2021-04-13 08:16:20)
> On Tue 2021-04-13 13:56:31, Andy Shevchenko wrote:
> > On Mon, Apr 12, 2021 at 12:29:05PM -0700, Stephen Boyd wrote:
> > > Quoting Andy Shevchenko (2021-04-12 04:58:02)
> > > >=20
> > > > First of all, why not static_assert() defined near to the actual ma=
cro?
> > >=20
> > > Which macro? BUILD_ID_SIZE_MAX?
> >=20
> > Yes.
> >=20
> > > I tried static_assert() and it didn't
> > > work for me but maybe I missed something.
>=20
> I guess that you wanted to use it inside macro definition:
>=20
> #define VMCOREINFO_BUILD_ID(value) \
>         static_assert(ARRAY_SIZE(value) =3D=3D BUILD_ID_SIZE_MAX); \
>         vmcoreinfo_append_str("BUILD-ID=3D%20phN\n", value)
>=20
> Instead, you should do it outside the macro:
>=20
> static_assert(ARRAY_SIZE(value) =3D=3D BUILD_ID_SIZE_MAX);
> #define VMCOREINFO_BUILD_ID(value) \
>         vmcoreinfo_append_str("BUILD-ID=3D%20phN\n", value)

In this example "value" is not defined because it's an argument to the
macro. How can this work?

From what I can tell static_assert() is for the case that you want to
assert something at the global scope level. BUILD_BUG_ON() can't be used
at global scope. I see the usage is usually to assert struct members and
alignment of those members. In turn, static_assert() can't be used at
function level scope. Each has a use and in this case I want to assert
at function level scope to be as close as possible to the place that
would need to change.

>=20
> > Sounds weird. static_assert() is a good one. Check, for example, lib/vs=
printf.c
> > on how to use it.
> >=20
> > > Why is static_assert()
> > > preferred?
>=20
> I guess that it is because it is enough and more efficient for
> checks of constant values (no computation of the value).
>=20
> > Because it's cleaner way to achieve it and as a bonus it can be put out=
side of
> > the functions (be in the header or so).

Ok, but I'm still not sure what it would be enforcing. In this case we
need to have it near the sprintf line so that we know to fix the 20 in
there should it ever change to be larger. If it's defined next to the
BUILD_ID_SIZE_MAX macro then it does practically nothing to help future
developers know what to change.

> >=20
> > > > > +             if (IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID) && add_b=
uildid && buildid)
> > > > > +                     len +=3D sprintf(buffer + len, " %20phN", b=
uildid);
> > > >=20
> > > >                         len +=3D sprintf(buffer + len, " %*phN", BU=
ILD_ID_SIZE_MAX, buildid);
> > > >=20
> > >=20
> > > Are you suggesting to use sprintf format here so that the size is part
> > > of the printf? Sounds good to me. Thanks.
> >=20
> > I prefer %20phN when the size is carved in stone (for example by
> > specification), but if you are really expecting that it may be
> > changed in the future, use variadic approach as I showed above.
>=20
> I would consider this written in stone (last famous words ;-) and use
> %20phN with the static_assert().
>=20

Yes it is pretty much written in stone. The build ID can be an md5sum
instead of SHA1, and thus 16 bytes instead of 20 bytes for the 160-bit
SHA1 form. This is rare, and the code in buildid.c is padding it out
with zeroes in the case that the note is smaller than 20 bytes in
length. Within the kernel we can always assume the buffer is
BUILD_ID_SIZE_MAX. How about this patch?

----8<-----
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index 2174dab16ba9..042c9c034fba 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -39,7 +39,7 @@ phys_addr_t paddr_vmcoreinfo_note(void);
 #define VMCOREINFO_OSRELEASE(value) \
 	vmcoreinfo_append_str("OSRELEASE=3D%s\n", value)
 #define VMCOREINFO_BUILD_ID(value) \
-	BUILD_BUG_ON(ARRAY_SIZE(value) !=3D BUILD_ID_SIZE_MAX); \
+	BUILD_BUG_ON(ARRAY_SIZE(value) !=3D 20); \
 	vmcoreinfo_append_str("BUILD-ID=3D%20phN\n", value)
 #define VMCOREINFO_PAGESIZE(value) \
 	vmcoreinfo_append_str("PAGESIZE=3D%ld\n", value)
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index b835992e76c2..5d9c7ac80633 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -25,7 +25,10 @@
 #include <linux/filter.h>
 #include <linux/ftrace.h>
 #include <linux/kprobes.h>
+#include <linux/build_bug.h>
 #include <linux/compiler.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
=20
 /*
  * These will be re-linked against their real values
@@ -394,7 +397,7 @@ static int __sprint_symbol(char *buffer, unsigned long =
address,
 	if (modname) {
 		len +=3D sprintf(buffer + len, " [%s", modname);
 		/* build ID should match length of sprintf below */
-		BUILD_BUG_ON(BUILD_ID_SIZE_MAX !=3D 20);
+		BUILD_BUG_ON(sizeof(typeof_member(struct module, build_id)) !=3D 20);
 		if (IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID) && add_buildid && buildid)
 			len +=3D sprintf(buffer + len, " %20phN", buildid);
 		len +=3D sprintf(buffer + len, "]");
