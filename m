Return-Path: <linux-doc+bounces-41158-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 344AAA66EAF
	for <lists+linux-doc@lfdr.de>; Tue, 18 Mar 2025 09:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D8B83A80A4
	for <lists+linux-doc@lfdr.de>; Tue, 18 Mar 2025 08:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76FF81E8344;
	Tue, 18 Mar 2025 08:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JkGDbmlq"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A891F8758
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 08:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742287359; cv=none; b=WMlJ9Qctuyre+hzZKigZ4yaxYs0LoA8k67CrPBpYaQfhRRKk/T1LwS+nIY5diwk4bAfHnnAM29mAc6RNcMMOcfMF8fwpO80Ad61LrIUL0puiwg42N3cpngkI+GgO14GNxuF32klgr0CkH1LdhCMNHey8mY/7XIH3yxQBf2titGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742287359; c=relaxed/simple;
	bh=ZGbW9fo3vP5338LrYCQ1+PmiczltGel6mYT8arK9AD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XgcwA25q4bdwRUUJpGe8M0mkgi/CQgchkw6GMPY6Ny9dJjy/rPQHNJyq370NKqmc5ZVii8IPU5zFv5KIEZ5EjK/+YGChC67EKGCqy8SWI2AXHIILMDLnrBlZmDOFcQaERzSt7hvO1A6SS0IQsVxMdGhM5kkOTIh9XAXEZubt7jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JkGDbmlq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742287356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yRHbKX6FjVUBiO+1/40VtuZMRWI5J7GJ/G7eeYB6Zhg=;
	b=JkGDbmlqxWUUx5M8gv7O+EeFHjU8HBEd/LOQpbBGVp9EXyZO+r19CUsuBWoiS9UelrwPSy
	qqfJQBC39uWGyN4T7LdtBiszjO77AZFY4Wutgb8NNcJfs0Kor5rusGWEJC1v4g9/rb7n7y
	rSVhif7H7py6D7cUHoYVYt4gdUyRAFk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-oUeFgQZsMkexGLKR7El77w-1; Tue, 18 Mar 2025 04:42:35 -0400
X-MC-Unique: oUeFgQZsMkexGLKR7El77w-1
X-Mimecast-MFC-AGG-ID: oUeFgQZsMkexGLKR7El77w_1742287354
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912d9848a7so3244968f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 01:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742287354; x=1742892154;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yRHbKX6FjVUBiO+1/40VtuZMRWI5J7GJ/G7eeYB6Zhg=;
        b=Gi8PW8Ca06h1s0l7xQFysEVC1d6egnRTnKA5N48BD3grzzlbl2KCFL32aZN2U/UwdB
         b3uadhKC6cphRnodJjE7f847jrSHBNTQPZdxcCMgXjdnKEbqB6bbjq6YGtP9+QWn7gOv
         LqRSx655JakEfKRoK4ul8bTL22GbMtqzmfgAV1BIszPIEPg7qmzcqCt/lEZJcvn8jL99
         +wAqU8JmNpC73BkbN/KsH8qK4h0vFjJJQH64DbimBD4MpiruwUbvv5/blUFG7xm40R1O
         S1y9buGjst9sImCpJ3wKd/okkPklrx18FmyMdWuzcf2uO/rfLOsQNIs4Hbh65ynDtG9a
         DAwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeY2sL31W/+TdS3zg6L3UA8Jvvtqe2Z82dbTMigFVp00oNgGI89AkUWsNV+t5+PZMQAPjOz/0/niQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGMvdur+upZ5GhiyCS9Ny+ebMcLmFLVodE5VQohbt7Fgfujq/+
	6o/ODXe7tNbTnHezcKnNiC+8dewaDgIsrGW3ZX6/dtcVk6CfYVaTFl4wgDOpR80pWPAE0MLAS/g
	NLS1QQ8Ea76StctCrgoyXiHYVnnLEjl3uDy7qfLMUgNh1ZCEEVTQ4FJfmXA==
