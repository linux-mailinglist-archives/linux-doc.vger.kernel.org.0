Return-Path: <linux-doc+bounces-27548-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D961A99E44C
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 12:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85E3EB22FB1
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 10:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A571E571A;
	Tue, 15 Oct 2024 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ti0/cPd8"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F844683
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988868; cv=none; b=Aku0BqHLmMha4Ry0cYI93K8ZOutxM87+N8ZTa5jm7R8D6uTSzM0y7TjH75OWLBfozKR5j9JYxqoedriDcYtygsz0vd6U2s52aZlL8GzdrfhkQOoq1ZxCGfFQKTTUM8M/x+LKrK+W6/r1d6+Im1oyM6LAYWimppsIB5UHGtqrs3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988868; c=relaxed/simple;
	bh=9ShdzO/bmLu67IAiwcstveks6ejOJ8Y6MaKWflhjXWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7rhILlih0b6jJFbU4Wf6A1HGCiuY66yic0qC1+uT3pN/Yx+2gB0mbknXqhbEBJVThWuf03Xm9DSIytDcsQloNPDfkJQMY0+8xekmiMOL+28rmNDE5aSVnpDaYW5FAER0CVyWggHphc6NT+52rS8r/nKAKHJDobFjSLuTPMc3BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ti0/cPd8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728988865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=o9Xc3pdTU7L6bKaIQgVX9nuyeL3ZIBH7Lpn32FEE8B0=;
	b=Ti0/cPd86k7VBscaCxQfs10Fh2I/V6hO0Jcc3fGBa6ygC6sX9zy84ZNlGQ3cbljBnakJjT
	UQoJbildgfseegc6mKmlcORMmJLCSpeqjz5NZ+umYbcFEdcVGmsYTT9PLH8tZfV7/pitor
	ZoEOqmyADuf3bUEroyF9ArRVDMip5vc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-4fGPFgMkPZuxPxso9OKd1w-1; Tue, 15 Oct 2024 06:41:03 -0400
X-MC-Unique: 4fGPFgMkPZuxPxso9OKd1w-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d5ca192b8so1919976f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 03:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728988862; x=1729593662;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o9Xc3pdTU7L6bKaIQgVX9nuyeL3ZIBH7Lpn32FEE8B0=;
        b=od7+FLNO/3nXOAVrqClGh5lju4UwDrV3qVnF7aIS/86ebhLGX8z4U4HJ2AYfsFVsne
         Mzpo+S+fhMJ38Qv5M9QoJS1trs1/rMF6S1GdMdnx2+8uDMzbWNW/2hdgI+4uFb26kfP6
         1c1i+0XC0YkWbMB9s79sFpe/pKZ0xW56AhQTNTTaRCfzou3r3IE07WwtSbPYsbHYHtTp
         1u5iqeOtwRyJ5jYlUSFayw8/hi0/S1hRGWhqDogNiuqNMDHoKQGCxD06LsG/BfWauZD8
         3kV4gBWf0dp/e4owTmsG8J9PR3NHY4vfrc3g6Yu5y56HB3uej3AbXkQjuGB0/fi+UMeD
         LCew==
X-Forwarded-Encrypted: i=1; AJvYcCUPs/zhQATvZR1BlkqLaAhgFnzvRldQNycU9R+BI5XoQ2VG/3GJzVglijteuShw/Ee6vpmq9Y9yX34=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0LAZpdUAt9XI/urIj4cG3lnxXLb/ToZA0NY0LurS9jGvCb8no
	mKUyTdg8WaRiaPFm7gNr9eN2OwK4ZA3SE3eZ+8Uh4goQV19CCovppiwQEUSspbSIC4z4IKmjaLq
	2yodk/McJ4H584P5bDtslV5gm/69oUQ5W8YR+rtNnIurnNLvytiwx7FkxPg==
X-Received: by 2002:adf:a111:0:b0:374:bcfe:e73 with SMTP id ffacd0b85a97d-37d552cdf30mr11133689f8f.28.1728988862546;
        Tue, 15 Oct 2024 03:41:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7DAcwtn/nc+ImvyMGU6FVrMUn2vES2YhfCeC9HkbCeAs9L2ilLS/PV2swbFEL1HNIJja0EA==
X-Received: by 2002:adf:a111:0:b0:374:bcfe:e73 with SMTP id ffacd0b85a97d-37d552cdf30mr11133644f8f.28.1728988862041;
        Tue, 15 Oct 2024 03:41:02 -0700 (PDT)
