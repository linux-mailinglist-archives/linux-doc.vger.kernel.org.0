Return-Path: <linux-doc+bounces-12777-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB4F88CC88
	for <lists+linux-doc@lfdr.de>; Tue, 26 Mar 2024 19:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F24481C3639D
	for <lists+linux-doc@lfdr.de>; Tue, 26 Mar 2024 18:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D093129E88;
	Tue, 26 Mar 2024 18:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gbqBBOxk"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEAF14265
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 18:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711479543; cv=none; b=W6frgoH2pUgnhSl0Jir6ewNcbmDAg5OS/0ynaOVhovPTvbXauXYwxGnuIHJOE/2wmfkylQ4mk8HHFsDakYfL2t8OX3pT2iqSeeBHAtJLQIkakmBVAzxylckyNRWS4usrzizLcnLtMcPISz4SGRIVOkd2Ebp8gXxF0/bk0xZnEy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711479543; c=relaxed/simple;
	bh=nzlWsc/uDBEtSoEPDmhVs0OiVWzdIGK9LtPb8FUS+30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ThWyb5/v2ESKJWw38fhlv+JBBE0Pb2Gd4DwwuIKCQnmK5nllXnSpIRUCNxmV9sxZIoQyGogh6yAWgEZT0NeK7EbIg/HAhmQ8oEUqcOazSJtPJvs7xdQ34Q9odk07o7QvEPitxsrAENnJCQQ7Fuh54I8qKz80snSmZAGtZV85MtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gbqBBOxk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711479540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uQIrddOl3QUoZaT2l/FFu3ki6nhY9Dj9MjNzIjnSbds=;
	b=gbqBBOxkqs3DExeKT4KQm0T36bemntOHl4ae/DjsSLx+mR0P3gg7tQ/5QxpK4GkJcQzZ51
	BCaiLAZ6WYc0pB3I4Pl1pABkACiSrkKr1YfqMuJU9WSFUDNYvXHc0RxLPbQ28Ibjtpc3/q
	T/GKgzcb78ypJzSzo9AAVpfm8ARhL8M=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-XxXW8LcLPMGhcI-muxtYYQ-1; Tue, 26 Mar 2024 14:58:59 -0400
X-MC-Unique: XxXW8LcLPMGhcI-muxtYYQ-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3c3d7bf4e1cso983803b6e.1
        for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 11:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711479538; x=1712084338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQIrddOl3QUoZaT2l/FFu3ki6nhY9Dj9MjNzIjnSbds=;
        b=c0ZRtswizNTmTV/bhvaAVh06tFRXN3n6K9uwZX2UKnXCO6fY9ouF8vFdseQCAc9buN
         qSOS9BZiJ/3fTqVyx3L5NXCKfWNAePL3fE2IwQzK+lwW78Oxm8zWLiWqC55UGBrPm4dk
         2SSAIvIvk7ESl53RkM0+WLBAEqqKCevzRtjEkEwLQFVBwoJyRDhBTP8oFdEzfeEADdsG
         nvEXYB6FvhYePJ0iMyQmpKxTjt7yV+6KkoxlZIH1FGtErBa6MtZ5sio678W+ntDGeG0D
         ydWvi/54+QFqNvvC9ptc1z4ADe3IcPSy4l/S822W5Uuc2/uKZXc6uOPJwT/MPyqgc9Js
         lxlg==
X-Forwarded-Encrypted: i=1; AJvYcCUhoewQdBFix2gZRvUKbT8X0H2ei+4YW1QyoCZmRrv1glwlMaYmC4K+55BSM2qgYLFfcKLBhw+J8dwWwiZlTPxi7aRts+YViy3Y
X-Gm-Message-State: AOJu0YyOGZkG4QhZoxN1wA19tLgIJ1UQ5yHFD7J5HeNaT9Z+0SwpbOUS
	MP1CxumSg14mzTcWDv/B/X+Weo1Xe37bomkr6I+pqJnlLXSkqjRazm2B7AoeBKjOiXbJEhW0+nn
	v9Ll13HBuNgOQezHQ6C4s0dFoMApQpVAXyPSVhqmfz51KP86M6JkwG22u
