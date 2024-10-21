Return-Path: <linux-doc+bounces-28127-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678AD9A6C81
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2024 16:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88CE11C21DF1
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2024 14:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A6A1F9A93;
	Mon, 21 Oct 2024 14:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yq3rSHZY"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E8A1FA274
	for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729521971; cv=none; b=cRxGiUoOkObRg8J5zCK4Xra+zcJx99bNKqSLlyUpx4mI5EHXbwm6SIyQkiRcTnUOuhN6g9o2mmeqv+1yFpxamYQivR2OwqmdT/lm9nQ09dWwQHrf9Hi4UZ5wMPrHLVcTc77n0A2vPIXAfuWsKLL/Gt/ChvvLxaoV37qS+RfMRww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729521971; c=relaxed/simple;
	bh=DmQWkn1T9PFoG0NEwWjY8BdpxvZZCy1ZxEjLTxUCtIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1Av++0cTUHA660x+EFsgR89Wlrm2ulYNKdl20lZmDu8dlAYrZwfGVbRCVBEKBzloO+cQQsz26qJGS1u4LXGSF5v+n+V0KUheLyjPEcF5uAz6wjzvQnn1CtgxBCCduyjUPe5ssB03uxYGnnY/ZrKPOHii4DcONNwc2Bs/uQgHKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yq3rSHZY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729521968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3pBpP7qLCW9N3cROeVqgUltAMhaWq+ArP+b0NXa5W34=;
	b=Yq3rSHZYG3Te7cCwWcrENGnLhF4UzmsLDweo4vZoZq496oALUj3+Pn6/SuPwlRhhtZpGfi
	PxwbGlKhMRW5E6nwqImo8MAjJtmUX83PIdbXm5idT4ef8nAH2syVC5PK8w2XS4a9t4q7Kw
	32X9nyVW8WJwfQeErn4ENxif8ZayFZA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-Zj5UpUVnPH-wbIRGAU5IKg-1; Mon, 21 Oct 2024 10:46:04 -0400
X-MC-Unique: Zj5UpUVnPH-wbIRGAU5IKg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4315cefda02so33101955e9.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 07:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521962; x=1730126762;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3pBpP7qLCW9N3cROeVqgUltAMhaWq+ArP+b0NXa5W34=;
        b=ZBIuvo4DG4qITXEAK0/rlXEUIedp3rGCzX5OIRkAH6gIifmSbA9KtptQ4Lo6QcOD7S
         p0ZaAnIPAYIq4MHr0S1IaY7zH6DEhgYJOoXbOB9gyNYRN1s2+riw/FAfd0F54NXni1IH
         8GjtJS8WIwzLnBnX20OZkz6z24uzBPIyEnKU2Kpq8O5QAcO4rfbrsBqN0bCYwRTjaVIR
         BZI6sGfkBO74jDvi6x/JtdbQ24bl2y2T5kmz22qVaajPJsZZlYrNxrka0H+S9VnTzYcM
         zUBlRcAm5SE8wVfwtr7YIPjUCfOPOxDBHhRx2wyicCsFpN/y3wvdeHcq5U77VFuRL70S
         N9lA==
X-Forwarded-Encrypted: i=1; AJvYcCWfoODmq5dn8Vr7YI/7lKGnbBPHU6rgou4rfNyXB2rbjmEv2nlGUyDZ9sWefCp8c5IUZ8+AGSidejw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAaNerNEWbz+yrciUNOk4EK/DU15Mxhidpxu4dFogGZOcb6vHn
	mg6jgrx4PoMiH3jaosMJWMAtsr1a1QQDEIpzpIpQrn5lwxg44+cIv+AnW6UXZdDeNeyVhuAEHPJ
	GVX4CKJQyR346r68tBs7JreQjvcpK3s0e42OVN0YmY64pW4TbAgILXs7oaQ==
X-Received: by 2002:a05:600c:4f15:b0:42c:b187:bde9 with SMTP id 5b1f17b1804b1-4316168ffb3mr101784465e9.30.1729521961927;
        Mon, 21 Oct 2024 07:46:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnIcoVRRXbRUhxXReK6GpWNjdl0oiVGYJ9jq/7PmjHByyOKh4qiRtxhiYigJPvogBLyhVgLw==
