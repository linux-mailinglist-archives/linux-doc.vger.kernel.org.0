Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB64435E27
	for <lists+linux-doc@lfdr.de>; Thu, 21 Oct 2021 11:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhJUJqF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 21 Oct 2021 05:46:05 -0400
Received: from mga02.intel.com ([134.134.136.20]:13611 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231475AbhJUJqF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 21 Oct 2021 05:46:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="216155143"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; 
   d="scan'208";a="216155143"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2021 02:43:49 -0700
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; 
   d="scan'208";a="495050449"
Received: from ssuryana-mobl.ger.corp.intel.com (HELO localhost) ([10.249.45.34])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2021 02:43:46 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Thorsten Leemhuis <linux@leemhuis.info>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v1 2/2] docs: submitting-patches: make section about the Link: tag more explicit
In-Reply-To: <65ccc5ff-e212-71db-78c4-d1f97503c0d0@leemhuis.info>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1633593385.git.linux@leemhuis.info> <d97daa2791a7598a6ee4e853d3c6b536919191d5.1633593385.git.linux@leemhuis.info> <87pmshyye7.fsf@intel.com> <4c17a070-78fe-eb21-875a-511603266cfb@leemhuis.info> <65ccc5ff-e212-71db-78c4-d1f97503c0d0@leemhuis.info>
Date:   Thu, 21 Oct 2021 12:43:41 +0300
Message-ID: <878rymogqa.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 21 Oct 2021, Thorsten Leemhuis <linux@leemhuis.info> wrote:
> On 08.10.21 11:47, Thorsten Leemhuis wrote:
>> On 07.10.21 11:31, Jani Nikula wrote:
>>> On Thu, 07 Oct 2021, Thorsten Leemhuis <linux@leemhuis.info> wrote:
>>>> Mention the 'Link' tag in the section about adding URLs to the commit
>>>> msg, which makes it easier to find its meaning with a text search. For
>>>> the same reason and to also improve comprehensibility provide an
>>>> example.
>>>>
>>>> Slightly improve the text at the same time to make it more obvious
>>>> developers are meant to add links to issue reports in mailing list
>>>> archives, as those allow regression tracking efforts to automatically
>>>> check which bugs got resolved.
>>>>
>>>> Move the section also downwards slightly, to reduce jumping back and
>>>> forth between aspects relevant for the top and the bottom part of the
>>>> commit msg.
>>>
>>> FWIW, we've been using the Link: tag in the drm-misc and drm-intel trees
>>> to reference the patch (that became the commit) in the freedesktop.org
>>> patchwork instance by message-id. This is almost exclusively the only
>>> way we use the Link: tag, and we've been doing this for about 5 years
>>> now. [...]
>> 
>> Which afaik is totally appropriate and the way it is used most of the
>> time, especially since more and more maintainers use b4.
>> 
>> But it afaics also gets used to refer to bug reports:
>> 
>> $ git log v5.14.. | grep ' Link: https://bugzilla.kernel.org/' | wc -
>> 8
>> 
>> But maybe that's not the way it is intended.
>> 
>>> For ages, References: tag has been used the way described in this patch.
>> 
>> Hmmm, seems other developers/subsystems handle that tag a bit different
>> as well. I simply looked for "References:" in v5.14.. (excluding drm)
>> and for example found the following in
>> https://git.kernel.org/torvalds/c/19532869feb9b0a97d17ddc14609d1e53a5b60db
>> 
>> ```
>>>     Link: https://github.com/ClangBuiltLinux/linux/issues/1453
>>>     References: 6baec880d7a5 ("kasan: turn off asan-stack for clang-8 and earlier")
>>>     Link: https://lkml.kernel.org/r/20210922205525.570068-1-nathan@kernel.org
>> ```
>> 
>> This commit uses "References:" in a similar way:
>> https://git.kernel.org/torvalds/c/13be2efc390acd2a46a69a359f6efc00ca434599
>
> FWIW, Linus today coincidentally in
> https://lore.kernel.org/lkml/CAHk-=wgBhyLhQLPem1vybKNt7BKP+=qF=veBgc7VirZaXn4FUw@mail.gmail.com/
> wrote:
>
> ```
> So _primarily_ the "Link:" line should be about background - and for
> "oh, there was discussion about this patch after it was committed".
> ```