X-Received: by 2002:a05:6808:201a:b0:3c3:8822:dc36 with SMTP id q26-20020a056808201a00b003c38822dc36mr477644oiw.28.1711479538551;
        Tue, 26 Mar 2024 11:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrik+AkTkIE9LjyOL97tsR5AKnWXtxMce6KS0OU3DQAjEkRYoZ9yMnGkVi5vEp8AiJwCmJyw==
X-Received: by 2002:a05:6808:201a:b0:3c3:8822:dc36 with SMTP id q26-20020a056808201a00b003c38822dc36mr477630oiw.28.1711479538296;
        Tue, 26 Mar 2024 11:58:58 -0700 (PDT)
Received: from [192.168.9.34] (net-2-34-30-89.cust.vodafonedsl.it. [2.34.30.89])
        by smtp.gmail.com with ESMTPSA id eo7-20020a05622a544700b00431532ced95sm2620960qtb.27.2024.03.26.11.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 11:58:58 -0700 (PDT)
Message-ID: <befc8ccf-0661-4c6f-b262-3dab3c34e0be@redhat.com>
Date: Tue, 26 Mar 2024 19:58:53 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fpga: region: add owner module and take its refcount
To: Russ Weight <russ.weight@linux.dev>
Cc: Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alan Tull <atull@opensource.altera.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fpga@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240322171931.233925-1-marpagan@redhat.com>
 <20240326172854.h6gww3mqlq63kxbp@4VRSMR2-DT.corp.robot.car>
Content-Language: en-US
From: Marco Pagani <marpagan@redhat.com>
In-Reply-To: <20240326172854.h6gww3mqlq63kxbp@4VRSMR2-DT.corp.robot.car>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2024-03-26 18:28, Russ Weight wrote:
> 
> On Fri, Mar 22, 2024 at 06:19:30PM +0100, Marco Pagani wrote:
>> The current implementation of the fpga region assumes that the low-level
>> module registers a driver for the parent device and uses its owner pointer
>> to take the module's refcount. This approach is problematic since it can
>> lead to a null pointer dereference while attempting to get the region
>> during programming if the parent device does not have a driver.
>>
>> To address this problem, add a module owner pointer to the fpga_region
>> struct and use it to take the module's refcount. Modify the functions for
>> registering a region to take an additional owner module parameter and
>> rename them to avoid conflicts. Use the old function names for helper
>> macros that automatically set the module that registers the region as the
>> owner. This ensures compatibility with existing low-level control modules
>> and reduces the chances of registering a region without setting the owner.
>>
>> Also, update the documentation to keep it consistent with the new interface
>> for registering an fpga region.
>>
>> Other changes: unlock the mutex before calling put_device() in
>> fpga_region_put() to avoid potential use after release issues.
>>
>> Fixes: 0fa20cdfcc1f ("fpga: fpga-region: device tree control for FPGA")
>> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Suggested-by: Xu Yilun <yilun.xu@intel.com>
>> Signed-off-by: Marco Pagani <marpagan@redhat.com>
>> ---
>>  Documentation/driver-api/fpga/fpga-region.rst | 13 ++++++----
>>  drivers/fpga/fpga-region.c                    | 26 +++++++++++--------
>>  include/linux/fpga/fpga-region.h              | 13 +++++++---
>>  3 files changed, 33 insertions(+), 19 deletions(-)
>>
>> diff --git a/Documentation/driver-api/fpga/fpga-region.rst b/Documentation/driver-api/fpga/fpga-region.rst
>> index dc55d60a0b4a..3aff5199b6d8 100644
>> --- a/Documentation/driver-api/fpga/fpga-region.rst
>> +++ b/Documentation/driver-api/fpga/fpga-region.rst
>> @@ -46,13 +46,16 @@ API to add a new FPGA region
>>  ----------------------------
>>  
>>  * struct fpga_region - The FPGA region struct
>> -* struct fpga_region_info - Parameter structure for fpga_region_register_full()
>> -* fpga_region_register_full() -  Create and register an FPGA region using the
>> +* struct fpga_region_info - Parameter structure for __fpga_region_register_full()
>> +* __fpga_region_register_full() -  Create and register an FPGA region using the
>>    fpga_region_info structure to provide the full flexibility of options
>> -* fpga_region_register() -  Create and register an FPGA region using standard
>> +* __fpga_region_register() -  Create and register an FPGA region using standard
>>    arguments
>>  * fpga_region_unregister() -  Unregister an FPGA region
>>  
>> +Helper macros ``fpga_region_register()`` and ``fpga_region_register_full()``
>> +automatically sets the module that registers the FPGA region as the owner.
> 
> s/sets/set/

