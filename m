Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 953C1260A3
	for <lists+linux-doc@lfdr.de>; Wed, 22 May 2019 11:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfEVJn5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 22 May 2019 05:43:57 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36369 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728406AbfEVJn5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 May 2019 05:43:57 -0400
Received: by mail-wm1-f65.google.com with SMTP id j187so1473150wmj.1
        for <linux-doc@vger.kernel.org>; Wed, 22 May 2019 02:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PrB8bjazqrKTtujd36+ScpTpMElxgI18Lk1sVXG1EeM=;
        b=RWzE1CZcJd8xeDNkLu6fALyKS7tpGxZ1HJIZG4FBmkalbADyrZMUoCUUFXKrBAov97
         JYlQUv6+mVBlhDnLoui7rE3md65d/0Vrw/QIjCwlzAhXs0yOVJgD+SvprtgrUGazBquK
         7PYoKjhJdAuT4olFn7H8h2mSYNVMoOoIoTjigZEdiyz83Y/beYwLh6wIJ7W/VnObOrp4
         FXIDMAlNgI8Te3jGlooKWOdzMIna6LWVASUijsJtBgcjKHI8FD4WH6sETwNYuggx8kPW
         oDQxxksfIMDKSsPp5zdiiO9JQ9UK68Bean0g44lOaEgBZE2I4lRRDmN6o3atHjk8JntP
         caVg==
X-Gm-Message-State: APjAAAUIX/N828G+CewYypE+7n5/88L/3ZlGQJZowyBMqWvxadddZWtz
        qJ8v3m3HhtL4lN+C4ljm53ff+qNpRbAgTA==
X-Google-Smtp-Source: APXvYqxV1VfoGYrWkdUiUd7Vup+WWEIqxx6yZS7ODGZJVOrVsbMNbzZZi+4cXwFjaWpZdF6V5Saw+g==
X-Received: by 2002:a1c:a804:: with SMTP id r4mr6672470wme.21.1558518235860;
        Wed, 22 May 2019 02:43:55 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id a5sm22071464wrt.10.2019.05.22.02.43.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 02:43:54 -0700 (PDT)
Date:   Wed, 22 May 2019 11:43:54 +0200
From:   Oleksandr Natalenko <oleksandr@redhat.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Markus Heiser <markus.heiser@darmarit.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH RFC 0/2] docs: Deal with some Sphinx deprecation warnings
Message-ID: <20190522094354.mnolo6bh6yeiza5h@butterfly.localdomain>
References: <20190521211714.1395-1-corbet@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521211714.1395-1-corbet@lwn.net>
User-Agent: NeoMutt/20180716
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 21, 2019 at 03:17:12PM -0600, Jonathan Corbet wrote:
> The Sphinx folks are deprecating some interfaces in the upcoming 2.0
> release; one immediate result of that is a bunch of warnings that show up
> when building with 1.8.  These two patches make those warnings go away,
> but at a cost:

A minor correction, if I may and if I understand this correctly: 2.0 is
not an upcoming release, but a current one (2.0.1, to be precise), and
this means that in some distros (like, Arch [1]) `make htmldocs` is
already broken for quite some time.

[1] https://bugs.archlinux.org/task/59688

> 
>  - It introduces a couple of Sphinx version checks, which are always
>    ugly, but the alternative would be to stop supporting versions
>    before 1.7.  For now, I think we can carry that cruft.
> 
>  - The second patch causes the build to fail horribly on newer
>    Sphinx installations.  The change to switch_source_input() seems
>    to make the parser much more finicky, increasing warnings and
>    eventually failing the build altogether.  In particular, it will
>    scream about problems in .rst files that are not included in the
>    TOC tree at all.  The complaints appear to be legitimate, but it's
>    a bunch of stuff to clean up.
> 
> I've tested these with 1.4 and 1.8, but not various versions in between.
> 
> Jonathan Corbet (2):
>   doc: Cope with Sphinx logging deprecations
>   doc: Cope with the deprecation of AutoReporter
> 
>  Documentation/sphinx/kerneldoc.py | 48 ++++++++++++++++++++++++-------
>  Documentation/sphinx/kernellog.py | 28 ++++++++++++++++++
>  Documentation/sphinx/kfigure.py   | 38 +++++++++++++-----------
>  3 files changed, 87 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/sphinx/kernellog.py
> 
> -- 
> 2.21.0
> 

-- 
  Best regards,
    Oleksandr Natalenko (post-factum)
    Senior Software Maintenance Engineer
