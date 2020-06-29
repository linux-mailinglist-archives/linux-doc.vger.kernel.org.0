Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE95820E126
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2020 23:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729223AbgF2Uwh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Jun 2020 16:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731349AbgF2TNY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Jun 2020 15:13:24 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F36C0086FD
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 02:55:32 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l2so13997932wmf.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 02:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LfaVHK95vP+/yqyPSsgOJ96CzY9z3S8IGFhM8d1JksE=;
        b=kQvFRp2JCmd6+CWcro1viq1NDZbcQv9QXvxVyS+hc5tHddsqQYQk7lFWuGFM+wLAWb
         0Mj3h23R6/dowPu/lo0Vo8jHCAyPBgh1OTB2rrKQBkT8Y8D7I+JI1OAH3OnoXii6MDbh
         nx7md3+03mL4EQdUjNWheQ+4NJcnnVEps8ShZdhsAqwODJA2rxxrCHtksxuMIm9kxLl5
         WDGMUj35pWLJxEHxpPTLQWvJX8U0iGBXmg6SjDN/D9KARgH5LqqQoVBBgndxNH5etBts
         cgPdp7PM5zn9sYE7VF7zerZt8LyMmO4keA94BFx7ItlgpkhocVTH9laEg29GIW5W8RMY
         /JUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LfaVHK95vP+/yqyPSsgOJ96CzY9z3S8IGFhM8d1JksE=;
        b=PigfnyyLtJ8cpVMdgEDnl2UcQP87Z9aXd1JArzsBJDALElzT/IfGcisllHQQJPHh3d
         yv+IbZE+q3BOGGcfnAfFTtuopFav5bRBcIBL5ThEYi6le90z4jHSy6t/E/zrUDYaWg/q
         VHui6ORHvMw47khIHF7LBGVEAUzYVyZ4+AdcyZIvsnEW35a9clHnu0Vy1Uh3Es3Wm1nA
         H5eaGgRwH18R49a3EfBhUm8ghryBkrW7xZHXDqPg188+gMFBuMy8iIrJDgdAVV6zRN7L
         Pn6SjEWVkQeusXQLMHMf9mzObWV0/kemYOMJOCh7T3hOrxgGae8z2R9lSjOS6M5rp0HQ
         iIZw==
X-Gm-Message-State: AOAM531VQrmB1Agd84mDbwp5NoZYKdRA2XYTJWKIDcZWyOIkmWC6rTDb
        P4cbxFpRq65i9EitcdCdGVh7uA==
X-Google-Smtp-Source: ABdhPJzJxBVIN7hpGpbilBwf8akgBE11lXjQGHA8rMwku6sqv13n9ShBOAAlVqTSAR4t6FB2yXe43w==
X-Received: by 2002:a1c:48e:: with SMTP id 136mr15305628wme.164.1593424531474;
        Mon, 29 Jun 2020 02:55:31 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id u84sm16341010wmg.7.2020.06.29.02.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 02:55:30 -0700 (PDT)
Date:   Mon, 29 Jun 2020 10:55:27 +0100
From:   Quentin Perret <qperret@google.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rafael Wysocki <rjw@rjwysocki.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        kernel-team@android.com, tkjos@google.com, adharmap@codeaurora.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 3/3] cpufreq: Specify default governor on command line
Message-ID: <20200629095527.GA1232873@google.com>
References: <cover.1593418662.git.viresh.kumar@linaro.org>
 <96b6e6ca02b664194ff3e57e1ec768fbc597bf38.1593418662.git.viresh.kumar@linaro.org>
 <20200629094452.GB1228312@google.com>
 <20200629094627.jh7pwhftcdqj6nhm@vireshk-i7>
 <20200629094825.GA1231692@google.com>
 <20200629095038.GB1231692@google.com>
 <20200629095423.xengjk5z2ezshrdb@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629095423.xengjk5z2ezshrdb@vireshk-i7>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Monday 29 Jun 2020 at 15:24:23 (+0530), Viresh Kumar wrote:
> On 29-06-20, 10:50, Quentin Perret wrote:
> > On Monday 29 Jun 2020 at 10:48:25 (+0100), Quentin Perret wrote:
> > > On Monday 29 Jun 2020 at 15:16:27 (+0530), Viresh Kumar wrote:
> > > > On 29-06-20, 10:44, Quentin Perret wrote:
> > > > > On Monday 29 Jun 2020 at 13:55:00 (+0530), Viresh Kumar wrote:
> > > > > >  static int __init cpufreq_core_init(void)
> > > > > >  {
> > > > > > +	struct cpufreq_governor *gov = cpufreq_default_governor();
> > > > > > +
> > > > > >  	if (cpufreq_disabled())
> > > > > >  		return -ENODEV;
> > > > > >  
> > > > > >  	cpufreq_global_kobject = kobject_create_and_add("cpufreq", &cpu_subsys.dev_root->kobj);
> > > > > >  	BUG_ON(!cpufreq_global_kobject);
> > > > > >  
> > > > > > +	if (!strlen(default_governor))
> > > > > 
> > > > > Should we test '!strlen(default_governor) && gov' here actually?
> > > > > We check the return value of cpufreq_default_governor() in
> > > > > cpufreq_init_policy(), so I'm guessing we should do the same here to be
> > > > > on the safe side.
> > > > 
> > > > With the current setup (the Kconfig option being a choice which
> > > > selects one governor at least), it is not possible for gov to be NULL
> > > > here. And so I didn't worry about it :)
> > > 
> > > Right, so should we remove the check in cpufreq_init_policy() then?
> > > I don't mind either way as long as we are consitent :)
> > 
> > And actually maybe we should remove the weakly defined
> > cpufreq_default_governor() implementation too? That'd make sure we get a
> > link-time error if for some reason things change in the Kconfig options.
> 
> That would be fine I believe. I will do all that in a separate patch
> then and let this series go through with no more changes :)

OK, that works for me.

Thanks!
Quentin
