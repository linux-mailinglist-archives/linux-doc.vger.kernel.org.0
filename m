Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A57D5EE026
	for <lists+linux-doc@lfdr.de>; Wed, 28 Sep 2022 17:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234224AbiI1PWt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Sep 2022 11:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233765AbiI1PW1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Sep 2022 11:22:27 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F4CB7EF8;
        Wed, 28 Sep 2022 08:21:20 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so2731011pjq.3;
        Wed, 28 Sep 2022 08:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=+WEGG8bdhAe2IeIV7nqdCMLjsT+NYXr3vPeV8ohPUdo=;
        b=NWQyIQIxOLBbO8SUWUFvnbiVWQh98VMz4aaF7yBvntNeo0lhVe58k8UbVlT21ceSy3
         N73J25O0TqMb7/Thn4zweOWpAI5H0J0ntIKpBQEAuOKdh6FgK1uAI485b6iHqcWhI1Pl
         bo4Rx9klC7pi4nz6dh5u3ntQhBZe+lpNuMRyBggNRNpyvKDUds8WsQLcy/KE+8aJLfWQ
         iRlwAUj5xdkEv8czArv0Qq0NY/vLa4Ty7E6RWatQOK91Alq1xvljZFnjyb1DOCEtMwSs
         2qMFu7mVUL95Ss/7LqKnn37AkHMHMy2RYH+POfMXUwH6+T16znqYpIEGsYIdmODza/xY
         3F5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=+WEGG8bdhAe2IeIV7nqdCMLjsT+NYXr3vPeV8ohPUdo=;
        b=XwZSCfNUFHbU00EAu/hbFYy/iceQDNAJ47l1BriEZwO4zS0edl0FGdt+nFT1ZbZpcd
         iIv3fRh7LNQsq9ePt310xOtV6B0FlqTZzw2JWE8avuMq/btG059JlddjYuZaOu65fmUI
         bg4jYKRogW2L2j10clQ136flthH9PaXJAtm4rGF6SFxs9mvwNXDNmqi6Uc/T02f6jlwU
         zvSTcp+TijAoF3+OThokN2Dg3GjUXByJSB6NL90t2BubtCQkcNwJU4MtMTrJ/lQQqwb3
         xYVrVjNNly1T2UaG+yQ62T5XOl4Ev/Qnlkm0Qrst/Z+n5lmLYLltQo9H8Bu5YuMrtUVv
         iIHQ==
X-Gm-Message-State: ACrzQf3PBL5QLlV9KgFHSobglYrr9UlYRIQ1LLKCvBCL6jW2f9pgWEZ5
        q0J1eC7Vw62C/wVGaqxwSE4=
X-Google-Smtp-Source: AMsMyM5mMWhYz3X1436kKEvjTcv3eDyNmzU671ZYKCbUm/02hn0itjtfv1akLF+RCA7rJZzYyQPCdw==
X-Received: by 2002:a17:90a:2fc9:b0:202:5605:65ae with SMTP id n9-20020a17090a2fc900b00202560565aemr11170445pjm.167.1664378479610;
        Wed, 28 Sep 2022 08:21:19 -0700 (PDT)
Received: from hyeyoo ([114.29.91.56])
        by smtp.gmail.com with ESMTPSA id y2-20020a170902864200b0016c0c82e85csm3784367plt.75.2022.09.28.08.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:21:17 -0700 (PDT)
Date:   Thu, 29 Sep 2022 00:21:10 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     Alexander Atanasov <alexander.atanasov@virtuozzo.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Roman Gushchin <roman.gushchin@linux.dev>, kernel@openvz.org,
        Kees Cook <keescook@chromium.org>,
        Roman Gushchin <guro@fb.com>, Jann Horn <jannh@google.com>,
        Vijayanand Jitta <vjitta@codeaurora.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v2] mm: Make failslab writable again
Message-ID: <YzRmZlJBFA9HIlSM@hyeyoo>
References: <20220920121111.1792905-1-alexander.atanasov@virtuozzo.com>
 <Yyr1xONdw8dBgsKr@hyeyoo>
 <30063d97-69f0-bea2-9d59-108140995bfc@virtuozzo.com>
 <YzJIsFZQoCEYntvR@hyeyoo>
 <7640a2d9-a32d-2fd7-8f64-586edb9b781e@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7640a2d9-a32d-2fd7-8f64-586edb9b781e@virtuozzo.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 27, 2022 at 10:44:20AM +0300, Alexander Atanasov wrote:
