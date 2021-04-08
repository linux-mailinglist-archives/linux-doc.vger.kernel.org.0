Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C16357999
	for <lists+linux-doc@lfdr.de>; Thu,  8 Apr 2021 03:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhDHBmY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 7 Apr 2021 21:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhDHBmX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 21:42:23 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D23EC061760
        for <linux-doc@vger.kernel.org>; Wed,  7 Apr 2021 18:42:13 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id s21so247776eju.8
        for <linux-doc@vger.kernel.org>; Wed, 07 Apr 2021 18:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6n231CBUghOAQxU3U/5l2AjQW4d7czM3DbowBIy9hCk=;
        b=Gx+V6BccszFJts/TQT0IxiD3yfhAjhr8MpOw5IjbhV9mIt6sDvdCprCLx7JJNRCbFZ
         DuYV3tNiefYhU+qg+KpEY82yAG9VFNOqTu7RzrWxWxvHJXUQpOFmTxZg9swTw+pBNkO/
         s18niD5eG0pfwKV2AhZzYfMrWFJ5Pb8JFZzQAvg++Ub8t6nN+JddBpfe77lXL7/5kZon
         9+mxHDarvYWylTUEtv0/PWrIeNG+XKy7uHXiOXh991pWH95jcLjWKxgyfZSZ+UC4+bhK
         PBeLPrDxuscoKAGr/A3hWh7sBI3I4CwkOl4+HUI1tEa8NmSqtZ7/qhxlmsJHuUsycYUd
         cgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6n231CBUghOAQxU3U/5l2AjQW4d7czM3DbowBIy9hCk=;
        b=bmk4O2KTN735ov5KoNEuO5UfmJE72JgUdnEN3oj3wzh/YB/+kBIYQDvwAfsM32sbYF
         G6r+bKCDack2PROaPmbY5/vI1RFOP9N6chJZTWoHE8LTuVuB9P6XhgIVfgFNzT47t5/K
         Cug8JTSss+kAppPK08jYVT9vzH5U3Dz4+a/M/7j+gEtCSj0SIkFxx7fcn/6pUbOOSnRi
         4/A1VWOVyroy0qhrrC3SjnWOIZgkUQZxYyOwse90vKZCElJ3Om5dEnzZkB0JuMwAc+kF
         Ni/Wuu6EcxeYPbwwNCQji4aggmfgaXpQgt/JQkuvDqQbXpHE1Vh7JF6z/ozFaqbV+6u0
         b+8w==
X-Gm-Message-State: AOAM530jlaSj7pCyQbs5XjAwRlqHxXq5eWRuZxLGRzoUT6XhoG0iY8U0
        9WoOFgUvE2Qt6Nkz+VziBzfATTqsTxapvLmZq90O
X-Google-Smtp-Source: ABdhPJwxlJ0FgA00wxWQd8bGRHYZNzEt5yMX1HTifk3A8syzAksdjyELkHpAg9I38oGAKIzjqGUm18fsSOfVckHUPAE=
X-Received: by 2002:a17:906:b53:: with SMTP id v19mr7155607ejg.542.1617846132121;
 Wed, 07 Apr 2021 18:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210309143953.142341-1-richard_c_haines@btinternet.com>
In-Reply-To: <20210309143953.142341-1-richard_c_haines@btinternet.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 7 Apr 2021 21:42:01 -0400
Message-ID: <CAHC9VhSHm-GrmjdZKPFf8Rr5JNzo7ieR+mSy7F3n-KjfD1OEaA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] LSM Documentation - Render lsm_hooks.h for kernel_docs
To:     Richard Haines <richard_c_haines@btinternet.com>
Cc:     linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, James Morris <jmorris@namei.org>,
        Serge Hallyn <serge@hallyn.com>, casey@schaufler-ca.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 9, 2021 at 9:40 AM Richard Haines
<richard_c_haines@btinternet.com> wrote:
>
> This patch series updates the LSM hook text defined in the comments
> section of inlcude/linux/lsm_hooks.h. This enables the hook functions to
> be rendered in kernel_docs html or pdf format.
>
> Note that no text has been changed in lsm_hooks.h, only formatting
> to render the text.
>
> To get the correct rendering some lines have exceeded checkpatch limits and
> therefore has a moan. The function statements seem to need being a
> continuous line. The others can be split, but decided not to.
> Any better ideas ??
>
> The hook functions render in HTML ok, however in PDF format the only issue
> is that the long function definitions do not wrap and therefore truncated.
> Check the 'int sb_mount(const char *dev_name' entry in:
> Documentation/output/pdf/security.pdf
>
> For reference two hooks have been marked as deprecated: sb_copy_data() and
> sb_parse_opts_str()
>
> Tested using 'make pdfdocs' and 'make htmldocs'
>
> Richard Haines (3):
>   Documentation/security: Update LSM security hook text
>   include/linux: Update LSM hook text part1
>   include/linux: Update LSM hook text part2
>
>  Documentation/security/lsm-development.rst |    5 +-
>  include/linux/lsm_hooks.h                  | 2365 +++++++++++---------
>  2 files changed, 1364 insertions(+), 1006 deletions(-)

I haven't yet pulled this patchset to generate the HTML/PDF docs, but
just looking at the comments themselves it looks reasonable to me ...
and I say this as being perhaps one of the stricter folks under
security/ when it comes to 80 character line lengths :)  In my
opinion, the benefit of being able to render the docs nicely outweigh
the pain of scrolling horizontally in my editor.  Thanks for doing
this Richard.

Does anyone else have any thoughts on these changes?

-- 
paul moore
www.paul-moore.com
