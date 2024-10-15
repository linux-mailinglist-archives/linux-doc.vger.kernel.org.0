Return-Path: <linux-doc+bounces-27524-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5925299E1B2
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 10:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBD9F1F26790
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 08:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590C41D0784;
	Tue, 15 Oct 2024 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z5gYEZEg"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E7C1C3F0A
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 08:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728982429; cv=none; b=WVo+HltyawNaWsDMTW0nnRvQfjwUOC5It8qDnDBhCrkiuea8+Ynxn2L5/WUsrWtpMM+CuqHLBGV0nTMBnhw5/mEdDb4ZXh8KKVLV8kKtPFhE1vQtuHtkupiEWQquydhlmlgqSlja23h8SVwcNcA0rcrxEVB/fufz9lcO7ajb4tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728982429; c=relaxed/simple;
	bh=cCO6k509GchPM8MKW2tnK2KlEfAg2yEcGXdslgc9ZAQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cHw8sD4/sFLtUJigDXgtjEdvfERHpOPjg5G2BqKu/5cL2VLVRp5+jxaTwJbTdLf7f5MHdiJcBCf2YVpNrd55aCbCB8Qx50RZzk3dlo1L1BHGgrY3EKGwoSGe6kuEYyydCz8/q3cvSvnoxreMKKH3TZRynISDXRTm//t+F2E5DRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z5gYEZEg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728982426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vea3Db7MOU1y6JVuoKAndvUjY3oqb1LxEwH6YBMbryM=;
	b=Z5gYEZEgLlaRfeOZKkDualbXQHGhCZri5xqwaVV3WwVT99bbBnpZUpSR24SjcMKHTiyKlq
	h1Np+rAUxjtPpLDeGjJo0KUG1fMO05yRQCiHnect1Yu94f01d/3DWvNmfH0fRGLabOPjjt
	NTIiangM5YkxvXpzr9qrAKpK+grk0YY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-SavAfEuxO4SfPmkVviMm7w-1; Tue, 15 Oct 2024 04:53:45 -0400
X-MC-Unique: SavAfEuxO4SfPmkVviMm7w-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-539f067414fso1587092e87.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 01:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728982422; x=1729587222;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vea3Db7MOU1y6JVuoKAndvUjY3oqb1LxEwH6YBMbryM=;
        b=INy1akrhQtO0iK7G14Xu3reL8DLWOB077sAfALxYOla4CZN+1WEwiVvZmSW4/BIS6A
         6ytHk4Cojw35EegkdBKUYO27kuBYaxwxntB+ZE63Ujq7vOLDoyH9A95UvCKz90Eg06kk
         0QbnxvECg34/SjYhli59L6279cT4Sk0CVlBQERnwowPWFACgqVIzc6u63jCSlD0TNvrf
         NelPabQSLUgEfGkvOFzrctfbW+BgoTq8KyK+ZPiVeo4yC/huXpSN2yEKXOH7zdtsnHcA
         X95qCeqtMaxfxALY5lGTW30H+zcKesvwVBnjl1QgS1Cqv1IohXYgOcZ19OWSIFJe0MnL
         qfcg==
X-Forwarded-Encrypted: i=1; AJvYcCWCObQlSV5FRrRTe/PJKJmF29mcZc5M6TvVF20Gqlz3+YWbJ+ukDnxkr5mkIPkGkIYL/FDtcJ5K1/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/1CWjbHXnG8/lHAOUVP5dxNUWUAQS+gd+FfVG86caSe5+8jSn
	y2DXcglkP7yNnEShsjv0FoJyCrLwBzo4hNQQadUfSmv78i/ztMkFbcbGCKiQlvhFpep5mHUKCOV
	RuHvd4x7Dnxv3ppO3PSZro8FF5Rvmmn878PRITFjRIDgnExaR4a7fsM7ODw==
X-Received: by 2002:a05:6512:2c90:b0:539:e776:71f2 with SMTP id 2adb3069b0e04-539e7767459mr4594042e87.52.1728982421691;
        Tue, 15 Oct 2024 01:53:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESPX9nlg7zsDBefSD6Paju6t8SbolD81sKh21Sxmd+f1ZnXPm6cBexBcsMMBeSMJwPe6g/1g==
X-Received: by 2002:a05:6512:2c90:b0:539:e776:71f2 with SMTP id 2adb3069b0e04-539e7767459mr4594020e87.52.1728982421165;
        Tue, 15 Oct 2024 01:53:41 -0700 (PDT)
