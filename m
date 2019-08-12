Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9C8189F1E
	for <lists+linux-doc@lfdr.de>; Mon, 12 Aug 2019 15:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbfHLNDO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 12 Aug 2019 09:03:14 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36654 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728651AbfHLNDN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Aug 2019 09:03:13 -0400
Received: by mail-pf1-f194.google.com with SMTP id r7so49661024pfl.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Aug 2019 06:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9PGFo0IOTBF0bIx7y/QxiVY31P4bvTcKQoBfJqZTG+w=;
        b=PwGI0wkwa6ZBvzJS2WowZtgp5DVi7QPH+BrB9p0HCfQcxpdzKqQgPTHdIAl3D1o9Ui
         UwguTSYRYWuAd3qrqhfjY+51MrRtaJizalVxHqxwXrlJqDBvavY40TWKCBgS4IeFRTPK
         AfF57tOE8WhINap7lLBY+lYVRyduY9cx0H4rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9PGFo0IOTBF0bIx7y/QxiVY31P4bvTcKQoBfJqZTG+w=;
        b=MuzcatDoeN1fGXcPRZ9hofTRkt3Kza8j1UaScEZKuZcAe0Naa95b1Kp9BCBvvRllX7
         chVfMi/SMQegTMiYSOJqMhtWGQ96N3LWw+TRwMYM1Qn5DhbkFOPcZy3H4hxWIpGATc+G
         ZW4SnBfOZHngTy6Hm2LvIiRtDDSJhNVrs9cegz5QYMFR2j1N52GfD+/Sv8XZL8+cAUed
         +1/ZINuDC3+pqYWajIg4GwQCVdDVm2cofo/hN0O8CKIu+Nr952wjpiDmfg5EjmktIsm7
         3bcBtMs/pkButA4BGfXPf3ZmUEJkRUAT4myLwnI9T42xFhSiWt3oE+AmBftr5PiQy8L1
         KdIA==
X-Gm-Message-State: APjAAAX5hFP9haAqZrtRw/UxxuSL+8etLEhquintZ3cpisdRoEAGcR7p
        EHwIRbolEgFmGlB45OA4apXtsA==
X-Google-Smtp-Source: APXvYqyz6EmE0iTkl3gZlNovk6A/dv0bMJdkggbBqQc3eqErF9H/OyeJ1CsBomxTPL6iok8vEgG0pQ==
X-Received: by 2002:a17:90a:ec07:: with SMTP id l7mr18571059pjy.39.1565614992605;
        Mon, 12 Aug 2019 06:03:12 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id o3sm25222103pje.1.2019.08.12.06.03.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 06:03:11 -0700 (PDT)
Date:   Mon, 12 Aug 2019 09:03:10 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, kbuild test robot <lkp@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 3/3] driver/core: Fix build error when SRCU and lockdep
 disabled
Message-ID: <20190812130310.GA27552@google.com>
References: <20190811221111.99401-1-joel@joelfernandes.org>
 <20190811221111.99401-3-joel@joelfernandes.org>
 <20190812050256.GC5834@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812050256.GC5834@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 12, 2019 at 07:02:56AM +0200, Greg Kroah-Hartman wrote:
> On Sun, Aug 11, 2019 at 06:11:11PM -0400, Joel Fernandes (Google) wrote:
> > Properly check if lockdep lock checking is disabled at config time. If
> > so, then lock_is_held() is undefined so don't do any checking.
> > 
> > This fix is similar to the pattern used in srcu_read_lock_held().
> > 
> > Link: https://lore.kernel.org/lkml/201908080026.WSAFx14k%25lkp@intel.com/
> > Fixes: c9e4d3a2fee8 ("acpi: Use built-in RCU list checking for acpi_ioremaps list")
> 
> What tree is this commit in?
> 
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > ---
> > This patch is based on the -rcu dev branch.
> 
> Ah...
> 
> >  drivers/base/core.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 32cf83d1c744..fe25cf690562 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -99,7 +99,11 @@ void device_links_read_unlock(int not_used)
> >  
> >  int device_links_read_lock_held(void)
> >  {
> > -	return lock_is_held(&device_links_lock);
> > +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> > +	return lock_is_held(&(device_links_lock.dep_map));
> > +#else
> > +	return 1;
> > +#endif
> 
> return 1?  So the lock is always held?

This is just the pattern of an assert that is disabled, so that
false-positives don't happen if lockdep is disabled.

So say someone writes a statement like:
WARN_ON_ONCE(!device_links_read_lock_held());

Since lockdep is disabled, we cannot check whether lock is held or not. Yet,
we don't want false positives by reporting that the lock is not held. In this
case, it is better to report that the lock is held to suppress
false-positives.  srcu_read_lock_held() also follows the same pattern.

thanks,

 - Joel

