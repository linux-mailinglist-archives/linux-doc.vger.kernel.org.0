Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01F134AD3BE
	for <lists+linux-doc@lfdr.de>; Tue,  8 Feb 2022 09:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349556AbiBHImf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Feb 2022 03:42:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236164AbiBHImf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Feb 2022 03:42:35 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86A6C03FEC0
        for <linux-doc@vger.kernel.org>; Tue,  8 Feb 2022 00:42:33 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id b5so6987873ile.11
        for <linux-doc@vger.kernel.org>; Tue, 08 Feb 2022 00:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FhfpJki+NNdkV0gRVxsiFBe0vxe4of82upgxXPZeRnU=;
        b=ltrv7fjxH8Z/MYJ+dFqSX07UsjFk0En2JVojwb07khT6GU/nljRY6ZcUw5XDkY2k9U
         10iCVy9Ac2BAJDuQFYo9S7tDIj3P9JKeZpva3KedKVwTgq/++kCs4tuecqGhtM8RyvXv
         mvjO6MjUYOeh3Eb7IF2GiKoupddeqo33NlX0dsBG/idvvizpFhLyoF6+Ck2Qi07i8O9m
         kuh39mSjp36sDeaM7WmQrV59O+OXMvNNFEcQADvyZ5Sp4fcVXuPGhcMOghBHacSXUKXf
         Zz7AOL9oylZsRdYSmJE8C0LTQ9L/alT7qztTD5bsEs2FMyshCXc9x3zGHrUcOn2yuILW
         p8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FhfpJki+NNdkV0gRVxsiFBe0vxe4of82upgxXPZeRnU=;
        b=UCJ1biJE5ACS/xMic9I3c63p0uICDN8lQ65W8uy68XIuo8Xypt3GzIVYw99WIEQOIx
         X67NhK5oOtjSDS3KuUCpOhMrqHbECMe0WHxmPpxIdMBPFSTq5HqcZAEsSuuS6hBu1zXi
         BAjjQzt611HqcNePBXmxmCyEvZXpdxdBZxOdHLBXpEVayml7W1fVls6YTr8f9cDyjgtw
         5+nf0QHpaidlR0wh/gYpPAVniET42GL6cIeh+cyD3CBnsaIeb3x25aVGcID/QxpfHKe/
         jDi2z6qcvHjf73OljtorxSrh79K1lIKoF7kLxE4+ru4HCTB2PRX2LFBDCd/vKOvtQU2C
         FbQQ==
X-Gm-Message-State: AOAM530nuN7znjQGR6GIIBp0ZDHjroqhimQDYb0hoEVVqPAkorxhM7PY
        L4y8aC8LR9kwvpsGrM3RsqVPTA==
X-Google-Smtp-Source: ABdhPJyYhd/AJxeDgLSOW7+qrTADVxq90CiyDTRHsiwwvVnqVHQOfXMPMVg1u68HTRArEl9IZnGDZQ==
X-Received: by 2002:a05:6e02:144c:: with SMTP id p12mr1713786ilo.182.1644309753034;
        Tue, 08 Feb 2022 00:42:33 -0800 (PST)
Received: from google.com ([2620:15c:183:200:5f31:19c3:21f5:7300])
        by smtp.gmail.com with ESMTPSA id r9sm7575223ill.52.2022.02.08.00.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 00:42:32 -0800 (PST)
Date:   Tue, 8 Feb 2022 01:42:28 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Michael Larabel <Michael@michaellarabel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        Holger =?iso-8859-1?Q?Hoffst=E4tte?= 
        <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>
Subject: Re: [PATCH v7 09/12] mm: multigenerational LRU: runtime switch
Message-ID: <YgIs9Ig7PMS8Lsw3@google.com>
References: <20220208081902.3550911-1-yuzhao@google.com>
 <20220208081902.3550911-10-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208081902.3550911-10-yuzhao@google.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 08, 2022 at 01:18:59AM -0700, Yu Zhao wrote:
> Add /sys/kernel/mm/lru_gen/enabled as a runtime switch. Features that
> can be enabled or disabled include:
>   0x0001: the multigenerational LRU
>   0x0002: the page table walks, when arch_has_hw_pte_young() returns
>           true
>   0x0004: the use of the accessed bit in non-leaf PMD entries, when
>           CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y
>   [yYnN]: apply to all the features above
> E.g.,
>   echo y >/sys/kernel/mm/lru_gen/enabled
>   cat /sys/kernel/mm/lru_gen/enabled
>   0x0007
>   echo 5 >/sys/kernel/mm/lru_gen/enabled
>   cat /sys/kernel/mm/lru_gen/enabled
>   0x0005
> 
> NB: the page table walks happen on the scale of seconds under heavy
> memory pressure. Under such a condition, the mmap_lock contention is a
> lesser concern, compared with the LRU lock contention and the I/O
> congestion. So far the only well-known case of the mmap_lock
> contention is Android, due to Scudo [1] which allocates several
> thousand VMAs for merely a few hundred MBs. The SPF and the Maple Tree
> also have provided their own assessments [2][3]. However, if the page
> table walks do worsen the mmap_lock contention, the runtime switch can
> be used to disable this feature. In this case the multigenerational
> LRU will suffer a minor performance degradation, as shown previously.

Clarified the potential impact from the mmap_lock contention as
requested here:
https://lore.kernel.org/linux-mm/YdwQcl6D5Mbp9Z4h@dhcp22.suse.cz/

<snipped>

> +static void lru_gen_change_state(bool enable)
> +{
> +	static DEFINE_MUTEX(state_mutex);
> +
> +	struct mem_cgroup *memcg;
> +
> +	cgroup_lock();
> +	cpus_read_lock();
> +	get_online_mems();
> +	mutex_lock(&state_mutex);
> +
> +	if (enable == lru_gen_enabled())
> +		goto unlock;
> +
> +	if (enable)
> +		static_branch_enable_cpuslocked(&lru_gen_caps[LRU_GEN_CORE]);
> +	else
> +		static_branch_disable_cpuslocked(&lru_gen_caps[LRU_GEN_CORE]);

Fixed the lockdep warning for memory hotplug:
https://lore.kernel.org/linux-mm/87a6g0nczg.fsf@linux.ibm.com/

<snipped>
