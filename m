Return-Path: <linux-doc+bounces-12917-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1651C88F6FE
	for <lists+linux-doc@lfdr.de>; Thu, 28 Mar 2024 06:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 383011C2396F
	for <lists+linux-doc@lfdr.de>; Thu, 28 Mar 2024 05:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B607A3FB8D;
	Thu, 28 Mar 2024 05:08:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EAC15C0
	for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 05:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711602498; cv=none; b=fNnPwTwD1Dhh9xGEwuYRe/jQIebLGyK5gIrHlXrhW5pAtEr5NgncNLo6KuLN8zhqDeNHYKIafhA16HkepXjdCQr9g38zChP9T+omMdvz+oMMIEHtFYkhhqIHuseNA1rGHjQ22DizdcTCQEVAZ0nx1d5YpEyWOb4uIGkIrjIIwlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711602498; c=relaxed/simple;
	bh=PL5DXbsk/zcSR4oAj7wKUmuNZY6vnQSkjdXIhxcxoUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XLbgMKcI2Q4LavY9TZjsg6VjeeZcbsgMe8GVh0knDnh6tA5tBt6idMp5xz8YnbdEo7q7jk9khm89HvrS2/ewNocskx8mraNRRoH3udLy7E3KiyoWmANsiHP7t6Vl2o7iYx9uiA1Ocyr6+do4yprT5HN+ui98fuLP0PHnmEHaXqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V4s1d47c8ztQW4;
	Thu, 28 Mar 2024 13:05:41 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id D017E1404DB;
	Thu, 28 Mar 2024 13:08:07 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 13:08:07 +0800
Message-ID: <3839b0b2-e980-4ea1-93f3-f37367af1a66@huawei.com>
Date: Thu, 28 Mar 2024 13:08:06 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] mm: migrate: add isolate_movable_folio()
Content-Language: en-US
To: Vishal Moola <vishal.moola@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>, <willy@infradead.org>, Miaohe
 Lin <linmiaohe@huawei.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, David
 Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>, Zi Yan
	<ziy@nvidia.com>, Hugh Dickins <hughd@google.com>, Jonathan Corbet
	<corbet@lwn.net>, <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>, Baolin
 Wang <baolin.wang@linux.alibaba.com>
References: <20240327141034.3712697-1-wangkefeng.wang@huawei.com>
 <20240327141034.3712697-2-wangkefeng.wang@huawei.com>
 <ZgRsntOMz0R2LdqJ@fedora>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <ZgRsntOMz0R2LdqJ@fedora>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm100001.china.huawei.com (7.185.36.93)



