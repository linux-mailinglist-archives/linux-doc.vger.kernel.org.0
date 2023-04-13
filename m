Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4327D6E1284
	for <lists+linux-doc@lfdr.de>; Thu, 13 Apr 2023 18:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbjDMQki (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Apr 2023 12:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjDMQkg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Apr 2023 12:40:36 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70F479755;
        Thu, 13 Apr 2023 09:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681404027; x=1712940027;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=k/vQzzzp37PrEgraenYXJY3XdiyFmmqNE9w0PfWjl6E=;
  b=Zg4yxJgOCXnBeLrecReA/8ITdwocT6cBVbJsiFIbGOcjFgHo+vCi45eV
   xFTtFyQoD7Eu4r+sKTThNJAOWEsXfsS8UjNKnlBdjbGFZOrGOPD19bVXZ
   BCg7a6tLljnCEKPUid9SIYTcFDdtRXCt3H+8vBpS2TUK8UDSxpZWEKNbe
   ckAetnoO/5lXh/3zaJmSGMeZv1gX6CIImWcLoaTVdea9ikNtOKX1DZFmp
   PLdB8NUPGNVd+8RmfDnKWqkSZ9CDKHrC3KFXVvomq9iwWbj+XHWmLwVI3
   2S3dSz+02HPtdkGcSm1dqOsNspOYFrrmbPkM4nRxWTSqRRW1WFx04hliJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="341732838"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="341732838"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 09:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="689422090"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="689422090"
Received: from mmcgar2x-mobl1.ger.corp.intel.com (HELO [10.213.231.135]) ([10.213.231.135])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 09:40:23 -0700
Message-ID: <ad8f2793-c1b3-a505-e93f-6cc52fded86d@linux.intel.com>
Date:   Thu, 13 Apr 2023 17:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 6/7] drm: Add fdinfo memory stats
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Christopher Healy <healych@amazon.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20230411225725.2032862-1-robdclark@gmail.com>
 <20230411225725.2032862-7-robdclark@gmail.com>
 <29a8d9aa-c6ea-873f-ce0b-fb8199b13068@linux.intel.com>
 <CAF6AEGsZsMx+Vy+4UQSx3X7w_QNvvjLqWxx=PnCLAOC9f-X2CQ@mail.gmail.com>
 <ZDb1phnddSne79iN@phenom.ffwll.local>
 <CAF6AEGvBeDVM12ac0j_PKSdcY83hNDhyrQs9-=h=dx_7AoMXLw@mail.gmail.com>
 <ZDcEGoSPGr/oRLas@phenom.ffwll.local>
 <c82fd8fa-9f4b-f62f-83be-25853f9ecf5e@linux.intel.com>
 <ZDgDQ1PqtXwu8zqA@phenom.ffwll.local>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZDgDQ1PqtXwu8zqA@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 13/04/2023 14:27, Daniel Vetter wrote:
