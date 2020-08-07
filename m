Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A863523F2C6
	for <lists+linux-doc@lfdr.de>; Fri,  7 Aug 2020 20:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgHGSba (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 7 Aug 2020 14:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgHGSb2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Aug 2020 14:31:28 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F923C061757
        for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2020 11:31:28 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id t4so2585189iln.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2020 11:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ow/n+p5v9AzYTA+9JReZiErGOMiITrcf1jfAhTavps8=;
        b=d/TLBHsbUxJim9gdd6Ilv6C2+IoLB5KGJSQKC8Y7rBSGC//gc3mJa8d+nyjASUx6Ld
         /Sap8yf2yTNMWrWQguBMFeBDe457yQgWGC1T1RXw2xz8rd6dATNB/I6tYOvkkueY3fQB
         ut599aJHWiP0JG0noR7f1MkiPe0AeqXyYCwUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ow/n+p5v9AzYTA+9JReZiErGOMiITrcf1jfAhTavps8=;
        b=uTtF3XPvzVxIvziBx2+E/9iCLpoCQA+LIBMumrq8WFC0zfgiPW0FxmsNv0RR+pYXzZ
         XzD9NLG9nC9MEdHPEENpLNsTcBZWTdflnKjMeii0gxlbChLYmyXG6UVDPe+jQ7G4qj2W
         oXEWysZQ/loLRj8UbVFbEhSvJvPlJ3xyX9lUsyO0NAe1CaMwAw+Z4G7EQ44wTPmWKuO/
         ZECoPhmdR/DoSPgsK5KBdAUjZKdAKQU0COYqKnDx9YoYWdpZM4pHwPMyGjB1GmtM8oJD
         97v/VWv/E/4S5pb8EQhPZPyVfLdzj+Y5JOntXKgAzjTIfdjEAsbD+W9eAqTdV8plBsO4
         AnoQ==
X-Gm-Message-State: AOAM5303oHF02Y4p4+qn6EyYDNU7Oi3a7ByEsjPvNjHJI1hECovU4Ms5
        rFmCXpeQT9OxOthhBTpVp+vYuRdpbuQZFmlhdoLWAg==
X-Google-Smtp-Source: ABdhPJy8Y0pVCBFunfYxLQ12k7YK8BWag29BNhppx9OX5t9Bt5CkoRs73Za0PwiTyL4uNOvTk/9RI6PwxpJZBtDtM9Q=
X-Received: by 2002:a92:cb06:: with SMTP id s6mr5997240ilo.13.1596825087854;
 Fri, 07 Aug 2020 11:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200807170722.2897328-1-joel@joelfernandes.org>
In-Reply-To: <20200807170722.2897328-1-joel@joelfernandes.org>
From:   Joel Fernandes <joel@joelfernandes.org>
Date:   Fri, 7 Aug 2020 14:31:16 -0400
Message-ID: <CAEXW_YSCjELpkFUoX=kNvrkPvU-mDwv50Bbu=MZmbKa8=+BbYw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] option-subject: RCU and CPU hotplug checks and docs
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Davidlohr Bueso <dave@stgolabs.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        rcu <rcu@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        Thomas Glexiner <tglx@linutronix.de>,
        Vineeth Pillai <vineethrp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 7, 2020 at 1:07 PM Joel Fernandes (Google)
<joel@joelfernandes.org> wrote:
>
>
> This series improves/adds to RCU's warnings about CPU hotplug and adds
> documentation and testing.
>
> v3->v4: Minor cleanups.
>
> Joel Fernandes (Google) (5):
> rcu/tree: Add a warning if CPU being onlined did not report QS already
> rcu/tree: Clarify comments about FQS loop reporting quiescent states
> rcu/tree: Make FQS complaining about offline CPU more aggressive
> rcutorture: Force synchronizing of RCU flavor from hotplug notifier
> docs: Update RCU's hotplug requirements with a bit about design

Apologies that the cover-letter subject has the weird 'option-subject'
in it.  Likely my git-send script misunderstood one of my markers.

thanks,

 - Joel
