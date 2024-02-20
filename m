Return-Path: <linux-doc+bounces-10101-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E52EB85BA12
	for <lists+linux-doc@lfdr.de>; Tue, 20 Feb 2024 12:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CFC62832B9
	for <lists+linux-doc@lfdr.de>; Tue, 20 Feb 2024 11:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB70567E8F;
	Tue, 20 Feb 2024 11:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ST54df3H"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0632267E91
	for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 11:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708427495; cv=none; b=jsJ2wjjCZh3uPJmLRkCRPvmGYSiEKOkoXhknxcojzAYv0V8RMYAaEe78RvIwKBCOtkEzr3nfCsV72nnowIuGMZ9GTCIMcQOyKQsNRaZ4EuxTAPMbC0LtLmpMgkNOP7UNATrLPYZ70Vtzfwnar8NMehG7Esr3gRBVukjQpfAsb/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708427495; c=relaxed/simple;
	bh=C91A5rLZ2ygagCyh3jj0WuRiDBihrW1zf2K5r9Y6ciQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtBKpJ9mWgIYrX5ngEbIYrB7jbg/FeUgXrExHcQ2lU6Ato0326MWx+SYk/tgq/qBmHcoLDA4iitXQQW0Q0GCquPdEBhyc7CPn6GQ7EfpN258ywktSkFZRfEuTFhIY7Yr+lGhAMTOhB337CfMWtDQNWhP9fcZJSTZ/jPmWBPFPeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ST54df3H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708427492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2MSipKiPs67DEWw5wlFB16YMhuuCHo3NiTgEwpzrbFk=;
	b=ST54df3HGW3KSVjLCu1l/7KL/LeRR3uQ5F5L251+jLcjty07oz0NngGZyVeKYp2zGI8PFc
	BFUgcCPcqq9GgiQYSg0Sbp24OxkHWeQZrErrO3fEdhuI1p3DpUNnkNedbjdjipr5+ZSqTV
	OMXTiOHR1MNgRGGM1YT0Gx35RGY8bLU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-uFXrkOcJMU2MeCPTZpnmng-1; Tue, 20 Feb 2024 06:11:31 -0500
X-MC-Unique: uFXrkOcJMU2MeCPTZpnmng-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-68c53f2816dso57186516d6.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 03:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708427491; x=1709032291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2MSipKiPs67DEWw5wlFB16YMhuuCHo3NiTgEwpzrbFk=;
        b=JAIS4DeJfvnlNTyOox4vvVY//0rZdYRWn/yda4WVr7AfKkKVv5Kl9jA7gmDtT/rF6Z
         W9dFyaaT/Xjff8l9hz+mKq/q2qDsLTO4SW7pBfsqgCzL+1m1gQd0kDCe/Ypzu8A6Wmv3
         xW/dc081tWiRltNT1eUsMXe2rRlwV8VRbmGNKyka+16ch8/LGuiSCu28W5k7Bq6nqmx0
         4VA4M4PTuK3m1dlbs+Avf/UP/dkp2dDugG8peNv2zP2ImsxjJLHbzfv2Ho/ohhLn6u7s
         BUB1eWOzuDVwelmkzSlM9++pSDt21TBG6l3RwTgKQRKplAcJhPIGefzd2hWkDXeao7jO
         9K5w==
X-Forwarded-Encrypted: i=1; AJvYcCX5OjzStFt/grarLj+s0EpflXIw857FSkOunP+crmqrBdRZnk1JmzEcts/GtaaTrN17vDZNYMw1LLD6GDOoJdOp0H8UG0+HydA8
X-Gm-Message-State: AOJu0YwAdSVBNJOpX5l1bZUECoL7ycarHtyJccwWfsoZdoEeS6pa3c54
	VsvmWRkR2xK7GbbOAvEvE0E6+OayvQYqx/O7xEB2Sa/xZJD4MLm7ifVgW+e2u6pi84H8NuCE8AM
	Lu/bEhlD06cB0a2/hFyVingxMfTSq1lC40/85jSddMh00+AL/Z8bhA5EX
X-Received: by 2002:a0c:f2c4:0:b0:68f:7c62:ccc7 with SMTP id c4-20020a0cf2c4000000b0068f7c62ccc7mr3525571qvm.52.1708427490872;
        Tue, 20 Feb 2024 03:11:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3e+rHiy7BLRRb2Bxlp90Q8E0Y8sYInFwg93yTV1yB+OetOFhQ+ojoYWpsW8esQ9yXtq0xnw==
X-Received: by 2002:a0c:f2c4:0:b0:68f:7c62:ccc7 with SMTP id c4-20020a0cf2c4000000b0068f7c62ccc7mr3525546qvm.52.1708427490567;
        Tue, 20 Feb 2024 03:11:30 -0800 (PST)
Received: from [192.168.9.34] (net-2-34-24-75.cust.vodafonedsl.it. [2.34.24.75])
        by smtp.gmail.com with ESMTPSA id l4-20020a0cee24000000b0068f6e1c3582sm255279qvs.146.2024.02.20.03.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 03:11:30 -0800 (PST)
Message-ID: <9a9d4018-fd65-49be-9e0a-1eecc9cbf15d@redhat.com>
Date: Tue, 20 Feb 2024 12:11:26 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 1/1] fpga: add an owner and use it to take the
 low-level module's refcount
