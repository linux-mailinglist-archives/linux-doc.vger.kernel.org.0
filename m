Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A76FC64AD6B
	for <lists+linux-doc@lfdr.de>; Tue, 13 Dec 2022 03:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbiLMCEC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 12 Dec 2022 21:04:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234113AbiLMCEB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Dec 2022 21:04:01 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC671B1F0;
        Mon, 12 Dec 2022 18:03:53 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id s196so9497380pgs.3;
        Mon, 12 Dec 2022 18:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=13l+GAcYpGztlBUQlibYZJJu+N68RuXQ0jlYBQoMmJs=;
        b=C7e8fTgkcHmuTrZQ/8Hm+970UEm9w0GwiZQGb4P0t3TPyHs6BpkM19PxJKevgaBLH9
         ecc6OZuZK31MBIapt3Lx9Doc/1/2Zvy3Sv4RNgX6VByVPmrOtG/+Ga1wvjrYg7Bg+aJU
         hBgAyMCEUrE77NMwofmYJhE+QZY8Sc2s5pf4BPUzxW6e00/RwCGXDej3FJWD8AG8SnJg
         KgKJF3uN6Ged36LgIu81WCnrak4VYiMRSiCowJctYqviIDtOoOciCV/KMx1uoZlsH3dv
         SRltgj/hC3dEGy/mcMZI0/LZcodQBnxbZfBAOgdy29UtCfFQTiPlpzjq8xKdCA8vgA0g
         jGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13l+GAcYpGztlBUQlibYZJJu+N68RuXQ0jlYBQoMmJs=;
        b=Hw/FI9Lzhh/tcVzuBY/BOtHhmZtNozv4LX/5cjmR32BNtqKPGCnzP3/WLSkHvvH8i4
         G9V+BV9Xpm9CFcQFayYdxsKNLPwsGMMowZWjKsFi2RkwmfbAUZfKOPcECiSIgVy47M0d
         3y83xVchTfSgUda69NBKiJKrA5pslpKrnDyoB1v4Tmst4nxz2fc5PDbXsthbZmexidIV
         aM4yeYjx9nJECiTvTlOx2fSLTlSmEpe/qGlhUKMuzqoft2TCG/YfJodSoFdSWflhw9Gr
         pU4+eoAOABGMaFnJ8z2dt003kvr2r9LC95Xs2RVK9EaHkW24bAER92P/9NUOcJON+j7L
         j+1g==
X-Gm-Message-State: ANoB5pl4WybH6nwLaLS78TKvueFZXccSSHDQnc2+I8N/1nVNb72Yr/tC
        MyG7obTaM7fTf0toXPZ0vLc=
X-Google-Smtp-Source: AA0mqf6TOA5Zv73oVP0Hyc/ykYBfNk8zTqgxjnqSQOAaaS39735qjuxncWfCwWmiPm9kAsblFyF7zA==
X-Received: by 2002:a62:fb14:0:b0:574:2b95:6f41 with SMTP id x20-20020a62fb14000000b005742b956f41mr3757325pfm.1.1670897033202;
        Mon, 12 Dec 2022 18:03:53 -0800 (PST)
Received: from mail.google.com ([103.229.249.253])
        by smtp.gmail.com with ESMTPSA id x28-20020aa78f1c000000b0056bc5ad4862sm6476212pfr.28.2022.12.12.18.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 18:03:52 -0800 (PST)
Date:   Tue, 13 Dec 2022 15:03:44 +1300
From:   Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To:     Vipin Sharma <vipinsh@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scripts/tags.sh: choose which directories to exclude
 from being indexed
Message-ID: <Y5fdgI4uTpXZQ9yn@mail.google.com>
References: <Y5T66yWNVAZNIaJ0@mail.google.com>
 <Y5UP+tnnxNgoi6A2@mail.google.com>
 <CAHVum0eOzd8MgP0FGObHWvqG_oPVoTmk_5gkEB0sAJK9JgCsFg@mail.gmail.com>
 <Y5ekQcJeoHd1i+Um@mail.google.com>
 <CAHVum0fqOj9peepXdrAETTO3_qNX-B2qM41AnPdHMMgPNyrnKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHVum0fqOj9peepXdrAETTO3_qNX-B2qM41AnPdHMMgPNyrnKg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 12, 2022 at 02:32:41PM -0800, Vipin Sharma wrote:
