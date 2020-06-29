Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B319E20E04F
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2020 23:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732346AbgF2Uo7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Jun 2020 16:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731585AbgF2TN7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Jun 2020 15:13:59 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F97C0086EC
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 02:44:58 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r12so15792352wrj.13
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 02:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ige0bLI228QBtpujPXwJLumrVk0AINfrstrNdcA8YTE=;
        b=VgKSnKwUGko3Ufn+PVIGXdWOFYC3GeRMX1JUUPmyLweEIpus3fNNVqIF8myZY7hlPE
         mr8DasZ/JN8K9fhWSlAQYeKQ/YmQ8PYVPaXy/H07HwRtbS2dhvX5wXjvO4nc/yDELJwe
         2TbfTcbgSB8q4MeYSkW0iafbaWGyYraCjuEn6v+4xx7kVYviV1W41/a8FGa6sOqE1S1y
         hH+nJ4gOdQXKp2UOwJD4PSyfxRiI7mNwIJEmAaFSwv5lky0FrvZF/mpAT/cbLZA49uD8
         SvtlG08UiwKF3810F0flrzRismFPAR2pXcJ41rA8pIxJwuidFTD83kZ9UeuHX5H/QFm2
         haew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ige0bLI228QBtpujPXwJLumrVk0AINfrstrNdcA8YTE=;
        b=S6oflnHVTTbOW8rJ7qNpf1Z1QyK04qBxAQqKaIS+6CRMgqbluyXN8ON8XAJmeHRspG
         IMIL7IQg0h6kGttHPhrAOxbc472l6tb8CytSEJjE5dzLS0WYzMA8q/GEx2Z7RCtao5b9
         gzggtzB2hPZG6/22d4VnhP8K2jsqYAjsrXVrgLLCtJuV9n43hWlR7iEBRvJBIWc1stPs
         X5oCCksudEkT52DvlidCUZd72+n/HRDvPWWBQLTNwgAc00fKTxJTNzwxINK+wAv43BI0
         3lBRYsFG/QGOYOeDss/jrREtFgZN+99I9T0gBpgphlgPLgUiWEYkYlx0iCfc/cg9DD/z
         ZiuA==
X-Gm-Message-State: AOAM530MhKdJnH8aA5533F2joxugaFxkalZodsl85Cw1egbtsnxzfN76
        hGvUjOjzXu2yYmXATAHOQ4BUNA==
X-Google-Smtp-Source: ABdhPJwHWrygg6BiK5fEk9EEnZAfF+5PYEBh9CUJkPtjUQ71I4bDVU2Q2M33ksNBJ9Sr+c3MY7lBAw==
X-Received: by 2002:adf:f38f:: with SMTP id m15mr14681272wro.173.1593423896894;
        Mon, 29 Jun 2020 02:44:56 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id 138sm29810979wma.23.2020.06.29.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 02:44:55 -0700 (PDT)
Date:   Mon, 29 Jun 2020 10:44:52 +0100
From:   Quentin Perret <qperret@google.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rafael Wysocki <rjw@rjwysocki.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        kernel-team@android.com, tkjos@google.com, adharmap@codeaurora.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 3/3] cpufreq: Specify default governor on command line
Message-ID: <20200629094452.GB1228312@google.com>
References: <cover.1593418662.git.viresh.kumar@linaro.org>
 <96b6e6ca02b664194ff3e57e1ec768fbc597bf38.1593418662.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96b6e6ca02b664194ff3e57e1ec768fbc597bf38.1593418662.git.viresh.kumar@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Monday 29 Jun 2020 at 13:55:00 (+0530), Viresh Kumar wrote:
>  static int __init cpufreq_core_init(void)
>  {
> +	struct cpufreq_governor *gov = cpufreq_default_governor();
> +
>  	if (cpufreq_disabled())
>  		return -ENODEV;
>  
>  	cpufreq_global_kobject = kobject_create_and_add("cpufreq", &cpu_subsys.dev_root->kobj);
>  	BUG_ON(!cpufreq_global_kobject);
>  
> +	if (!strlen(default_governor))

Should we test '!strlen(default_governor) && gov' here actually?
We check the return value of cpufreq_default_governor() in
cpufreq_init_policy(), so I'm guessing we should do the same here to be
on the safe side.

> +		strncpy(default_governor, gov->name, CPUFREQ_NAME_LEN);
> +
>  	return 0;
>  }
>  module_param(off, int, 0444);
> +module_param_string(default_governor, default_governor, CPUFREQ_NAME_LEN, 0444);
>  core_initcall(cpufreq_core_init);
> -- 
> 2.25.0.rc1.19.g042ed3e048af


Other than that, the whole series looks good to me.

Thanks,
Quentin
