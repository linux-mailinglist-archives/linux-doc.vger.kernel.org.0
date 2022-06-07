Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30543532BD5
	for <lists+linux-doc@lfdr.de>; Tue, 24 May 2022 16:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237961AbiEXN7i (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 May 2022 09:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235198AbiEXN7h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 May 2022 09:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 525F68CB26
        for <linux-doc@vger.kernel.org>; Tue, 24 May 2022 06:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653400775;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2Ff+pshfC1Z6E3EzI0y8JRQ1REVK5W8crSBK2MgvYz0=;
        b=CPY9tM8sOjSxfzwTh7DEsSuHWWLbrhLWX/iqRSn1MdNdt6EJxKhOSCoLqqSSl3gemhEHbK
        t3Dz7DkZWAEtTC7RfPioiOQfvQjjR1vUCQgtIpZoMW7n8QaM6Gmmn7lnqVZDCa0/9PhDhj
        KTzNspw7a0zwd+Armo35R/J0iFl1BhY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-dNzN_8-uNNeVvrkQa5ME0A-1; Tue, 24 May 2022 09:59:33 -0400
X-MC-Unique: dNzN_8-uNNeVvrkQa5ME0A-1
Received: by mail-qk1-f200.google.com with SMTP id z13-20020a05620a100d00b006a3870a404bso4345457qkj.17
        for <linux-doc@vger.kernel.org>; Tue, 24 May 2022 06:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Ff+pshfC1Z6E3EzI0y8JRQ1REVK5W8crSBK2MgvYz0=;
        b=KdKFbOmZKakn/PZYryt5IgjFPG/kfZYmdhNL0cuT7OAoEdUfoXl2QgH4brQX7Q+v6W
         IVTR8z/ixwnCDbP6KD+y0yK1aoySVFTnzuchM5v0JeGYIztWCqpx+0RMOgK1RLxO2DVv
         xJb+dMX1Du20IN0562B5AwcC5pejrBQv+rNam3bLAichezEEgcUthBIlm6yXRls2DaJe
         NfePWP+cHyCnK7+d2oJnXEDxSQYLSQoTRaseXh8deupfctbl570HWl2lDY1EwA1e4cHG
         P/3Qwh1fBzHKkC75kSeERAxRH0iYy/dqCsLdsdZN7zlKlVkoXhhYqv4Yp+UwiDCauEfa
         lSpQ==
X-Gm-Message-State: AOAM533WWdg5eR1YNSuWeGH8A/qkCEGyB8ZOZw80FmCbick1lz0Da7S9
        8auMQXoD3iODAlFLWRsjwz+CQREsg31Imsg9FpBwzRhLFKG3qvYV+3OqkmTohnpz4uD9nSObAwb
        rK+jebCFaOTEN74oGycnVkSDMB1cCjDhwq6LJ
X-Received: by 2002:a05:620a:1981:b0:507:4a52:f310 with SMTP id bm1-20020a05620a198100b005074a52f310mr17389272qkb.611.1653400773156;
        Tue, 24 May 2022 06:59:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqS+yZK5ZzpIED7qcr754PYpaiBLoHFNyuZBNAopvk3ojwwBfdu204lMoxiDpi9ZmkpuCv+gT3j6X+c8inrO8=
X-Received: by 2002:a05:620a:1981:b0:507:4a52:f310 with SMTP id
 bm1-20020a05620a198100b005074a52f310mr17389243qkb.611.1653400772863; Tue, 24
 May 2022 06:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211029184500.2821444-1-mcgrof@kernel.org> <20211029184500.2821444-2-mcgrof@kernel.org>
 <87h75g0xbm.ffs@tglx>
In-Reply-To: <87h75g0xbm.ffs@tglx>
From:   Richard Fontana <rfontana@redhat.com>
Date:   Tue, 24 May 2022 09:59:22 -0400
Message-ID: <CAC1cPGz3ARW_H9cq6LY0_h3YXomMmSdVR1v1+xEYbshtK8Mvmw@mail.gmail.com>
Subject: Re: [PATCH v9 1/6] LICENSES: Add the copyleft-next-0.3.1 license
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Luis Chamberlain <mcgrof@kernel.org>, tj@kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
        akpm@linux-foundation.org, jeyu@kernel.org,
        Shuah Khan <shuah@kernel.org>, bvanassche@acm.org,
        dan.j.williams@intel.com, joe@perches.com, keescook@chromium.org,
        rostedt@goodmis.org, minchan@kernel.org,
        linux-spdx@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Goldwyn Rodrigues <rgoldwyn@suse.com>,
        Kuno Woudt <kuno@frob.nl>,
        Richard Fontana <fontana@sharpeleven.org>,
        copyleft-next@lists.fedorahosted.org,
        Ciaran Farrell <Ciaran.Farrell@suse.com>,
        Christopher De Nicolo <Christopher.DeNicolo@suse.com>,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Thorsten Leemhuis <linux@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 23, 2022 at 5:10 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Fri, Oct 29 2021 at 11:44, Luis Chamberlain wrote:
> > preferred. A summary of benefits why projects outside of Linux might
> > prefer to use copyleft-next >= 0.3.1 over GPLv2:
> >
> <snip>
> >
> > o copyleft-next has a 'built-in or-later' provision
>
> Not convinced that this is a benefit under all circumstances, but that's
> a philosopical problem. The real problem is this:
>
> > +Valid-License-Identifier: copyleft-next-0.3.1
>
> and
>
> > +11. Later License Versions
> > +
> > +    The Copyleft-Next Project may release new versions of copyleft-next,
> > +    designated by a distinguishing version number ("Later Versions").
> > +    Unless I explicitly remove the option of Distributing Covered Works
> > +    under Later Versions, You may Distribute Covered Works under any Later
> > +    Version.
>
> If I want to remove this option, then how do I express this with a SPDX
> license identifier?

Probably off-topic but: I think as things currently stand in SPDX you
would have to use an ad hoc LicenseRef- identifier to express the
entirety of copyleft-next-0.3.1 coupled with an amendment that sort of
strikes the later versions provision. This issue is also somewhat
relevant: https://github.com/spdx/spdx-spec/issues/153

FWIW, built-in 'or-later' clauses are actually common in copyleft open
source licenses; the GPL family is the oddity here. (Then again, the
whole idea of a downstream license upgradability option is sort of
unusual in the bigger scheme of things, but that's another topic.)

Richard

