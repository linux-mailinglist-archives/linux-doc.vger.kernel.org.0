Return-Path: <linux-doc+bounces-11094-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BBC86C70F
	for <lists+linux-doc@lfdr.de>; Thu, 29 Feb 2024 11:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 963D4285EB6
	for <lists+linux-doc@lfdr.de>; Thu, 29 Feb 2024 10:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A162651A1;
	Thu, 29 Feb 2024 10:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dx1gwm0r"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEBE657AF
	for <linux-doc@vger.kernel.org>; Thu, 29 Feb 2024 10:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709203039; cv=none; b=rl7dyB60+iRuTgGAfK6X3gvdtsLeFRMF9X8Z4W+IMKq0BX/3DBEzWLy0M5mlYLm4TRIvCSaG/OOfTFxXUKdZxvcW9qqxqeOOim+MwLh4JxzEZ991Al//0BpPJI007H611xbxYVmjKho+qQeyfsJlUk1L3Q3LKUna5Pcv2LZjz9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709203039; c=relaxed/simple;
	bh=xkeld8Lk8IBplM8fZKyDA8lxo+4YDzsa8AtbNMPtOrg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fEhyay0wzbIuLh0kHAhIeF+IvUFLzGeUi2k2mkxfPQgikl6SdTjsYBZX4ALL2hxS30b8W0rC6IJ8ynhrNOa3GTFOh2AXGUN/DgBHTWmIHfKtY79l3TY0Z/4Y4GL/VSYxoc0XG29vfwexn/t04C0OKLUx28DcUY7FbA3kcOyHjrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dx1gwm0r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709203036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VmmqZdgeBo5f2z5C02fBhM61/leQCIABlPf1lTPL92E=;
	b=dx1gwm0rj0sDbUxjo/004aecaRCGsul2qlWW+AWCv1ILmmBdovZUrZ5McfwLiZYIku65e8
	7sbyc5SzqBp6sI5r6u5cSk2FItigCnogsMXSjOLLqz1jtLacZC33oAB123r8X0AzyC1A4R
	L5SELf9nTUdoiVrrD4I5FX+uPNXL3RQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-MFxc_KNMPJ2VQTWMheSqBw-1; Thu, 29 Feb 2024 05:37:15 -0500
X-MC-Unique: MFxc_KNMPJ2VQTWMheSqBw-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-787b03ea2b4so82931385a.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Feb 2024 02:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709203034; x=1709807834;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmmqZdgeBo5f2z5C02fBhM61/leQCIABlPf1lTPL92E=;
        b=a/nEQoK/9V5XhFXeBIWaeKlsFkxrvSVRJEKRI4OoMxogF/NkIm+Jmy/9eLxS/M5UtR
         9W+DfwO7AozYsbAus3m0lpibqQchQMdXCkLshF1UJkjQORCo5KHQz1UqQejsha/M700r
         hbcnrVYCamMfs4I5O1vYy9VLlSTos8mpBz5bAys8eA7tmGjfbs8HfkbnDZ1woGJuuJEN
         ac6rBZFiWCu1cklgiRYnrgzHZr/pjznnOXIiFRrgtCUQOe7Vm+144nY6WGNH3ZB5bHRV
         upKc0TPIdeCggte7h1s+Is7Npz9M8eurscwAyo/lmYu5kIweUSZNSvaxHRowEGF6W/Ug
         cdDA==
X-Forwarded-Encrypted: i=1; AJvYcCXMX37nwbiQUcZxS2WByoTfI4Nd75c++fdM6/a3X3PN3UKSJkHtr5Gw8XhZTiTGKxgl1QpNAR8rDswqssVXZolA7dOQoJJnbAhc
X-Gm-Message-State: AOJu0YykIyV/rpH8FS5XoMPxqKIgnN4P4LxH/OoNdcDuq0pRDyB8/k57
	u9O6CBQuK/e/cAicHBwYD7y4k99X1vU6wcrTq1+NKjYkelHZzUxMd86RRF3Z+U+cNsouHhFHQTz
	y+FCnYVYKOvJxYmi0ZS3eaWjU1tTtxSwBcNcjgzNJ6ZrYQ6SE/GQmgUE6
X-Received: by 2002:ac8:57d1:0:b0:42e:8145:8589 with SMTP id w17-20020ac857d1000000b0042e81458589mr1720861qta.2.1709203034652;
        Thu, 29 Feb 2024 02:37:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvjZZh4qSQgCFe2Zwl1bZvlNHTz+j+elx5TttakPKlYeodm3M1v9KlIIjfLmbzsJBo6Cq7pw==