> Hello,
> 
> On 27.09.22 3:49, Hyeonggon Yoo wrote:
> > On Fri, Sep 23, 2022 at 10:34:28AM +0300, Alexander Atanasov wrote:
> > > Hello,
> > > 
> > > On 21.09.22 14:30, Hyeonggon Yoo wrote:
> > > > On Tue, Sep 20, 2022 at 03:11:11PM +0300, Alexander Atanasov wrote:
> > > > > In (060807f841ac mm, slub: make remaining slub_debug related attributes
> > > > > read-only) failslab was made read-only.
> > > > > I think it became a collateral victim to the two other options for which
> > > > > the reasons are perfectly valid.
> > > > > Here is why:
> > > > >    - sanity_checks and trace are slab internal debug options,
> > > > >      failslab is used for fault injection.
> > > > >    - for fault injections, which by presumption are random, it
> > > > >      does not matter if it is not set atomically. And you need to
> > > > >      set atleast one more option to trigger fault injection.
> > > > >    - in a testing scenario you may need to change it at runtime
> > > > >      example: module loading - you test all allocations limited
> > > > >      by the space option. Then you move to test only your module's
> > > > >      own slabs.
> > > > >    - when set by command line flags it effectively disables all
> > > > >      cache merges.
> > > > 
> > > > Maybe we can make failslab= boot parameter to consider cache filtering?
> > > > 
> > > > With that, just pass something like this:
> > > > 	failslab=X,X,X,X,cache_filter slub_debug=A,<cache-name>>
> > > 
> > > > Users should pass slub_debug=A,<cache-name> anyway to prevent cache merging.
> > > 
> > > It will be good to have this in case you want to test cache that is used
> > > early. But why push something to command line option only when it can be
> > > changed at runtime?
> > 
> > Hmm okay. I'm not against changing it writable. (it looks okay to me.)
> 
> Okay. Good to know that.
> 
> > Just wanted to understand your use case!
> > Can you please elaborate why booting with slub_debug=A,<your cache name>
> > and enabling cache_filter after boot does not work?
> 
> I didn't say it does not work - it does work but requires reboot. You may
> want to test variations of caches for example. Cache A, Cache B ... C and so
> on one by one. Reboots might be fast these days with VMs but you may not be
> able to test everything in a VM. And ... reboots used to be the signature
> move of one Other OS.

Thank you for elaboration!
Makes sense.

> 
> > Or is it trying to changnig these steps,
> > 
> > FROM
> > 	1. booting with slub_debug=A,<cache name>
> > 	2. write to cache_filter to enable cache filtering
> > 	3. setup probability, interval, times, size
> > 
> > TO
> > 
> > 	1. write to failslab attribute of <cache name> (may fail it has alias)
> > 	2. write to cache_filter to enable cache filtering
> > 	3. setup probability, interval, times, size
> > ?
> > 
> > as you may know, SLAB_FAILSLAB does nothing whens
> > cache_filter is disabled, and you should pass slub_debug=A,<cache name> anyway
> 
> Okay , i think there awaits another problem:
> bool __should_failslab(struct kmem_cache *s, gfp_t gfpflags)
> {
> ...
> 
>         if (failslab.cache_filter && !(s->flags & SLAB_FAILSLAB))
>                 return false;
> ...
> 	return should_fail(&failslab.attr, s->object_size);
> }
> 
> So if you do not have cache_filter set ... you go to should_fail for all
> slabs.

Yes.

> I've been hit by that and spend a lot of time trying to understand why i got
> crashes at random places. And the reason was that i read an old
> documentation that said cache_filter is writable and i blindly wrote 1 to
> it.
>
> If the intent is to only work with cache filter set - then i will update
> the patch to do so.

You mean to set cache_filter to true when writing to 'failslab',
or when setting SLAB_FAILSLAB slab flag?

I'm not so confident for that because it's implicitly changing.
Maybe more documentation would be proper?

what do you think, Vlastimil?

> This is the only place where SLAB_FAILSLAB is explicitly
> tested, other places check it as part of SLAB_NEVER_MERGE.
> 
> But even for all caches it is kind of possible to test with size(space)
> which is in turn useful because you need to figure out how you handle
> failures from external caches - external to your code under test and you
> don't want to keep track for all of them (same goes for too much options in
> command line). 

Yeah, we should be able to inject fault in all caches, or a specific
cache(s).

> > to prevent doing cache merging with <cache name>.
> 
> Or you can pass SLAB_FAILSLAB from your module when creating the cache to
> prevent merge when under test.

Right. I missed that.

> 
> 
> -- 
> Regards,
> Alexander Atanasov
> 

-- 
Thanks,
Hyeonggon
