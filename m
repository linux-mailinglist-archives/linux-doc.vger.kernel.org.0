Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8728E64AA54
	for <lists+linux-doc@lfdr.de>; Mon, 12 Dec 2022 23:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233804AbiLLWdV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 12 Dec 2022 17:33:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233795AbiLLWdU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Dec 2022 17:33:20 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85852E089
        for <linux-doc@vger.kernel.org>; Mon, 12 Dec 2022 14:33:18 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-3c090251d59so168019637b3.4
        for <linux-doc@vger.kernel.org>; Mon, 12 Dec 2022 14:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ERChCKAaEicV+ZSb2kKfofFWZiWQNAgNVRHikC/FBc=;
        b=JEF7vKSBUpOrRz7XuDm4rQuAb2tYmogjXU8xMAcLL2C296BZd1nENuGNYQDpK4masv
         CC97sal8aHp8CXapbo+jGLsgSywam0AuLsUi6GjWvBQZ2VWXnQ5LBTQnde56z4m6YHC5
         9cFNzo29mkpqcNu3Ay10Cvi/IJMzwj/FMe5SjceBB9c0AXd621u/hLjHsQ7TDaNGUhdI
         UXkdRDvCBnMYipi4K831lmkFyUPGUlTKWWeblZJNdSmPllD1OcoJ5X32VNOKPzGqNd6U
         Wpl18+UvUysC8EleX8F+CuWnXdO/oNz2Qq2/j7GFDWGi2p5/Lfz0LJQ7y8jMntDSRJN9
         C9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ERChCKAaEicV+ZSb2kKfofFWZiWQNAgNVRHikC/FBc=;
        b=k4zlQWSUb9UIBxmDKHmjmUOyXo3XNRVTy5a4EOX9ZUOjOb6e0TBq1S3vbL30N6seRq
         iNHIIRSvgNeSXr6exksiVIkPmCyzM8wsC+clt2zp7QLE7DZt1CINjorWvf/pm8eV57Va
         cGcodKNk6Dtrz/KnHQxFp9uP8zPz9O9wmEhPpckTC/aUXuJYMW3sAAJIhPDXzI/LPQ62
         EnLnXKewVArcuveN8ri9qy14bAhIE/2enBQBmkZzY3skut6vmW7r6m6HhJHKa6V+laaU
         Cw2DiLgp0oI+vy2LVhnySijSxZavIcs3pilOezJGcpBw+/3n+H+1oFE/SZZ/+waHMFfE
         ylNg==
X-Gm-Message-State: ANoB5pl7dDfPpCXF0bNX6JG0r9yDTbq8v3sFfhjOcSX4A1qjeuDbBV7i
        9LmQBGHxgZZES2VGot1TtS1RlIXsGnvwGSJOkjX7iA==
X-Google-Smtp-Source: AA0mqf4eSwTLWbjN9YZdzuxBeh8O84PRa9SeLFHXHMFwLI4edAQ/bNMCIE8Pinn9YkTHKdR0qMzP0lK7CJGXeq21szc=
X-Received: by 2002:a81:91d2:0:b0:370:4d2d:8edd with SMTP id
 i201-20020a8191d2000000b003704d2d8eddmr25999445ywg.120.1670884397514; Mon, 12
 Dec 2022 14:33:17 -0800 (PST)
MIME-Version: 1.0
References: <Y5T66yWNVAZNIaJ0@mail.google.com> <Y5UP+tnnxNgoi6A2@mail.google.com>
 <CAHVum0eOzd8MgP0FGObHWvqG_oPVoTmk_5gkEB0sAJK9JgCsFg@mail.gmail.com> <Y5ekQcJeoHd1i+Um@mail.google.com>
In-Reply-To: <Y5ekQcJeoHd1i+Um@mail.google.com>
From:   Vipin Sharma <vipinsh@google.com>
Date:   Mon, 12 Dec 2022 14:32:41 -0800
Message-ID: <CAHVum0fqOj9peepXdrAETTO3_qNX-B2qM41AnPdHMMgPNyrnKg@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/tags.sh: choose which directories to exclude
 from being indexed