X-Received: by 2002:ac8:57d1:0:b0:42e:8145:8589 with SMTP id w17-20020ac857d1000000b0042e81458589mr1720840qta.2.1709203034266;
        Thu, 29 Feb 2024 02:37:14 -0800 (PST)
Received: from [192.168.9.34] (net-2-34-30-118.cust.vodafonedsl.it. [2.34.30.118])
        by smtp.gmail.com with ESMTPSA id d3-20020ac851c3000000b0042c61b99f42sm582123qtn.46.2024.02.29.02.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 02:37:13 -0800 (PST)
Message-ID: <0c885ff2-44bc-4158-b5dd-3d7513cb2857@redhat.com>
Date: Thu, 29 Feb 2024 11:37:10 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marco Pagani <marpagan@redhat.com>
Subject: Re: [RFC PATCH v5 1/1] fpga: add an owner and use it to take the
 low-level module's refcount
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Tull <atull@opensource.altera.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fpga@vger.kernel.org
References: <20240111160242.149265-1-marpagan@redhat.com>
 <20240111160242.149265-2-marpagan@redhat.com>
 <Zbh7iO9wlm9ekzB7@yilunxu-OptiPlex-7050>
 <0720eb91-72f9-4781-8558-8a1b0a3691c2@redhat.com>
 <Zb8dd9af0Ru/fzGi@yilunxu-OptiPlex-7050>
 <4aaa131a-4b64-4b86-9548-68aef63c87b3@redhat.com>
 <ZdHWaeU+/On6LmHX@yilunxu-OptiPlex-7050>
 <9a9d4018-fd65-49be-9e0a-1eecc9cbf15d@redhat.com>
 <ZdYKnZxdTCvu5THG@yilunxu-OptiPlex-7050>
 <ae3cd81b-82af-4977-91d7-fa809c6fc45a@redhat.com>
 <Zd7cff43ffbJOGNY@yilunxu-OptiPlex-7050>
