Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2AC64C90F1
	for <lists+linux-doc@lfdr.de>; Tue,  1 Mar 2022 17:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234495AbiCAQzQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 1 Mar 2022 11:55:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232880AbiCAQzQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Mar 2022 11:55:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECE36321;
        Tue,  1 Mar 2022 08:54:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9ECEEB8184F;
        Tue,  1 Mar 2022 16:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740C1C340EE;
        Tue,  1 Mar 2022 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646153672;
        bh=9NZHNm5f//UknLBQJi8aC7uw9czFahxKr+dcDCmFUCE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DAkNpCOltDdkG4CouhQG0dgkdaSG+j0l1C23qUMaLCvWXveml1Bg7Um3AS0uTmR33
         Z6yOKIMrLwUHhvy7GfU7WOAEAtARrMJKtdVhHwmHcp7horUQosHtlsFQg5gqUan1XR
         d0UrTqoxcw3w/XKYLhEEWVhXQ7H8JYmTb7SDLzdNRBXWyJxPAlb+dnJgJnWL5npNeW
         63xbWytUOsFzaJrkFx9qyR2Ew31u64F7qX9wHQeu3E2JtobC2y8ZxWIiMP3vYgRqh9
         YRCHyXZxC8WdH460sGtTP9MnHQr6LhQQVgrUVnzWBfQKx4zeBp6yrIhS3qsDwpWV90
         YFYdZxrdVrO4w==
Date:   Tue, 1 Mar 2022 09:54:26 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Marco Elver <elver@google.com>,
        Jani Nikula <jani.nikula@intel.com>,
        David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] treewide: use -Wdeclaration-after-statement
Message-ID: <Yh5PwhYav2OOxnZV@dev-arch.archlinux-ax161>
References: <20220301145233.3689119-1-arnd@kernel.org>
 <20220301145233.3689119-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220301145233.3689119-2-arnd@kernel.org>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 01, 2022 at 03:52:32PM +0100, Arnd Bergmann wrote:
> From: Mark Rutland <mark.rutland@arm.com>
> 
> In a subsequent patch we'll move the kernel from using `-std=gnu89` to
> `-std=gnu11`, permitting the use of additional C11 features such as
> for-loop initial declarations.
> 
> One contentious aspect of C99 is that it permits mixed declarations and
> code, and for now at least, it seems preferable to enforce that
> declarations must come first.
> 
> These warnings were already disabled in the kernel itself, but not
> for KBUILD_USERCFLAGS or the compat VDSO on arch/arm64, which uses
> a separate set of CFLAGS.
> 
> This patch fixes an existing violation in modpost.c, which is not
> reported because of the missing flag in KBUILD_USERCFLAGS:
> 
> | scripts/mod/modpost.c: In function ‘match’:
> | scripts/mod/modpost.c:837:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
> |   837 |   const char *endp = p + strlen(p) - 1;
> |       |   ^~~~~
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> [arnd: don't add a duplicate flag to the default set, update changelog]
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Makefile                          | 3 ++-
>  arch/arm64/kernel/vdso32/Makefile | 1 +
>  scripts/mod/modpost.c             | 4 +++-
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 94fa9a849a7a..37ef6a555dcd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -432,7 +432,8 @@ HOSTCXX	= g++
>  endif
>  
>  export KBUILD_USERCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
> -			      -O2 -fomit-frame-pointer -std=gnu89
> +			    -O2 -fomit-frame-pointer -std=gnu89 \
> +			    -Wdeclaration-after-statement
>  export KBUILD_USERLDFLAGS :=
>  
>  KBUILD_HOSTCFLAGS   := $(KBUILD_USERCFLAGS) $(HOST_LFS_CFLAGS) $(HOSTCFLAGS)
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index 9378ea055bf2..ed181bedbffc 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -68,6 +68,7 @@ VDSO_CFLAGS += -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>                 -fno-strict-aliasing -fno-common \
>                 -Werror-implicit-function-declaration \
>                 -Wno-format-security \
> +               -Wdeclaration-after-statement \
>                 -std=gnu11
>  VDSO_CFLAGS  += -O2
>  # Some useful compiler-dependent flags from top-level Makefile
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 6bfa33217914..fe693304b120 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -833,8 +833,10 @@ static int match(const char *sym, const char * const pat[])
>  {
>  	const char *p;
>  	while (*pat) {
> +		const char *endp;
> +
>  		p = *pat++;
> -		const char *endp = p + strlen(p) - 1;
> +		endp = p + strlen(p) - 1;
>  
>  		/* "*foo*" */
>  		if (*p == '*' && *endp == '*') {
> -- 
> 2.29.2
> 
> 
