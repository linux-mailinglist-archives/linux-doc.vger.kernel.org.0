Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03576D8F86
	for <lists+linux-doc@lfdr.de>; Thu,  6 Apr 2023 08:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235448AbjDFGe6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 6 Apr 2023 02:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235531AbjDFGel (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 02:34:41 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C68BA5C8;
        Wed,  5 Apr 2023 23:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680762875; x=1712298875;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YOJponhxRttYqVGtZnJ5a2oLNec4i/zm9vWttrUqJmc=;
  b=J5VLrZKjL8qit33ri55bM3TzpksaWSZ00ZXaqPIZSQJuyqWcsLIX4GV+
   5OTnlruzTjzOVy6lg37aOn85MLuEp8zXI1pHHH+t4HLLePCeO+RudOuoV
   3mKvyQvPfSTQctLGNk7Jqd8Ckbmw5lRvc36GTrYDwWgBZDvD/cBkNpqjQ
   6yd5f3SHvJtPrg7CWlM0xv9GcisspxnU4KcOqeLJROr/r0zLVarLXEAl2
   cWmZxGkRiLlIDQpo6EPGbYrDi8CiWj1mT1Q0DOMcb/7gt7eP0/fg3DYb1
   vP5MtDSfRt025l7vjsAKFRI8dY+9xUyUIPiX0QXe0b6RsMpVN4E0o0/6F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="326696188"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="326696188"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 23:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="664315136"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="664315136"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.130.121]) ([10.249.130.121])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 23:34:31 -0700
Message-ID: <228d379b-e4e5-5324-4bcf-6152faf5c54f@linux.intel.com>
Date:   Thu, 6 Apr 2023 08:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 0/8] QAIC accel driver
Content-Language: en-US
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Oded Gabbay <ogabbay@kernel.org>
Cc:     linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mani@kernel.org, dri-devel@lists.freedesktop.org,
        quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com,
        stanislaw.gruszka@linux.intel.com, quic_carlv@quicinc.com,
        bagasdotme@gmail.com
References: <1679932497-30277-1-git-send-email-quic_jhugo@quicinc.com>
 <857db3fb-b006-4aa8-a7f8-2ae0b8a160c9@quicinc.com>
 <c5d11a88-351a-8eaf-f1d2-d7cf37cdf81c@linux.intel.com>
 <CAFCwf12iVZkcPKOEc911-fCd4-YzHYJzs_p36jfBiT=VkcO9uQ@mail.gmail.com>
 <ZC13QdSRybIe3nvk@phenom.ffwll.local>
 <32ee0be5-99cf-7b0b-e195-73c6ef3294af@quicinc.com>
From:   Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <32ee0be5-99cf-7b0b-e195-73c6ef3294af@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I've merged the patchset to drm-misc-next.
Congrats Jeffrey :)

On 05.04.2023 16:28, Jeffrey Hugo wrote:
> On 4/5/2023 7:27 AM, Daniel Vetter wrote:
>> On Wed, Apr 05, 2023 at 03:35:19PM +0300, Oded Gabbay wrote:
>>> On Wed, Apr 5, 2023 at 2:26 PM Jacek Lawrynowicz
>>> <jacek.lawrynowicz@linux.intel.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 03.04.2023 19:22, Jeffrey Hugo wrote:
>>>>> On 3/27/2023 9:54 AM, Jeffrey Hugo wrote:
>>>>>> This series introduces a driver under the accel subsystem (QAIC -
>>>>>> Qualcomm AIC) for the Qualcomm Cloud AI 100 product (AIC100).  AIC100 is
>>>>>> a PCIe adapter card that hosts a dedicated machine learning inference
>>>>>> accelerator.
>>>>>>
>>>>>> The previous version (v4) can be found at:
>>>>>> https://lore.kernel.org/all/1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com/
>>>>>
>>>>> Looks like things have been silent on this revision and we have a number of review tags already.  Seems like this series is ready for merge.
>>>>>
>>>>> I'd like to see this queued for 6.4 if possible.  Given that we are at 6.3-rc5, it seems like this would need to be merged now(ish) to make 6.4.
>>>>>
>>>>> Jacek, since you have commit permissions in drm-misc and are an active Accel maintainer, I wonder if it would be appropriate for you to merge this series to drm-misc.  Thoughts?
>>>>
>>>> I'm would be happy to merge it but I think it needs to be acked by Oded first.
>>>>
>>>> Regards,
>>>> Jacek
>>>
>>> Hi,
>>> Entire patch-set is:
>>> Acked-by: Oded Gabbay <ogabbay@kernel.org>
>>
>> Once Jacke has pushed this I htink it would also be good to get Jeffrey
>> commit rights for drm-misc, so that in the future bugfixes for the qaic
>> driver can be pushed directly by the qaic team. Still with acks/r-b
>> requirements as per usual, and I guess for anything bigger/new uapi an ack
>> from oded is needed.
>>
>> https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html#drm-misc
>>
>> Cheers, Daniel
> 
> Yep.  This is the plan per my understanding.
> 
> -Jeff