To:     Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 12, 2022 at 1:59 PM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
>
> On Mon, Dec 12, 2022 at 01:27:37PM -0800, Vipin Sharma wrote:
> > On Sat, Dec 10, 2022 at 3:02 PM Paulo Miguel Almeida
> > <paulo.miguel.almeida.rodenas@gmail.com> wrote:
> > >  # find sources in rest of tree
> > > -# we could benefit from a list of dirs to search in here
> > >  find_other_sources()
> > >  {
> > > -       find ${tree}* $ignore \
> > > +       local loc_ignore=${ignore}
> > > +       if [ -n "${IGNOREDIRS}" ]; then
> > > +               exp_ignored_dirs=$(sed 's/,/ /g' <<< ${IGNOREDIRS})
> > > +               for i in ${exp_ignored_dirs}; do
> > > +                       loc_ignore="${loc_ignore} ( -path $i ) -prune -o"
> > > +               done
> > > +       fi
> > > +
> >
> > This should be global overwrite instead of just in this function.
> > Before find_other_sources() is executed, this script finds files in
> > arch directories. So, if you keep it local then those files cannot be
> > excluded which makes execution of the command incorrect:
> >
> > make IGNOREDIRS=arch/x86 cscope
> >
>
> Hi Vipin, thanks for taking the time to review this patch.
>
> I see where you are coming from. I was aware of the 'loophole' that the
> current approach could have but, to be honest, I thought that there
> would be very little use in being able to exclude arch/.*?/ files.
>
> The reason for that being that I thought the most common usage for this
> feature would be to ignore folders within subsystems like drivers and
> tools to ensure code navigation would be less 'messy'.

Yes, the original intent was to make driver code browsing less messy
but if we are introducing an option we should adapt it for generic
cases and correct the semantics.

>
> Additionally, if we go with the global IGNOREDIRS approach you just
> described, we could have some conflicting options too such as:
>
> make ALLSOURCE_ARCHS="x86 arm" IGNOREDIRS=arch/x86 cscope
>

I don't think this is conflicting, to me it is more complementary.
Above line shows get all code for x86 and arm but don't get x86 source
code ("arch/x86/include" is fine). This can even be fine tuned to sub
directories.

I just now noticed after seeing your command, ALLSOURCE_ARCHS take
space separated values, whereas, IGNOREDIRS take comma separated
values. They both should be in the same format, since ALLSOURCE_ARCHS
was already there, it is better to change IGNOREDIRS.

Can you also change IGNOREDIRS to IGNORE_DIRS? It is much easier to
read this way. Sorry, I should have said this in the  beginning.

> My 2 cents is that ALLSOURCE_ARCHS is already the mechanism for
> excluding archs so it's 'okay' to keep IGNOREDIRS as is.
>
> Let me know your thoughts.
>
> Thanks!
>
> - Paulo A.
>
> > Above command will still index all of the code in arch/x86. Something
> > like this will be better.
> >
> > --- a/scripts/tags.sh
> > +++ b/scripts/tags.sh
> > @@ -17,6 +17,13 @@ ignore="$(echo "$RCS_FIND_IGNORE" | sed 's|\\||g' )"
> >  # tags and cscope files should also ignore MODVERSION *.mod.c files
> >  ignore="$ignore ( -name *.mod.c ) -prune -o"
> >
> > +if [ -n "${IGNOREDIRS}" ]; then
> > +       exp_ignored_dirs=$(sed 's/,/ /g' <<< ${IGNOREDIRS})
> > +       for i in ${exp_ignored_dirs}; do
> > +               ignore="${ignore} ( -path $i ) -prune -o"
> > +       done
> > +fi
> > +
> >  # Use make KBUILD_ABS_SRCTREE=1 {tags|cscope}
> >  # to force full paths for a non-O= build
> >  if [ "${srctree}" = "." -o -z "${srctree}" ]; then
> > @@ -62,9 +69,9 @@ find_include_sources()
> >  # we could benefit from a list of dirs to search in here
> >  find_other_sources()
> >  {
> > -       find ${tree}* $ignore \
> > -            \( -path ${tree}include -o -path ${tree}arch -o -name
> > '.tmp_*' \) -prune -o \
> > -              -name "$1" -not -type l -print;
> > +       find ${tree}* ${ignore} \
> > +               \( -path ${tree}include -o -path ${tree}arch -o -name
> > '.tmp_*' \) -prune -o \
> > +               -name "$1" -not -type l -print;
> >  }
> >
> > We will still have to specify arch/x86 and arch/x86/include but this
> > works and keeps the definition of IGNOREDIRS relatively correct.
> >
> >
> > > +       find ${tree}* ${loc_ignore} \
> > >              \( -path ${tree}include -o -path ${tree}arch -o -name '.tmp_*' \) -prune -o \
> > >                -name "$1" -not -type l -print;
> > >  }
> > > --
> > > 2.38.1
> > >
