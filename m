Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98C04AEB3E
	for <lists+linux-doc@lfdr.de>; Wed,  9 Feb 2022 08:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234535AbiBIHit (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Feb 2022 02:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238476AbiBIHir (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Feb 2022 02:38:47 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928D8C05CB82
        for <linux-doc@vger.kernel.org>; Tue,  8 Feb 2022 23:38:51 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id k17so1549248plk.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Feb 2022 23:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A7moO6TkWuZd8WQdT04YbPTaZYf9v5wim/a38Dn6kdU=;
        b=d7OY/fw7ZyhqzU2siPVnMH2MTqK8RfIIThY4XV8/L7Zqc8FAjRbEGUf97eHrHtJ2jZ
         cVn4ySmLnUxoNuhyFTYlVQTiBtIRKeE/xV8gSA4A3hVCPxO8bGpQlQ5oeB6j68MVu9in
         W7do93yqrY+rjx/eOZ1OwuXeCvBsesJ5aPMBB/pSypJmrAsgOMExGCGnJMgpSgBGKg6B
         hemFbHx3bg+KLJEQfmmxI8j2sjHpyiksRSq0B+Y5JFHGPf1kWzTQ5xcT9+SbXo3urkl1
         VeQvsjBKTl9j7WiLVt0GjbnXQatn32ucPoXbxJjsZ2JB02WGlCqmdDCmjXEEqrTMeUdL
         Lqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A7moO6TkWuZd8WQdT04YbPTaZYf9v5wim/a38Dn6kdU=;
        b=IA7SjSGFxVYI5627CDaGrcQjGMRpMaGM7DgY0kB2yDi+AUKDeM3aaX2SvjBpABCiah
         1wu9v0CS3X/vFuIWbIkNnWP28U7tOhQDHeEHmesft5UsxENM8t3ukjOW7zsT6k4Z0U2N
         msk1kXFmhFkgVnhlyyz3BShb76EzFTwlonAX/LckUhZY1B9G2MqKPsJ6Aphz2JVAeV9b
         Zrnyip2wDP0UODLUlgPWM3pR/1heICUjUxMJtpQi1rtnc0Ta2Dkq4rE2D96cyT/3xysr
         ia96qGWLN4a/U4YmpoZLUOMB0D/bCCyqFxQ6N2id2KMjoOuTBqN0WvK/3oULT7G6CU9h
         2PUg==
X-Gm-Message-State: AOAM5316LH+t9hJeBHLw0xbL4nXLSRgOTXqEJzoawxkEWJSbcMDJ18vn
        2JZXVvTNclHABcs6pbYn4H3bcQ==
X-Google-Smtp-Source: ABdhPJwaHUcuH3/iB+RVY+2+ujvOxUJ62MobtGVMVgxN9chRjzARE3UPH2rR78bDdpNHQisBGcwZ1Q==
X-Received: by 2002:a17:90b:2243:: with SMTP id hk3mr2024689pjb.244.1644392331056;
        Tue, 08 Feb 2022 23:38:51 -0800 (PST)
Received: from localhost ([136.185.132.167])
        by smtp.gmail.com with ESMTPSA id c4sm6075144pfl.131.2022.02.08.23.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 23:38:50 -0800 (PST)
Date:   Wed, 9 Feb 2022 13:08:48 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Lukasz Luba <lukasz.luba@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cpufreq: qcom-hw: Delay enabling throttle_irq
Message-ID: <20220209073848.os3i7unf2qw3un3i@vireshk-i7>
References: <20220128032554.155132-1-bjorn.andersson@linaro.org>
 <20220128032554.155132-2-bjorn.andersson@linaro.org>
 <5433250b-ee51-06e0-3ef8-ab287a112611@arm.com>
 <YfQ2WEiqV30PGNrt@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfQ2WEiqV30PGNrt@ripper>
User-Agent: NeoMutt/20180716-391-311a52
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28-01-22, 10:30, Bjorn Andersson wrote:
> On Fri 28 Jan 02:39 PST 2022, Lukasz Luba wrote:
> > On 1/28/22 3:25 AM, Bjorn Andersson wrote:
> > > In the event that the SoC is under thermal pressure while booting it's
> > > possible for the dcvs notification to happen inbetween the cpufreq
> > > framework calling init and it actually updating the policy's
> > > related_cpus cpumask.
> > > 
> > > Prior to the introduction of the thermal pressure update helper an empty
> > > cpumask would simply result in the thermal pressure of no cpus being
> > > updated, but the new code will attempt to dereference an invalid per_cpu
> > > variable.
> > 
> > Just to confirm, is that per-cpu var the 'policy->related_cpus' in this
> > driver?
> > 
> 
> Correct, we boot under thermal pressure, so the interrupt fires before
> we return from "init", which means that related_cpus is still 0.

Just to clarify here a bit, policy->related_cpus is already allocated at this
point of time. AFAICT, the dereferencing of the invalid per-cpu variable refers
to the per-cpu freq_factor in arch_topology.c, which happens because the cpumask
isn't initialized yet.

-- 
viresh
