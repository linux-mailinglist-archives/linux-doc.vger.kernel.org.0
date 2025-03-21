Return-Path: <linux-doc+bounces-41513-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C9BA6B911
	for <lists+linux-doc@lfdr.de>; Fri, 21 Mar 2025 11:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9C5C19C591E
	for <lists+linux-doc@lfdr.de>; Fri, 21 Mar 2025 10:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A681DE3CE;
	Fri, 21 Mar 2025 10:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gOm+/Tq7"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B011F3B8D
	for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742554184; cv=none; b=NiSnFMhE9I9EvicRZmEEsF5B+5sEZQmlmVYiyZlJjYzaXXpNL5eqkPnVhs+CqSm1b6jIedLYIKyUGNxuPkJ37F0b56kaxfTsn0WXuUQnQXYoKxZKLRfBROwDwU4aWdC2yqVx8tgABiXjNz46bQKoqK0735cvYnH19/Rlqlvwg7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742554184; c=relaxed/simple;
	bh=dwU9hnQ0TJSznAmn203p3pdwF68405zlbUnyH28qE3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SS6UoX3O8zwdPmCi7/sNZkDs9mTFBOBLijzL9Xbjue232fHJTEgJ5QZ0zX/ht/lewLutLb6d/TCxg2vHVWItAwB2TS6EuEBh/Gi3TTvOUtwxNRrs1e7sFt8tM/GIvh4ubB6JcOlhOtDiiVDXROtcMCA72dAjhVDAOdx4M2Lrc38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gOm+/Tq7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742554182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5HfBpke3YL7+rR7hRniNLyJc0aMTeAEo/zxk+Y3d0Tw=;
	b=gOm+/Tq7OSnOV3R6KCcHd4uNku/D7vHk3A40M2n5P2lEC31mWxzEubDEdcPFu69UWsN9q4
	E7vgW+oiPovyMGSL+YbLuRwboBoCGjqlzve+Xh7vCLMo1c9kgIRv+gxKcOvC+rb4QnbWsY
	JG8UIhpAhRBOIlSGudvfSeybq84hNi8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606--YywqVcxPQuQRWDUMotQWA-1; Fri, 21 Mar 2025 06:49:35 -0400
X-MC-Unique: -YywqVcxPQuQRWDUMotQWA-1
X-Mimecast-MFC-AGG-ID: -YywqVcxPQuQRWDUMotQWA_1742554174
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3913aaf1e32so1121387f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Mar 2025 03:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742554174; x=1743158974;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5HfBpke3YL7+rR7hRniNLyJc0aMTeAEo/zxk+Y3d0Tw=;
        b=OSQQgWUaClcTUyBT4ztBWhf8YgVSLeaTfWvhvV3mA2yAKgd1LLgqw2bDNbc2REanE4
         Uw7LBydx61d+Sc5PS4U02UxgaVwiX8Wn3ys0+lBDcTqLYsuxlIK0llGr3lP0TOIQYAOz
         NF0B5hRkSHqXpz6Un14ONpmxoibAmHQnxEVQlpjlVoIBwYhOfk90/zW/IXZk8CTIiJZe
         Gv4BvChu07mAmVVrdqaqCA11Filkoa4MR0OL86sk3Jsbmc3F40PIghSS2qBFz4Ig5Jk6
         T+89Xg16tv4yycBToY9GByc0J5ivf+i9WupPzyBijfMDGbQTdtXZcOM6mikazpddnjVC
         6NZg==
X-Forwarded-Encrypted: i=1; AJvYcCUruGnNat83eq1j7Og5x4yZqmduhXHHHa3C0dxE6WziESYlurrHFORodLtp61icqKvQE0DSAp78eks=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwYrg7d0F6rbi69rATcozouteQiT9kkmwoVhmEjszftxKPvqhk
	SU/pQOgZF22tdei7z5eSsnW/Uj1xo/wwVQRbqYPyrQf1ilka1prphltkU73hnW7eauqqFWm/0GR
	x/d2vcd7gH/sOlHidIVOSU+uyM2xh30QoDhvjs77y9SWpiMSfGay48dZWZw==
X-Gm-Gg: ASbGncsJ8FIDz0XDwOWGhiqEXjgFoC1CtqzbOGU56awKe6xLbDH43/q9L9cdQoktSPF
	aoJ8I8PInFv3iM4HRCKSJZ6NC/0C+O4oTx9AH4ijaXNzAfY4roBHblR4aJBlgqytJ9W1OpebgD6
	fpztFvLSS1C/7gSMsYf/LMbpKJbUCvwlkpqTfYFhJ9gbAuEr6SNU9m3AKFPsjoua36GLaH9RLWP
	VoUt/Uwu/QcISGfjcEm0cmYrEASxkCt2KMAU9mCihonBqcie7HOLT1uCIwO49DpXI/owhJbLIYT
	oQY+0mgdAK1R7+h5803y8iE30Fn5Lg0VOy6LX51h9CiyOXFqFnXkH3EoauUE8zf+zr0Onrp77ib
	2e+E4mNWVuuo1LxL2l4sCcZI8o24WehoRRqgW8fnE820=
