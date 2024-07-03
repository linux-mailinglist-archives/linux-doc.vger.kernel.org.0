Return-Path: <linux-doc+bounces-19982-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6205925753
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jul 2024 11:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35CE91F2598F
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jul 2024 09:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FCF15B107;
	Wed,  3 Jul 2024 09:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpCtg51m"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0004B142621;
	Wed,  3 Jul 2024 09:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000234; cv=none; b=RcTjgif6n4W3/5CctrOhop/a98aVKxZvEldYVdWSUCxE7kkiRfCII3JxzZn92soMMPvNNBpo/vnTXOJgytM/sJL0+ipjJmcETcxZfDF2RDaX3qKv/eIS9mFgsNYwv7VZkyJIvUthRfUNwNZfK1U4N/P21FdhTavBKYbc1tPJ6hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000234; c=relaxed/simple;
	bh=DJpEKaO0GRS1/3x/TYtrZypLe7tnIvtbnFwzw/W3d3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EIc94QgouhDZx8ZIRHRpCd/Tslp0v3rpp76hfd3nEu8v47IdtbSRCjcmkw51apsFvtE6I5akCtkLtpr1g46MrjmB+dDRbbNaOvG/jSRlkL86FLWeX98UUFv1S5C3KMGDfpXmosYGzaRQcPYWunaz9P+EDLI5gt+8RQb0FIHOpLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpCtg51m; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720000232; x=1751536232;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DJpEKaO0GRS1/3x/TYtrZypLe7tnIvtbnFwzw/W3d3o=;
  b=FpCtg51mA5+NOxPLz1E+yRkEdF2rsDcRFH0KOLP0ZNYXJ5XWxQErhZXQ
   5ciz5taafpcMMxG30IWxASpM/GzsXOrBZ7h8jtq/k1gc+tE6hfeHLqb63
   +U50NoSUVtT9aqc6kUO31zzjEuV4/slaCiohtvg/hPptBEYxrOovtKOnn
   i7IAQnZj6xI5gmuRongw+zW7ufeSrkZgPPe8YJn6kDTqNLfH3wbJrb1j3
   nh/GyezANbNPcKeOxwTlGAs8E49q7/pvOnw3MU64cN+BOFfpZJxa7si8z
   HZdQWMjtS12z6ySIpf50lZitqiqy+y8nVbOCVSga1VqOG09YKSBTSRJ0X
   w==;
X-CSE-ConnectionGUID: nbIBZQz/RVqbmCgAFgBoMA==
X-CSE-MsgGUID: XytG+FgyT1WNPYJ1vPOQOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17353927"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="17353927"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 02:50:31 -0700
X-CSE-ConnectionGUID: HisMjqEsSnu1KvOGzxeF/Q==
X-CSE-MsgGUID: o6LxAqoWSDaNPEVrfSuhqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="83754897"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.242]) ([10.245.246.242])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 02:50:25 -0700
Message-ID: <ab734271-58ee-4981-926c-9b57f36b8ac6@linux.intel.com>
Date: Wed, 3 Jul 2024 11:50:21 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Wesley Cheng
 <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <20240610235808.22173-33-quic_wcheng@quicinc.com>
 <5be51e1f-70c9-4bbc-96fa-1e50e441bd35@linux.intel.com>
 <408d9e8e-0f40-7e66-54be-2f8d2c0783a3@quicinc.com>
 <ca1e1063-e1bd-4e03-a7cd-91985e9954e9@linux.intel.com>
 <096d59a0-5e18-092c-c9ae-d98130226f06@quicinc.com>
 <368d9019-2c96-468e-b472-7e1127f76213@linux.intel.com>
 <eb6370ea-47a0-3659-3c10-cb7f95e3e520@quicinc.com>
 <510468c7-b181-48d0-bf2d-3e478b2f2aca@linux.intel.com>
 <c7a95157-1b71-1489-3657-8fe67f9acb4e@quicinc.com>
 <90463a4e-c2e7-4b59-9a79-23533b4acd1e@linux.intel.com>
 <fd8f1eb0-4b21-4697-8175-a61bc3858852@quicinc.com>
 <f982842a-1804-420b-a539-a609ecf8fb8a@linux.intel.com>
 <3c358604-6926-4f90-8fc8-8139c68c3418@quicinc.com>
 <70bf10a7-7f87-4fd1-bd44-1733d3b2b15e@linux.intel.com>
 <b1fcef2a-2af9-4985-ae00-f348ca5df3f1@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <b1fcef2a-2af9-4985-ae00-f348ca5df3f1@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit




>>>>>> There are really multiple layers to deal with
>>>>>>
>>>>>> a) is the controller able to support the offload path? IIRC this is
>>>>>> embedded in an obscure XHCI property, it would make sense to
>>>>>> expose it
>>>>>> as a control, or component string, of the USB card.
>>>>> If a component string/tag is desired, I already have some way of
>>>>> doing that.  I can add it to the USB card.
>>>>>
>>>>>> b) is there a companion card capable of dealing with the offload
>>>>>> path?
>>>>>> Since the presence of this card may depend on driver probe, there
>>>>>> should
>>>>>> be a control on the USB card. userspace could detect changes to this
>>>>>> control and detect if that path is or is no longer enabled.
>>>>> So currently, the "USB Offload Playback Capable Card" kcontrol (on
>>>>> the USB card) will determine if there is an offload path.  However,
>>>>> this differs than what Amadeusz is suggesting, in that he wants a
>>>>> single kcontrol created for EACH USB card identified (per USB audio
>>>>> device), and a simple enable/disable control to determine if the
>>>>> offload path is enabled for that card/pcm stream.
>>>>>
>>>>> It would be a simpler approach for the userspace, and if the card
>>>>> that handles the offload card isn't present, then these
>>>>> enable/disable control will be set to "disabled," and even if users
>>>>> attempt to set the control, it won't go through.
>>>> Not following. Are you suggesting userspace would modify the
>>>> enable/disable status?
>>>
>>> Yes, this is the suggestion.  One writeable kcontrol on the USB SND
>>> audio device that will control if that USB audio device is going to
>>> be offloaded.  If the kcontrol reads back "enabled" (or 1) then
>>> userspace knows that the offload path is active.  Else, if it reads
>>> "disabled" (or 0) after the attempt to set the kcontrol, then the
>>> offload path was unsuccessfully enabled, ie maybe due to no available
>>> offload streams.
>>
>> It's a bit over-engineered IMHO.
>>
>> My alternate suggestion is a read-only control reporting that offload is
>> possible. Then userspace attempts to open a PCM device on the ASoC card,
>> any failures due to resources would be handled at that point.
>>
>>>> I would just have a read-only control that reports what the hardware
>>>> can
>>>> do and which other card can deal with offload. It's up to userspace to
>>>> select the offloaded PCM device or not.
>>>>
>>> That is what I have implemented in the previous patch series.  One
>>> USB SND kcontrol within each USB audio device, which points to the
>>> ASoC platform card that supports offloading:
>>>
>>> "USB Offload Playback Capable Card" --> returns the card index to the
>>> ASoC platform card
>>>
>>> >From there the offloading control is all within the ASoC platform
>>> card.  This is opposite to what Amaduesz suggested in that, the
>>> offload control of which USB device to offload should be within USB
>>> SND (not ASoC)
>>
>> It's very hard to follow, I don't understand what userspace needs to
>> 'control' - in the modify sense. What userspace needs is a place to read
>> from, and then select the PCM device and follow usual ALSA configuration
>> with hw_params.
>>
> 
> From what I've seen I assumed that goal is to allow Offloading of
> specific stream from USB card. Otherwise I would say controls are not
> needed at all, as more user friendly solution is Offloading streams in
> order they are used as long as resources are available.

That's not great in terms of audio routing, you'd really want more rules
or controlled behavior where the order in which devices are used does
not matter.