> On Thu, Apr 13, 2023 at 01:58:34PM +0100, Tvrtko Ursulin wrote:
>>
>> On 12/04/2023 20:18, Daniel Vetter wrote:
>>> On Wed, Apr 12, 2023 at 11:42:07AM -0700, Rob Clark wrote:
>>>> On Wed, Apr 12, 2023 at 11:17 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>
>>>>> On Wed, Apr 12, 2023 at 10:59:54AM -0700, Rob Clark wrote:
>>>>>> On Wed, Apr 12, 2023 at 7:42 AM Tvrtko Ursulin
>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 11/04/2023 23:56, Rob Clark wrote:
>>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>>
>>>>>>>> Add support to dump GEM stats to fdinfo.
>>>>>>>>
>>>>>>>> v2: Fix typos, change size units to match docs, use div_u64
>>>>>>>> v3: Do it in core
>>>>>>>>
>>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>>>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>>>>>>>> ---
>>>>>>>>     Documentation/gpu/drm-usage-stats.rst | 21 ++++++++
>>>>>>>>     drivers/gpu/drm/drm_file.c            | 76 +++++++++++++++++++++++++++
>>>>>>>>     include/drm/drm_file.h                |  1 +
>>>>>>>>     include/drm/drm_gem.h                 | 19 +++++++
>>>>>>>>     4 files changed, 117 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>>>>>>>> index b46327356e80..b5e7802532ed 100644
>>>>>>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>>>>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>>>>>>> @@ -105,6 +105,27 @@ object belong to this client, in the respective memory region.
>>>>>>>>     Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>>>>>>>>     indicating kibi- or mebi-bytes.
>>>>>>>>
>>>>>>>> +- drm-shared-memory: <uint> [KiB|MiB]
>>>>>>>> +
>>>>>>>> +The total size of buffers that are shared with another file (ie. have more
>>>>>>>> +than a single handle).
>>>>>>>> +
>>>>>>>> +- drm-private-memory: <uint> [KiB|MiB]
>>>>>>>> +
>>>>>>>> +The total size of buffers that are not shared with another file.
>>>>>>>> +
>>>>>>>> +- drm-resident-memory: <uint> [KiB|MiB]
>>>>>>>> +
>>>>>>>> +The total size of buffers that are resident in system memory.
>>>>>>>
>>>>>>> I think this naming maybe does not work best with the existing
>>>>>>> drm-memory-<region> keys.
>>>>>>
>>>>>> Actually, it was very deliberate not to conflict with the existing
>>>>>> drm-memory-<region> keys ;-)
>>>>>>
>>>>>> I wouldn't have preferred drm-memory-{active,resident,...} but it
>>>>>> could be mis-parsed by existing userspace so my hands were a bit tied.
>>>>>>
>>>>>>> How about introduce the concept of a memory region from the start and
>>>>>>> use naming similar like we do for engines?
>>>>>>>
>>>>>>> drm-memory-$CATEGORY-$REGION: ...
>>>>>>>
>>>>>>> Then we document a bunch of categories and their semantics, for instance:
>>>>>>>
>>>>>>> 'size' - All reachable objects
>>>>>>> 'shared' - Subset of 'size' with handle_count > 1
>>>>>>> 'resident' - Objects with backing store
>>>>>>> 'active' - Objects in use, subset of resident
>>>>>>> 'purgeable' - Or inactive? Subset of resident.
>>>>>>>
>>>>>>> We keep the same semantics as with process memory accounting (if I got
>>>>>>> it right) which could be desirable for a simplified mental model.
>>>>>>>
>>>>>>> (AMD needs to remind me of their 'drm-memory-...' keys semantics. If we
>>>>>>> correctly captured this in the first round it should be equivalent to
>>>>>>> 'resident' above. In any case we can document no category is equal to
>>>>>>> which category, and at most one of the two must be output.)
>>>>>>>
>>>>>>> Region names we at most partially standardize. Like we could say
>>>>>>> 'system' is to be used where backing store is system RAM and others are
>>>>>>> driver defined.
>>>>>>>
>>>>>>> Then discrete GPUs could emit N sets of key-values, one for each memory
>>>>>>> region they support.
>>>>>>>
>>>>>>> I think this all also works for objects which can be migrated between
>>>>>>> memory regions. 'Size' accounts them against all regions while for
>>>>>>> 'resident' they only appear in the region of their current placement, etc.
>>>>>>
>>>>>> I'm not too sure how to rectify different memory regions with this,
>>>>>> since drm core doesn't really know about the driver's memory regions.
>>>>>> Perhaps we can go back to this being a helper and drivers with vram
>>>>>> just don't use the helper?  Or??
>>>>>
>>>>> I think if you flip it around to drm-$CATEGORY-memory{-$REGION}: then it
>>>>> all works out reasonably consistently?
>>>>
>>>> That is basically what we have now.  I could append -system to each to
>>>> make things easier to add vram/etc (from a uabi standpoint)..
>>>
>>> What you have isn't really -system, but everything. So doesn't really make
>>> sense to me to mark this -system, it's only really true for integrated (if
>>> they don't have stolen or something like that).
>>>
>>> Also my comment was more in reply to Tvrtko's suggestion.
>>
>> Right so my proposal was drm-memory-$CATEGORY-$REGION which I think aligns
>> with the current drm-memory-$REGION by extending, rather than creating
>> confusion with different order of key name components.
> 
> Oh my comment was pretty much just bikeshed, in case someone creates a
> $REGION that other drivers use for $CATEGORY. Kinda Rob's parsing point.
> So $CATEGORY before the -memory.
> 
> Otoh I don't think that'll happen, so I guess we can go with whatever more
> folks like :-) I don't really care much personally.

Okay I missed the parsing problem.

>> AMD currently has (among others) drm-memory-vram, which we could define in
>> the spec maps to category X, if category component is not present.
>>
>> Some examples:
>>
>> drm-memory-resident-system:
>> drm-memory-size-lmem0:
>> drm-memory-active-vram:
>>
>> Etc.. I think it creates a consistent story.
>>
>> Other than this, my two I think significant opens which haven't been
>> addressed yet are:
>>
>> 1)
>>
>> Why do we want totals (not per region) when userspace can trivially
>> aggregate if they want. What is the use case?
>>
>> 2)
>>
>> Current proposal limits the value to whole objects and fixates that by
>> having it in the common code. If/when some driver is able to support sub-BO
>> granularity they will need to opt out of the common printer at which point
>> it may be less churn to start with a helper rather than mid-layer. Or maybe
>> some drivers already support this, I don't know. Given how important VM BIND
>> is I wouldn't be surprised.
> 
> I feel like for drivers using ttm we want a ttm helper which takes care of
> the region printing in hopefully a standard way. And that could then also
> take care of all kinds of of partial binding and funny rules (like maybe
> we want a standard vram region that addds up all the lmem regions on
> intel, so that all dgpu have a common vram bucket that generic tools
> understand?).

First part yes, but for the second I would think we want to avoid any 
aggregation in the kernel which can be done in userspace just as well. 
Such total vram bucket would be pretty useless on Intel even since 
userspace needs to be region aware to make use of all resources. It 
could even be counter productive I think - "why am I getting out of 
memory when half of my vram is unused!?".

> It does mean we walk the bo list twice, but *shrug*. People have been
> complaining about procutils for decades, they're still horrible, I think
> walking bo lists twice internally in the ttm case is going to be ok. If
> not, it's internals, we can change them again.
> 
> Also I'd lean a lot more towards making ttm a helper and not putting that
> into core, exactly because it's pretty clear we'll need more flexibility
> when it comes to accurate stats for multi-region drivers.

Exactly.

> But for a first "how much gpu space does this app use" across everything I
> think this is a good enough starting point.

Okay so we agree this would be better as a helper and not in the core.

On the point are keys/semantics good enough as a starting point I am 
still not convinced kernel should aggregate and that instead we should 
start from day one by appending -system (or something) to Rob's proposed 
keys.

Regards,

Tvrtko
