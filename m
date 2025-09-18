Return-Path: <linux-doc+bounces-56482-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECFEB28AF6
	for <lists+linux-doc@lfdr.de>; Sat, 16 Aug 2025 08:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAD4D2A229D
	for <lists+linux-doc@lfdr.de>; Sat, 16 Aug 2025 06:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D2A2116F4;
	Sat, 16 Aug 2025 06:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NXDR3NjA"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9432116E0
	for <linux-doc@vger.kernel.org>; Sat, 16 Aug 2025 06:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755325457; cv=none; b=eYc7He1u5RLKlxRFXb5eCA0JiT7VWe9G2DN6xvk78udhI+zVuFBH2MkaEGN9gEJ5biajrzrL++P7ZBnVDej1Wlm08pGY2hMKdtYfKjl9XpF9lHM6CZJG3fQLFoKY7Dfz/l3AaTRHiZ/e4jT0b7A97YZs2pKyxAV8gVo9Rw1czWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755325457; c=relaxed/simple;
	bh=342LxuJdaNl4CWX9CTzec1rpwOpSIab+DVBXDHi3jYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTsDKIhNaqEWNTeIAwBAQ2KlPcuGrC58aEX9LIpqKctsu9ZNbS5k1utwooxYyF86nKYDWZ5hQkEGE4c78w/sqSFJU3/4Rky2WEWkHBfMqdrHXg/NwcV+N8+5Y7+0+D6Zo85oE79HXEXrLz668j89hgZvO8DXzI9Q+0f1FdI2yrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NXDR3NjA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755325454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=p1AiogaXO4KDpvqOf8z6X8E09Ih613U1kMZd3r/QYjs=;
	b=NXDR3NjAK4DcxiK/Vo8Ll7mUFw15t2LbBZHQEh7Vq6cxWo2x2LoPD2hrrnb6ShjjtSo4BF
	EkGe1I2jQfY8qtSgiZYTuCgZ6pya6XMnSyFQSDTYUKqWJAyOkPx+SpQf0lRWQMB2qj2DxN
	GnVzhNjdNOSCh/8CF/wfy5ABOrTA0ms=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-rjs7vJKkP46BlsROkZLUyQ-1; Sat, 16 Aug 2025 02:24:12 -0400
X-MC-Unique: rjs7vJKkP46BlsROkZLUyQ-1
X-Mimecast-MFC-AGG-ID: rjs7vJKkP46BlsROkZLUyQ_1755325452
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b9e418aab7so1319299f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 15 Aug 2025 23:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755325451; x=1755930251;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1AiogaXO4KDpvqOf8z6X8E09Ih613U1kMZd3r/QYjs=;
        b=fNSEB6RJocM5EmLNB55LWbjrtX3xntjVibhOYgqtCavblEMTMChhyCfD8RRizZdmLr
         Jll3UleCPQ6HbWl/APVqinA9XijhsqYxBv5CKqYrkRAFEKwUC2st6wvagntIM3S+ogwN
         dYf0k3y2EDqoAWh08DJTQpavM19vBKuLRzVhWDShxbeyPnF5pECjEz2gKGzpNF1CiyzI
         URwlxUz6CF6Q/+qqBmEFld5WmbVCed0ds7zichO8S4X7lAZ+BwA0+yfP7T+p7KSFUO31
         Qnu+dLwHKSaP0XDMPQVdIyuGwrpKz6Y/aVn9JHHbPVajItgiEilnipWi0q1B/JlNQ6U2
         8RvA==
X-Forwarded-Encrypted: i=1; AJvYcCWwT70r5HkggT3R1If5ztpAmEQ4sUi5JolXJ0C4Eag0LETH48AG0tCzgJU8lIc62wDHG5WS72Y9CR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyPskqvf1w55sLsSPJWRMBF9B33NrAO7ClpLvKr0YFCz85ho92
	BmEewYDr1VgY7Gm7ASMxZaTQu9HGg8D2owu8aLGvBIPwjl0duibkU0p/d48sCw2I06wpc88RSiu
	esamRl4IWVMIGwyVdPleTf+bOP2PKMiMqG0MD8IxH+/CuNVVJzb+PhWnyj1fMcQ==
