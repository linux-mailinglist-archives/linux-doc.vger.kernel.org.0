Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88FAD4683A1
	for <lists+linux-doc@lfdr.de>; Sat,  4 Dec 2021 10:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384481AbhLDJkP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 4 Dec 2021 04:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384477AbhLDJkP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Dec 2021 04:40:15 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D04C061359
        for <linux-doc@vger.kernel.org>; Sat,  4 Dec 2021 01:36:50 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 133so4311075wme.0
        for <linux-doc@vger.kernel.org>; Sat, 04 Dec 2021 01:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Fa6xeDSp50/P8rOL+C54lxIGIVulHb+9yCsfNo1/Wpw=;
        b=FWWeWvzsX0lVcVoLsRisdgMqOjZy/JOgW6iYDCzNR3aS7WRsMEBPIai+ZFNIuMynAr
         BT2jMNkIswwTyxFGrp3xMLb/eXReYAVYgdBy/v3oHKfoEgRChUczwjAU2SBhL9tXhriA
         MJOvZgEQz3GgTo7U+U9Zs7ICijCpUjoRP6E8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Fa6xeDSp50/P8rOL+C54lxIGIVulHb+9yCsfNo1/Wpw=;
        b=JuJw6R6+GQGVHilAAEFmF0V03qpL5QZrck8Cg7SOEIBO6fWOgcNUcDNg5a2rxvbZHN
         rKctGrgTH1NqwsZgkjsExQyv0EakiedF7BoVWSMHU3oGWBGrKfhXWX5zASyiFjuQEQit
         Qt5pjaAUeawWhoeyxBNWBWfTUrwfT5mrAf/BZjjTu0gd3vf1DMDo1bQGTSCI2LkjACp0
         T//1Q09BhJzLkgvHt5hhl4t+wR5l8lSgDQIlu+uxh8MuAsdMH61t3YSztAFVCcg2gEjR
         rrhrooM5UB3ZUQyk4mb80T+xdFtVol4rsyqDWkPEhjcOYhwAvhtugCq8B0V25oF+y4EL
         T9kw==
X-Gm-Message-State: AOAM530r3aEQ00jDcl6zz4+USiyB65qD0qvZkGFEs6kmg9Rs3pJg8Aq0
        sCZNMQfnPnJXhTzmvWMe4AwxbA==
X-Google-Smtp-Source: ABdhPJwiOTmQCn38xCf3cLyyJfvN07htPUbre2qVQ4wfsE4L4QKy64fvmr02+djFj6Wlf0GKZ/75tw==
X-Received: by 2002:a7b:c301:: with SMTP id k1mr22029998wmj.36.1638610608329;
        Sat, 04 Dec 2021 01:36:48 -0800 (PST)
Received: from localhost ([2a01:4b00:8432:8a00:5ee4:2aff:fe50:f48d])
        by smtp.gmail.com with ESMTPSA id i17sm5622892wmq.48.2021.12.04.01.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 01:36:47 -0800 (PST)
Date:   Sat, 4 Dec 2021 09:36:46 +0000
From:   Chris Down <chris@chrisdown.name>
To:     Dan Schatzberg <schatzberg.dan@gmail.com>
Cc:     Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <guro@fb.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shakeel Butt <shakeelb@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Muchun Song <songmuchun@bytedance.com>,
        Alex Shi <alexs@kernel.org>,
        Wei Yang <richard.weiyang@gmail.com>,
        "open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" 
        <linux-mm@kvack.org>
Subject: Re: [PATCH] mm: add group_oom_kill memory event
Message-ID: <Yas2ro/NCDY+1n09@chrisdown.name>
References: <20211203162426.3375036-1-schatzberg.dan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211203162426.3375036-1-schatzberg.dan@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Dan Schatzberg writes:
>Our container agent wants to know when a container exits if it was OOM
>killed or not to report to the user. We use memory.oom.group = 1 to
>ensure that OOM kills within the container's cgroup kill
>everything. Existing memory.events are insufficient for knowing if
>this triggered:
>
>1) Our current approach reads memory.events oom_kill and reports the
>container was killed if the value is non-zero. This is erroneous in
>some cases where containers create their children cgroups with
>memory.oom.group=1 as such OOM kills will get counted against the
>container cgroup's oom_kill counter despite not actually OOM killing
>the entire container.
>
>2) Reading memory.events.local will fail to identify OOM kills in leaf
>cgroups (that don't set memory.oom.group) within the container cgroup.
>
>This patch adds a new oom_group_kill event when memory.oom.group
>triggers to allow userspace to cleanly identify when an entire cgroup
>is oom killed.
>
>Signed-off-by: Dan Schatzberg <schatzberg.dan@gmail.com>

Thanks! Acking with one minor point on the documentation front.

Acked-by: Chris Down <chris@chrisdown.name>

>---
> Documentation/admin-guide/cgroup-v2.rst | 4 ++++
> include/linux/memcontrol.h              | 1 +
> mm/memcontrol.c                         | 5 +++++
> mm/oom_kill.c                           | 1 +
> 4 files changed, 11 insertions(+)
>
>diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
>index 2aeb7ae8b393..eec830ce2068 100644
>--- a/Documentation/admin-guide/cgroup-v2.rst
>+++ b/Documentation/admin-guide/cgroup-v2.rst
>@@ -1268,6 +1268,10 @@ PAGE_SIZE multiple when read back.
> 		The number of processes belonging to this cgroup
> 		killed by any kind of OOM killer.
>
>+          oom_group_kill
>+                The number of times all tasks in the cgroup were killed
>+                due to memory.oom.group.

Maybe pedantic, but this reads as unclear to me whether in cgroup with 3 tasks 
we get the value "3" or "1" when a group kill occurs.

Maybe rephrase to not make be about tasks and just say "number of times a group 
OOM occurred"?
