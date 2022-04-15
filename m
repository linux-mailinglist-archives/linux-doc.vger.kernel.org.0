Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9385025A0
	for <lists+linux-doc@lfdr.de>; Fri, 15 Apr 2022 08:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350484AbiDOGeL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 Apr 2022 02:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350478AbiDOGeL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Apr 2022 02:34:11 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 877CA5C67C;
        Thu, 14 Apr 2022 23:31:42 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Kfmd60fpyzFpXP;
        Fri, 15 Apr 2022 14:29:14 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 15 Apr 2022 14:31:40 +0800
Received: from [10.174.178.178] (10.174.178.178) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 15 Apr 2022 14:31:37 +0800
Message-ID: <9e3ca922-1448-2eb1-b056-218236e7c72f@huawei.com>
Date:   Fri, 15 Apr 2022 14:31:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH v10 06/14] mm: multi-gen LRU: minimal implementation
To:     Yu Zhao <yuzhao@google.com>
CC:     Stephen Rothwell <sfr@rothwell.id.au>, <linux-mm@kvack.org>,
        Andi Kleen <ak@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Hillf Danton" <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "Matthew Wilcox" <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <page-reclaim@google.com>, <x86@kernel.org>,
        Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        =?UTF-8?Q?Holger_Hoffst=c3=a4tte?= <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
References: <20220407031525.2368067-1-yuzhao@google.com>
 <20220407031525.2368067-7-yuzhao@google.com>
 <71af92d2-0777-c318-67fb-8f7d52c800bb@huawei.com>
 <YliJzrfXzwwxiCId@google.com>
 <4c416f09-5304-07fd-cb53-5c9c8c75f6fa@huawei.com>
 <YlkBrHOFgah3vHaK@google.com>
From:   Chen Wandun <chenwandun@huawei.com>
In-Reply-To: <YlkBrHOFgah3vHaK@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.178]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2022/4/15 13:25, Yu Zhao 写道:
> On Fri, Apr 15, 2022 at 10:23:18AM +0800, Chen Wandun wrote:
>> 在 2022/4/15 4:53, Yu Zhao 写道:
>>> On Thu, Apr 14, 2022 at 07:47:54PM +0800, Chen Wandun wrote:
>>>> On 2022/4/7 11:15, Yu Zhao wrote:
>>>>> +static void inc_min_seq(struct lruvec *lruvec)
>>>>> +{
>>>>> +	int type;
>>>>> +	struct lru_gen_struct *lrugen = &lruvec->lrugen;
>>>>> +
>>>>> +	VM_BUG_ON(!seq_is_valid(lruvec));
>>>>> +
>>>>> +	for (type = 0; type < ANON_AND_FILE; type++) {
>>>>> +		if (get_nr_gens(lruvec, type) != MAX_NR_GENS)
>>>>> +			continue;
>>>> I'm confused about relation between aging and LRU list operation.
>>>>
>>>> In function inc_max_seq,  both min_seq and max_seq will increase，
>>>> the lrugen->lists[] indexed by lru_gen_from_seq(max_seq + 1) may
>>>> be non-empty?
>>> Yes.
>>>
>>>> for example,
>>>> before inc_max_seq:
>>>> min_seq == 0, lrugen->lists[0][type][zone]
>>>> max_seq ==3, lrugen->lists[3][type][zone]
>>>>
>>>> after inc_max_seq:
>>>> min_seq ==1, lrugen->lists[1][type][zone]
>>>> max_seq ==4, lrugen->lists[0][type][zone]
>>>>
>>>> If lrugen->lists[0][type][zone] is not empty before inc_max_seq and it is
>>>> the most inactive list，however lurgen->lists[0][type][zone] will become
>>>> the most active list after inc_max_seq.
>>> Correct.
>>>
>>>> So,  in this place,
>>>>
>>>> if (get_nr_gens(lruvec, type) != MAX_NR_GENS)
>>>> 	continue;
>>>>
>>>> should change to
>>>>
>>>> if (get_nr_gens(lruvec, type) == MAX_NR_GENS)
>>>> 	continue;
>>> No, because max/min_seq will overlap if we do so.
>>>
>>> lrugen->lists[max_seq+1] can only be non-empty for anon LRU, for a
>>> couple of reasons:
>>> 1. We can't swap at all.
>>> 2. Swapping is constrained, e.g., swapfile is full.
>>>
>>> Both cases are similar to a producer (the aging) overrunning a
>>> consumer (the eviction). We used to handle them, but I simplified the
>>> code because I don't feel they are worth handling [1].
>> Can lrugen->lists[max_seq+1]  also be non-empty for file LRU？
> On reclaim path, no. But it can be forced to do so via debugfs.
>
>> such as in dont reclaim mapped file page case(isolation will fail).
> You mean may_unmap=false? Pages stays in the same generation if
> isolation fails. So lrugen->lists[min_seq] won't be empty in this
> case.
>
>> If so, after aging, eviction will reclaim memory start from
>> lrugen->lists[min_seq+1], but some oldest file page still
>> remain in lrugen->lists[max_seq+1].
>>
>> sort_folio can help to put misplaced pages to the right
>> LRU list, but in this case, it does't help, because sort_folio
>> only sort lrugen->lists[min_seq+1].
> On reclaim path, inc_max_seq() is only called when need_aging=true,
> and this guarantees max_seq-min_seq[LRU_GEN_FILE]+1 < MAX_NR_GENS.
yes, I think so, but I did't find the logical in function get_nr_evictable,
or am I missing something

         if (min_seq[LRU_GEN_FILE] + MIN_NR_GENS > max_seq)
                 *need_aging = true;
         else if (min_seq[LRU_GEN_FILE] + MIN_NR_GENS < max_seq)
                 *need_aging = false;
         else if (young * MIN_NR_GENS > total)
                 *need_aging = true;
         else if (old * (MIN_NR_GENS + 2) < total)
                 *need_aging = true;
         else
                 *need_aging = false;

Thanks
> .

