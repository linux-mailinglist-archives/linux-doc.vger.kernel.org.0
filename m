Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5B096C5B80
	for <lists+linux-doc@lfdr.de>; Thu, 23 Mar 2023 01:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjCWAoP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 22 Mar 2023 20:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjCWAoP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Mar 2023 20:44:15 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E5113D5B
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 17:44:12 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-541a05e4124so368936457b3.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 17:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20210112.gappssmtp.com; s=20210112; t=1679532251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAgegFFYRJFgMmY65gKMXq+08Wd+mNcD7wi9VXrXcSc=;
        b=Ie+0oAM/+OGZJIQfDwD/5CiFJTqW07sMYUm0MHX3naZyX8BRojLwhFRFRowA3lnfg1
         GKFcM0bl+h/e1UcA39V/AyelIfhi+GVD7zz9ReIlgCXrrcXJ7vUMJHRW6ZHzbiLERQwV
         3usiq3YhLV8HVO3XMtuWPQPEbupK67NyLfR/putVsVyjPfC0eYR9X+VNAF8Ff77oUqWs
         dTlekuFoBfwEEPybMpNaGJW1LPvab3Z5VOL/XD0wkQRWnBsnHeGxQqdmbZvG3aVy3mpd
         pjcGZuy4NR18V511prRV1TPMjLzmWRKNO5SnDCZPhqlbrD+qOfnZCbuqV6AtW7G8npfd
         ij7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679532251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KAgegFFYRJFgMmY65gKMXq+08Wd+mNcD7wi9VXrXcSc=;
        b=b/h58ZCdQkj7T11InPLWLpG3Iet30qWCTq6fJNh4Slz1sE4rx9s/tCwsuEoeWpcqYH
         Au9ZdixnIS29Xxn1tz5YkEbKDwQzHfujB0WvaWfnCjKiB/JhJySpc1QklmopuBJGpyBl
         ko0aTFIE+RywX2EHg7j1DrQB2PKNGGYvPk1BqHIUl8JfiKTpSKb8RSbeg5bvC6ozLB5u
         KLpEpOQ0LtiS8vqHExUwCjElSY1GIackjMhsHcrnUR9AtvKd+jPPxbCvAkt5CmZS9HEx
         JSHtL3xZvePFSVKMKJmHjmNav9KEZtCwMrnwfZLkYwAsBGMhZHqtafovtqGP/MaEEPaW
         cYcA==
X-Gm-Message-State: AAQBX9cvot39dLHHQXhAAIXnfYH9/iyBa9Ic6pkACOwsrsYM6fuYbk7V
        NeG74ZOvlvt51amrgsk0e+1t0BFsBQ9s6Q+PINQVWQ==
X-Google-Smtp-Source: AKy350YnUMB0sDfILYet1HARj1/7MAFHet+kh3sCbnCzmh5dcGDMyXy8fiPZHNmyE1WcCaO2EuUhSm3ybEYK6yEXz6k=
X-Received: by 2002:a81:4524:0:b0:545:1d7f:abfe with SMTP id
 s36-20020a814524000000b005451d7fabfemr903896ywa.7.1679532251795; Wed, 22 Mar
 2023 17:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230315223044.471002-1-kuba@kernel.org> <20230315183846.3eb99271@hermes.local>
In-Reply-To: <20230315183846.3eb99271@hermes.local>
From:   Jamal Hadi Salim <jhs@mojatatu.com>
Date:   Wed, 22 Mar 2023 20:44:00 -0400
Message-ID: <CAM0EoMmYMVPAAKwKNkxnWyYdm6-Xu3VwE56+ph3wH3f+ewE-aA@mail.gmail.com>
Subject: Re: [PATCH net-next] docs: networking: document NAPI
To:     Stephen Hemminger <stephen@networkplumber.org>
Cc:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
        netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        corbet@lwn.net, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 15, 2023 at 9:38=E2=80=AFPM Stephen Hemminger
<stephen@networkplumber.org> wrote:
>
> On Wed, 15 Mar 2023 15:30:44 -0700
> Jakub Kicinski <kuba@kernel.org> wrote:
>
> > Add basic documentation about NAPI. We can stop linking to the ancient
> > doc on the LF wiki.
> >
> > Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> > ---
> > CC: jesse.brandeburg@intel.com
> > CC: anthony.l.nguyen@intel.com
> > CC: corbet@lwn.net
> > CC: linux-doc@vger.kernel.org
>
> Older pre LF wiki NAPI docs still survive here
> https://lwn.net/2002/0321/a/napi-howto.php3

Feel free to use that doc or excerpts under whatever licence you want.
Other references:
https://www.usenix.org/legacy/publications/library/proceedings/als01/full_p=
apers/jamal/jamal.pdf
(good reference for most excellent diagrams!)
And some musings (still relevant today):
http://ftp.dei.uc.pt/pub/linux/kernel/people/hadi/docs/UKUUG2005.pdf

cheers,
jamal