> On Mon, Dec 12, 2022 at 1:59 PM Paulo Miguel Almeida
> <paulo.miguel.almeida.rodenas@gmail.com> wrote:
> >
> > On Mon, Dec 12, 2022 at 01:27:37PM -0800, Vipin Sharma wrote:
> > > On Sat, Dec 10, 2022 at 3:02 PM Paulo Miguel Almeida
> > > <paulo.miguel.almeida.rodenas@gmail.com> wrote:
> > > >  # find sources in rest of tree
> > > > -# we could benefit from a list of dirs to search in here
> > > >  find_other_sources()
> > > >  {
> > > > -       find ${tree}* $ignore \
> > > > +       local loc_ignore=${ignore}
> > > > +       if [ -n "${IGNOREDIRS}" ]; then
> > > > +               exp_ignored_dirs=$(sed 's/,/ /g' <<< ${IGNOREDIRS})
> > > > +               for i in ${exp_ignored_dirs}; do
> > > > +                       loc_ignore="${loc_ignore} ( -path $i ) -prune -o"
> > > > +               done
> > > > +       fi
> > > > +
> > >
> > > This should be global overwrite instead of just in this function.
> > > Before find_other_sources() is executed, this script finds files in
> > > arch directories. So, if you keep it local then those files cannot be
> > > excluded which makes execution of the command incorrect:
> > >
> > > make IGNOREDIRS=arch/x86 cscope
> > >
> >
> > Hi Vipin, thanks for taking the time to review this patch.
> >
> > I see where you are coming from. I was aware of the 'loophole' that the
> > current approach could have but, to be honest, I thought that there
> > would be very little use in being able to exclude arch/.*?/ files.
> >
> > The reason for that being that I thought the most common usage for this
> > feature would be to ignore folders within subsystems like drivers and
> > tools to ensure code navigation would be less 'messy'.
> 
> Yes, the original intent was to make driver code browsing less messy
> but if we are introducing an option we should adapt it for generic
> cases and correct the semantics.

Agreed.

> 
> >
> > Additionally, if we go with the global IGNOREDIRS approach you just
> > described, we could have some conflicting options too such as:
> >
> > make ALLSOURCE_ARCHS="x86 arm" IGNOREDIRS=arch/x86 cscope
> >
> 
> I don't think this is conflicting, to me it is more complementary.
> Above line shows get all code for x86 and arm but don't get x86 source
> code ("arch/x86/include" is fine). This can even be fine tuned to sub
> directories.
> 

That's a fair point. I had not thought about it that way. Thanks!

Will implement the changes when I get home.

> I just now noticed after seeing your command, ALLSOURCE_ARCHS take
> space separated values, whereas, IGNOREDIRS take comma separated
> values. They both should be in the same format, since ALLSOURCE_ARCHS
> was already there, it is better to change IGNOREDIRS.
> 
> Can you also change IGNOREDIRS to IGNORE_DIRS? It is much easier to
> read this way. Sorry, I should have said this in the  beginning.
> 

Yep, no problem! :-)

> > My 2 cents is that ALLSOURCE_ARCHS is already the mechanism for
> > excluding archs so it's 'okay' to keep IGNOREDIRS as is.
> >
> > Let me know your thoughts.
> >
> > Thanks!
> >
> > - Paulo A.
> >
> > > Above command will still index all of the code in arch/x86. Something
> > > like this will be better.
> > >
> > > --- a/scripts/tags.sh
> > > +++ b/scripts/tags.sh
> > > @@ -17,6 +17,13 @@ ignore="$(echo "$RCS_FIND_IGNORE" | sed 's|\\||g' )"
> > >  # tags and cscope files should also ignore MODVERSION *.mod.c files
> > >  ignore="$ignore ( -name *.mod.c ) -prune -o"
> > >
> > > +if [ -n "${IGNOREDIRS}" ]; then
> > > +       exp_ignored_dirs=$(sed 's/,/ /g' <<< ${IGNOREDIRS})
> > > +       for i in ${exp_ignored_dirs}; do
> > > +               ignore="${ignore} ( -path $i ) -prune -o"
> > > +       done
> > > +fi
> > > +
> > >  # Use make KBUILD_ABS_SRCTREE=1 {tags|cscope}
> > >  # to force full paths for a non-O= build
> > >  if [ "${srctree}" = "." -o -z "${srctree}" ]; then
> > > @@ -62,9 +69,9 @@ find_include_sources()
> > >  # we could benefit from a list of dirs to search in here
> > >  find_other_sources()
> > >  {
> > > -       find ${tree}* $ignore \
> > > -            \( -path ${tree}include -o -path ${tree}arch -o -name
> > > '.tmp_*' \) -prune -o \
> > > -              -name "$1" -not -type l -print;
> > > +       find ${tree}* ${ignore} \
> > > +               \( -path ${tree}include -o -path ${tree}arch -o -name
> > > '.tmp_*' \) -prune -o \
> > > +               -name "$1" -not -type l -print;
> > >  }
> > >
> > > We will still have to specify arch/x86 and arch/x86/include but this
> > > works and keeps the definition of IGNOREDIRS relatively correct.
> > >
> > >
> > > > +       find ${tree}* ${loc_ignore} \
> > > >              \( -path ${tree}include -o -path ${tree}arch -o -name '.tmp_*' \) -prune -o \
> > > >                -name "$1" -not -type l -print;
> > > >  }
> > > > --
> > > > 2.38.1
> > > >