X-Received: by 2002:a05:600c:4f15:b0:42c:b187:bde9 with SMTP id 5b1f17b1804b1-4316168ffb3mr101784205e9.30.1729521961507;
        Mon, 21 Oct 2024 07:46:01 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:36d3:2b96:a142:a05b? ([2a09:80c0:192:0:36d3:2b96:a142:a05b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57fc77sm60419925e9.17.2024.10.21.07.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 07:46:01 -0700 (PDT)
Message-ID: <64db4a88-4f2d-4d1d-8f7c-37c797d15529@redhat.com>
Date: Mon, 21 Oct 2024 16:45:59 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] s390/kdump: implement is_kdump_kernel()
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Cc: agordeev@linux.ibm.com, akpm@linux-foundation.org,
 borntraeger@linux.ibm.com, cohuck@redhat.com, corbet@lwn.net,
 eperezma@redhat.com, frankja@linux.ibm.com, gor@linux.ibm.com,
 hca@linux.ibm.com, imbrenda@linux.ibm.com, jasowang@redhat.com,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-s390@vger.kernel.org, mcasquer@redhat.com, mst@redhat.com,
 svens@linux.ibm.com, thuth@redhat.com, virtualization@lists.linux.dev,
 xuanzhuo@linux.alibaba.com, zaslonko@linux.ibm.com
References: <87ed4g5fwk.fsf@li-0ccc18cc-2c67-11b2-a85c-a193851e4c5d.ibm.com>
 <76f4ed45-5a40-4ac4-af24-a40effe7725c@redhat.com>
 <87sespfwtt.fsf@li-0ccc18cc-2c67-11b2-a85c-a193851e4c5d.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
In-Reply-To: <87sespfwtt.fsf@li-0ccc18cc-2c67-11b2-a85c-a193851e4c5d.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Am 21.10.24 um 14:46 schrieb Alexander Egorenkov:
> Hi David,
> 
> David Hildenbrand <david@redhat.com> writes:
> 
>> Makes sense, so it boils down to either
>>
>> bool is_kdump_kernel(void)
>> {
>>            return oldmem_data.start;
>> }
>>
>> Which means is_kdump_kernel() can be "false" even though /proc/vmcore is
>> available or
>>
>> bool is_kdump_kernel(void)
>> {
>>            return dump_available();
>> }
>>
>> Which means is_kdump_kernel() can never be "false" if /proc/vmcore is
>> available. There is the chance of is_kdump_kernel() being "true" if
>> "elfcorehdr_alloc()" fails with -ENODEV.

Thanks for having another look!

> 
> Do you consider is_kdump_kernel() returning "true" in case of zfcpdump or
> nvme/eckd+ldipl dump (also called NGDump) okay ? Because
> dump_available() would return "true" in such cases too.
> If yes then please explain why, i might have missed a previous
> explanation from you.

I consider it okay because this is the current behavior after elfcorehdr_alloc() 
succeeded and set elfcorehdr_addr.

Not sure if it is the right think to do, though :)

Whatever we do, we should achieve on s390 that the result of is_kdump_kernel() 
is consistent throughout the booting stages, just like on all other architectures.

Right now it goes from false->true when /proc/vmcore gets initialized (and only 
if it gets initialized properly).

> 
> I'm afraid everyone will make wrong assumptions while reading the name
> of is_kdump_kernel() and assuming that it only applies to kdump or
> kdump-alike dumps (like stand-alone kdump), and, therefore, introduce
> bugs because the name of the function conveys the wrong idea to code
> readers. I consider dump_available() as a superset of is_kdump_kernel()
> and, therefore, to me they are not equivalent.
 > > I have the feeling you consider is_kdump_kernel() equivalent to
> "/proc/vmcore" being present and not really saying anything about
> whether kdump is active ?

Yes, but primarily because this is the existing handling.

Staring at the powerpc implementation:

/*
  * Return true only when kexec based kernel dump capturing method is used.
  * This ensures all restritions applied for kdump case are not automatically
  * applied for fadump case.
  */
bool is_kdump_kernel(void)
{
	return !is_fadump_active() && elfcorehdr_addr != ELFCORE_ADDR_MAX;
}
EXPORT_SYMBOL_GPL(is_kdump_kernel);


Which was added by

commit b098f1c32365304633077d73e4ae21c72d4241b3
Author: Hari Bathini <hbathini@linux.ibm.com>
Date:   Tue Sep 12 13:59:50 2023 +0530

     powerpc/fadump: make is_kdump_kernel() return false when fadump is active

     Currently, is_kdump_kernel() returns true in crash dump capture kernel
     for both kdump and fadump crash dump capturing methods, as both these
     methods set elfcorehdr_addr. Some restrictions enforced for crash dump
     capture kernel, based on is_kdump_kernel(), are specifically meant for
     kdump case and not desirable for fadump - eg. IO queues restriction in
     device drivers. So, define is_kdump_kernel() to return false when f/w
     assisted dump is active.


For my purpose (virtio-mem), it's sufficient to only support "kexec triggered 
kdump" either way, so I don't care.

So for me it's good enough to have

bool is_kdump_kernel(void)
{
	return oldmem_data.start;
}

And trying to document the situation in a comment like powerpc does :)

-- 
Cheers,

David / dhildenb


