Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A20B66F3E97
	for <lists+linux-doc@lfdr.de>; Tue,  2 May 2023 09:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbjEBHvA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 May 2023 03:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233696AbjEBHu6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 May 2023 03:50:58 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094624496;
        Tue,  2 May 2023 00:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683013857; x=1714549857;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gKKgWxQpCuWmOuFkCXz8DH5UejGSkjM2udqvopsWWAo=;
  b=AvFngH6xN3yubi9yuheanXHrtxsm7zY+mNGwjexwjRigKFlNzE5sYkPa
   2DEFr9JPCASlp+mIkYkwbREYqaNBWXUA413Muxp6gImkXwdAEWUfr/hvX
   QTgaX4uhu0Gsi+5V1PFSQbJJTfBQOxNYMRaMs5ih0znqG8OMxkRxxa7tE
   jiEnO5nbXnjXUg53+gngup8o228KN2y6E1Rs6wXvUdp/MH9H3OUwMD71u
   aXQwlgWEiiVlcMQET4ZdX6a+8VvxwXNjCwHAeTHvc9Wj/pmNmQM/bMwLa
   lxemYjcYNhymN2x1nCJY65jq/xCSxtFXIc6i5PsKZ7u1PCI79BpGO7T8z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="328706328"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="328706328"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 00:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="785579118"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; 
   d="scan'208";a="785579118"
Received: from petrush-mobl3.ger.corp.intel.com (HELO [10.213.196.106]) ([10.213.196.106])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 00:50:53 -0700
Message-ID: <b615ba5e-c15a-226b-959b-e76216015f83@linux.intel.com>
Date:   Tue, 2 May 2023 08:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 8/9] drm/fdinfo: Add comm/cmdline override fields
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Christopher Healy <healych@amazon.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20230427175340.1280952-1-robdclark@gmail.com>
 <20230427175340.1280952-9-robdclark@gmail.com>
 <135ff649-e50c-50f4-55ba-a1b615865e02@linux.intel.com>
 <CAF6AEGvKnPgtna4yjN56mMjCLqpjs8B8K152VWxmPs1NdY78vA@mail.gmail.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGvKnPgtna4yjN56mMjCLqpjs8B8K152VWxmPs1NdY78vA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 01/05/2023 17:58, Rob Clark wrote:
> On Fri, Apr 28, 2023 at 4:05 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 27/04/2023 18:53, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> These are useful in particular for VM scenarios where the process which
>>> has opened to drm device file is just a proxy for the real user in a VM
>>> guest.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    Documentation/gpu/drm-usage-stats.rst | 18 ++++++++++++++++++
>>>    drivers/gpu/drm/drm_file.c            | 15 +++++++++++++++
>>>    include/drm/drm_file.h                | 19 +++++++++++++++++++
>>>    3 files changed, 52 insertions(+)
>>>
>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>>> index 58dc0d3f8c58..e4877cf8089c 100644
>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>> @@ -73,6 +73,24 @@ scope of each device, in which case `drm-pdev` shall be present as well.
>>>    Userspace should make sure to not double account any usage statistics by using
>>>    the above described criteria in order to associate data to individual clients.
>>>
>>> +- drm-comm-override: <valstr>
>>> +
>>> +Returns the client executable override string.  Some drivers support letting
>>> +userspace override this in cases where the userspace is simply a "proxy".
>>> +Such as is the case with virglrenderer drm native context, where the host
>>> +process is just forwarding command submission, etc, from guest userspace.
>>> +This allows the proxy to make visible the executable name of the actual
>>> +app in the VM guest.
>>> +
>>> +- drm-cmdline-override: <valstr>
>>> +
>>> +Returns the client cmdline override string.  Some drivers support letting
>>> +userspace override this in cases where the userspace is simply a "proxy".
>>> +Such as is the case with virglrenderer drm native context, where the host
>>> +process is just forwarding command submission, etc, from guest userspace.
>>> +This allows the proxy to make visible the cmdline of the actual app in the
>>> +VM guest.
>>
>> Perhaps it would be okay to save space here by not repeating the
>> description, like:
>>
>> drm-comm-override: <valstr>
>> drm-cmdline-override: <valstr>
>>
>> Long description blah blah...
>> This allows the proxy to make visible the _executable name *and* command
>> line_ blah blah..
>>
>>> +
>>>    Utilization
>>>    ^^^^^^^^^^^
>>>
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index 9321eb0bf020..d7514c313af1 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -178,6 +178,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>        spin_lock_init(&file->master_lookup_lock);
>>>        mutex_init(&file->event_read_lock);
>>>
>>> +     mutex_init(&file->override_lock);
>>> +
>>>        if (drm_core_check_feature(dev, DRIVER_GEM))
>>>                drm_gem_open(dev, file);
>>>
>>> @@ -292,6 +294,8 @@ void drm_file_free(struct drm_file *file)
>>>        WARN_ON(!list_empty(&file->event_list));
>>>
>>>        put_pid(file->pid);
>>> +     kfree(file->override_comm);
>>> +     kfree(file->override_cmdline);
>>>        kfree(file);
>>>    }
>>>
>>> @@ -995,6 +999,17 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>>>                           PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
>>>        }
>>>
>>> +     mutex_lock(&file->override_lock);
>>
>> You could add a fast unlocked check before taking the mutex for no risk
>> apart a transient false negative. For 99.9999% of userspace it would
>> mean no pointless lock/unlock cycle.
> 
> I'm not sure I get your point?  This needs to be serialized against
> userspace setting the override values

