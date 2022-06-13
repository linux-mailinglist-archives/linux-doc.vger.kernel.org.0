Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB17B54A034
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jun 2022 22:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbiFMUy1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Jun 2022 16:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347970AbiFMUw7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 16:52:59 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADBE3F55
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 13:12:29 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id q15so8427133wrc.11
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 13:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LOq+BPckvYHQKeGJ0rXgOkEOuJiM+yu8YvLI9pqoBQg=;
        b=qbUZAt+v2CC3Q4p5lcEFp4Xh1PKc/r5H9G7bNEQigUvWNsRWB4MhuO/Ezj6rAtwRO+
         9mxq2US6cR+VK5ELpo/lGOXCy78OLH1Tte5aNJVOG4tYTk0sKdkGGmSJrf9QJPeJu7xq
         a2mnDe8z6Gw/ibphd2lPonjlj8G1gllZSrn+7X3QreVjL5oJL/N1/g0V/JQHoBFNFjeF
         L3ZOnnkwPt1+XHBfbkUf14MLpuDJIx33DbK4PBkMPCSV5lqJT15pIdKLc8WKKPGoAhrG
         zQiGgqA6N42M154UgN1I44grr8G7D7qc2rLsUF6yRkhfkcH5jgl6Aw9HNcA2oteX4aNf
         vQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LOq+BPckvYHQKeGJ0rXgOkEOuJiM+yu8YvLI9pqoBQg=;
        b=0TZsgO1jUsqQ1xI6v+fnEJXMZpLWjD0FL9J52uIPQZvuJ0NaOKZFQD0erD/jazcaop
         mykazsLhssaaWL/Uy+rGADM+UkIsc3M8UjZJsnXBd5v8szdtjw9y5ggBBG5LGRuOue7I
         YH0l51o48VQLpFyBYX8vHjGoYjjIMakW7SkKQc4Qpy4PIOmGpiTMGzot8jundxyRo+k9
         CBF4HqCLNUUszClrvEYbYC5RKXzSP0fRXlvaH4YNYGZmXltvhN89s/QVozrvm3gifSt8
         YRR+hYb/7zGSKFXGXAmzK9TtjV59U75B9HWzH+iR1wU47UF2zFymztGFapHCLXE/nTLL
         tJPQ==
X-Gm-Message-State: AJIora9plOyZl/+EGGOXSNpbCY7+5DuBdpVJtJOlCpNvvpGBJ11GyZcr
        KnB3GUDQ8gjXQUBgl/mhOBBvKcK5DactWvsOVQTpwAS8Dg==
X-Google-Smtp-Source: AGRyM1tFkfiIW9amUpPXfaCCRQ/xd+Xqwkzg6K5j832uqkVmOJDT5j0HzXP4wx7mJlOsDpCCDoWXKNtJYb1IDHc0cQQ=
X-Received: by 2002:a5d:64e7:0:b0:218:5626:7e7f with SMTP id
 g7-20020a5d64e7000000b0021856267e7fmr1374504wri.245.1655151148059; Mon, 13
 Jun 2022 13:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220301041454.18960-1-rdunlap@infradead.org> <CAHC9VhSuzpuEm437SCYC8pf0mU6qdWXRU38sb2+JjVtj-8T4Kw@mail.gmail.com>
 <CAHC9VhSa74OFVV=XcceO12kVOxivm5cnyvBo-yeMbyPT8+t5Kg@mail.gmail.com> <87mtegz7t5.fsf@meer.lwn.net>
In-Reply-To: <87mtegz7t5.fsf@meer.lwn.net>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 13 Jun 2022 16:12:26 -0400
Message-ID: <CAHC9VhTSzVH+jrYieE8WbRLGgkAR65jDX7qtATuFCQRSX+dSgg@mail.gmail.com>
Subject: Re: [PATCH] docs: selinux: add '=' signs to kernel boot options
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        patches@lists.linux.dev,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>, selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 13, 2022 at 3:23 PM Jonathan Corbet <corbet@lwn.net> wrote:
> Paul Moore <paul@paul-moore.com> writes:
>
> > I assumed the doc folks would have picked this up but I don't see it
> > in the tree so I'm going to pull it into the selinux/next tree right
> > now.  Thanks again Randy, I'm sorry for the delay.
>
> Sorry, the "doc folks" have learned that, in general, folks in the
> security subsystems prefer to carry their own patches upward, so I
> assumed this one was taken care of.  If you'd rather I picked up SELinux
> documentation patches, I'd be glad to do so.

Hi Jon,

I don't care much either way, as long as Linus' tree is correct I'm
happy.  In this particular case there were no changes under
security/selinux so I assumed that the "doc folks" would merge it; I
have similar assumptions regarding other subsystems when it comes to
SELinux adjacent patches.  However, we all know the old joke about
making assumptions, so I generally keep tracking those patches for a
while and apply them myself if the other subsystems do not.

Generally speaking, if I add an Acked-by for a patch I'm not expecting
to merge that patch (hence the ACK to let the other maintainer know
I'm okay with the patch).  Otherwise I'll merge the patch and send a
reply to the thread that it has been merged into the relevant SELinux
branch.

-- 
paul-moore.com
