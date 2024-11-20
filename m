Return-Path: <linux-doc+bounces-31244-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A04479D4128
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2024 18:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18797B3AD80
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2024 16:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEAE155300;
	Wed, 20 Nov 2024 16:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bzCKQg6w"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741C7148FE8
	for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 16:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732121051; cv=none; b=gQJ97IP7YwnkjnPDP+oe27SEBqwA2r3NhcXJZfL3WQEgRtdNXaAEqcfCeKeQCnD7/itAffpmT6iDEKkxbbne/rJaJXxThzczCnWtMALM7hj0UH+gC/B+LzHB0V4FWzS+DaJ7ZvxzrpCiaQgTCKAcjj6P8IQShqzv0i4YUBYuvG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732121051; c=relaxed/simple;
	bh=uYo8eG8inoXGpUEzLzFFj6kxgXP2JIPjALVru0W0OGY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=i5XreBdkzLZw49veOeIPro+BmeJDaxa4v6aKxyxL0F+gcT+wHtb/SBfglZW1s17lk3BfMmyhBfzSAfmeU7ndvy3B6touOMkQzx30ETqnivYgHNvvd1hwpmVrSWB0UMR8Uq7YEq+Y4iC2mHQInCSOxW/poMME0ppG1ocSoURZGWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bzCKQg6w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732121048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=x9Ssvuyu1MgRlStpb+O7UdyHoMsIuLdOhQfEXiBZnfA=;
	b=bzCKQg6wqKvJMaEf7q7Dpx6w5jnJRb4OiXdvD0ZePYqLIr5o3+o3Khj/p/6W8C03bS6EWe
	fBja6LW91oAeG1I1NQlyf8xu4PuhaicRQ2KyvAb7MqJhNbyou+qu99P10DJ2BVuCRTJ0mX
	gteu+0HsQV9Xg53JpBHe9tMFDgUVBqg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-irLv-3S0MAak5IM0B8WIOw-1; Wed, 20 Nov 2024 11:44:07 -0500
X-MC-Unique: irLv-3S0MAak5IM0B8WIOw-1
X-Mimecast-MFC-AGG-ID: irLv-3S0MAak5IM0B8WIOw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4315a0f25afso17836085e9.3
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 08:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732121046; x=1732725846;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x9Ssvuyu1MgRlStpb+O7UdyHoMsIuLdOhQfEXiBZnfA=;
        b=rTzvFsRxlMZSqWYWSMvd+rXQ6wsh74vIPhV5FEV22uhbJfaE14rsqxoEBvTUt7D/Mv
         HsE8mELZ30z7/Xw3g7xHJJSsri1427HEffl+4Bvf7LJE3VDVwsgAvsRn9f79MQjnqLN4
         sJjg7zk0ptUQeFaFbTTQsMo0wrVl3nW8QJgtGaS1LO1v6PdiitjgXLtKSnLo5x93yxcu
         QDumPpxsbQ9nXsm5yo0Il9w1N24x7HOb2DeUIftHBo7UpsSN3Egl97wydo//5gafkzVb
         ev7uw/jzfFAl08BZw2ihDUikAzLANkZrPXTTJQsT6xHYKJGalw3rGkbf0vZhhXeivI2u
         8wCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCLEDRJXC0PbPDGXNSI+PW8CJ8qQ1p/S2jNzmp9vnJf/tc138x3D/CG3Ph3QyAfzE4XZb0q++RwE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRF1dnQTzaEWpsCAHHAuOougMQVGurvoHSXdJ6ej5rIImVgzy9
	ytIaYNyS2rvf3C9PMbhivallBjR4LHjPxooWQ+uSZYJIVix8KkubfCzRFOYMJRRBI5oMQ5QnmMZ
	jp12oEr/9kRw75p2vZi9COHmAXv2ov8K+gjF5GRHeL6iUj/JM7iA8ax2kpg==
