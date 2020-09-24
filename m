Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 626A927716D
	for <lists+linux-doc@lfdr.de>; Thu, 24 Sep 2020 14:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgIXMrL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 24 Sep 2020 08:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727788AbgIXMrJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Sep 2020 08:47:09 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86431C0613CE
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2020 05:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To;
        bh=oN/eolXZY9u+LKnpVrUX4gJQ+gqfCB4thtUFDwSk17s=; b=ZOLJzYtdbnHYdOx5Bdt6MzSKbl
        NrGjeCpLtNFCtn2bzF7+yj7aXeVjC9boFq7LLXzGpt6ZIdkkHOutz7tLc0WuwU1VEKCJer2Y5lT6U
        gTwaUEto01pwqlw3rMFxuRtxj94vX8UgKnD37rLKEU4CewkKRW+BKXYfJ4x1a8wpTQErL/4UcVC0L
        oEEhe53B1ovBZcCC1soKQnaZSRGW+C3RuJ9dHn9328PpjEgx5sxQF2KAgyNZYo7J7g8LTHtudu+CP
        +yzfQsfx/bZG5uU97dfWG4X1WS69HwHAQNE8AI5vR7lW/GMXnBlH/3IXf9FCy/q6TtsajaIh9a8+g
        KZ0rLygw==;
Received: from ip5f5ad5c4.dynamic.kabel-deutschland.de ([95.90.213.196] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kLQeP-0007WT-HI; Thu, 24 Sep 2020 12:47:05 +0000
Date:   Thu, 24 Sep 2020 14:47:03 +0200
From:   Mauro Carvalho Chehab <mchehab@infradead.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [PATCH RFC] Make the docs build "work" with Sphinx 3.x
Message-ID: <20200924144703.33202e24@coco.lan>
References: <20200904102925.52fcd2a1@lwn.net>
        <20200921222639.GY32101@casper.infradead.org>
        <87sgbaqnp9.fsf@intel.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <mchehab@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 23 Sep 2020 14:31:55 +0200
Mauro Carvalho Chehab <mchehab@infradead.org> escreveu:

> Em Tue, 22 Sep 2020 10:23:46 +0300
> Jani Nikula <jani.nikula@linux.intel.com> escreveu:
> 
> > On Mon, 21 Sep 2020, Matthew Wilcox <willy@infradead.org> wrote:  
> > > On Fri, Sep 04, 2020 at 10:29:25AM -0600, Jonathan Corbet wrote:    
> > >> +# cdomain is badly broken in Sphinx 3+.  Leaving it out generates *most*
> > >> +# of the docs correctly, but not all.  Scream bloody murder but allow
> > >> +# the process to proceed; hopefully somebody will fix this properly soon.
> > >> +#
> > >> +if major >= 3:
> > >> +    sys.stderr.write('''WARNING: The kernel documentation build process
> > >> +	does not work correctly with Sphinx v3.0 and above.  Expect errors
> > >> +	in the generated output.    
> > >
> > > Should we be converting the kernel-doc script to output 3.0-style markup
> > > for structs?    
> > 
> > IIUC it's not backwards compatible with Sphinx pre-3.0, so you'd either
> > have to require Sphinx 3.0 or have kernel-doc emit both, depending on
> > the Sphinx version.  
> 
> Well, making kernel-doc to emit both may be not too hard, as it
> could be doing something like:

Hi Jani,

> 
> <snp
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 0a102d57437d..0605949db383 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -50,6 +50,7 @@ if major >= 3:
>  	does not work correctly with Sphinx v3.0 and above.  Expect errors
>  	in the generated output.
>  	''')
> +    tags.add('sphinx3')
>  else:
>      extensions.append('cdomain')
>  
> diff --git a/Documentation/userspace-api/media/v4l/v4l2.rst b/Documentation/userspace-api/media/v4l/v4l2.rst
> index ad7a2bf0cf26..5007f33a7920 100644
> --- a/Documentation/userspace-api/media/v4l/v4l2.rst
> +++ b/Documentation/userspace-api/media/v4l/v4l2.rst
> @@ -3,6 +3,10 @@
>  
>  .. _v4l2spec:
>  
> +.. only: sphinx3
> +
> +   .. c:namespace:: v4l_uAPI
> +
>  ############################
>  Part I - Video for Linux API
>  ############################
> @@ -416,3 +420,7 @@ Second draft, with corrections pointed out by Gerd Knorr.
>  
>  First draft, based on documentation by Bill Dirks and discussions on the
>  V4L mailing list.
> +
> +.. only: sphinx3
> +
> +   .. c:namespace:: NULL

I actually tried that, but this didn't work.

Btw, it is not that simple. It needs to convert also several other tags,
and some are in the middle of the tests.

So, even if this would work, a change like that will introduce lots
of "noise" at the docs.

The approach of adding support for c:namespace: at cdomain
(see the patchset I sent today) is a lot more cleaner.

Thanks,
Mauro
