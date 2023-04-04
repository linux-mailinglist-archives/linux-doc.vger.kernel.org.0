Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D00DF6D5A54
	for <lists+linux-doc@lfdr.de>; Tue,  4 Apr 2023 10:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbjDDIJz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Apr 2023 04:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbjDDIJz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Apr 2023 04:09:55 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069491BD9;
        Tue,  4 Apr 2023 01:09:53 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pjbjf-0006fr-PJ; Tue, 04 Apr 2023 10:09:47 +0200
Message-ID: <e671189c-086e-87bd-68db-fb80678d4666@leemhuis.info>
Date:   Tue, 4 Apr 2023 10:09:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US, de-DE
To:     Matthieu Baerts <matthieu.baerts@tessares.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        =?UTF-8?Q?Kai_Wasserb=c3=a4ch?= <kai@dev.carbon-project.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mptcp@lists.linux.dev
References: <20230314-doc-checkpatch-closes-tag-v4-0-d26d1fa66f9f@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v4-1-d26d1fa66f9f@tessares.net>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v4 1/5] docs: process: allow Closes tags with links
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v4-1-d26d1fa66f9f@tessares.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1680595794;ab84f175;
X-HE-SMSGID: 1pjbjf-0006fr-PJ
X-Spam-Status: No, score=-1.9 required=5.0 tests=NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 03.04.23 18:23, Matthieu Baerts wrote:
> [...]
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 828997bc9ff9..12d58ddc2b8a 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -113,11 +113,9 @@ there is no collision with your six-character ID now, that condition may
>  change five years from now.
>  
>  If related discussions or any other background information behind the change
> -can be found on the web, add 'Link:' tags pointing to it. In case your patch
> -fixes a bug, for example, add a tag with a URL referencing the report in the
> -mailing list archives or a bug tracker; if the patch is a result of some
> -earlier mailing list discussion or something documented on the web, point to
> -it.
> +can be found on the web, add 'Link:' tags pointing to it. If the patch is a
> +result of some earlier mailing list discussions or something documented on the
> +web, point to it.
>  
>  When linking to mailing list archives, preferably use the lore.kernel.org
>  message archiver service. To create the link URL, use the contents of the
> @@ -134,6 +132,16 @@ resources. In addition to giving a URL to a mailing list archive or bug,
>  summarize the relevant points of the discussion that led to the
>  patch as submitted.
>  
> +In case your patch fixes a bug, use the 'Closes:' tag with a URL referencing
> +the report in the mailing list archives or a public bug tracker. For example::
> +
> +	Closes: https://example.com/issues/1234

YMMV, but is this...

> +Some bug trackers have the ability to close issues automatically when a
> +commit with such a tag is applied. Some bots monitoring mailing lists can
> +also track such tags and take certain actions. Private bug trackers and
> +invalid URLs are forbidden.
> +

...section (and a similar one in the other document) really worth it
and/or does it have to be that long? A simple "Some bug trackers then
will automatically close the issue when the commit is merged" IMHO would
suffice, but OTOH it might be considered common knowledge. And the
"found on the web", "a public bug tracker" (both quoted above) and
"available on the web" (quoted below) already make it pretty clear that
links to private bug trackers are now desired. And there is also a
"Please check the link to make sure that it is actually working and
points to the relevant message." in submitting-patches.rst already, so
invalid URLs are obviously not wanted either.

>  If your patch fixes a bug in a specific commit, e.g. you found an issue using
>  ``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
>  the SHA-1 ID, and the one line summary.  Do not split the tag across multiple
> @@ -498,9 +506,11 @@ Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:
>  The Reported-by tag gives credit to people who find bugs and report them and it
>  hopefully inspires them to help us again in the future. The tag is intended for
>  bugs; please do not use it to credit feature requests. The tag should be
> -followed by a Link: tag pointing to the report, unless the report is not
> -available on the web. Please note that if the bug was reported in private, then
> -ask for permission first before using the Reported-by tag.
> +followed by a Closes: tag pointing to the report, unless the report is not
> +available on the web. The Link: tag can be used instead of Closes: if the patch
> +fixes a part of the issue(s) being reported. Please note that if the bug was
> +reported in private, then ask for permission first before using the Reported-by
> +tag.
>  
>  A Tested-by: tag indicates that the patch has been successfully tested (in
>  some environment) by the person named.  This tag informs maintainers that

Ciao, Thorsten
