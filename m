Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A988014A24B
	for <lists+linux-doc@lfdr.de>; Mon, 27 Jan 2020 11:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730126AbgA0Kzj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 27 Jan 2020 05:55:39 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20416 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726571AbgA0Kzj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jan 2020 05:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580122538;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=C5GoHU21tITOeLGcgSeI5DCMeKnGmZHyFA/f49KFvg0=;
        b=f3oZhnPuzps5Am2LaCzCkb4E3UhI9hSUAYy42buJLvfMh7E+6fSsaAJ+Wl6GHb6rHfGvcW
        9AGsiM7Cl0R461B5s2P+BduH+ZM9sJ7I6RjZ3ycAUpoA3VP8A2IqRun+cQwf80z/5WeoXD
        IkFi5FXt8eFwaVD/kZ0k6RE46+FJy3M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-6ckfxuRXPriZSTqy914unw-1; Mon, 27 Jan 2020 05:55:36 -0500
X-MC-Unique: 6ckfxuRXPriZSTqy914unw-1
Received: by mail-wm1-f72.google.com with SMTP id e12so1330369wma.7
        for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2020 02:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C5GoHU21tITOeLGcgSeI5DCMeKnGmZHyFA/f49KFvg0=;
        b=hX/gXlxysx6LqIdVgdi4SasjH/8L+cNmR8bqMpCEEKn1/xdd7PJQntzoIeTsE6Oh3H
         U0oTx0Gg6exUCYqkMuLOWT8SIXAaJzKZTLVymzrsfZMM0WmUxm0JbrVuy10olA2FL424
         74E87s2cKHFzR5feiRA+xDjewdis0lHqBiAiINy2DKJ6R16WZMkjYW1ue1b6IGqLoTB6
         IVTD/ak/UYEZfjR2GvKiVse8NUhnJ0FLZk/eWk1of5mK9rUaVlbTqJbHRUR7fjrfjtPS
         l0P8qY9MQ9uscZNECjmy0WC2vKUMlOJFdlGmnK7XaTh2rgHunmd1q4Gt8iFqpjOyBL/9
         SY6A==
X-Gm-Message-State: APjAAAWuJYP1R+UEdT/54T6tbX5WOanDE7mY/h/axwXquQwYskj2tnwG
        xqgSXU646u8bIl4HnhIqmd4RKjSbiaRppRxhnQqNsrUOETY8Of5gY5dNjN39N4q38v4DKpQfFlp
        grMYkKe7qIYbtmvSbnxQ=
X-Received: by 2002:adf:e58d:: with SMTP id l13mr21065268wrm.135.1580122535307;
        Mon, 27 Jan 2020 02:55:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxmXHDECwNyV4sc/J2dESQugTCA1QujhGGSTGYrOTm4ABN+g+mCYs8AGc58vXWnshCbjImijQ==
X-Received: by 2002:adf:e58d:: with SMTP id l13mr21065242wrm.135.1580122535083;
        Mon, 27 Jan 2020 02:55:35 -0800 (PST)
Received: from localhost (cpc111743-lutn13-2-0-cust844.9-3.cable.virginm.net. [82.17.115.77])
        by smtp.gmail.com with ESMTPSA id x14sm18076625wmj.42.2020.01.27.02.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 02:55:34 -0800 (PST)
Date:   Mon, 27 Jan 2020 10:55:33 +0000
From:   Aaron Tomlin <atomlin@redhat.com>
To:     Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc:     Grzegorz Halat <ghalat@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, ssaner@redhat.com, oleksandr@redhat.com,
        vbendel@redhat.com, kirill@shutemov.name,
        khlebnikov@yandex-team.ru, borntraeger@de.ibm.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Kees Cook <keescook@chromium.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 1/1] mm: sysctl: add panic_on_mm_error sysctl
Message-ID: <20200127105533.azrlz2ff73vrhg6n@atomlin.usersys.com>
References: <20200127101100.92588-1-ghalat@redhat.com>
 <063e702f-dc5f-b0ca-fe26-508a9f1e8e9a@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <063e702f-dc5f-b0ca-fe26-508a9f1e8e9a@I-love.SAKURA.ne.jp>
X-PGP-Key: http://pgp.mit.edu/pks/lookup?search=atomlin%40redhat.com
X-PGP-Fingerprint: 7906 84EB FA8A 9638 8D1E  6E9B E2DE 9658 19CC 77D6
User-Agent: NeoMutt/20180716-1637-ee8449
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon 2020-01-27 19:42 +0900, Tetsuo Handa wrote:
> On 2020/01/27 19:11, Grzegorz Halat wrote:
> > diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> > index def074807cee..2fecd6b2547e 100644
> > --- a/Documentation/admin-guide/sysctl/kernel.rst
> > +++ b/Documentation/admin-guide/sysctl/kernel.rst
> > @@ -61,6 +61,7 @@ show up in /proc/sys/kernel:
> >  - overflowgid
> >  - overflowuid
> >  - panic
> > +- panic_on_mm_error
> 
> Maybe panic_on_inconsistent_mm is better, for an MM error sounds too generic
> (e.g. is page allocation failure an error, is OOM killer an error,
> is NULL pointer dereference an error, is use-after-free access an error) ?

Fair enough; 'panic_on_inconsistent_mm' is more concise.

-- 
Aaron Tomlin

