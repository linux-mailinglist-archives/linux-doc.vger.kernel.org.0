Return-Path: <linux-doc+bounces-55146-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB2EB1B396
	for <lists+linux-doc@lfdr.de>; Tue,  5 Aug 2025 14:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ED7017E1A5
	for <lists+linux-doc@lfdr.de>; Tue,  5 Aug 2025 12:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2495272E51;
	Tue,  5 Aug 2025 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VjJ4+4N+"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BFE2701AE
	for <linux-doc@vger.kernel.org>; Tue,  5 Aug 2025 12:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754397567; cv=none; b=Ucu4yO5JyRQO+elpkZXVCKyYMqTQ4Q6MgoAYUb7CRxUPuUfccj2xWZdnIKHqC7H8d8FdpmllaN5mTIjQ/W2SgsuRE3Sy0ouqb4goB0qy0eoXiewT9w11ZX06SQC90vrECLMJckZchX5LuKRus0ciz6ay09OAOveyry0/chh9T+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754397567; c=relaxed/simple;
	bh=IS019dNwkTAyW6zKTEVaixompW86l5CK8PQHObYle/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i253IMf4zGcgx/l5wi9tkySBOJeIKieZWlm2OPpu8jmyoJznJN6m6KEvcha1yoLZiLqbasVRg92meHPOFWNfD8PaBaeOB1xOoxD1mjmIP/A/7jGMmoUsbfGolTcBvH5o1NHWfPMiUF1knbLaxMwgLkc/4GZrWv2FygNvB1a6Le8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VjJ4+4N+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754397564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=m5Y+Zp/i7E50G0WGTS0Sm25Wg/EgJru81SUTqhRCQxo=;
	b=VjJ4+4N+B9gkEZX/MMnAk2LocBWBAPD8Iheif11rD69oPWN6X2IFFDLrl5Z5zwhbyAeoJv
	NrQ85wo8L6WR1aSkHp6t7EABS0Gand/Ky/Rgs/5i7lsA5X4OA+/rhKXCsf9SRtcJC9PgMl
	mofTM7EOI3dOEGBnx9E3foVX8YYjJW8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-SmoRAP33OQCGouOmlUIcGw-1; Tue, 05 Aug 2025 08:39:23 -0400
X-MC-Unique: SmoRAP33OQCGouOmlUIcGw-1
X-Mimecast-MFC-AGG-ID: SmoRAP33OQCGouOmlUIcGw_1754397563
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45891629648so30635945e9.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Aug 2025 05:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754397562; x=1755002362;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m5Y+Zp/i7E50G0WGTS0Sm25Wg/EgJru81SUTqhRCQxo=;
        b=RycYXtO33kDOe9bBPlVQG6mt4P8pRvHMqygd5bhV2ng7bTCqLsduHcGFqZalFPRTZn
         RjrUyuKk0smK/zFgPTG4rovd7g7QfjHYFlXJc2zm7cSRid6D56IBHkZ3+wpVZyGGie2M
         Fqhqoz42HRD904h42va83iT/p08/+3WtdaWOVzAo8nbNWt9jkzZgMI2Z3kH4J0Rx+N8k
         W3uHRDvotYbYVSpqhOoLK1wK+rp96dWtC2Z74dwAU0KDJPOkfcq7/zOydQYICSS7eMiO
         /FsyENwzFjnLEzfKgBvpGVx+4fskGVowj+x1ILzAPMh0ZKHLvF5+6yTyYqjicZFk4PMS
         lKDg==
X-Forwarded-Encrypted: i=1; AJvYcCWuMJNLRh+XFW0tMtMzTtKCisXvGeDi5x+fzZBf7pMhjV3BXOu/LzycxB7gh/vMeLQcEafk/9Gwd50=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVfiZmNqpJmB14wMosIzzqfD0lGYfkRX7SbsNFuBAA3FrJVVV1
	OBNarQF7v+kKl5Ub+/xe6B9SBLwYHaB+hcnmWwXT3VwoBj/mTvEOzuYXjvrv2G2i5T/8jUj8S4F
	6o59dvBMt90cf9kyC6aOuOTxPBxYLkvpsXXDFtRtupPNAy5FAqjscSo9IeGZopQ==
X-Gm-Gg: ASbGncuAQ1/fgT1Jw8IgJtaUPjGQL/iaLng1VIipTDnlDM2WSpoMjPA7Q37VOL3a4m4
	bFHiXlq4k5FaS/gfjNmnv8XfcDXxytiB1tSRp7uGlrtt3VIkUnnITQtTNMk6ooGP69h5ml8kR+t
	rM8Z5VbJOoI9nX31VSkBQB+y+1VlfjybtSZEoOKCBYwEQiigajRSXXqcWwqZu/sMuu52y6oswNI
	C8766gej46A6OckqM9bx7L9k5BcVKSuEY47B9Y/2++CRvLApDy1cvtNJTfPGsFVTC698Qp5ih/L
	8M2u1rpLYfylfZSqj4WK+dhCpb/9qpkfoBckltO+C5b02yUvkAh2cetxSKvUCRIa0VKH+Qg=
X-Received: by 2002:a05:600c:6305:b0:459:d3e2:d743 with SMTP id 5b1f17b1804b1-459e0ce7d64mr25782735e9.8.1754397562403;
        Tue, 05 Aug 2025 05:39:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9s7iANb1Hl8Kzi4LwMjObXbUhyYy8qTBI01O5RhMA7SSDeNZ4hZPMsdRmz97VTDrMkp7u7Q==
X-Received: by 2002:a05:600c:6305:b0:459:d3e2:d743 with SMTP id 5b1f17b1804b1-459e0ce7d64mr25782265e9.8.1754397561835;
        Tue, 05 Aug 2025 05:39:21 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a26f.dip0.t-ipconnect.de. [87.161.162.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953f886dsm260816025e9.30.2025.08.05.05.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 05:39:21 -0700 (PDT)
Message-ID: <66c2b413-fa60-476a-b88f-542bbda9c89c@redhat.com>
Date: Tue, 5 Aug 2025 14:39:19 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] selftests: prctl: introduce tests for disabling
 THPs completely
To: Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: linux-fsdevel@vger.kernel.org, corbet@lwn.net, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, baohua@kernel.org,
 shakeel.butt@linux.dev, riel@surriel.com, ziy@nvidia.com,
 laoar.shao@gmail.com, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 ryan.roberts@arm.com, vbabka@suse.cz, jannh@google.com,
 Arnd Bergmann <arnd@arndb.de>, sj@kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250804154317.1648084-1-usamaarif642@gmail.com>
 <20250804154317.1648084-6-usamaarif642@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250804154317.1648084-6-usamaarif642@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> +FIXTURE_SETUP(prctl_thp_disable_completely)
> +{
> +	if (!thp_available())
> +		SKIP(return, "Transparent Hugepages not available\n");
> +
> +	self->pmdsize = read_pmd_pagesize();
> +	if (!self->pmdsize)
> +		SKIP(return, "Unable to read PMD size\n");
> +
> +	thp_save_settings();
> +	thp_read_settings(&self->settings);
> +	self->settings.thp_enabled = variant->thp_policy;
> +	self->settings.hugepages[sz2ord(self->pmdsize, getpagesize())].enabled = THP_INHERIT;

Oh, one more thing: should we set all other sizes also to THP_INHERIT or 
(for simplicity) THP_NEVER?

-- 
Cheers,

David / dhildenb


