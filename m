Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC20B20E14C
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2020 23:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgF2UyF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Jun 2020 16:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731320AbgF2TNT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Jun 2020 15:13:19 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54ECC0086F3
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 02:49:36 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a14so3114242pfi.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 02:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=908Q6F9vnpUpqdsRok1kJOp1UfdjYn7RTaPOk8rPa7s=;
        b=K4cV+eDGQe/ywLx7Hea34M9L4+o6jA1UwaGhOl2F1k1pKXHebEzIi00A3eXinUhHsj
         sfdCVjCMH1wW2m3aakI/L39gS9Vf9LN18trMVIuSY8Af7MqRA3OaF/S7qCIGv6AjoU7H
         JfIR6Uc7UOix3m7M29aFxSeunhIHWTzR1YsUO6HSPOgLjVl1iWX0VZcCgz9fyWVLdRYQ
         6MqF+7tU2ysTPv7iuuB2N7J64PQN1dQ2oDuGZAH5NPJw+MoUuBVmqlbyXDqzN5UvSuH9
         U6RGmJ0brDiyKDMgOAlhKKfsaN9XDGvrVCzqtujyoXGj3BZvfCpg+LZkyShKmRWeqs42
         7M6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=908Q6F9vnpUpqdsRok1kJOp1UfdjYn7RTaPOk8rPa7s=;
        b=LziX3ZZa2VlMFBpgLlThSbjA5vQOr88ht960hbDjtn2MlQiyIChOg/+egqzXJh2w6i
         Vi8xaYaUsDy39Z/TKKYTtWGYCYtt0RZ8faIZSi2CJq6wxxm4lh+LVylkaILKBK+8b2EG
         hrLU5di/Q8LgW7h+pTltdRgJvStV25WbHko5imaI9lni/mHm6ZAFZub5FG9Km7smh81Y
         hIBRP1uQVmjlPmACl7lZBYq2JP/iRD7Q7+OrRtN4j785P0lRwFlxvVvQFMsTb/D9Yq5R
         R+imbmLFR6nRSGfdRZjQDlo5v6E/sGpr4azdx1RrjI4hkuTdUX7NCG3BwsCIWuqTGd4K
         slDQ==
X-Gm-Message-State: AOAM531NXb2FQyBVrSPPVJnh1WLJ+aL+HDjviPc4sjkNfE4DBKwa6qL2
        zN9ELZQE5ZAlxeHGNSUlx/yAdw==
X-Google-Smtp-Source: ABdhPJyyHuSsstC2FkFfOBkBMG9TIg0jujD+uM29enO1mJksrpDaXWQfQdbhQ+75RZqx3mwwNae1IQ==
X-Received: by 2002:a62:27c6:: with SMTP id n189mr14078705pfn.277.1593424176363;
        Mon, 29 Jun 2020 02:49:36 -0700 (PDT)
Received: from localhost ([122.172.127.76])
        by smtp.gmail.com with ESMTPSA id g12sm5108745pfb.190.2020.06.29.02.49.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 02:49:35 -0700 (PDT)
Date:   Mon, 29 Jun 2020 15:19:34 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Quentin Perret <qperret@google.com>
Cc:     Rafael Wysocki <rjw@rjwysocki.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        kernel-team@android.com, tkjos@google.com, adharmap@codeaurora.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 3/3] cpufreq: Specify default governor on command line
Message-ID: <20200629094934.vbcprgimvywhfwk6@vireshk-i7>
References: <cover.1593418662.git.viresh.kumar@linaro.org>
 <96b6e6ca02b664194ff3e57e1ec768fbc597bf38.1593418662.git.viresh.kumar@linaro.org>
 <20200629094452.GB1228312@google.com>
 <20200629094627.jh7pwhftcdqj6nhm@vireshk-i7>
 <20200629094825.GA1231692@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629094825.GA1231692@google.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29-06-20, 10:48, Quentin Perret wrote:
> On Monday 29 Jun 2020 at 15:16:27 (+0530), Viresh Kumar wrote:
> > On 29-06-20, 10:44, Quentin Perret wrote:
> > > On Monday 29 Jun 2020 at 13:55:00 (+0530), Viresh Kumar wrote:
> > > >  static int __init cpufreq_core_init(void)
> > > >  {
> > > > +	struct cpufreq_governor *gov = cpufreq_default_governor();
> > > > +
> > > >  	if (cpufreq_disabled())
> > > >  		return -ENODEV;
> > > >  
> > > >  	cpufreq_global_kobject = kobject_create_and_add("cpufreq", &cpu_subsys.dev_root->kobj);
> > > >  	BUG_ON(!cpufreq_global_kobject);
> > > >  
> > > > +	if (!strlen(default_governor))
> > > 
> > > Should we test '!strlen(default_governor) && gov' here actually?
> > > We check the return value of cpufreq_default_governor() in
> > > cpufreq_init_policy(), so I'm guessing we should do the same here to be
> > > on the safe side.
> > 
> > With the current setup (the Kconfig option being a choice which
> > selects one governor at least), it is not possible for gov to be NULL
> > here. And so I didn't worry about it :)
> 
> Right, so should we remove the check in cpufreq_init_policy() then?
> I don't mind either way as long as we are consitent :)

We can get rid of that as well.

-- 
viresh
