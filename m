Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC4026C93FD
	for <lists+linux-doc@lfdr.de>; Sun, 26 Mar 2023 13:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbjCZL2r (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 26 Mar 2023 07:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjCZL2q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 26 Mar 2023 07:28:46 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C88E83CB;
        Sun, 26 Mar 2023 04:28:44 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pgOYA-0004Op-9n; Sun, 26 Mar 2023 13:28:38 +0200
Message-ID: <29b2c9c1-f176-5e42-2606-94b4bc6d4c45@leemhuis.info>
Date:   Sun, 26 Mar 2023 13:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
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
References: <20230314-doc-checkpatch-closes-tag-v2-0-f4a417861f6d@tessares.net>
 <20230314-doc-checkpatch-closes-tag-v2-1-f4a417861f6d@tessares.net>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v2 1/2] docs: process: allow Closes tags with links
In-Reply-To: <20230314-doc-checkpatch-closes-tag-v2-1-f4a417861f6d@tessares.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1679830125;0647ea1f;
X-HE-SMSGID: 1pgOYA-0004Op-9n
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 24.03.23 19:52, Matthieu Baerts wrote:
> Making sure a bug tracker is up to date is not an easy task. For
> example, a first version of a patch fixing a tracked issue can be sent a
> long time after having created the issue. But also, it can take some
> time to have this patch accepted upstream in its final form. When it is
> done, someone -- probably not the person who accepted the patch -- has
> to remember about closing the corresponding issue.
> 
> This task of closing and tracking the patch can be done automatically by
> bug trackers like GitLab [1], GitHub [2] and hopefully soon [3]
> bugzilla.kernel.org when the appropriated tag is used. The two first
> ones accept multiple tags but it is probably better to pick one.
> 
> [...]
> 
> diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
> index 7a670a075ab6..20f0b6b639b7 100644
> --- a/Documentation/process/5.Posting.rst
> +++ b/Documentation/process/5.Posting.rst
> @@ -217,6 +217,15 @@ latest public review posting of the patch; often this is automatically done
>  by tools like b4 or a git hook like the one described in
>  'Documentation/maintainer/configure-git.rst'.
>  
> +Similarly, there is also the "Closes:" tag that can be used to close issues
> +when the underlying public bug tracker can do this operation automatically.
> +For example::
> +
> +	Closes: https://example.com/issues/1234
> +
> +Private bug trackers and invalid URLs are forbidden. For other public bug
> +trackers not supporting automations, keep using the "Link:" tag instead.
> [...]

This more and more seems half-hearted to me.

One reason: it makes things unnecessarily complicated for developers, as
they'd then have to remember `is this a public bug tracker that is
supporting automations? Then use "Closes", otherwise "Link:"`.

Another reason: the resulting situation ignores my regression tracking
bot, which (among others) tracks emailed reports. It would benefit from
"Closes" as well to avoid the ambiguity problem Konstantin brought up
(the one about "Link: might just point to a report for background
information in patches that don't address the problem the link points
to"[1]. But FWIW, I'm not sure if this ambiguity is much of a problem in
practice, I have a feeling that it's rare and most of the time will
happen after the reported problem has been addressed or in the same
patch-set.

I thus think we should use either of these approaches:

* just stick to "Link: <url>"

* go "all-in" and tell developers to use "Closes: <url>"[2] all the time
when a patch is resolving an issue that was reported in public

I'm not sure which of them I prefer myself. Maybe I'm slightly leaning
towards the latter: it avoids the ambiguity, checkpatch.pl will yell if
it's used with something else than a URL, it makes things easier for
MPTCP & DRM developers, and (maybe most importantly) is something new
developers are often used to already from git forges.

Ciao, Thorsten

[1]
https://lore.kernel.org/linux-doc/20230317185637.ebxzsdxivhgzkqqw@meerkat.local/

[2] fwiw, I still prefer "Resolves:" over "Closes". Yes, I've seen
Konstantin's comment on the subtle difference between the two[3], but as
he said, Bugbot can work with it as well. But to me "Resolves" sounds
way friendlier and more descriptive to me; but well, I'm not a native
speaker, so I don't think my option should count much here.

[3]
https://lore.kernel.org/linux-doc/20230316162227.727rhima2tejdl5j@meerkat.local/