X-Gm-Gg: ASbGncuB6To8tjCCKkxNJEeiuJgwC4DX7O/dWjY4LGTtJ++LjsufQOyrhZ67X9ML6iK
	MG/j8fe69jOFKkURdjIWXUYMquLcqK6tSRI4B3lpKNj7NcVXKo5I7zISeXtO3U1gmko3NuKFgxF
	glrJC60fMtAeodYDbZZM1d4XLA7UaKPt98uJ1Ik/OnbZ/cteTkMNYAN+L+s9v40hQR+vGWpDl/o
	erlz/7A+NuJ6j7uc3z4BcEKi1aZQ0vYCyYt/CnXLtMpDyXZAgfhR5eDtOT3FfGUiaKc3cQ/gRS0
	Y7VY/QE/EYQEWWOWgxp7uWIIHqIbcsRU61JZqdzxMOMC+lhAXNAYBoYgUFeI+ZSHTZLcp1b4ger
	ZHA==
X-Received: by 2002:a05:600c:4586:b0:42e:d4a2:ce67 with SMTP id 5b1f17b1804b1-433489d47fcmr34773285e9.17.1732121045821;
        Wed, 20 Nov 2024 08:44:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA9eT41sZnAwaZLAcxIVGSg2mXc58Srg0wwX1mEr1ZzI70pKW8isqCx2JyDupfQl/M2mFYoQ==
X-Received: by 2002:a05:600c:4586:b0:42e:d4a2:ce67 with SMTP id 5b1f17b1804b1-433489d47fcmr34773035e9.17.1732121045471;
        Wed, 20 Nov 2024 08:44:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:4200:ce79:acf6:d832:60df? (p200300cbc7054200ce79acf6d83260df.dip0.t-ipconnect.de. [2003:cb:c705:4200:ce79:acf6:d832:60df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825491103fsm2483483f8f.55.2024.11.20.08.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 08:44:04 -0800 (PST)
Message-ID: <f55d56d7-0ab9-495f-96bf-9bf642a9762d@redhat.com>
Date: Wed, 20 Nov 2024 17:44:03 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] KVM: ioctl for populating guest_memfd
From: David Hildenbrand <david@redhat.com>
To: kalyazin@amazon.com, pbonzini@redhat.com, corbet@lwn.net,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jthoughton@google.com, brijesh.singh@amd.com, michael.roth@amd.com,
 graf@amazon.de, jgowans@amazon.com, roypat@amazon.co.uk, derekmn@amazon.com,
 nsaenz@amazon.es, xmarcalx@amazon.com,
 Sean Christopherson <seanjc@google.com>, linux-mm@kvack.org
References: <20241024095429.54052-1-kalyazin@amazon.com>
 <08aeaf6e-dc89-413a-86a6-b9772c9b2faf@amazon.com>
 <01b0a528-bec0-41d7-80f6-8afe213bd56b@redhat.com>
 <efe6acf5-8e08-46cd-88e4-ad85d3af2688@redhat.com>
 <55b6b3ec-eaa8-494b-9bc7-741fe0c3bc63@amazon.com>
 <9286da7a-9923-4a3b-a769-590e8824fa10@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9286da7a-9923-4a3b-a769-590e8824fa10@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> No, I can't immediately see why it shouldn't work.  My main concern
>> would probably still be about the latency of the population stage as I
>> can't see why it would improve compared to what we have now, because my
>   > feeling is this is linked with the sharedness property of guest_memfd.
> 
> If the problem is the "pagecache" overhead, then yes, it will be a
> harder nut to crack. But maybe there are some low-hanging fruits to
> optimize? Finding the main cause for the added overhead would be
> interesting.

Can you compare uffdio_copy() when using anonymous memory vs. shmem? 
That's likely the best we could currently achieve with guest_memfd.

There is the tools/testing/selftests/mm/uffd-stress benchmark, not sure 
if that is of any help; it SEGFAULTS for me right now with a (likely) 
division by 0.

-- 
Cheers,

David / dhildenb


