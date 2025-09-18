Return-Path: <linux-doc+bounces-58271-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBC8B3EC17
	for <lists+linux-doc@lfdr.de>; Mon,  1 Sep 2025 18:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C4BC4442D1
	for <lists+linux-doc@lfdr.de>; Mon,  1 Sep 2025 16:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CBF2E6CB9;
	Mon,  1 Sep 2025 16:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NZ1iYfvE"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2252D5936
	for <linux-doc@vger.kernel.org>; Mon,  1 Sep 2025 16:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756743671; cv=none; b=vDyYD2OGgIjvbNGSeczfvo/JbxHJxsG+I4iJyU56TNVK54NCujNTaNZjnUihQn5+GokNYp+p+pcnDXyw+KltSxhSR2ZSt8H1rmQERtNiN0O+e+WH/YOG7a9dd7/8fDZTmo8fMu8kClcryh0Fr2JD6beoT3I+u0lNnVVqKF2+1T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756743671; c=relaxed/simple;
	bh=jfmxWuXxnEBJGeGeYqfB6wBHv8YbYsBHfs9rwRdX9B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2wqzv20sd//jtGVM7WuLLNfehB9Og3QE2K2+xjFGJqMrd4W5iUqDx+NPI4uYo+hNBzZxe5Na51G3bzf3g3V3ukqO2H1rNQUztxdtBu2WjiGf/7ieCjudn4vbTacs1LaqtqN/MS6dPkiK3VYMTu3qyWbYZfOwSPG5XLuHpCF1Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NZ1iYfvE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756743669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xPcwA7DHP8CQMDqmjZ6zA+PMccXA/CBy019wh06lmcI=;
	b=NZ1iYfvEfwfIVS3lYEcvUcxvLKSE9NMbmhttVxaJ+t8VqcWxhXMUbCmFVhsQCmYyuStmw4
	3yURydodW3zwiXq16tXEL/8L+pRMSloOQK+gxDHrKON/lUbzuSynhGE1+oFhhBfWoQEmth
	vsqdVsLCFuU50Vk6D5CtIMBhiHTyltE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-76FLp2etO7CImNajE2TG0A-1; Mon, 01 Sep 2025 12:21:07 -0400
X-MC-Unique: 76FLp2etO7CImNajE2TG0A-1
X-Mimecast-MFC-AGG-ID: 76FLp2etO7CImNajE2TG0A_1756743667
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45b883aa405so13442915e9.2
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 09:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756743667; x=1757348467;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPcwA7DHP8CQMDqmjZ6zA+PMccXA/CBy019wh06lmcI=;
        b=AS/0Vk8wIspSyuz5Y3OtBfeEkMJyHcRAmDaxEwDE3syHkWBWTBsXHytgXkXSpMiPVO
         XFTV7ldPCBe7nA4fnmn8RHPRj1ir1BjPGQ88Ptsk/E+jzVUhzy0ZSXZycExEjgAetiuI
         BWu2TnjCmy+eFYOqGvQEAq0POV+5kdCMs3PJspDXKpSB3/VJBZlltNcuUpPADUf6Ahhz
         5XUSpBSHiIwOv+V2XPpK17KdoB3m+gywcWLQJltme/qM3koLjrgE2b5UNDvDchdPnTFp
         dtvtTiu9YDa0OnvK2QVS1U5K20dwF2Lf1bm6q16KkV0rxw9SQm2mxaVv+3kWcHrPpQCN
         pv7w==
X-Forwarded-Encrypted: i=1; AJvYcCWrzpL9El3YGiXes13p63oLoIEyWl+snXVEaojrLV/XHctCoM2OU8rvbatLN6p1xEpuKbc2qDLsqzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYgewveaT3KwQGGYZUfvqnjTEMeupeLD5CSQDENY6WBWi0ygGb
	d23rkq4Vjv5zen3xyGXc8zXnONfMmLN0ryypGVGsgI2jcoo8BzPbnMYy0xhES5iBPdstBCcz4ME
	72v4F1B2ZH2GzW7uA3vw3FAUi3i8EyPAR5zZ4kiz7Bu3wDBJwS1mCaTnG78w8DA==