X-Received: by 2002:a5d:64ce:0:b0:398:fd9b:b935 with SMTP id ffacd0b85a97d-3997f9407b6mr3202446f8f.53.1742554173622;
        Fri, 21 Mar 2025 03:49:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/QIYfFEThKYHfy0m4x52uirzkjphsVpeKs7ht6DTF54VIuM9rWUOyEUHCqESKQ+gfIZJrbA==
X-Received: by 2002:a5d:64ce:0:b0:398:fd9b:b935 with SMTP id ffacd0b85a97d-3997f9407b6mr3202410f8f.53.1742554173184;
        Fri, 21 Mar 2025 03:49:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72a:9100:23d2:3800:cdcc:90f0? (p200300cbc72a910023d23800cdcc90f0.dip0.t-ipconnect.de. [2003:cb:c72a:9100:23d2:3800:cdcc:90f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9f0107sm2060668f8f.99.2025.03.21.03.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 03:49:32 -0700 (PDT)
Message-ID: <43657a07-617b-43fe-b0b0-689f2392fc63@redhat.com>
Date: Fri, 21 Mar 2025 11:49:31 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fs/proc: extend the PAGEMAP_SCAN ioctl to report
 guard regions
To: Andrei Vagin <avagin@google.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Andrei Vagin <avagin@gmail.com>
References: <20250320063903.2685882-1-avagin@google.com>
 <20250320063903.2685882-2-avagin@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250320063903.2685882-2-avagin@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.03.25 07:39, Andrei Vagin wrote:
> From: Andrei Vagin <avagin@gmail.com>
> 
> Introduce the PAGE_IS_GUARD flag in the PAGEMAP_SCAN ioctl to expose
> information about guard regions. This allows userspace tools, such as
> CRIU, to detect and handle guard regions.
> 
> Signed-off-by: Andrei Vagin <avagin@gmail.com>
> ---
>   Documentation/admin-guide/mm/pagemap.rst | 1 +
>   fs/proc/task_mmu.c                       | 8 ++++++--
>   include/uapi/linux/fs.h                  | 1 +
>   3 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
> index a297e824f990..7997b67ffc97 100644
> --- a/Documentation/admin-guide/mm/pagemap.rst
> +++ b/Documentation/admin-guide/mm/pagemap.rst
> @@ -234,6 +234,7 @@ Following flags about pages are currently supported:
>   - ``PAGE_IS_PFNZERO`` - Page has zero PFN
>   - ``PAGE_IS_HUGE`` - Page is PMD-mapped THP or Hugetlb backed
>   - ``PAGE_IS_SOFT_DIRTY`` - Page is soft-dirty
> +- ``PAGE_IS_GUARD`` - Page is a guard region
>   
>   The ``struct pm_scan_arg`` is used as the argument of the IOCTL.
>   
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index c17615e21a5d..698d660bfee4 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -2067,7 +2067,8 @@ static int pagemap_release(struct inode *inode, struct file *file)
>   #define PM_SCAN_CATEGORIES	(PAGE_IS_WPALLOWED | PAGE_IS_WRITTEN |	\
>   				 PAGE_IS_FILE |	PAGE_IS_PRESENT |	\
>   				 PAGE_IS_SWAPPED | PAGE_IS_PFNZERO |	\
> -				 PAGE_IS_HUGE | PAGE_IS_SOFT_DIRTY)
> +				 PAGE_IS_HUGE | PAGE_IS_SOFT_DIRTY |	\
> +				 PAGE_IS_GUARD)
>   #define PM_SCAN_FLAGS		(PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC)
>   
>   struct pagemap_scan_private {
> @@ -2108,8 +2109,11 @@ static unsigned long pagemap_page_category(struct pagemap_scan_private *p,
>   		if (!pte_swp_uffd_wp_any(pte))
>   			categories |= PAGE_IS_WRITTEN;
>   
> +		swp = pte_to_swp_entry(pte);
> +		if (is_guard_swp_entry(swp))
> +			categories |= PAGE_IS_GUARD;
> +
>   		if (p->masks_of_interest & PAGE_IS_FILE) {

could be an else if?

if (is_guard_swp_entry(swp)) {
	categories |= PAGE_IS_GUARD;
} else if (p->masks_of_interest & PAGE_IS_FILE) {
...


Acked-by: David Hildenbrand <david@redhat.com>


-- 
Cheers,

David / dhildenb


