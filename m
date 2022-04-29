Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3FF5514800
	for <lists+linux-doc@lfdr.de>; Fri, 29 Apr 2022 13:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358263AbiD2L1s (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 29 Apr 2022 07:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345528AbiD2L1r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Apr 2022 07:27:47 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD5632ECF;
        Fri, 29 Apr 2022 04:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651231469; x=1682767469;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=lb5yLVgnVmkYIIVoioX0WLdSXH8dIeW5esUM9LN0+Yw=;
  b=JtFmQrsSBvjGoMstEdpTgLP8vLj4ghxj61X0Sg9bTsXUp21izRTEzKQG
   Y6zVur5olhoKo1TswzYpCusMf1aKNE6PoQusgsNn/QX7NERlzFJoUu4k/
   7XD/8bf/TrXbV92ukwW4ingwZ+YesOkj8K7gEn6h7MP1joHVeuuoAqTeM
   X7/Rv5e/jIlFguNGiLLVflB+WI0qUxXsvydbQtAdNQru3LFYbNmXpXsCr
   ysgcPGY27SpCxC4YOfQr5AfMsw49B4tCxgE4VfQS8ubCjU8++rNnR1X8P
   Jvxg1IfQ/KdBmO3+uzKWD8eZr1a73mKG9/xX20NE+FCsslVW2RJE5c6ja
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="266144752"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; 
   d="scan'208";a="266144752"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2022 04:21:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; 
   d="scan'208";a="534437328"
Received: from agerasym-mobl.ger.corp.intel.com (HELO localhost) ([10.249.133.25])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2022 04:21:29 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        David Gow <davidgow@google.com>
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
In-Reply-To: <YmuPFGrkzQYACgK0@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220429043913.626647-1-davidgow@google.com>
 <YmuPFGrkzQYACgK0@kroah.com>
Date:   Fri, 29 Apr 2022 14:21:26 +0300
Message-ID: <87tuacrv7t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 29 Apr 2022, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Fri, Apr 29, 2022 at 12:39:14PM +0800, David Gow wrote:
>> KUnit tests are not supposed to run on production systems: they may do
>> deliberately illegal things to trigger errors, and have security
>> implications (assertions will often deliberately leak kernel addresses).
>> 
>> Add a new taint type, TAINT_KUNIT to signal that a KUnit test has been
>> run. This will be printed as 'N' (for kuNit, as K, U and T were already
>> taken).
>> 
>> This should discourage people from running KUnit tests on production
>> systems, and to make it easier to tell if tests have been run
>> accidentally (by loading the wrong configuration, etc.)
>> 
>> Signed-off-by: David Gow <davidgow@google.com>
>> ---
>> 
>> This is something I'd been thinking about for a while, and it came up
>> again, so I'm finally giving it a go.
>> 
>> Two notes:
>> - I decided to add a new type of taint, as none of the existing ones
>>   really seemed to fit. We could live with considering KUnit tests as
>>   TAINT_WARN or TAINT_CRAP or something otherwise, but neither are quite
>>   right.
>> - The taint_flags table gives a couple of checkpatch.pl errors around
>>   bracket placement. I've kept the new entry consistent with what's
>>   there rather than reformatting the whole table, but be prepared for
>>   complaints about spaces.
>> 
>> Thoughts?
>> -- David
>> 
>> ---
>>  Documentation/admin-guide/tainted-kernels.rst | 1 +
>>  include/linux/panic.h                         | 3 ++-
>>  kernel/panic.c                                | 1 +
>>  lib/kunit/test.c                              | 4 ++++
>>  4 files changed, 8 insertions(+), 1 deletion(-)
>> 
>> diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
>> index ceeed7b0798d..8f18fc4659d4 100644
>> --- a/Documentation/admin-guide/tainted-kernels.rst
>> +++ b/Documentation/admin-guide/tainted-kernels.rst
>> @@ -100,6 +100,7 @@ Bit  Log  Number  Reason that got the kernel tainted
>>   15  _/K   32768  kernel has been live patched
>>   16  _/X   65536  auxiliary taint, defined for and used by distros
>>   17  _/T  131072  kernel was built with the struct randomization plugin
>> + 18  _/N  262144  a KUnit test has been run
>>  ===  ===  ======  ========================================================
>>  
>>  Note: The character ``_`` is representing a blank in this table to make reading
>> diff --git a/include/linux/panic.h b/include/linux/panic.h
>> index f5844908a089..1d316c26bf27 100644
>> --- a/include/linux/panic.h
>> +++ b/include/linux/panic.h
>> @@ -74,7 +74,8 @@ static inline void set_arch_panic_timeout(int timeout, int arch_default_timeout)
>>  #define TAINT_LIVEPATCH			15
>>  #define TAINT_AUX			16
>>  #define TAINT_RANDSTRUCT		17
>> -#define TAINT_FLAGS_COUNT		18
>> +#define TAINT_KUNIT			18
>> +#define TAINT_FLAGS_COUNT		19
>>  #define TAINT_FLAGS_MAX			((1UL << TAINT_FLAGS_COUNT) - 1)
>>  
>>  struct taint_flag {
>> diff --git a/kernel/panic.c b/kernel/panic.c
>> index eb4dfb932c85..b24ca63ed738 100644
>> --- a/kernel/panic.c
>> +++ b/kernel/panic.c
>> @@ -404,6 +404,7 @@ const struct taint_flag taint_flags[TAINT_FLAGS_COUNT] = {
>>  	[ TAINT_LIVEPATCH ]		= { 'K', ' ', true },
>>  	[ TAINT_AUX ]			= { 'X', ' ', true },
>>  	[ TAINT_RANDSTRUCT ]		= { 'T', ' ', true },
>> +	[ TAINT_KUNIT ]			= { 'N', ' ', false },
>
> As kunit tests can be in modules, shouldn't this be "true" here?
>
> Overall, I like it, makes sense to me.  The "N" will take some getting
> used to, and I have no idea why "T" was for "struct randomization", that
> would have allowed you to use "T" instead.  Oh well.

Would you consider a patch adding more self-explanatory taint flag
strings to the output?

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