Received: from ?IPV6:2003:cb:c730:9700:d653:fb19:75e5:ab5c? (p200300cbc7309700d653fb1975e5ab5c.dip0.t-ipconnect.de. [2003:cb:c730:9700:d653:fb19:75e5:ab5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa92741sm1240283f8f.60.2024.10.15.03.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:41:01 -0700 (PDT)
Message-ID: <a3f310d0-b878-44c4-9454-f7faf8be04ad@redhat.com>
Date: Tue, 15 Oct 2024 12:40:59 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] s390/kdump: implement is_kdump_kernel()
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
 Jonathan Corbet <corbet@lwn.net>, Mario Casquero <mcasquer@redhat.com>,
 Alexander Egorenkov <egorenar@linux.ibm.com>,
 Mikhail Zaslonko <zaslonko@linux.ibm.com>
References: <20241014144622.876731-1-david@redhat.com>
 <20241014144622.876731-2-david@redhat.com>
 <20241014182054.10447-D-hca@linux.ibm.com>
 <f93b2c89-821a-4da1-8953-73ccd129a074@redhat.com>
 <20241015083040.7641-C-hca@linux.ibm.com>
 <0c7e876f-5648-4a82-b809-ca48f778b4a6@redhat.com>
 <20241015100854.7641-J-hca@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241015100854.7641-J-hca@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.10.24 12:08, Heiko Carstens wrote:
> On Tue, Oct 15, 2024 at 10:41:21AM +0200, David Hildenbrand wrote:
>> On 15.10.24 10:30, Heiko Carstens wrote:
>>> On Mon, Oct 14, 2024 at 09:26:03PM +0200, David Hildenbrand wrote:
>>>> On 14.10.24 20:20, Heiko Carstens wrote:
>>>>> Looks like this could work. But the comment in smp.c above
>>>>> dump_available() needs to be updated.
>>>>
>>>> A right, I remember that there was some outdated documentation.
> 
> ...
> 
>> My concern is that we'll now have
>>
>> bool is_kdump_kernel(void)
>> {
>>         return oldmem_data.start && !is_ipl_type_dump();
>> }
>>
>> Which matches 3), but if 2) is also called "kdump", then should it actually
>> be
>>
>> bool is_kdump_kernel(void)
>> {
>>         return oldmem_data.start;
>> }
>>
>> ?
>>
>> When I wrote that code I was rather convinced that the variant in this patch
>> is the right thing to do.
> 
> Oh well, we simply of too many dump options. I'll let Alexander and
> Mikhail better comment on this :)

Thanks!

> 
> Alexander, Mikhail, the discussion starts here, and we need a sane
> is_kdump_kernel() for s390:
> https://lore.kernel.org/all/20241014144622.876731-1-david@redhat.com/
> 

With the following cleanup in mind:

 From 9fbbff43f725a8482ce9e85857316ab8484ff3c8 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Tue, 15 Oct 2024 11:07:43 +0200
Subject: [PATCH] s390: use !dump_available() instead of "!oldmem_data.start &&
  !is_ipl_type_dump()"

Let's make the code more readable:

    !dump_available()
-> !(oldmem_data.start || is_ipl_type_dump())
-> !oldmem_data.start && !is_ipl_type_dump()

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  arch/s390/kernel/crash_dump.c | 2 +-
  arch/s390/kernel/os_info.c    | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/s390/kernel/crash_dump.c b/arch/s390/kernel/crash_dump.c
index cca1827d3d2e..fbc5de66d03b 100644
--- a/arch/s390/kernel/crash_dump.c
+++ b/arch/s390/kernel/crash_dump.c
@@ -609,7 +609,7 @@ int elfcorehdr_alloc(unsigned long long *addr, unsigned long long *size)
  	u64 hdr_off;
  
  	/* If we are not in kdump or zfcp/nvme dump mode return */
-	if (!oldmem_data.start && !is_ipl_type_dump())
+	if (!dump_available())
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
-	if (!oldmem_data.start && !is_ipl_type_dump())
+	if (!dump_available())
  		goto fail;
  	if (copy_oldmem_kernel(&addr, __LC_OS_INFO, sizeof(addr)))
  		goto fail;
-- 
2.46.1


It looks like we create /proc/vmcore, allocating the elfcorehdr essentially
if dump_available() && (!is_ipl_type_dump() || !sclp.hsa_size).

So in the condition, we would have previously made is_kdump_kernel() happt *after* the
fs init calls.

So I'm wondering if is_kdump_kernel() should simply translate to dump_available(). It
doesn't sound completely right to create /proc/vmcore for "standard zfcp/nvme dump",
but that is what we currently do.

I would have thought we have that special zcore thingy for that.


So I think we should either have

bool is_kdump_kernel(void)
{
	return dump_available();
}

Or

bool is_kdump_kernel(void)
{
	return dump_available() && (!is_ipl_type_dump() || !sclp.hsa_size);
}


I'd prefer the first version.

-- 
Cheers,

David / dhildenb


