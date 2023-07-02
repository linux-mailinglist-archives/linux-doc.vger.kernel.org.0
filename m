Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEDB6744D9C
	for <lists+linux-doc@lfdr.de>; Sun,  2 Jul 2023 14:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjGBMkA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 2 Jul 2023 08:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjGBMj7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 2 Jul 2023 08:39:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E20812A;
        Sun,  2 Jul 2023 05:39:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1E60660BD8;
        Sun,  2 Jul 2023 12:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C0FC433C8;
        Sun,  2 Jul 2023 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1688301597;
        bh=Gs10fttTgnhj5fhjLDWFZ0nrwMhadhZS6+ukxYV05Bw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jyxA0qYizBtdPmWrk2kjuW65B0CjVfIE8CbaJzq8Km7bcrnlErGRNRnEwesmL9cIf
         gwFhHQokKhnVJYn9t/qYRVj7c55uJlu7pjrdZBCZJRwqCLlYDK3rsIowy9krOr3gvY
         8VtLI43tqlGvp/Ard9XCx9MM8Fq5KuzjRMH7dQZg=
Date:   Sun, 2 Jul 2023 14:39:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        security@kernel.org, corbet@lwn.net, workflows@vger.kernel.org
Subject: Re: [PATCH 2/2] Documentation: security-bugs.rst: clarify CVE
 handling
Message-ID: <2023070213-capacity-moneybags-3668@gregkh>
References: <2023063020-throat-pantyhose-f110@gregkh>
 <2023063022-retouch-kerosene-7e4a@gregkh>
 <202306301114.E199B136@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306301114.E199B136@keescook>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 30, 2023 at 11:18:37AM -0700, Kees Cook wrote:
> On Fri, Jun 30, 2023 at 09:14:21AM +0200, Greg Kroah-Hartman wrote:
> > The kernel security team does NOT assign CVEs, so document that properly
> > and provide the "if you want one, ask MITRE for it" response that we
> > give on a weekly basis in the document, so we don't have to constantly
> > say it to everyone who asks.
> > 
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  Documentation/process/security-bugs.rst | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
> > index f12ac2316ce7..8b80e1eb7d79 100644
> > --- a/Documentation/process/security-bugs.rst
> > +++ b/Documentation/process/security-bugs.rst
> > @@ -79,13 +79,10 @@ not contribute to actually fixing any potential security problems.
> >  CVE assignment
> >  --------------
> >  
> > -The security team does not normally assign CVEs, nor do we require them
> > -for reports or fixes, as this can needlessly complicate the process and
> > -may delay the bug handling. If a reporter wishes to have a CVE identifier
> > -assigned ahead of public disclosure, they will need to contact the private
> > -linux-distros list, described above. When such a CVE identifier is known
> > -before a patch is provided, it is desirable to mention it in the commit
> > -message if the reporter agrees.
> > +The security team does not assign CVEs, nor do we require them for
> > +reports or fixes, as this can needlessly complicate the process and may
> > +delay the bug handling.  If a reporter wishes to have a CVE identifier
> > +assigned, they should contact MITRE directly.
> 
> Hmm. The language about "assigned ahead of public disclosure" was added
> intentionally due to trouble we'd had with coordination when a CVE was
> needed, etc. Additionally, it IS preferred to have a CVE in a patch when
> it IS known ahead of time, so I think that should be kept. How about
> this:
> 
> 
> diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
> index 82e29837d589..2f4060d49b31 100644
> --- a/Documentation/process/security-bugs.rst
> +++ b/Documentation/process/security-bugs.rst
> @@ -81,13 +81,12 @@ the email Subject line with "[vs]" as described in the linux-distros wiki:
>  CVE assignment
>  --------------
>  
> -The security team does not normally assign CVEs, nor do we require them
> -for reports or fixes, as this can needlessly complicate the process and
> -may delay the bug handling. If a reporter wishes to have a CVE identifier
> -assigned ahead of public disclosure, they will need to contact the private
> -linux-distros list, described above. When such a CVE identifier is known
> -before a patch is provided, it is desirable to mention it in the commit
> -message if the reporter agrees.
> +The security team does not assign CVEs, nor do we require them for reports
> +or fixes, as this can needlessly complicate the process and may delay
> +the bug handling. If a reporter wishes to have a CVE identifier assigned
> +ahead of public disclosure, they will need to contact MITRE directly.
> +When such a CVE identifier is known before a patch is provided, it is
> +desirable to mention it in the commit message if the reporter agrees.

I can not, in good faith, with the current mess that MITRE is going
through, tell anyone that they should contact MITRE ahead of public
disclosure, sorry.

All I can say is "if you really want one, go ask them for one", as
everyone keeps asking us for one to pad their resume/CV.

Also note that many non-US-based companies are not allowed to contact a
US-government-backed entity for potential security issues for obvious
reasons.

So I don't want to even give a hint that we support or request this at
all, or that it is something that changelog texts should contain for
security issues (for the obvious reason of them being a "hint" one way
or another.)

External groups may wish to play the CVE "game" as it facilitates their
engineering procedures to get changes past managers, but that's not
anything that we should be encouraging at all for all of the various
geopolitical and corporate reasons involved in that mess.

thanks,

greg k-h