Received: from ?IPV6:2003:cb:c730:9700:d653:fb19:75e5:ab5c? (p200300cbc7309700d653fb1975e5ab5c.dip0.t-ipconnect.de. [2003:cb:c730:9700:d653:fb19:75e5:ab5c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f569eacsm11175035e9.20.2024.10.15.01.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 01:53:39 -0700 (PDT)
Message-ID: <9be496ff-9d94-4680-b095-863ec12e3261@redhat.com>
Date: Tue, 15 Oct 2024 10:53:37 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] s390/kdump: implement is_kdump_kernel()
From: David Hildenbrand <david@redhat.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-s390@vger.kernel.org, virtualization@lists.linux.dev,
 linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Mario Casquero <mcasquer@redhat.com>
References: <20241014144622.876731-1-david@redhat.com>
 <20241014144622.876731-2-david@redhat.com>
 <20241014182054.10447-D-hca@linux.ibm.com>
 <f93b2c89-821a-4da1-8953-73ccd129a074@redhat.com>
 <20241015083040.7641-C-hca@linux.ibm.com>
 <0c7e876f-5648-4a82-b809-ca48f778b4a6@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <0c7e876f-5648-4a82-b809-ca48f778b4a6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.10.24 10:41, David Hildenbrand wrote:
> On 15.10.24 10:30, Heiko Carstens wrote:
>> On Mon, Oct 14, 2024 at 09:26:03PM +0200, David Hildenbrand wrote:
>>> On 14.10.24 20:20, Heiko Carstens wrote:
>>>> Looks like this could work. But the comment in smp.c above
>>>> dump_available() needs to be updated.
>>>
>>> A right, I remember that there was some outdated documentation.
>>>
>>>>
>>>> Are you willing to do that, or should I provide an addon patch?
>>>>
>>>
>>> I can squash the following:
>>>
>>> diff --git a/arch/s390/kernel/smp.c b/arch/s390/kernel/smp.c
>>> index 4df56fdb2488..a4f538876462 100644
>>> --- a/arch/s390/kernel/smp.c
>>> +++ b/arch/s390/kernel/smp.c
>>> @@ -587,16 +587,16 @@ int smp_store_status(int cpu)
>>>     *    with sigp stop-and-store-status. The firmware or the boot-loader
>>>     *    stored the registers of the boot CPU in the absolute lowcore in the
>>>     *    memory of the old system.
>>> - * 3) kdump and the old kernel did not store the CPU state,
>>> - *    or stand-alone kdump for DASD
>>> - *    condition: OLDMEM_BASE != NULL && !is_kdump_kernel()
>>> + * 3) kdump or stand-alone kdump for DASD
>>> + *    condition: OLDMEM_BASE != NULL && !is_ipl_type_dump() == false
>>>     *    The state for all CPUs except the boot CPU needs to be collected
>>>     *    with sigp stop-and-store-status. The kexec code or the boot-loader
>>>     *    stored the registers of the boot CPU in the memory of the old system.
>>> - * 4) kdump and the old kernel stored the CPU state
>>> - *    condition: OLDMEM_BASE != NULL && is_kdump_kernel()
>>> - *    This case does not exist for s390 anymore, setup_arch explicitly
>>> - *    deactivates the elfcorehdr= kernel parameter
>>> + *
>>> + * Note that the old Kdump mode where the old kernel stored the CPU state
>>
>> To be consistent with the rest of the comment, please write kdump in
>> all lower case characters, please.
> 
> It obviously was too late in the evening for me :) Thanks!
> 
>>
>>> + * does no longer exist: setup_arch explicitly deactivates the elfcorehdr=
>>> + * kernel parameter. The is_kudmp_kernel() implementation on s390 is independent
>>
>> Typo: kudmp.
>>
>>> Does that sound reasonable? I'm not so sure about the "2) stand-alone kdump for
>>> SCSI/NVMe (zfcp/nvme dump with swapped memory)": is that really "kdump" ?
>>
>> Yes, it is some sort of kdump, even though a bit odd.
> 
> My concern is that we'll now have
> 
> bool is_kdump_kernel(void)
> {
>          return oldmem_data.start && !is_ipl_type_dump();
> }
> 
> Which matches 3), but if 2) is also called "kdump", then should it
> actually be
> 
> bool is_kdump_kernel(void)
> {
>          return oldmem_data.start;
> }
> 
> ?
> 
> When I wrote that code I was rather convinced that the variant in this
> patch is the right thing to do.
> 

I think we can do some follow up cleanups, assuming is_kdump_kernel() here is correct:

diff --git a/arch/s390/kernel/crash_dump.c b/arch/s390/kernel/crash_dump.c
index cca1827d3d2e..fbc5de66d03b 100644
--- a/arch/s390/kernel/crash_dump.c
+++ b/arch/s390/kernel/crash_dump.c
@@ -609,7 +609,7 @@ int elfcorehdr_alloc(unsigned long long *addr, unsigned long long *size)
         u64 hdr_off;
  
         /* If we are not in kdump or zfcp/nvme dump mode return */
-       if (!oldmem_data.start && !is_ipl_type_dump())
+       if (!dump_available())
                 return 0;
         /* If we cannot get HSA size for zfcp/nvme dump return error */
         if (is_ipl_type_dump() && !sclp.hsa_size)
diff --git a/arch/s390/kernel/os_info.c b/arch/s390/kernel/os_info.c
index b695f980bbde..09578f400ef7 100644
--- a/arch/s390/kernel/os_info.c
+++ b/arch/s390/kernel/os_info.c
@@ -148,7 +148,7 @@ static void os_info_old_init(void)
  
         if (os_info_init)
                 return;
-       if (!oldmem_data.start && !is_ipl_type_dump())
+       if (!dump_available())
                 goto fail;
         if (copy_oldmem_kernel(&addr, __LC_OS_INFO, sizeof(addr)))
                 goto fail;
diff --git a/drivers/s390/char/zcore.c b/drivers/s390/char/zcore.c
index 33cebb91b933..6a194b4f6ba5 100644
--- a/drivers/s390/char/zcore.c
+++ b/drivers/s390/char/zcore.c
@@ -300,9 +300,7 @@ static int __init zcore_init(void)
         unsigned char arch;
         int rc;
  
-       if (!is_ipl_type_dump())
-               return -ENODATA;
-       if (oldmem_data.start)
+       if (is_kdump_kernel())
                 return -ENODATA;
  
         zcore_dbf = debug_register("zcore", 4, 1, 4 * sizeof(long));


-- 
Cheers,

David / dhildenb


