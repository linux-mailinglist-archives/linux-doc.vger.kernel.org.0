Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 899984C96F9
	for <lists+linux-doc@lfdr.de>; Tue,  1 Mar 2022 21:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbiCAUcj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Mar 2022 15:32:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238267AbiCAUbx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Mar 2022 15:31:53 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3600BB12E7
        for <linux-doc@vger.kernel.org>; Tue,  1 Mar 2022 12:28:54 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id u11so23446644lju.4
        for <linux-doc@vger.kernel.org>; Tue, 01 Mar 2022 12:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xd7zhNWTAbsjcup8ovj0bhbEUHVo9VN2YG5iXSmKuGY=;
        b=AXUNohphNBaqg4Ym0QvnB7ovOxC0qHBwQQTkvDU09LsSmaqliomVWRZBWSH9rA/NdX
         mggO8k84CHtaDmY5vc6klMZugRCimckzfjt5ruN87TRJQCG97xdfs7M+rGBCx/iITiho
         m3WSdHrV71StH8wJGQD2H6zmXpefAi4NA1HM50JkQz1wBh8FPbo2JL0PJbfCiWj+flF5
         VPizIjc+dyyhgd2d0QTocmiEr7TKxUjrxGCsDGzMcimHkmBPd+NZjW2RI4B879m3tzhe
         7OsVy6+c5Q5sdBrzGsalxEeXKu7lIv3BuaHd0Vn77MJW4nH68YFqeea7l79i24g7mXhe
         HpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xd7zhNWTAbsjcup8ovj0bhbEUHVo9VN2YG5iXSmKuGY=;
        b=zuoczsBjjnEIiX4VZzGGxX6Q1hxxzWaiqrYaOWISSOWo2aqqfCw3BYXNICguWwwlc3
         cImcJwmiKfWDqloodiR6LfFop5T+UTZ7LSqL5/qNxm11LgAo2bEERwGYGLe9BegxG4im
         0Xf1Uour6EC3lQMNnc2gLOiPOxBtvQShbcAOLEvOiADY6mEDjetZyFTRBE1/HwicQxp1
         lBRcNdV3YVlJaNP5dpWEoTDnWNndZQfXNu3zDQGDCepkikEhUCpr5cgJeNGiv6Y4whAW
         Grer/eif3x/F5BDeJ+TW5+XuDPLAIuvnDG76SINbBjub6D53rAOI6owq7wN1NLn7ouv0
         RI/w==
X-Gm-Message-State: AOAM5326VrYVVrzKJUgF+FvUdngWmlfM5OUOz6EcRKBJYoFYnJF3/v0g
        qap73zkwc0aC7oYyttMEbJjsCmd8EFwLRXjjmK7DvQ==
X-Google-Smtp-Source: ABdhPJz45aoPYRnC0P6aRihQR7uE1J/WWQWC3IT9GukIQheAZ9K3oSg9y9PHLUJG3F+nspjRI+QY5wqfA1AwR9GjK5Q=
X-Received: by 2002:a05:651c:1542:b0:233:8ff5:eb80 with SMTP id
 y2-20020a05651c154200b002338ff5eb80mr18018505ljp.352.1646166529822; Tue, 01
 Mar 2022 12:28:49 -0800 (PST)
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-2-arnd@kernel.org>
 <CAKwvOdnkfuT_w_0RNCb+WTKJ+282zLKmhB9UNG=D-UFz9VkUng@mail.gmail.com>
 <CAKwvOdn-PrCUPe2WzLv18AH3=9DjtFES+r=M1DhoQivy8sHm-g@mail.gmail.com> <CAHk-=wh4OdQANe7TLYGdPWUub0MEdbGDr72wpATHxypaSEGAyg@mail.gmail.com>
In-Reply-To: <CAHk-=wh4OdQANe7TLYGdPWUub0MEdbGDr72wpATHxypaSEGAyg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 1 Mar 2022 12:28:38 -0800
Message-ID: <CAKwvOd=TpqiSSh3yqQ2Z44nJArBACvfohVCgd6Ej32rGQMvShA@mail.gmail.com>
Subject: Re: [PATCH 2/3] treewide: use -Wdeclaration-after-statement
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Marco Elver <elver@google.com>,
        Jani Nikula <jani.nikula@intel.com>,
        David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-18.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 1, 2022 at 12:20 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Mar 1, 2022 at 12:06 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > That said, there's a few additional places that reset KBUILD_CFLAGS.
>
> Yeah, the boot code and vdso code often sets its own private flags,
> because it's _so_ different.
>
> The generic kernel CFLAGS often don't work at all, because that code
> may be doing some truly horrendous things.
>
> So I agree that this may not catch all the kernel code, but I don't
> think it's much of a problem.

Agreed; they can still mirror the style imposed by
-Wdeclaration-after-statement like the rest of the codebase though.
-- 
Thanks,
~Nick Desaulniers
