Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6422AE7C5
	for <lists+linux-doc@lfdr.de>; Wed, 11 Nov 2020 06:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgKKFNz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 11 Nov 2020 00:13:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgKKFNy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Nov 2020 00:13:54 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA3E0C0613D1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 21:13:54 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id m13so696869pgl.7
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 21:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lqk9gT/atveM9k+VRBlwrhLK1Fp317eifcLejbxW1B4=;
        b=d8doHJA55o0L8EcvDtUW7FdbIj7wmRAuJdFB9sYpHR3X60GC4fdmD5B+p8PWDbCnZc
         uDij5LmLbttmsg/m2JU0G8+BhgbbBl5I3ZOqfStpMAc92fIQrlPOTJUy3OH/4wHIpXky
         ZHquWIbRNQJyMbLwyPNTGRsVDHB42vgs7niAyqb0W7GSY3RMEVV5JbxQvQ4SiWp1TQW6
         xm+jWul86uI7UFO0jNZB+KMkjynXGnxMcketYFCZc8NA8z3+T5YEcFf7qdCoL0YXnPBE
         xppjZVbWJAsRXwHPPIaTWuoYlUSCCnJFriuvFdIHV+WdXCRgHqP0pMLqH4rp/Tm5zuJX
         UkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lqk9gT/atveM9k+VRBlwrhLK1Fp317eifcLejbxW1B4=;
        b=WDR/uhtT6rYXf3UvGBwmoQVQZWnowbbvhNMiXpcpPlZp9hB48qVQIIrcKL9xc8uzhi
         4hb+NC1vEFINCxC9hR7ysZCeCVD6Bppky6oMO2JcJGK2jFuhMsbx2t05nBZzZPbF92vw
         c2RG2Sv8QUc2ZLm+huDU+WkCzClweN+z3wEDULj5L1ySLjuiudW0LIh0G5kWkUj+Zb8y
         YljkZM3yV2/coOp9YiaXE0NBfI2b9mNSk3jrUNe2sK9NLWqdjFnTKvlOVq/73o+w32h5
         bYAn+D6YoKeeXQBkHgeaJrO5/LgGMiZ1sJePnyt8T6VgcIdUOtisofdTIBVRYzbySCdP
         reow==
X-Gm-Message-State: AOAM532oj39pN0nOJ6q39riiW7KcVax/i8uioYaSW8zWUxSe6hHc6iyR
        5zrydJ7d+JLl76TakrFrPhtZIA==
X-Google-Smtp-Source: ABdhPJxK6tZBFKNGUjzN/V+ChoFoO0yc4BAsskNUkr3V7R4feNiLFOHZ/JxxbY0zB/NYWhWVM9sIyA==
X-Received: by 2002:a63:4747:: with SMTP id w7mr19848081pgk.56.1605071634450;
        Tue, 10 Nov 2020 21:13:54 -0800 (PST)
Received: from localhost ([122.172.12.172])
        by smtp.gmail.com with ESMTPSA id v126sm828115pfb.137.2020.11.10.21.13.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2020 21:13:52 -0800 (PST)
Date:   Wed, 11 Nov 2020 10:43:50 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Thomas Renninger <trenn@suse.de>
Cc:     Rafael Wysocki <rjw@rjwysocki.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: stats: Switch to ktime and msec instead of
 jiffies and usertime
Message-ID: <20201111051350.qxevqcca5775h2xa@vireshk-i7>
References: <0e0fb542b6f6b26944cb2cf356041348aeac95f6.1605006378.git.viresh.kumar@linaro.org>
 <1832747.5iOEhN7m9D@c100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1832747.5iOEhN7m9D@c100>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10-11-20, 13:53, Thomas Renninger wrote:
> Am Dienstag, 10. November 2020, 12:07:37 CET schrieb Viresh Kumar:
> > The cpufreq and thermal core, both provide sysfs statistics to help
> > userspace learn about the behavior of frequencies and cooling states.
> > 
> > This is how they look:
> > /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:1200000 399
>  
> > The results look like this after this commit:
> > /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state:1200000 3830
> 
> How would userspace know whether it's ms or 10ms?
> 
> whatabout a new file with the same convention as cooling devices (adding ms):

Keeping two files for same stuff is not great, and renaming the file
breaks userspace ABI. I am not sure what's the right thing to do here.

> > /sys/class/thermal/cooling_device0/stats/time_in_state_ms:state0 3888
> > /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state_ms:1200000 3830
> 
> Somewhat off-topic, some ideas:
> 
> I wonder how useful these stats still are.
> CPU_FREQ_STAT is off on my system:

I still use it.

> config CPU_FREQ_STAT
>         bool "CPU frequency transition statistics"
>         help
>           Export CPU frequency statistics information through sysfs.
> 
>           If in doubt, say N.
> 
> Iirc this was a module at former times?
> 
> commit 1aefc75b2449eb68a6fc3ca932e2a4ee353b748d
> Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Date:   Tue May 31 22:14:44 2016 +0200
> 
>     cpufreq: stats: Make the stats code non-modular
> 
> outlined 2 problems with cpufreq_stats being non-modular, but
> also seem to fix them up:
> ... and drop the notifiers from it
> Make the stats sysfs attributes appear empty if fast frequency
> switching is enabled...

I already fixed this recently and stats don't appear empty for fast
switch anymore.

-- 
viresh