if (file->override_comm || file->override_cmdline) {
	mutex_lock(&file->override_lock);
	if (file->override_comm)
		drm_printf(&p, "drm-comm-override:\t%s\n",
			   file->override_comm);
	if (file->override_cmdline)
		drm_printf(&p, "drm-cmdline-override:\t%s\n",
			   file->override_cmdline);
	mutext_unlock(&file->override_lock);
}

No risk apart for a transient false negative (which is immaterial for 
userspace since fdinfo reads are not ordered versus the override setting 
anyway) and 99.9% of deployments can get by not needing to pointlessly 
cycle the lock.

> 
>>
>>> +     if (file->override_comm) {
>>> +             drm_printf(&p, "drm-comm-override:\t%s\n",
>>> +                        file->override_comm);
>>> +     }
>>> +     if (file->override_cmdline) {
>>> +             drm_printf(&p, "drm-cmdline-override:\t%s\n",
>>> +                        file->override_cmdline);
>>> +     }
>>> +     mutex_unlock(&file->override_lock);
>>> +
>>>        if (dev->driver->show_fdinfo)
>>>                dev->driver->show_fdinfo(&p, file);
>>>    }
>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>> index 1339e925af52..604d05fa6f0c 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -370,6 +370,25 @@ struct drm_file {
>>>         */
>>>        struct drm_prime_file_private prime;
>>>
>>> +     /**
>>> +      * @comm: Overridden task comm
>>> +      *
>>> +      * Accessed under override_lock
>>> +      */
>>> +     char *override_comm;
>>> +
>>> +     /**
>>> +      * @cmdline: Overridden task cmdline
>>> +      *
>>> +      * Accessed under override_lock
>>> +      */
>>> +     char *override_cmdline;
>>> +
>>> +     /**
>>> +      * @override_lock: Serialize access to override_comm and override_cmdline
>>> +      */
>>> +     struct mutex override_lock;
>>> +
>>
>> I don't think this should go to drm just yet though. Only one driver can
>> make use of it so I'd leave it for later and print from msm_show_fdinfo
>> for now.
> 
> This was my original approach but danvet asked that it be moved into
> drm for consistency across drivers.  (And really, I want the in-flight
> amd and intel native-context stuff to motivate adding similar features
> to amdgpu/i915/xe.)

IMO if implementation is not shared, not even by using helpers, I don't 
think data storage should be either, but it's not a deal breaker.

Regards,

Tvrtko

> 
> BR,
> -R
> 
>> Regards,
>>
>> Tvrtko
>>
>>>        /* private: */
>>>    #if IS_ENABLED(CONFIG_DRM_LEGACY)
>>>        unsigned long lock_count; /* DRI1 legacy lock count */