X-Gm-Gg: ASbGnctfLBBjEZfgZ5nOkDTJA9iMj+++VBs5NRUHmmNgYJf97u6SHMLXHxdpw81or+J
	ZCaHFmLzh6ShQDlM0DYnynbfg8rkEHb89+XRDBHZ9J4GaUQ5BWQ1tJLuosQfSs+alol1jIYnwhq
	j0KU4kCjEm/wLguPTSm9LzsP7Bad2mf/weeu6N9jG2PbSu6ReKAbH7HheOkY4bwzab4rZR1mLas
	qRlee37Tm8EgHfLPFsaf52hcQk8cfXX6WEEMfxa7isK92t0bgtxJQYI9kf2Ms1BiZGNDNhvwtPe
	GNWVKystekC5LgDvyVUPS+loioknRAoJtCf8LQUV5BrfyZYeTXE4T76jymwwq1IUGdCO3x07wPQ
	KB8aXzOb3YL5vF0obB+CbHx14jTxAU84kJI1T+Su4e7I=
X-Received: by 2002:a05:6000:2ce:b0:391:bc8:564a with SMTP id ffacd0b85a97d-3996bb7747dmr2048469f8f.22.1742287354087;
        Tue, 18 Mar 2025 01:42:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcxCaRjsQElGo8NhVhjZFDKXM0lcxpeWA0RUWXl+T2QyfIskBHdftyBRjuJL2uDCD2grYz9g==
X-Received: by 2002:a05:6000:2ce:b0:391:bc8:564a with SMTP id ffacd0b85a97d-3996bb7747dmr2048427f8f.22.1742287353654;
        Tue, 18 Mar 2025 01:42:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72d:2500:94b5:4b7d:ad4a:fd0b? (p200300cbc72d250094b54b7dad4afd0b.dip0.t-ipconnect.de. [2003:cb:c72d:2500:94b5:4b7d:ad4a:fd0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7eb9ccsm17724747f8f.96.2025.03.18.01.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 01:42:33 -0700 (PDT)
Message-ID: <e2807c0f-c6db-4946-a731-009d34c2c72e@redhat.com>
Date: Tue, 18 Mar 2025 09:42:31 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Add "Unaccepted" meminfo entry
To: Nico Pache <npache@redhat.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 kirill.shutemov@linux.intel.com
Cc: corbet@lwn.net, akpm@linux-foundation.org, surenb@google.com,
 pasha.tatashin@soleen.com, catalin.marinas@arm.com, jeffxu@chromium.org,
 andrii@kernel.org, xu.xin16@zte.com.cn
References: <20250317230403.79632-1-npache@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250317230403.79632-1-npache@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.03.25 00:04, Nico Pache wrote:
> Commit dcdfdd40fa82 ("mm: Add support for unaccepted memory") added a
> entry to meminfo but did not document it in the proc.rst file.
> 
> This counter tracks the amount of "Unaccepted" guest memory for some
> Virtual Machine platforms, such as Intel TDX or AMD SEV-SNP.
> 
> Add the missing entry in the documentation.
> 
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>   Documentation/filesystems/proc.rst | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
> index 09f0aed5a08b..8fcf19c31b18 100644
> --- a/Documentation/filesystems/proc.rst
> +++ b/Documentation/filesystems/proc.rst
> @@ -1060,6 +1060,7 @@ Example output. You may not have all of these fields.
>       FilePmdMapped:         0 kB
>       CmaTotal:              0 kB
>       CmaFree:               0 kB
> +    Unaccepted:            0 kB
>       HugePages_Total:       0
>       HugePages_Free:        0
>       HugePages_Rsvd:        0
> @@ -1228,6 +1229,8 @@ CmaTotal
>                 Memory reserved for the Contiguous Memory Allocator (CMA)
>   CmaFree
>                 Free remaining memory in the CMA reserves
> +Unaccepted
> +              Memory that has not been accepted by the guest

I was wondering if we could be clearer like

"Memory that has not been accepted. Especially in some confidential VM 
implementations, memory must be accepted manually by the guest OS before 
it can be used the first time."

In any case

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


