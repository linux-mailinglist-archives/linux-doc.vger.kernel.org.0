Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3761048E468
	for <lists+linux-doc@lfdr.de>; Fri, 14 Jan 2022 07:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232800AbiANGuW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 14 Jan 2022 01:50:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbiANGuV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jan 2022 01:50:21 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664FAC061574
        for <linux-doc@vger.kernel.org>; Thu, 13 Jan 2022 22:50:21 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id v1so11248126ioj.10
        for <linux-doc@vger.kernel.org>; Thu, 13 Jan 2022 22:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/uAIslgp7ONq6Ddd5/X8dnsCVfeQok8EwfpuDdopIBA=;
        b=aelyoHTVyggA4VE8b2pomJTP4FTQJnMiNt3Yk6nHA5ZrfLep8xNJhn8NA4XTaiKpcd
         wjp1S1gFpg6TbmlWxDYoZV6LJ1KosYKL0I+yt2KHduWnx+2H/nOy6iQT6vYv3K6XEb9e
         +xPSOQE1hXMkQ0IV2yWwo1ebyvo2dS0Rik6/W++J4z9Q9pLS7i2vn6jXXy6YFDuc9D3E
         UOPZ6SySmvkuI3NeAjFS3vJ6jecQZMuaRCRL+EGWla/bQDyEDaXPeHS5R2Ba4MYT5QBy
         oJYMSj4gGV/3QWO9gZZYJKEVIXBeuC9GR+ardniSfG5ehuAMGPhNlaSU5RrZxgIWKlAA
         c9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/uAIslgp7ONq6Ddd5/X8dnsCVfeQok8EwfpuDdopIBA=;
        b=oy3kOk3GmxrG/C0AhzRNfaEUAgZa+IK6jxBAktOxMBoN+1hSuQG3omQldNb/R+hpRH
         vl69GopHIo4klloMM+lFiT6RNh2u2+uqLEGe/GA3hNvkYtaG1ZcYZSKdv75vyZNaNIdm
         3W9UBB8dCRBwm1t63atCdxg6MGqkVjU+z8e4bmXcPw/xWF6JVBYK0euRXj0HBqvROblo
         sAgFc0FiKBGR3eorGhjLnD9CPN8P9t2KOuJ8oEhLF1MhwSmQRPILpgf4cHS1bc0ftdT1
         Lw8g3Ww1oBhQcxEkdpGvJOLHaycmHI+xEV5bY9xTc1l3Ut6ErkxAmDhk+XS2sp+Xzg3P
         lVTQ==
X-Gm-Message-State: AOAM531FZoV2dX7Gvjnaf5DM1/6hrMzVMTfPJy7YF+Z/iv4Rp9SOR/BX
        nLyxDrF+YlCAtu2lwTyr5KohPA==
X-Google-Smtp-Source: ABdhPJyOWiBBNEtN/fpYQONgoCQeeIW6abrdFufzxfrdvPmlu6061PGP7cx2UON7MtXNbTIgq9KkJg==
X-Received: by 2002:a05:6602:2b0b:: with SMTP id p11mr3595653iov.116.1642143020636;
        Thu, 13 Jan 2022 22:50:20 -0800 (PST)
Received: from google.com ([2620:15c:183:200:2ee3:2c3c:a8c8:b1bf])
        by smtp.gmail.com with ESMTPSA id o5sm4261525iow.8.2022.01.13.22.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 22:50:20 -0800 (PST)
Date:   Thu, 13 Jan 2022 23:50:15 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>
Subject: Re: [PATCH v6 8/9] mm: multigenerational lru: user interface
Message-ID: <YeEdJxLdUaxEGBBP@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <20220104202227.2903605-9-yuzhao@google.com>
 <87a6g0nczg.fsf@linux.ibm.com>
 <YeCvd4UBPy27SYGZ@google.com>
 <877db2opve.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877db2opve.fsf@linux.ibm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 14, 2022 at 10:50:05AM +0530, Aneesh Kumar K.V wrote:
> Yu Zhao <yuzhao@google.com> writes:
> > On Thu, Jan 13, 2022 at 04:01:31PM +0530, Aneesh Kumar K.V wrote:
> >> Yu Zhao <yuzhao@google.com> writes:
> >> 
> >> > Add /sys/kernel/mm/lru_gen/enabled as a runtime kill switch.
> >> 
> >> Got the below lockdep warning while using the above kill/enable switch
> >> 
> >> 
> >> [   84.252952] ======================================================
> >> [   84.253012] WARNING: possible circular locking dependency detected
> >> [   84.253074] 5.16.0-rc8-16204-g1cdcf1120b31 #511 Not tainted
> >> [   84.253135] ------------------------------------------------------
> >> [   84.253194] bash/2862 is trying to acquire lock:
> >> [   84.253243] c0000000021ff740 (cgroup_mutex){+.+.}-{3:3}, at: store_enable+0x80/0x1510
> >> [   84.253340]
> >>                but task is already holding lock:
> >> [   84.253410] c000000002221348 (mem_hotplug_lock){++++}-{0:0}, at: mem_hotplug_begin+0x30/0x50
> >> [   84.253503]
> >>                which lock already depends on the new lock.
> >> 
> >> [   84.255933] Chain exists of:
> >>                  cgroup_mutex --> cpu_hotplug_lock --> mem_hotplug_lock
> >
> > Thanks. Will reverse the order between mem_hotplug_lock and
> > cgroup_mutex in the next spin.
> 
> It also needs the unlocked variant of static_key_enable/disable.

Right. This is what I have at the moment. Tested with QEMU memory
hotplug. Can you please give it try too? Thanks.

    cgroup_lock()
    cpus_read_lock()
    get_online_mems()

        if (enable)
            static_branch_enable_cpuslocked()
        else
            static_branch_disable_cpuslocked()

    put_online_mems()
    cpus_read_unlock()
    cgroup_unlock()
