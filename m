Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5D45426720
	for <lists+linux-doc@lfdr.de>; Fri,  8 Oct 2021 11:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236118AbhJHJtl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 8 Oct 2021 05:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbhJHJtl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Oct 2021 05:49:41 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8527EC061570;
        Fri,  8 Oct 2021 02:47:46 -0700 (PDT)
Received: from ip4d14bdef.dynamic.kabel-deutschland.de ([77.20.189.239] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1mYmTg-00008i-4P; Fri, 08 Oct 2021 11:47:44 +0200
Message-ID: <4c17a070-78fe-eb21-875a-511603266cfb@leemhuis.info>
Date:   Fri, 8 Oct 2021 11:47:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
References: <cover.1633593385.git.linux@leemhuis.info>
 <d97daa2791a7598a6ee4e853d3c6b536919191d5.1633593385.git.linux@leemhuis.info>
 <87pmshyye7.fsf@intel.com>
Content-Language: en-US
Subject: Re: [PATCH v1 2/2] docs: submitting-patches: make section about the
 Link: tag more explicit
In-Reply-To: <87pmshyye7.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1633686466;c75e1508;
X-HE-SMSGID: 1mYmTg-00008i-4P
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

(sorry, sending it a second time, vger rejected it earlier - and I have
an idea now what went wrong)

On 07.10.21 11:31, Jani Nikula wrote:
> On Thu, 07 Oct 2021, Thorsten Leemhuis <linux@leemhuis.info> wrote:
>> Mention the 'Link' tag in the section about adding URLs to the commit
>> msg, which makes it easier to find its meaning with a text search. For
>> the same reason and to also improve comprehensibility provide an
>> example.
>>
>> Slightly improve the text at the same time to make it more obvious
>> developers are meant to add links to issue reports in mailing list
>> archives, as those allow regression tracking efforts to automatically
>> check which bugs got resolved.
>>
>> Move the section also downwards slightly, to reduce jumping back and
>> forth between aspects relevant for the top and the bottom part of the
>> commit msg.
>
> FWIW, we've been using the Link: tag in the drm-misc and drm-intel trees
> to reference the patch (that became the commit) in the freedesktop.org
> patchwork instance by message-id. This is almost exclusively the only
> way we use the Link: tag, and we've been doing this for about 5 years
> now. [...]

Which afaik is totally appropriate and the way it is used most of the
time, especially since more and more maintainers use b4.

But it afaics also gets used to refer to bug reports:

$ git log v5.14.. | grep ' Link: https://bugzilla.kernel.org/' | wc -
8

But maybe that's not the way it is intended.

> For ages, References: tag has been used the way described in this patch.

Hmmm, seems other developers/subsystems handle that tag a bit different
as well. I simply looked for "References:" in v5.14.. (excluding drm)
and for example found the following in
https://git.kernel.org/torvalds/c/19532869feb9b0a97d17ddc14609d1e53a5b60db

```
>     Link: https://github.com/ClangBuiltLinux/linux/issues/1453
>     References: 6baec880d7a5 ("kasan: turn off asan-stack for clang-8 and earlier")
>     Link: https://lkml.kernel.org/r/20210922205525.570068-1-nathan@kernel.org
```

This commit uses "References:" in a similar way:
https://git.kernel.org/torvalds/c/13be2efc390acd2a46a69a359f6efc00ca434599

Maybe it's time to generate a table with the "official tags" (and create
separate tags for the different purposes at the same time as well?).
Wasn't something like that a topic in the past? My mind vaguely recalls
a lwn.net article about tags and their misuse, but I couldn't find it.
And maybe my mind is mixing things up anyway and remembers something
that never happened. :-/

Ciao, Thorsten


>> CC: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
>> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
>> ---
>>  Documentation/process/submitting-patches.rst | 32 +++++++++++++-------
>>  1 file changed, 21 insertions(+), 11 deletions(-)
>>
>> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
>> index b0f31aa82fcd..8ba69332322f 100644
>> --- a/Documentation/process/submitting-patches.rst
>> +++ b/Documentation/process/submitting-patches.rst
>> @@ -96,17 +96,6 @@ instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
>>  to do frotz", as if you are giving orders to the codebase to change
>>  its behaviour.
>>  
>> -If the patch fixes a logged bug entry, refer to that bug entry by
>> -number and URL.  If the patch follows from a mailing list discussion,
>> -give a URL to the mailing list archive; use the https://lore.kernel.org/
>> -redirector with a ``Message-Id``, to ensure that the links cannot become
>> -stale.
>> -
>> -However, try to make your explanation understandable without external
>> -resources.  In addition to giving a URL to a mailing list archive or
>> -bug, summarize the relevant points of the discussion that led to the
>> -patch as submitted.
>> -
>>  If you want to refer to a specific commit, don't just refer to the
>>  SHA-1 ID of the commit. Please also include the oneline summary of
>>  the commit, to make it easier for reviewers to know what it is about.
>> @@ -123,6 +112,27 @@ collisions with shorter IDs a real possibility.  Bear in mind that, even if
>>  there is no collision with your six-character ID now, that condition may
>>  change five years from now.
>>  
>> +Add 'Link:' tags with URLs pointing to related discussions and rationale
>> +behind the change whenever that makes sense. If your patch for example
>> +fixes a bug, add a tag with a URL referencing the report in the mailing
>> +list archives or a bug tracker; if the patch was discussed on a mailing
>> +list or originated in some discussion, point to it.
>> +
>> +When linking to mailing list archives, preferably use the lore.kernel.org
>> +message archiver service. To create the link URL, use the contents of the
>> +``Message-Id`` header of the message without the surrounding angle brackets.
>> +For example::
>> +
>> +    Link: https://lore.kernel.org/r/git-send-email.555-1234@example.org
>> +
>> +Please check the link to make sure that it is actually working and points
>> +to the relevant message.
>> +
>> +However, try to make your explanation understandable without external
>> +resources.  In addition to giving a URL to a mailing list archive or
>> +bug, summarize the relevant points of the discussion that led to the
>> +patch as submitted.
>> +
>>  If your patch fixes a bug in a specific commit, e.g. you found an issue using
>>  ``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
>>  the SHA-1 ID, and the one line summary.  Do not split the tag across multiple
> 