X-Gm-Gg: ASbGncv13TLTUULFeyoork21XKYzQAyTPy8wWmPPSJNWUR9YGam4DutZrV30LnDoNY4
	5GI1S0UoO2aBJo0QJ7z5rV3GLlmJvplQQhiGKcKAME8f2+6SnhYC13Xdge8eeXjBdTPbDxTiJxT
	ROKzEIvVQsx2rTwOooqkhIYG6W96FVIE2xyfWcc4yFgVv2fvNn1/osB60D9dxjfIGFEXK8v8Isv
	XQybZ3yLVfWw73rVqArymqeWikj7E+3YD28XPkUL68KuBNinCfoMWBb7zyUPh0AX55a2zwC5bsR
	oGyIR2abXrdZ7RlG9J2uTfNKb3XcoSi/NvQeEU1tuicYCrUoWLzlBDeg84NDXjomccsGUj8w/r2
	d6ZDQOBQMIyS0r3elK2FIkMYn95LPS7A3o87Y7pPJk0oYDW4zPUTd5eNC7PyMgB/ul74=
X-Received: by 2002:a05:600c:4f91:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-45a2678420fmr10232345e9.21.1755325451399;
        Fri, 15 Aug 2025 23:24:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSIospP340Ezkww18kd7aUrmmiQWcd4pTR9W4fP9PhEqEg8ffXiYj3nkoM5w1sMGhQv7pE/Q==
