Return-Path: <linux-doc+bounces-32367-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 909289EAB4D
	for <lists+linux-doc@lfdr.de>; Tue, 10 Dec 2024 10:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49EAB1635E0
	for <lists+linux-doc@lfdr.de>; Tue, 10 Dec 2024 09:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAA3230D36;
	Tue, 10 Dec 2024 09:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QMda8sx+"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21B9230D1D
	for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821599; cv=none; b=Wh+iRn8OGrltMdKpavYgyY+xh9S5+2CPxOOQwKlZFjqtwbiKkptYbExcNl0XBMyzPryWLb+/LnoXEYqYtYbE5E4Tvpw4fP5BnFVHZLAHmnvNqVMGqrRMYwsXH7k8JJoIc6+0QQ45UeO2UX7MHEEPgfR41bN3L3BEaVzhsUxdoJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821599; c=relaxed/simple;
	bh=h6FopaCop7AllYqKqoGUbRYW5t/1gfoA4MRDd3QukfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aH+22sD85nhV4Tl2cO6o1QNM852jPoVsGSS3F/Hza3gen3zwmPcqbIGzOVF1ixeZoIocExX/55jr3HjdvZ1gimcrSfyQzm6ZPz9nJk4MuhPw4T66L46p4rykqvBILzedH7fGRFRFqb1pu0toVn5RW6DnEZFSwPHZIzwiTowfJko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QMda8sx+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733821596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WViKBtubyiEweAq6c93mHEW2iW9FasO8p1wZhXA5URg=;
	b=QMda8sx+AJQ1sNejnC8bicTQsL2d77k5H/D9cnYW220n0G0CquK3DxoK/K7IjVkjLk4jCB
	bDOk4x1hBO77lhjgK0lBh9frMyyu8k4Lnf93rOKQaXB6/5LQPOBa5dUVdnuKL+f+DnUrf1
	ZHa47quXvRvA6YP51myrN8B9rnmJJYQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-I2HFTH0OOeKo4ONScnmbyA-1; Tue, 10 Dec 2024 04:06:34 -0500
X-MC-Unique: I2HFTH0OOeKo4ONScnmbyA-1
X-Mimecast-MFC-AGG-ID: I2HFTH0OOeKo4ONScnmbyA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385f0829430so3615668f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 01:06:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821593; x=1734426393;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WViKBtubyiEweAq6c93mHEW2iW9FasO8p1wZhXA5URg=;
        b=jj+tAAVrqFRGRI/YXjbe8BONpGx1fG3mZGISO3Ll8jxXeCP6QaG6R8TVhgp54O99sY
         kaYSJTfypyvUR+pUInW8lmADNTabWBcpt6A89jOrjDcnTtbYhWDgH/cz0WAIfDP32jwH
         SY/YEXdOW+TIaWGIfo2UIsi8jX7sJLKKJHFSgyD2yscQW+NRgGsQ0kqDkmBf2xcUuscR
         wEAb3BvWN4b/YJAU0l5jmWGKl6V3IqXmWFMryAKxcOLEgFNcUU1zdXOWl14LClP36P6I
         jv2O1ZTjMF3vTZZ03UDxbWJu6Y7PdKV7v8axz2diAVCyfLE1CpnJ03sZ5h3Ivcdbdsag
         I+tA==
X-Forwarded-Encrypted: i=1; AJvYcCWsWobaxXaqmlv1xrDGL9kHH1Amp/e5m+9xmOcmss4wF91JUxAirDVJLg8cXHCBGbETTxj2sSMN5pw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCH+1cTFA1BksuSDJ9jPaj6y9BMnm2w/B9F5ZU3UMXLJm3NYl2
	8pKcdjjc35nV9XIxUy/KuqANxTSFMoQNQ3YJQIY3mALTV8cjVDk6sy+xwQnmXTdrOT1PKO+VXJh
	NLCphjW+Q6KWQG4A6cFcS4N2Ax5XjWxTYdWgs+CT+dWfDxxQeOwQ81RTcrg==
X-Gm-Gg: ASbGncv7tsF6UYSOpuFPGMbevxZFyTc3ZTzC5uuyeD3DF9exoSP/7pyyz4WOOPsCrzv
	sfHYqow3RV7A9RSvN5pGFoePVRk4ejPVEYtghLBd8bqv5E4xGboPBRDi2D19rFyy7ypUKQxgJpR
	VlCYZP37NCpPCHBGtfYO5exyKPBW6LXQ95dZSSPEbhYcGSMnM92gP23cjzOjS3oJEWkxivr4UyO
	vz9TRM2gfQE1aldKlmajn+TQuFiGjM4MhVJ5hVXme/szNOjBTj8q4ym4KhtACZKyvL1bWjAX+7e
	OO2DCFLGPIt3nwXaXvZk+kgvjFtpy5GKMtDY+WdFJrmT1jRFFpElp4y+nyz+lI3rNM9sTZ/+W+8
	7kyki8g==
X-Received: by 2002:a05:6000:716:b0:385:df73:2f42 with SMTP id ffacd0b85a97d-386453e1ed4mr3407569f8f.32.1733821593217;
        Tue, 10 Dec 2024 01:06:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGl8zSmol9ZLal+68wsCmsbBIBHWp10p/fCgidEcZpYsF4kBtwxdF5K1aT3eXRNGSPBT4sZrw==
X-Received: by 2002:a05:6000:716:b0:385:df73:2f42 with SMTP id ffacd0b85a97d-386453e1ed4mr3407512f8f.32.1733821592917;
        Tue, 10 Dec 2024 01:06:32 -0800 (PST)
Received: from ?IPV6:2003:cb:c723:b800:9a60:4b46:49f9:87f3? (p200300cbc723b8009a604b4649f987f3.dip0.t-ipconnect.de. [2003:cb:c723:b800:9a60:4b46:49f9:87f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-435017d724esm27604605e9.19.2024.12.10.01.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 01:06:31 -0800 (PST)
Message-ID: <0448d4c5-1675-402f-9629-d1348019e38a@redhat.com>
Date: Tue, 10 Dec 2024 10:06:30 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm: fix vma_copy for !CONFIG_PER_VMA_LOCK
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: oliver.sang@intel.com, klarasmodin@gmail.com, willy@infradead.org,
 liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com,
 vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
 mgorman@techsingularity.net, peterx@redhat.com, oleg@redhat.com,
 dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
 dhowells@redhat.com, hdanton@sina.com, hughd@google.com, minchan@google.com,
 jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
 pasha.tatashin@soleen.com, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20241209221028.1644210-1-surenb@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241209221028.1644210-1-surenb@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.12.24 23:10, Suren Baghdasaryan wrote:
> vma_copy() function for !CONFIG_PER_VMA_LOCK configuration copies all
> fields using memcpy() as opposed to CONFIG_PER_VMA_LOCK version which
> copies only required fields. anon_vma_chain field should not be copied
> and new vma should instead initialize it to an empty list. Fix this
> by initializing anon_vma_chain inside vma_copy() function. The version
> of vma_copy() for CONFIG_PER_VMA_LOCK is fine since it does not change
> that field and anon_vma_chain of any new vma is already initialized and
> empty.

I'm wondering if there is sufficient reason to have two implementations 
to do the copying.

How expensive would it be to simply use the CONFIG_PER_VMA_LOCK variant 
unconditionally? Is it even measurable in fork() micro-benchmarks?

-- 
Cheers,

David / dhildenb