X-Gm-Gg: ASbGnctWFtHNbBdUHb5E8xpVChvULqUonnuUz4Gi+i8dYRUTTVKXkfsCFc3tOhSB1TL
	35675gx5AYQ2kecJw5w7oaDjz306RhFPUbbR4HjjrkTwW9Swrwtj+OzkSlUJosdL9SSGcnNjwt2
	gIrkXvHUw/4lc7cz5N2f4cLKCTgR/5g4smcZjRo+6fDOR1lH+oQY0V4wz5AtGXBDgDkU2efFFeM
	ao6p1HwKaS6YGGtoiCs1GXysMBJnKrduhJiZvlnDwdqzObjFW9A59yK9ndzgqT2xPuNuGWPuS7B
	bV1JSyWCOuXPbsXPaqKsRh1IHyzELXv/isMx30ENdy753dayuWdspOow/0+u1wRi8fl37iO04wh
	gHi6BUWmWT+E4YIFr/AzegLszLm7HKa5/xiG/Vig1x32aYpPRPpaLTr0MnWqHixQvjZg=
X-Received: by 2002:a05:600c:c8f:b0:458:bc3f:6a77 with SMTP id 5b1f17b1804b1-45b855261cdmr64178525e9.2.1756743666704;
        Mon, 01 Sep 2025 09:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0X+8mvSEeRaJrsUrV5c2nUPwcb4BLt12X/j/210D44OdXtgUpfkmIvO5r1ObQQubR1FLV+g==
X-Received: by 2002:a05:600c:c8f:b0:458:bc3f:6a77 with SMTP id 5b1f17b1804b1-45b855261cdmr64178025e9.2.1756743666189;
        Mon, 01 Sep 2025 09:21:06 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b93fae643sm6961135e9.3.2025.09.01.09.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 09:21:05 -0700 (PDT)
Message-ID: <7d423d50-47e0-4c97-abaa-1fa865ec3e42@redhat.com>
Date: Mon, 1 Sep 2025 18:21:02 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/13] khugepaged: mTHP support
To: Nico Pache <npache@redhat.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com,
 dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, akpm@linux-foundation.org,
 baohua@kernel.org, willy@infradead.org, peterx@redhat.com,
 wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com,
 vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com,
 yang@os.amperecomputing.com, kirill.shutemov@linux.intel.com,
 aarcange@redhat.com, raquini@redhat.com, anshuman.khandual@arm.com,
 catalin.marinas@arm.com, tiwai@suse.de, will@kernel.org,
 dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, zokeefe@google.com,
 hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com,
 rdunlap@infradead.org, hughd@google.com
References: <20250819134205.622806-1-npache@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250819134205.622806-1-npache@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.08.25 15:41, Nico Pache wrote:
> The following series provides khugepaged with the capability to collapse
> anonymous memory regions to mTHPs.
> 
> To achieve this we generalize the khugepaged functions to no longer depend
> on PMD_ORDER. Then during the PMD scan, we use a bitmap to track chunks of
> pages (defined by KHUGEPAGED_MTHP_MIN_ORDER) that are utilized. After the
> PMD scan is done, we do binary recursion on the bitmap to find the optimal
> mTHP sizes for the PMD range. The restriction on max_ptes_none is removed
> during the scan, to make sure we account for the whole PMD range. When no
> mTHP size is enabled, the legacy behavior of khugepaged is maintained.
> max_ptes_none will be scaled by the attempted collapse order to determine
> how full a mTHP must be to be eligible for the collapse to occur. If a
> mTHP collapse is attempted, but contains swapped out, or shared pages, we
> don't perform the collapse. It is now also possible to collapse to mTHPs
> without requiring the PMD THP size to be enabled.
> 
> With the default max_ptes_none=511, the code should keep its most of its
> original behavior. When enabling multiple adjacent (m)THP sizes we need to
> set max_ptes_none<=255. With max_ptes_none > HPAGE_PMD_NR/2 you will
> experience collapse "creep" and constantly promote mTHPs to the next
> available size. This is due the fact that a collapse will introduce at
> least 2x the number of pages, and on a future scan will satisfy the
> promotion condition once again.
> 
> Patch 1:     Refactor/rename hpage_collapse
> Patch 2:     Some refactoring to combine madvise_collapse and khugepaged
> Patch 3-5:   Generalize khugepaged functions for arbitrary orders
> Patch 6-8:   The mTHP patches
> Patch 9-10:  Allow khugepaged to operate without PMD enabled
> Patch 11-12: Tracing/stats
> Patch 13:    Documentation

Would it be feasible to start with simply not supporting the 
max_pte_none parameter in the first version, just like we won't support 
max_pte_swapped/max_pte_shared in the first version?

That gives us more time to think about how to use/modify the old interface.

For example, I could envision a ratio-based interface, or as discussed 
with Lorenzo a simple boolean. We could make the existing max_ptes* 
interface backwards compatible then.

That also gives us the opportunity to think about the creep problem 
separately.

I'm sure initial mTHP collapse will be valuable even without support for 
that weird set of parameters.

Would there be implementation-wise a problem?

But let me think further about the creep problem ... :/

-- 
Cheers

David / dhildenb