>>>>>> c) which PCM device is actually offloaded? This could be plural
>>>>>> for some
>>>>>> implementations. The mapping between PCM devices exposed by the USB
>>>>>> card, and those exposed by the companion card, should be known to
>>>>>> userspace. I am not sure how this would be done though, a variable
>>>>>> number of controls is a sure way to confuse userspace.
>>>>> Expanding on Amadeusz's suggestion, my idea is to have an
>>>>> enable/disable kcontrol per USB stream.  For example, one USB card
>>>>> could have multiple PCM devices (USB streams).  So we would have
>>>>> something like:
>>>>>
>>>>> PCM Offload Playback Enable Stream#0  enable/disable
>>>>>
>>>>> PCM Offload Playback Enable Stream#1  enable/disable
>>>>>
>>>>> ....
>>>> are those read-only or not?
>>>
>>> No, writable and readable.
>>
>> The writable part introduces a complicated error handling, e.g. what
>> happens if you have an offloaded stream and then this control is changed
>> with amixer while streaming?
>>
> 
> -EBUSY? and keep old value

That would require a stop, fw_free, close, reopening of the
non-offloaded device and restart. Best to avoid interrupting streams, if
there are no resources that should be detected with an early fail during
open/hw_params. Once the stream is flowing, it should not be interrupted
- unless the USB device is removed of course.

>>>>> So we'd know which USB card and PCM device is selected for USB
>>>>> SND.  However, I see what you're getting at in case there are
>>>>> multiple supported streams, because userspace needs to know which
>>>>> ASoC card/pcm combination corresponds to which USB device/combination.
>>>> I don't understand how this would help map the two parts? There's
>>>> got to
>>>> be an additional mapping...
>>> It won't help with the mapping.  That is something which we'd need to
>>> add, suggestion below.
>>>>> What do you think about having a USB card kcontrol to display the
>>>>> mapped ASoC card and PCM indexes?
>>>>>
>>>>> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0,
>>>>> PCM device#1)
>>>>>
>>>>> To summarize, if we did this, I'd plan to remove all the kcontrols
>>>>> in ASoC card, and have the following in the USB card for an USB
>>>>> audio device that supports one USB stream:
>>>>>
>>>>> PCM Offload Playback Enable Stream#0  enable/disable
>>>>>
>>>>> PCM Offload Playback Enable Stream Mapping#0  0, 1 (ASoC card#0,
>>>>> PCM device#1)
>>>> ... which is suggested here.
>>>>
>>>> Assuming these are read-only controls, we would need to know which PCM
>>>> device on the USB card can be optimized with the use of which PCM
>>>> device
>>>> on the ASoC card. That means a set of three values. You would also want
>>>> a number of streams to make the guesswork on controls less painful.
>>>
>>> OK, so now to just figuring out something that both you and Amadeusz
>>> can agree on before I put time implementing it.  So I've implemented
>>> the "enable/disable" path that Amadeusz suggested, which is
>>> highlighted in my previous response, for evaluation purposes.  The
>>> overall question is which layer should control the devices that will
>>> be offloaded.  In my submissions up until now, the control was given
>>> to the ASoC platform card to determine which USB device to offload. 
>>> Amadeusz mentioned that it might be beneficial to move the control to
>>> the USB SND devices, because what if the offloading is NOT backed by
>>> ASoC. (highlighted in [1])  However, IMO the current implementation
>>> assumes there is ASoC involved, which should mean that there is some
>>> platform "card" that is backing the offload path.  Please let me know
>>> if my understanding is incorrect, @Amadeusz.
>>
>> I still fundamentally don't get why userspace would try and modify any
>> controls, this makes the flows more complicated IMHO since you also have
>> the PCM open/hw_params stages.
>> I really think it'd be more than enough if the USB card exposed
>> read-only values showing that offload is possible and which card/device
>> to map to. Then userspace uses the ASoC PCM device and errors are
>> handled at that level.
> 
> I tend to agree, less values to change, less chance something breaks.
> However I think that there should be some way to disable Offload in case
> something doesn't work properly. (It doesn't have to be control, one can
> go with module parameter or sysfs toggle or something.)

Agree with this, a 'static' configuration to disable offload would be
just fine. Module parameter is fine.

A control to read if offload is possible and what the mapping is would
be good. From there on, userspace may open the offloaded PCM and deal
with all events (hw_params not supported, xruns, removal, etc).