X-Received: by 2002:a05:600c:4f91:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-45a2678420fmr10232105e9.21.1755325450984;
        Fri, 15 Aug 2025 23:24:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f23:c700:d8ae:41bf:492a:9e4c? (p200300d82f23c700d8ae41bf492a9e4c.dip0.t-ipconnect.de. [2003:d8:2f23:c700:d8ae:41bf:492a:9e4c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a223197fbsm45975695e9.8.2025.08.15.23.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 23:24:10 -0700 (PDT)
Message-ID: <2aaa9982-48c7-4461-8be8-1427d9ed3f3d@redhat.com>
Date: Sat, 16 Aug 2025 08:24:07 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] selftest/mm: Extract sz2ord function into
 vm_util.h
To: Andrew Morton <akpm@linux-foundation.org>,
 Usama Arif <usamaarif642@gmail.com>
Cc: linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, corbet@lwn.net,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org,
 baohua@kernel.org, shakeel.butt@linux.dev, riel@surriel.com, ziy@nvidia.com,
 laoar.shao@gmail.com, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 ryan.roberts@arm.com, vbabka@suse.cz, jannh@google.com,
 Arnd Bergmann <arnd@arndb.de>, sj@kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250815135549.130506-1-usamaarif642@gmail.com>
 <20250815135549.130506-6-usamaarif642@gmail.com>
 <20250815231549.1d7ef74fc13149e07471f335@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250815231549.1d7ef74fc13149e07471f335@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.08.25 08:15, Andrew Morton wrote:
> On Fri, 15 Aug 2025 14:54:57 +0100 Usama Arif <usamaarif642@gmail.com> wrote:
> 
>> The function already has 2 uses and will have a 3rd one
>> in prctl selftests. The pagesize argument is added into
>> the function, as it's not a global variable anymore.
>> No functional change intended with this patch.
>>
> 
> https://lkml.kernel.org/r/20250816040113.760010-5-aboorvad@linux.ibm.com
> jut did this, but didn't add the extra arg.
> tools/testing/selftests/mm/split_huge_page_test.c needed updating.
> 
> --- a/tools/testing/selftests/mm/cow.c~selftest-mm-extract-sz2ord-function-into-vm_utilh
> +++ a/tools/testing/selftests/mm/cow.c
> @@ -52,7 +52,7 @@ static int detect_thp_sizes(size_t sizes
>   	if (!pmdsize)
>   		return 0;
>   
> -	orders = 1UL << sz2ord(pmdsize);
> +	orders = 1UL << sz2ord(pmdsize, pagesize);
>   	orders |= thp_supported_orders();
>   
>   	for (i = 0; orders && count < max; i++) {
> @@ -1211,8 +1211,8 @@ static void run_anon_test_case(struct te
>   		size_t size = thpsizes[i];
>   		struct thp_settings settings = *thp_current_settings();
>   
> -		settings.hugepages[sz2ord(pmdsize)].enabled = THP_NEVER;
> -		settings.hugepages[sz2ord(size)].enabled = THP_ALWAYS;
> +		settings.hugepages[sz2ord(pmdsize, pagesize)].enabled = THP_NEVER;
> +		settings.hugepages[sz2ord(size, pagesize)].enabled = THP_ALWAYS;
>   		thp_push_settings(&settings);
>   
>   		if (size == pmdsize) {
> @@ -1863,7 +1863,7 @@ int main(void)
>   	if (pmdsize) {
>   		/* Only if THP is supported. */
>   		thp_read_settings(&default_settings);
> -		default_settings.hugepages[sz2ord(pmdsize)].enabled = THP_INHERIT;
> +		default_settings.hugepages[sz2ord(pmdsize, pagesize)].enabled = THP_INHERIT;
>   		thp_save_settings();
>   		thp_push_settings(&default_settings);
>   
> --- a/tools/testing/selftests/mm/uffd-wp-mremap.c~selftest-mm-extract-sz2ord-function-into-vm_utilh
> +++ a/tools/testing/selftests/mm/uffd-wp-mremap.c
> @@ -82,9 +82,9 @@ static void *alloc_one_folio(size_t size
>   		struct thp_settings settings = *thp_current_settings();
>   
>   		if (private)
> -			settings.hugepages[sz2ord(size)].enabled = THP_ALWAYS;
> +			settings.hugepages[sz2ord(size, pagesize)].enabled = THP_ALWAYS;
>   		else
> -			settings.shmem_hugepages[sz2ord(size)].enabled = SHMEM_ALWAYS;
> +			settings.shmem_hugepages[sz2ord(size, pagesize)].enabled = SHMEM_ALWAYS;
>   
>   		thp_push_settings(&settings);
>   
> --- a/tools/testing/selftests/mm/vm_util.h~selftest-mm-extract-sz2ord-function-into-vm_utilh
> +++ a/tools/testing/selftests/mm/vm_util.h
> @@ -127,9 +127,9 @@ static inline void log_test_result(int r
>   	ksft_test_result_report(result, "%s\n", test_name);
>   }
>   
> -static inline int sz2ord(size_t size)
> +static inline int sz2ord(size_t size, size_t pagesize)
>   {
> -	return __builtin_ctzll(size / getpagesize());
> +	return __builtin_ctzll(size / pagesize);
>   }
>   
>   void *sys_mremap(void *old_address, unsigned long old_size,
> --- a/tools/testing/selftests/mm/split_huge_page_test.c~selftest-mm-extract-sz2ord-function-into-vm_utilh
> +++ a/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -544,7 +544,7 @@ int main(int argc, char **argv)
>   		ksft_exit_fail_msg("Reading PMD pagesize failed\n");
>   
>   	nr_pages = pmd_pagesize / pagesize;
> -	max_order =  sz2ord(pmd_pagesize);
> +	max_order =  sz2ord(pmd_pagesize, pagesize);
>   	tests = 2 + (max_order - 1) + (2 * max_order) + (max_order - 1) * 4 + 2;
>   	ksft_set_plan(tests);
>   
> _
> 


LGTM.

-- 
Cheers

David / dhildenb