Content-Language: en-US
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
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <ZdHWaeU+/On6LmHX@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2024-02-18 11:05, Xu Yilun wrote:
> On Mon, Feb 05, 2024 at 06:47:34PM +0100, Marco Pagani wrote:
>>
>>
>> On 2024-02-04 06:15, Xu Yilun wrote:
>>> On Fri, Feb 02, 2024 at 06:44:01PM +0100, Marco Pagani wrote:
>>>>
>>>>
>>>> On 2024-01-30 05:31, Xu Yilun wrote:
>>>>>> +#define fpga_mgr_register_full(parent, info) \
>>>>>> +	__fpga_mgr_register_full(parent, info, THIS_MODULE)
>>>>>>  struct fpga_manager *
>>>>>> -fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info);
>>>>>> +__fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info,
>>>>>> +			 struct module *owner);
>>>>>>  
>>>>>> +#define fpga_mgr_register(parent, name, mops, priv) \
>>>>>> +	__fpga_mgr_register(parent, name, mops, priv, THIS_MODULE)
>>>>>>  struct fpga_manager *
>>>>>> -fpga_mgr_register(struct device *parent, const char *name,
>>>>>> -		  const struct fpga_manager_ops *mops, void *priv);
>>>>>> +__fpga_mgr_register(struct device *parent, const char *name,
>>>>>> +		    const struct fpga_manager_ops *mops, void *priv, struct module *owner);
>>>>>> +
>>>>>>  void fpga_mgr_unregister(struct fpga_manager *mgr);
>>>>>>  
>>>>>> +#define devm_fpga_mgr_register_full(parent, info) \
>>>>>> +	__devm_fpga_mgr_register_full(parent, info, THIS_MODULE)
>>>>>>  struct fpga_manager *
>>>>>> -devm_fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info);
>>>>>> +__devm_fpga_mgr_register_full(struct device *parent, const struct fpga_manager_info *info,
>>>>>> +			      struct module *owner);
>>>>>
>>>>> Add a line here. I can do it myself if you agree.
>>>>
>>>> Sure, that is fine by me. I also spotted a typo in the commit log body
>>>> (in taken -> is taken). Do you want me to send a v6, or do you prefer
>>>> to fix that in place?
>>>
>>> No need, I can fix it.
>>>
>>>>
>>>>>
>>>>> There is still a RFC prefix for this patch. Are you ready to get it merged?
>>>>> If yes, Acked-by: Xu Yilun <yilun.xu@intel.com>
>>>>
>>>> I'm ready for the patch to be merged. However, I recently sent an RFC
>>>> to propose a safer implementation of try_module_get() that would
>>>> simplify the code and may also benefit other subsystems. What do you
>>>> think?
>>>>
>>>> https://lore.kernel.org/linux-modules/20240130193614.49772-1-marpagan@redhat.com/
>>>
>>> I suggest take your fix to linux-fpga/for-next now. If your try_module_get()
>>> proposal is applied before the end of this cycle, we could re-evaluate
>>> this patch.
>>
>> That's fine by me.
> 
> Sorry, I still found issues about this solution.
> 
> void fpga_mgr_unregister(struct fpga_manager *mgr)
> {
>         dev_info(&mgr->dev, "%s %s\n", __func__, mgr->name);
> 
>         /*
>          * If the low level driver provides a method for putting fpga into
>          * a desired state upon unregister, do it.
>          */
>         fpga_mgr_fpga_remove(mgr);
> 
>         mutex_lock(&mgr->mops_mutex);
> 
>         mgr->mops = NULL;
> 
>         mutex_unlock(&mgr->mops_mutex);
> 
>         device_unregister(&mgr->dev);
> }
> 
> Note that fpga_mgr_unregister() doesn't have to be called in module_exit().
> So if we do fpga_mgr_get() then fpga_mgr_unregister(), We finally had a
> fpga_manager dev without mops, this is not what the user want and cause
> problem when using this fpga_manager dev for other FPGA APIs.

How about moving mgr->mops = NULL from fpga_mgr_unregister() to
class->dev_release()? In that way, mops will be set to NULL only when the
manager dev refcount reaches 0.

If fpga_mgr_unregister() is called from module_exit(), we are sure that nobody
got the manager dev earlier using fpga_mgr_get(), or it would have bumped up
the module's refcount, preventing its removal in the first place. In this case,
when device_unregister() is called, it will trigger dev_release() since the
manager dev refcount has reached 0.

If fpga_mgr_unregister() is called elsewhere in the module that registered the
manager (1), we have two subcases:

a) someone got the manager dev earlier and bumped the module's refcount. Hence,
the ops are safe since the module cannot be removed until the manager dev is
released by calling (the last) put_device(). This, in turn, will trigger
class->dev_release().

b) no one got manager dev. In this case, class->dev_release() will be called
immediately.

(1) The caller of fpga_mgr_register_*() is responsible for calling
fpga_mgr_unregister(), as specified in the docs.

> I have this concern when I was reviewing the same improvement for fpga
> bridge. The change for fpga bridge seems workable, the mutex keeps hold
> until fpga_bridge_put(). But I somewhat don't prefer the unregistration
> been unnecessarily blocked for long term.

I also don't like the idea of potentially blocking the unregistration, but I
could not find a better solution for the bridge at the moment.

> I think your try_module_get_safe() patch may finally solve the invalid
> module owner issue. Some options now, we ignore the invalid module owner
> issue (it exists before this change) and merge the rest of the
> improvements, or we wait for your patch accepted then re-evaluate. I
> prefer the former.

Yeah, try_module_get_safe() would make things simpler and easier. I'm currently
working on a series of selftests to demonstrate that the function is safe from
deadlocks, as requested by the maintainer. I hope I can convince people of the
advantages.

Thanks,
Marco