On 2024/3/28 2:59, Vishal Moola wrote:
> On Wed, Mar 27, 2024 at 10:10:29PM +0800, Kefeng Wang wrote:
>> Like isolate_lru_page(), make isolate_movable_page() as a wrapper
>> around isolate_lru_folio(), since isolate_movable_page() always
>> fails on a tail page, add a warn for tail page and return immediately.
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   include/linux/migrate.h |  3 +++
>>   mm/migrate.c            | 41 +++++++++++++++++++++++------------------
>>   2 files changed, 26 insertions(+), 18 deletions(-)
>>
>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>> index f9d92482d117..a6c38ee7246a 100644
>> --- a/include/linux/migrate.h
>> +++ b/include/linux/migrate.h
>> @@ -70,6 +70,7 @@ int migrate_pages(struct list_head *l, new_folio_t new, free_folio_t free,
>>   		  unsigned int *ret_succeeded);
>>   struct folio *alloc_migration_target(struct folio *src, unsigned long private);
>>   bool isolate_movable_page(struct page *page, isolate_mode_t mode);
>> +bool isolate_movable_folio(struct folio *folio, isolate_mode_t mode);
>>   
>>   int migrate_huge_page_move_mapping(struct address_space *mapping,
>>   		struct folio *dst, struct folio *src);
>> @@ -91,6 +92,8 @@ static inline struct folio *alloc_migration_target(struct folio *src,
>>   	{ return NULL; }
>>   static inline bool isolate_movable_page(struct page *page, isolate_mode_t mode)
>>   	{ return false; }
>> +static inline bool isolate_movable_folio(struct page *page, isolate_mode_t mode)
>> +	{ return false; }
> 
> Wrong argument here.
Mistake, will fix.

> 
>>   
>>   static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
>>   				  struct folio *dst, struct folio *src)
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index 2228ca681afb..b2195b6ff32c 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -57,31 +57,29 @@
>>   
>>   #include "internal.h"
>>   
>> -bool isolate_movable_page(struct page *page, isolate_mode_t mode)
>> +bool isolate_movable_folio(struct folio *folio, isolate_mode_t mode)
>>   {
>> -	struct folio *folio = folio_get_nontail_page(page);
>>   	const struct movable_operations *mops;
>>   
>>   	/*
>> -	 * Avoid burning cycles with pages that are yet under __free_pages(),
>> +	 * Avoid burning cycles with folios that are yet under __free_pages(),
>>   	 * or just got freed under us.
>>   	 *
>> -	 * In case we 'win' a race for a movable page being freed under us and
>> +	 * In case we 'win' a race for a movable folio being freed under us and
>>   	 * raise its refcount preventing __free_pages() from doing its job
>> -	 * the put_page() at the end of this block will take care of
>> -	 * release this page, thus avoiding a nasty leakage.
>> +	 * the folio_put() at the end of this block will take care of
>> +	 * release this folio, thus avoiding a nasty leakage.
>>   	 */
>> -	if (!folio)
>> -		goto out;
>> +	folio_get(folio);
>>   
>>   	if (unlikely(folio_test_slab(folio)))
>>   		goto out_putfolio;
>>   	/* Pairs with smp_wmb() in slab freeing, e.g. SLUB's __free_slab() */
>>   	smp_rmb();
>>   	/*
>> -	 * Check movable flag before taking the page lock because
>> -	 * we use non-atomic bitops on newly allocated page flags so
>> -	 * unconditionally grabbing the lock ruins page's owner side.
>> +	 * Check movable flag before taking the folio lock because
>> +	 * we use non-atomic bitops on newly allocated folio flags so
>> +	 * unconditionally grabbing the lock ruins folio's owner side.
>>   	 */
>>   	if (unlikely(!__folio_test_movable(folio)))
>>   		goto out_putfolio;
>> @@ -91,13 +89,13 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
>>   		goto out_putfolio;
>>   
>>   	/*
>> -	 * As movable pages are not isolated from LRU lists, concurrent
>> -	 * compaction threads can race against page migration functions
>> -	 * as well as race against the releasing a page.
>> +	 * As movable folios are not isolated from LRU lists, concurrent
>> +	 * compaction threads can race against folio migration functions
>> +	 * as well as race against the releasing a folio.
>>   	 *
>> -	 * In order to avoid having an already isolated movable page
>> +	 * In order to avoid having an already isolated movable folio
>>   	 * being (wrongly) re-isolated while it is under migration,
>> -	 * or to avoid attempting to isolate pages being released,
>> +	 * or to avoid attempting to isolate folios being released,
>>   	 * lets be sure we have the page lock
>>   	 * before proceeding with the movable page isolation steps.
>>   	 */
>> @@ -113,7 +111,7 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
>>   	if (!mops->isolate_page(&folio->page, mode))
>>   		goto out_no_isolated;
>>   
>> -	/* Driver shouldn't use PG_isolated bit of page->flags */
>> +	/* Driver shouldn't use PG_isolated bit of folio->flags */
>>   	WARN_ON_ONCE(folio_test_isolated(folio));
>>   	folio_set_isolated(folio);
>>   	folio_unlock(folio);
>> @@ -124,10 +122,17 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
>>   	folio_unlock(folio);
>>   out_putfolio:
>>   	folio_put(folio);
>> -out:
>>   	return false;
>>   }
>>   
>> +bool isolate_movable_page(struct page *page, isolate_mode_t mode)
>> +{
>> +	if (WARN_RATELIMIT(PageTail(page), "trying to isolate tail page"))
>> +		return false;
> 
> This warning doesn't make sense. As of now, we still isolate_movable_page()
> to be able to take in a tail page, we just don't want to operate on it.
Zi replied too, I will remove it.

Thanks.
> 
>> +	return isolate_movable_folio((struct folio *)page, mode);
>> +}
>> +
>>   static void putback_movable_folio(struct folio *folio)
>>   {
>>   	const struct movable_operations *mops = folio_movable_ops(folio);
>> -- 
>> 2.27.0
>>