Nice catch.

> 
>> +
>>  The FPGA region's probe function will need to get a reference to the FPGA
>>  Manager it will be using to do the programming.  This usually would happen
>>  during the region's probe function.
>> @@ -82,10 +85,10 @@ following APIs to handle building or tearing down that list.
>>     :functions: fpga_region_info
>>  
>>  .. kernel-doc:: drivers/fpga/fpga-region.c
>> -   :functions: fpga_region_register_full
>> +   :functions: __fpga_region_register
>>  
>>  .. kernel-doc:: drivers/fpga/fpga-region.c
>> -   :functions: fpga_region_register
>> +   :functions: __fpga_region_register_full
>>  
>>  .. kernel-doc:: drivers/fpga/fpga-region.c
>>     :functions: fpga_region_unregister
>> diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
>> index b364a929425c..f8bbda024d59 100644
>> --- a/drivers/fpga/fpga-region.c
>> +++ b/drivers/fpga/fpga-region.c
>> @@ -53,7 +53,7 @@ static struct fpga_region *fpga_region_get(struct fpga_region *region)
>>  	}
>>  
>>  	get_device(dev);
>> -	if (!try_module_get(dev->parent->driver->owner)) {
>> +	if (!try_module_get(region->get_br_owner)) {
>>  		put_device(dev);
>>  		mutex_unlock(&region->mutex);
>>  		return ERR_PTR(-ENODEV);
>> @@ -75,9 +75,9 @@ static void fpga_region_put(struct fpga_region *region)
>>  
>>  	dev_dbg(dev, "put\n");
>>  
>> -	module_put(dev->parent->driver->owner);
>> -	put_device(dev);
>> +	module_put(region->get_br_owner);
>>  	mutex_unlock(&region->mutex);
>> +	put_device(dev);
>>  }
>>  
>>  /**
>> @@ -181,14 +181,16 @@ static struct attribute *fpga_region_attrs[] = {
>>  ATTRIBUTE_GROUPS(fpga_region);
>>  
>>  /**
>> - * fpga_region_register_full - create and register an FPGA Region device
>> + * __fpga_region_register_full - create and register an FPGA Region device
>>   * @parent: device parent
>>   * @info: parameters for FPGA Region
>> + * @owner: owner module containing the get_bridges function
>>   *
>>   * Return: struct fpga_region or ERR_PTR()
>>   */
>>  struct fpga_region *
>> -fpga_region_register_full(struct device *parent, const struct fpga_region_info *info)
>> +__fpga_region_register_full(struct device *parent, const struct fpga_region_info *info,
>> +			    struct module *owner)
>>  {
>>  	struct fpga_region *region;
>>  	int id, ret = 0;
>> @@ -213,6 +215,7 @@ fpga_region_register_full(struct device *parent, const struct fpga_region_info *
>>  	region->compat_id = info->compat_id;
>>  	region->priv = info->priv;
>>  	region->get_bridges = info->get_bridges;
>> +	region->get_br_owner = owner;
> 
> get_* implies a function. Maybe this would be better called br_owner?

You are right. I will change it to br_owner in v2.

> 
> - Russ
> 

[ ... ]
Thanks,
Marco