Content-Language: en-US
In-Reply-To: <Zd7cff43ffbJOGNY@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024-02-28 08:10, Xu Yilun wrote:
> On Tue, Feb 27, 2024 at 12:49:06PM +0100, Marco Pagani wrote:
>>
>>
>> On 2024-02-21 15:37, Xu Yilun wrote:
>>> On Tue, Feb 20, 2024 at 12:11:26PM +0100, Marco Pagani wrote:
>>>>
>>>>
>>>> On 2024-02-18 11:05, Xu Yilun wrote:
>>>>> On Mon, Feb 05, 2024 at 06:47:34PM +0100, Marco Pagani wrote:
>>>>>>
>>>>>>
>>>>>> On 2024-02-04 06:15, Xu Yilun wrote:
>>>>>>> On Fri, Feb 02, 2024 at 06:44:01PM +0100, Marco Pagani wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2024-01-30 05:31, Xu Yilun wrote:
>>>>>>>>>> +#define fpga_mgr_register_full(parent, info) \
>>>>>>>>>> +	__fpga_mgr_register_full(parent, info, THIS_MODULE)
>>>>>>>>>>  struct fpga_manager *
>>>>>>>>>> -fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info);
>>>>>>>>>> +__fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info,
>>>>>>>>>> +			 struct module *owner);
>>>>>>>>>>  
>>>>>>>>>> +#define fpga_mgr_register(parent, name, mops, priv) \
>>>>>>>>>> +	__fpga_mgr_register(parent, name, mops, priv, THIS_MODULE)
>>>>>>>>>>  struct fpga_manager *
>>>>>>>>>> -fpga_mgr_register(struct device *parent, const char *name,
>>>>>>>>>> -		  const struct fpga_manager_ops *mops, void *priv);
>>>>>>>>>> +__fpga_mgr_register(struct device *parent, const char *name,
>>>>>>>>>> +		    const struct fpga_manager_ops *mops, void *priv, struct module *owner);
>>>>>>>>>> +
>>>>>>>>>>  void fpga_mgr_unregister(struct fpga_manager *mgr);
>>>>>>>>>>  
>>>>>>>>>> +#define devm_fpga_mgr_register_full(parent, info) \
>>>>>>>>>> +	__devm_fpga_mgr_register_full(parent, info, THIS_MODULE)
>>>>>>>>>>  struct fpga_manager *
>>>>>>>>>> -devm_fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info);
>>>>>>>>>> +__devm_fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info,
>>>>>>>>>> +			      struct module *owner);
>>>>>>>>>
>>>>>>>>> Add a line here. I can do it myself if you agree.
>>>>>>>>
>>>>>>>> Sure, that is fine by me. I also spotted a typo in the commit log body
>>>>>>>> (in taken -> is taken). Do you want me to send a v6, or do you prefer
>>>>>>>> to fix that in place?
>>>>>>>
>>>>>>> No need, I can fix it.
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> There is still a RFC prefix for this patch. Are you ready to get it merged?
>>>>>>>>> If yes, Acked-by: Xu Yilun <yilun.xu@intel.com>
>>>>>>>>
>>>>>>>> I'm ready for the patch to be merged. However, I recently sent an RFC
>>>>>>>> to propose a safer implementation of try_module_get() that would
>>>>>>>> simplify the code and may also benefit other subsystems. What do you
>>>>>>>> think?
>>>>>>>>
>>>>>>>> https://lore.kernel.org/linux-modules/20240130193614.49772-1-marpagan@redhat.com/
>>>>>>>
>>>>>>> I suggest take your fix to linux-fpga/for-next now. If your try_module_get()
>>>>>>> proposal is applied before the end of this cycle, we could re-evaluate
>>>>>>> this patch.
>>>>>>
>>>>>> That's fine by me.
>>>>>
>>>>> Sorry, I still found issues about this solution.
>>>>>
>>>>> void fpga_mgr_unregister(struct fpga_manager *mgr)
>>>>> {
>>>>>         dev_info(&mgr->dev, "%s %s\n", __func__, mgr->name);
>>>>>
>>>>>         /*
>>>>>          * If the low level driver provides a method for putting fpga into
>>>>>          * a desired state upon unregister, do it.
>>>>>          */
>>>>>         fpga_mgr_fpga_remove(mgr);
>>>>>
>>>>>         mutex_lock(&mgr->mops_mutex);
>>>>>
>>>>>         mgr->mops = NULL;
>>>>>
>>>>>         mutex_unlock(&mgr->mops_mutex);
>>>>>
>>>>>         device_unregister(&mgr->dev);
>>>>> }
>>>>>
>>>>> Note that fpga_mgr_unregister() doesn't have to be called in module_exit().
>>>>> So if we do fpga_mgr_get() then fpga_mgr_unregister(), We finally had a
>>>>> fpga_manager dev without mops, this is not what the user want and cause
>>>>> problem when using this fpga_manager dev for other FPGA APIs.
>>>>
>>>> How about moving mgr->mops = NULL from fpga_mgr_unregister() to
>>>> class->dev_release()? In that way, mops will be set to NULL only when the
>>>> manager dev refcount reaches 0.
>>>
>>> I'm afraid it doesn't help.  The lifecycle of the module and the fpga
>>> mgr dev is different.
>>>
>>> We use mops = NULL to indicate module has been freed or will be freed in no
>>> time.  On the other hand mops != NULL means module is still there, so
>>> that try_module_get() could be safely called.  It is possible someone
>>> has got fpga mgr dev but not the module yet, at that time the module is
>>> unloaded, then try_module_get() triggers crash.
>>>
>>>>
>>>> If fpga_mgr_unregister() is called from module_exit(), we are sure that nobody
>>>> got the manager dev earlier using fpga_mgr_get(), or it would have bumped up
>>>
>>> No, someone may get the manager dev but not the module yet, and been
>>> scheduled out.
>>>
>>
>> You are right. Overall, it's a bad idea. How about then using an additional 
>> bool flag instead of "overloading" the mops pointer? Something like:
>>
>> get:
>> 	if (!mgr->owner_valid || !try_module_get(mgr->mops_owner))
>>
>> remove:
>> 	mgr->owner_valid = false;
> 
> I'm not quite sure which function is actually mentioned by "remove".  I
> assume it should be fpga_mgr_unregister().

Yes, I was referring to fpga_mgr_unregister().

> IIUC this flag means no more reference to fpga mgr, but existing
> references are still valid.

Yes.

> 
> It works for me. But the name of this flag could be reconsidered to
> avoid misunderstanding.  The owner is still valid (we still need to put
> the owner) but allows no more reference.  Maybe "owner_inactive"?

Right, owner_valid might be misleading. How about removing any
reference to the owner module and name the flag unreg?

__fpga_mgr_get:
	if (mgr->unreg || !try_module_get(mgr->mops_owner))
		mgr = ERR_PTR(-ENODEV);

fpga_mgr_unregister:
 	mgr->unreg = true;

> I still wanna this owner reference change been splitted, so that
> we could simply revert it when the try_module_get_safe() got accepted.

I guess it may take some time to have try_module_get_safe() accepted.
What do you prefer to do with the bridge and the region in the
meantime?

Thanks,
Marco


