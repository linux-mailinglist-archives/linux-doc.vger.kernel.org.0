Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2076E20E027
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2020 23:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731643AbgF2UnQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Jun 2020 16:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731633AbgF2TOD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Jun 2020 15:14:03 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2508C0086F6
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 02:50:43 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g75so14732105wme.5
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IXD7e4aEv7sgXUIWJkq0xUs1aBDV2xAaVnA6400SobQ=;
        b=CLgd6xmdcEKh0TYTp6bS2/cnN4ve6VpRHpjGNf1iI1fca4aR7317bHKFlRuZ9Wx2q6
         5agnn/14ytGl0Zc3TOng7wBjOUZXSXteNxxJwTw2NCavC0ZzZN8CaFmgPX49JPkVhUWL
         PFK5aaOWQuOkJT/BINyeAu1ZxoKKaJD9N3AOWGHjxna7hGelNbCEA2ApFp+EdFj3tjMa
         EcoY4RBXpeN1cp3atcfrD2v0mfB/sxZS/CrQID6YEV57FpKEIEgN20t1yY4GTxlShSdA
         WcqoXCviP51t0/2Z77vnIhZDuCmAZ8jBkpmkYnNPQIMaWW3Tkmc/z0xufzCR4jwBKR2E
         gHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IXD7e4aEv7sgXUIWJkq0xUs1aBDV2xAaVnA6400SobQ=;
        b=IoVTAMrR53bfHv5AWPUBXlxWaFwKU1iO+/JG8FgWAo20Cq9iKhkLgLNNZE+jE25XJN
         pL+D7hMAS7fop9I2uheZ4WfF2dXr+IKDMAoPlXEZ/Onv3MY+dBNm2u7j8V7osAA4SOil
         z7YTtrl5tuYjHgwpx7QfNP8PcHVXB81YZz+javRocOUFNh6js/ki+S8Ifi6PoWIk4Kes
         r2J4KPgh3xrZrwNaPEkx3qaP+U8ucsJstwJtH+s/V6wFZIsgLCu1JanGJrqcjPZwDrhd
         bsxwwb1FCfD/0E7uM13u0boAMXrCNlrIYIsvYTgC2FL9Wlp1Q19ELP+VwKhErRUa3azP
         q+Bg==
X-Gm-Message-State: AOAM531Nh/53qFQchi9C4QZp8cyMMtVOf31tVKp1MA3dKF+MOdCyqBQJ
        TGt+q8fG0h45rMn5ibqSmmsJcg==
X-Google-Smtp-Source: ABdhPJxMqPKSRyQRTa8e+1xxaRQXHveCNK3SVjkE6kDWmX2xGNysUBdu3iSx65dgB0uJZD4m0+GKlA==
X-Received: by 2002:a1c:ab84:: with SMTP id u126mr10979386wme.43.1593424242304;
        Mon, 29 Jun 2020 02:50:42 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id 138sm29835351wma.23.2020.06.29.02.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 02:50:41 -0700 (PDT)
Date:   Mon, 29 Jun 2020 10:50:38 +0100
From:   Quentin Perret <qperret@google.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rafael Wysocki <rjw@rjwysocki.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        kernel-team@android.com, tkjos@google.com, adharmap@codeaurora.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 3/3] cpufreq: Specify default governor on command line
Message-ID: <20200629095038.GB1231692@google.com>
References: <cover.1593418662.git.viresh.kumar@linaro.org>
 <96b6e6ca02b664194ff3e57e1ec768fbc597bf38.1593418662.git.viresh.kumar@linaro.org>
 <20200629094452.GB1228312@google.com>
 <20200629094627.jh7pwhftcdqj6nhm@vireshk-i7>
 <20200629094825.GA1231692@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629094825.GA1231692@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Monday 29 Jun 2020 at 10:48:25 (+0100), Quentin Perret wrote:
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

And actually maybe we should remove the weakly defined
cpufreq_default_governor() implementation too? That'd make sure we get a
link-time error if for some reason things change in the Kconfig options.

Thanks,
Quentin