Discussion about a patch *after* it was committed will likely happen in
the mailing list thread where the patch was posted. So kind of what we
do with Link.

> I'd consider a bug/regression report as "background", so from my point
> of view I'd say what my patch does is correct. Or do you disagree Jani?
> If not I'd like to move on and ask Jonathan to merge it.

Fair enough.

I think the main thing to accept is that while we may add kernel wide
guidance, we'll end up with different subsystems and drivers having
varying conventions no matter what.

> FWIW, I'll...
>
>> Maybe it's time to generate a table with the "official tags" (and create
>> separate tags for the different purposes at the same time as well?).
>
> ...keep this in mind to maybe get back to it sooner or later.

That is going to be one massive bikeshed fest. :|

BR,
Jani.

>
> Ciao, Thorsten
>
>> Wasn't something like that a topic in the past? My mind vaguely recalls
>> a lwn.net article about tags and their misuse, but I couldn't find it.
>> And maybe my mind is mixing things up anyway and remembers something
>> that never happened. :-/
>> 
>> Ciao, Thorsten
>> 
>> 
>>>> CC: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
>>>> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
>>>> ---
>>>>  Documentation/process/submitting-patches.rst | 32 +++++++++++++-------
>>>>  1 file changed, 21 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
>>>> index b0f31aa82fcd..8ba69332322f 100644
>>>> --- a/Documentation/process/submitting-patches.rst
>>>> +++ b/Documentation/process/submitting-patches.rst
>>>> @@ -96,17 +96,6 @@ instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
>>>>  to do frotz", as if you are giving orders to the codebase to change
>>>>  its behaviour.
>>>>  
>>>> -If the patch fixes a logged bug entry, refer to that bug entry by
>>>> -number and URL.  If the patch follows from a mailing list discussion,
>>>> -give a URL to the mailing list archive; use the https://lore.kernel.org/
>>>> -redirector with a ``Message-Id``, to ensure that the links cannot become
>>>> -stale.
>>>> -
>>>> -However, try to make your explanation understandable without external
>>>> -resources.  In addition to giving a URL to a mailing list archive or
>>>> -bug, summarize the relevant points of the discussion that led to the
>>>> -patch as submitted.
>>>> -
>>>>  If you want to refer to a specific commit, don't just refer to the
>>>>  SHA-1 ID of the commit. Please also include the oneline summary of
>>>>  the commit, to make it easier for reviewers to know what it is about.
>>>> @@ -123,6 +112,27 @@ collisions with shorter IDs a real possibility.  Bear in mind that, even if
>>>>  there is no collision with your six-character ID now, that condition may
>>>>  change five years from now.
>>>>  
>>>> +Add 'Link:' tags with URLs pointing to related discussions and rationale
>>>> +behind the change whenever that makes sense. If your patch for example
>>>> +fixes a bug, add a tag with a URL referencing the report in the mailing
>>>> +list archives or a bug tracker; if the patch was discussed on a mailing
>>>> +list or originated in some discussion, point to it.
>>>> +
>>>> +When linking to mailing list archives, preferably use the lore.kernel.org
>>>> +message archiver service. To create the link URL, use the contents of the
>>>> +``Message-Id`` header of the message without the surrounding angle brackets.
>>>> +For example::
>>>> +
>>>> +    Link: https://lore.kernel.org/r/git-send-email.555-1234@example.org
>>>> +
>>>> +Please check the link to make sure that it is actually working and points
>>>> +to the relevant message.
>>>> +
>>>> +However, try to make your explanation understandable without external
>>>> +resources.  In addition to giving a URL to a mailing list archive or
>>>> +bug, summarize the relevant points of the discussion that led to the
>>>> +patch as submitted.
>>>> +
>>>>  If your patch fixes a bug in a specific commit, e.g. you found an issue using
>>>>  ``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
>>>>  the SHA-1 ID, and the one line summary.  Do not split the tag across multiple
>>>
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
