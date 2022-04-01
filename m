Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A09014EFC11
	for <lists+linux-doc@lfdr.de>; Fri,  1 Apr 2022 23:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351717AbiDAVPq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 1 Apr 2022 17:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345759AbiDAVPp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Apr 2022 17:15:45 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C912527CB
        for <linux-doc@vger.kernel.org>; Fri,  1 Apr 2022 14:13:54 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id r127so3108862qke.13
        for <linux-doc@vger.kernel.org>; Fri, 01 Apr 2022 14:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1NBRp1HzbNCgKf7QFMBcsjXIZ9h5LA2zsVAhStlZGsU=;
        b=S3e9r2h5S/Lod35wzYRaK1L5GREWuQAVOTczCCvp+AvT9S37huY+EoFoDqDnnr6KOE
         N6e1yXaNF4QQVU8G9U/GULrvVAEC7yd+sEuCnVhhtnxImWTtkJnry6Mn85pnbyip6w0P
         VoBUATjnT3b1RpL+BsqSjYjyhZvg3WWi10vxawB6kHAkm2DkuEo8dhSfUn/QT/T6KGOY
         Dxc0HmB78YkJbJoJI12rAo3MJOChv+SEFUT6efmRoS4tPr8tFZK6tpnzR4DJ+hJI6F4B
         s+pNP7VlxTORg0K4n1IEq98avQdmm/GdYqZXPMXnfkFXpLjvwbp/RfpKhQgxN9hie8af
         gjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1NBRp1HzbNCgKf7QFMBcsjXIZ9h5LA2zsVAhStlZGsU=;
        b=dzB+3tfR+M4ue44O+PQvXBnWoY4rCdVOSVThDJgoe/aLJ+HwizH9mEfSUAt0NgajOP
         3JXgW+sr+VUQsBXIGTb5VfOyrdomn/ETJZPb9vw3gTgqQzn9O/vjBzaBznzJ3qOHopx3
         t704G+8VFo7C909RZmLln3DkwUKzRuodvoJWKMIt5djxkvO7Bp/yeq6aZLxL9P9CWVp3
         OFZ4t+eeyTgh1dkZOeFEAkCmLhlrAbme3CjkC7/cV3gUykrVyevsRRcP8eyMyynW6E0j
         xD5gvKyxoHIDjk7jV7JJIn5Xttg+hgbJjE8BTRRGxFM9Fpgo0Pu/f/NcSsl71ExmIbH8
         EhHw==
X-Gm-Message-State: AOAM532DiP0eFWlgLFLgbEQxWSF4YSAkc/fRQMcTWB2CB30CLVJvskpR
        +95A/KVmqIaA9Sk6AVnQSplz7A==
X-Google-Smtp-Source: ABdhPJyXBCMAL3/HZEBhemG6vUEMlJWBqz+syx/qm25d7BuxnWqjdHM8goVn8TL79Ikm/UjFgI9FZw==
X-Received: by 2002:a37:b984:0:b0:67f:64a2:313e with SMTP id j126-20020a37b984000000b0067f64a2313emr7725162qkf.3.1648847633352;
        Fri, 01 Apr 2022 14:13:53 -0700 (PDT)
Received: from localhost (cpe-98-15-154-102.hvc.res.rr.com. [98.15.154.102])
        by smtp.gmail.com with ESMTPSA id f19-20020a05620a409300b00680c933fb1csm2254822qko.20.2022.04.01.14.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 14:13:52 -0700 (PDT)
Date:   Fri, 1 Apr 2022 17:13:52 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Roman Gushchin <roman.gushchin@linux.dev>
Cc:     Yosry Ahmed <yosryahmed@google.com>,
        Michal Hocko <mhocko@kernel.org>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        Jonathan Corbet <corbet@lwn.net>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>
Subject: Re: [PATCH resend] memcg: introduce per-memcg reclaim interface
Message-ID: <YkdrEG5FlL7Gq2Vi@cmpxchg.org>
References: <20220331084151.2600229-1-yosryahmed@google.com>
 <YkXkA+Oh1Bx33PrU@carbon.dhcp.thefacebook.com>
 <CAJD7tkYVpnf1+sa9vRAQCw5H0LUH6zE6_yhNAFwKF3sW0BLzEA@mail.gmail.com>
 <YkdG4nv/uKI0EtMp@carbon.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkdG4nv/uKI0EtMp@carbon.dhcp.thefacebook.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 01, 2022 at 11:39:30AM -0700, Roman Gushchin wrote:
> The interface you're proposing is not really extensible, so we'll likely need to
> introduce a new interface like memory.reclaim_ext very soon. Why not create
> an extensible API from scratch?
> 
> I'm looking at cgroup v2 documentation which describes various interface files
> formats and it seems like given the number of potential optional arguments
> the best option is nested keyed (please, refer to the Interface Files section).
> 
> E.g. the format can be:
> echo "1G type=file nodemask=1-2 timeout=30s" > memory.reclaim

Yeah, that syntax looks perfect.

But why do you think it's not extensible from the current patch? We
can add those arguments one by one as we agree on them, and return
-EINVAL if somebody passes an unknown parameter.

It seems to me the current proposal is forward-compatible that way
(with the current set of keyword pararms being the empty set :-))
