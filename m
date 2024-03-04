Return-Path: <linux-doc+bounces-11256-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3748700C9
	for <lists+linux-doc@lfdr.de>; Mon,  4 Mar 2024 12:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 176421C20382
	for <lists+linux-doc@lfdr.de>; Mon,  4 Mar 2024 11:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9D839AF1;
	Mon,  4 Mar 2024 11:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zh1x6nij"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570B93B189
	for <linux-doc@vger.kernel.org>; Mon,  4 Mar 2024 11:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709553089; cv=none; b=q+w9eO07YGCqrbFAttDwHPRDTC0Nz4dEkO3FuXn4haA3kC20sL0fD/vxEVe7JyrypjYiLe03fH77Z5lrTw5Quak2UA/370Y5MYcKvj0zq9jPVPE5Xaqjw1TID8J3qN9OMsJaLuBg+OBR98sIKIwyskIBivHVbji6ot8bbeMsXsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709553089; c=relaxed/simple;
	bh=8gS+rmN7okUTx/LRlLhFcd7fke0eWILyuTxHV3jPxuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDWOWcMSXJRBgt7+pRwrVsKCFi+R/aM7CQL464mz+BT8JLa3RjK8ySw2cI0Bg9LFG1lrmci/E3xRw2yBWtHTa5fk1MvA9g56jmnxLRM7M9xAMGuO3eNrv3tImsymgFeSk7ns8p27yOZuLIPLgua2Y4/Jw6DCeblUJxcp/HQq3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zh1x6nij; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709553086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YGV3F7gnos2oeKZmIQU9xmwtjcgedu3/W3Bi6ih6p34=;
	b=Zh1x6nijcq1g0kMuUgWok34YKZ82qfm+CylBM6/j4p1mLUKbv7O7WzaXfjx0yl6Y7mBepJ
	hn9p7YnqOvbfiTBigsETlcoHumJbdVPVn4T0i7aNV1QUrie2zQ3Rs/mcC/DB/UyghrlZrs
	UnnrwChk/JTQ3plt4cIQ5Dd4E4CrBLc=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-bgOkp3qIPhq2aKs8zVDMCw-1; Mon, 04 Mar 2024 06:51:25 -0500
X-MC-Unique: bgOkp3qIPhq2aKs8zVDMCw-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-21e6d841929so3739213fac.3
        for <linux-doc@vger.kernel.org>; Mon, 04 Mar 2024 03:51:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709553084; x=1710157884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGV3F7gnos2oeKZmIQU9xmwtjcgedu3/W3Bi6ih6p34=;
        b=JO0wCPn3Sfhp5gFhckGfs9OjH+NN6NCC4O2Vl4LaLtB0/t0rY44rEpaxSLyAB7l04i
         nvzL3+HE6Q7h373vzKFvh8MHbKrRDzNSECJEXYQIuZmJ0Gb5DzJulPyG0w62CyYt0n91
         ERalO25G+cF3vCCEOpkpNp8fkew8YtXHaEw5OzD7zq1X68SFCc4Sy5PF5x+WFtLyLyJt
         q08JiBpORpiUhvA62ky6Bj8EV1hW/yKkC9rwnYpHhl3sa7JntNDdKsSs56crubBmqbaC
         yHZi3Z+LVXqnjIXeYp6wstqBUQFJMPfpkd4dERdXQsyhWbX/rkwrdQXp6oSPeib/Cf7U
         1wOw==
X-Forwarded-Encrypted: i=1; AJvYcCX/28p/HgwtTEwGJAQYj/tw3yoI1I0w8SgTOC6iVPaUEmCFm1Dhx4VMwgthXCnkYEpC4XPpYtUCkIJ8JabM44Avalcf24/kP7WP
X-Gm-Message-State: AOJu0Ywybd0XXLhfqLebUXPj9eilv+16z0OOoEW3iopoUcm0MOWixCKB
	7DiriK7xGtgZ4TCLGe6Vx8Z99Tsdar8Fb7L5Or+VJYlNUJddcDv0ha6+rrmCDqh2Jp3IwEx3kIM
	Uaj61F6v4py53e1JhVK3CvQ4lSYPOzA1OD3o6m5GfVEOx0Gshw40+x+1G
X-Received: by 2002:a05:6871:1ce:b0:220:8c16:fe1b with SMTP id q14-20020a05687101ce00b002208c16fe1bmr11085257oad.40.1709553084365;
        Mon, 04 Mar 2024 03:51:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjVI5yM9TxghtElxPmigUP4YfP85AqY7ZvlN1o4ZW2WFa7APMJa0sy0Aq3JOmAu/PtAIozZA==
X-Received: by 2002:a05:6871:1ce:b0:220:8c16:fe1b with SMTP id q14-20020a05687101ce00b002208c16fe1bmr11085240oad.40.1709553084101;
        Mon, 04 Mar 2024 03:51:24 -0800 (PST)
Received: from [192.168.9.34] (net-2-34-28-168.cust.vodafonedsl.it. [2.34.28.168])
        by smtp.gmail.com with ESMTPSA id ye10-20020a05620a3b8a00b00788306ddc4csm115461qkn.31.2024.03.04.03.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 03:51:23 -0800 (PST)
Message-ID: <08ba8bce-0ebf-4c8f-952d-a6665dc7fdf9@redhat.com>
Date: Mon, 4 Mar 2024 12:51:20 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
From: Marco Pagani <marpagan@redhat.com>
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
> assume it should be fpga_mgr_unregister().  IIUC this flag means no
> more reference to fpga mgr, but existing references are still valid.
> 
> It works for me. But the name of this flag could be reconsidered to
> avoid misunderstanding.  The owner is still valid (we still need to put
> the owner) but allows no more reference.  Maybe "owner_inactive"?
> 
> I still wanna this owner reference change been splitted, so that
> we could simply revert it when the try_module_get_safe() got accepted.
> 

Just to be sure that I understood correctly, you want to split the
changes into two patches, like:

a) add module owner to the manager struct and take it in
__fpga_mgr_get(); move put_device() from __fpga_mgr_get() to
fpga_mgr_get() and of_fpga_mgr_get().

b) add the mutex and the unregistered flag for protection against races.

So that (b) can be reverted if try_module_get_safe() will be accepted?

> [...]

Thanks,
Marco


