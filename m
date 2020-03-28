Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B323196991
	for <lists+linux-doc@lfdr.de>; Sat, 28 Mar 2020 22:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbgC1Vqp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 28 Mar 2020 17:46:45 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37914 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbgC1Vqp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Mar 2020 17:46:45 -0400
Received: by mail-ot1-f65.google.com with SMTP id t28so13857978ott.5
        for <linux-doc@vger.kernel.org>; Sat, 28 Mar 2020 14:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nPXNxsOZ3C7pRcm5mKIgZGPNm3UgML/++VJMRLMb3AI=;
        b=qTskBs0YmHh+tZEs84jHvRBn/43ZsP4wf1/5WCdmRZJ0AsdWtvM4X04ADXXYAcSi8J
         iLeuHFAS97j2PhIz3A+o9X0tQ/qo19nMFjGDx6kweTbNWQ50pCz+FFZgDHYxQEo+Bf8I
         KKUuqmBa53G1zkdO2LnPVx68/t2Gv3WUSP5Bks4cKmZuNLvUKbX4MoFxbGSp4N1a6BzK
         etcXqxEdv4quoP2Hoh5SAao+bAcBWdrE3l+d7oJgXG6uYq5vqlxRy3VS6HN7x0VDW6fR
         E1+45JyNk1fHKvAP1+4FzhLZHmRRJ3WLvm2JmPvMcfbDLCdja5/kOaJcDfF4c8pPwly9
         xgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nPXNxsOZ3C7pRcm5mKIgZGPNm3UgML/++VJMRLMb3AI=;
        b=qKbPARouxHSL9aLMgkEpp1QrIjmNW3U1d8JB8hzsG3TsV9RbjoLR2jQRLOFJkWC2SL
         vEIScQ5ZBF5mbK7pViw81Ro2ZP1qaMRB0Jv0dkz1QTETfar4PmSCTqJhZi0UKY3R0y3Z
         XUULeMChQN0B+/05bXeC539kov8K3lfICFVA8QvzkBvbh6uu1NhaGL23BFia+kLq0XRU
         D47CCuak3XbpkYHEGnq12l0BTfQ3lrzi7lMWNBXUC46Wh3DIcunEdt0jbctP6nTtlfXl
         g6v8JbrAfrIJiQ+LVVBZ2Bvi/UotfndZ8TeLmC0fzbz4roI1xdD4rvblSaJAzYMeE/7E
         /3Kg==
X-Gm-Message-State: ANhLgQ2bbJmmrQF1OcVJcrjR2cZkX6nX7jjp1lXY7J0hPb0HXKxE5c5x
        9BXAboLwLxOgrzcrQYnVfzONqOuMcAWYCeD6WV/wBQ==
X-Google-Smtp-Source: ADFU+vvO4/e4aHB57owXkNgpgc4HV0D0tikOOK0ubtXnhm0OhkMPch3zJcOJ9Q4m/i7MsgSphG9JBcOGlz6Ynv6bL7Q=
X-Received: by 2002:a9d:42f:: with SMTP id 44mr3947412otc.236.1585432003872;
 Sat, 28 Mar 2020 14:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200327170132.17275-1-grant.likely@arm.com> <CAGETcx8CJqMQaHBj1r5MhNBTw7Smz4BRHPkB0kCUCJPSmW6KwA@mail.gmail.com>
 <2885b440-77a5-f2be-7524-d5fba2b0c08a@arm.com> <CAGETcx_0=W6P_Zf-6fvDfncXUrPvt31bf6de-RWwHaXtwJizmQ@mail.gmail.com>
 <20200328110351.4e50491e@lwn.net>
In-Reply-To: <20200328110351.4e50491e@lwn.net>
From:   Saravana Kannan <saravanak@google.com>
Date:   Sat, 28 Mar 2020 14:46:07 -0700
Message-ID: <CAGETcx_Y-S=tAZiiymB2qWdx0uKzoDnGcmPoOr8EkOUsi6A0mg@mail.gmail.com>
Subject: Re: [PATCH] Add documentation on meaning of -EPROBE_DEFER
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Grant Likely <grant.likely@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, nd@arm.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Mar 28, 2020 at 10:03 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Fri, 27 Mar 2020 16:55:34 -0700
> Saravana Kannan <saravanak@google.com> wrote:
>
> > > > The infinite loop is a current implementation behavior. Not an
> > > > intentional choice. So, maybe we can say the behavior is undefined
> > > > instead?
> > >
> > > If you feel strongly about it, but I don't have any problem with
> > > documenting it as the current implementation behaviour, and then
> > > changing the text if that ever changes.
> >
> > Assuming Greg is okay with this doc update, I'm kinda leaning towards
> > "undefined" because if documented as "infinite loop" people might be
> > hesitant towards removing that behavior. But I'll let Greg make the
> > final call. Not going to NACK for this point.
>
> FWIW, kernel developers have to cope with enough trouble from "undefined
> behavior" already; I don't think we should really be adding that to our
> own docs.  We can certainly document the infinite loop behavior as being
> not guaranteed as part of the API if we're worried that somebody might
> start to rely on it...:)

Ok, all of you have convinced me of the error of my ways. :)

Thanks,
Saravana
