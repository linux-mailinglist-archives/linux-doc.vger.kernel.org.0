Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89F32514301
	for <lists+linux-doc@lfdr.de>; Fri, 29 Apr 2022 09:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345628AbiD2HMb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 29 Apr 2022 03:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232023AbiD2HM3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Apr 2022 03:12:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54098BF958;
        Fri, 29 Apr 2022 00:09:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E452861FAC;
        Fri, 29 Apr 2022 07:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2F5C385A7;
        Fri, 29 Apr 2022 07:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1651216151;
        bh=pPnNA7l+RPM/P9eQGjg00BuTyqTQsPsqQezFfVprvwo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zV/Ee37rg7nWJC6Gzw0dbhxcCqPFx7CIi0FPv8U8J/QH5RIlLqvhRitsSrxPPxkAt
         H+xZ8whaRKX/4IaX7ua4ADZQkmlPWxyWMK3cC1JGZZs2wpapFl+TSC+etpK4hapghA
         HkRQMn42GSiZwHQAWGBqNnhQgZZYCgk7S8gEov4M=
Date:   Fri, 29 Apr 2022 09:09:08 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     David Gow <davidgow@google.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        John Ogness <john.ogness@linutronix.de>,
        Joe Fradley <joefradley@google.com>,
        Daniel Latypov <dlatypov@google.com>,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kunit: Taint kernel if any tests run
Message-ID: <YmuPFGrkzQYACgK0@kroah.com>
References: <20220429043913.626647-1-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429043913.626647-1-davidgow@google.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 29, 2022 at 12:39:14PM +0800, David Gow wrote:
> KUnit tests are not supposed to run on production systems: they may do
> deliberately illegal things to trigger errors, and have security
> implications (assertions will often deliberately leak kernel addresses).
> 
> Add a new taint type, TAINT_KUNIT to signal that a KUnit test has been
> run. This will be printed as 'N' (for kuNit, as K, U and T were already
> taken).
> 
> This should discourage people from running KUnit tests on production
> systems, and to make it easier to tell if tests have been run
> accidentally (by loading the wrong configuration, etc.)
> 
> Signed-off-by: David Gow <davidgow@google.com>
> ---
> 
> This is something I'd been thinking about for a while, and it came up
> again, so I'm finally giving it a go.
> 
> Two notes:
> - I decided to add a new type of taint, as none of the existing ones
>   really seemed to fit. We could live with considering KUnit tests as
>   TAINT_WARN or TAINT_CRAP or something otherwise, but neither are quite
>   right.
> - The taint_flags table gives a couple of checkpatch.pl errors around
>   bracket placement. I've kept the new entry consistent with what's
>   there rather than reformatting the whole table, but be prepared for
>   complaints about spaces.
> 
> Thoughts?
> -- David
> 
> ---
>  Documentation/admin-guide/tainted-kernels.rst | 1 +
>  include/linux/panic.h                         | 3 ++-
>  kernel/panic.c                                | 1 +
>  lib/kunit/test.c                              | 4 ++++
>  4 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
> index ceeed7b0798d..8f18fc4659d4 100644
> --- a/Documentation/admin-guide/tainted-kernels.rst
> +++ b/Documentation/admin-guide/tainted-kernels.rst
> @@ -100,6 +100,7 @@ Bit  Log  Number  Reason that got the kernel tainted
>   15  _/K   32768  kernel has been live patched
>   16  _/X   65536  auxiliary taint, defined for and used by distros
>   17  _/T  131072  kernel was built with the struct randomization plugin
> + 18  _/N  262144  a KUnit test has been run
>  ===  ===  ======  ========================================================
>  
>  Note: The character ``_`` is representing a blank in this table to make reading
> diff --git a/include/linux/panic.h b/include/linux/panic.h
> index f5844908a089..1d316c26bf27 100644
> --- a/include/linux/panic.h
> +++ b/include/linux/panic.h
> @@ -74,7 +74,8 @@ static inline void set_arch_panic_timeout(int timeout, int arch_default_timeout)
>  #define TAINT_LIVEPATCH			15
>  #define TAINT_AUX			16
>  #define TAINT_RANDSTRUCT		17
> -#define TAINT_FLAGS_COUNT		18
> +#define TAINT_KUNIT			18
> +#define TAINT_FLAGS_COUNT		19
>  #define TAINT_FLAGS_MAX			((1UL << TAINT_FLAGS_COUNT) - 1)
>  
>  struct taint_flag {
> diff --git a/kernel/panic.c b/kernel/panic.c
> index eb4dfb932c85..b24ca63ed738 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -404,6 +404,7 @@ const struct taint_flag taint_flags[TAINT_FLAGS_COUNT] = {
>  	[ TAINT_LIVEPATCH ]		= { 'K', ' ', true },
>  	[ TAINT_AUX ]			= { 'X', ' ', true },
>  	[ TAINT_RANDSTRUCT ]		= { 'T', ' ', true },
> +	[ TAINT_KUNIT ]			= { 'N', ' ', false },

As kunit tests can be in modules, shouldn't this be "true" here?

Overall, I like it, makes sense to me.  The "N" will take some getting
used to, and I have no idea why "T" was for "struct randomization", that
would have allowed you to use "T" instead.  Oh well.

thanks,

greg k-h
