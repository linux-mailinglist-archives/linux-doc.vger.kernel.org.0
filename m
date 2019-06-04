Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB8FA33CD3
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jun 2019 03:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfFDBqt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Jun 2019 21:46:49 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:38100 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725876AbfFDBqt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 3 Jun 2019 21:46:49 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 7BA1C55AF8D62E01697B;
        Tue,  4 Jun 2019 09:46:47 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 4 Jun 2019
 09:46:44 +0800
Subject: Re: [PATCH v3 3/4] f2fs: Fix accounting for unusable blocks
To:     Jaegeuk Kim <jaegeuk@kernel.org>
CC:     Daniel Rosenberg <drosen@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        <linux-f2fs-devel@lists.sourceforge.net>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-fsdevel@vger.kernel.org>, <kernel-team@android.com>
References: <20190530004906.261170-1-drosen@google.com>
 <20190530004906.261170-4-drosen@google.com>
 <c99079bd-99e1-e100-08f6-1e8adae5e722@huawei.com>
 <20190603202630.GB34729@jaegeuk-macbookpro.roam.corp.google.com>
From:   Chao Yu <yuchao0@huawei.com>
Message-ID: <2fbeda5b-50d6-a8c2-06a9-dddf5d466de8@huawei.com>
Date:   Tue, 4 Jun 2019 09:46:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190603202630.GB34729@jaegeuk-macbookpro.roam.corp.google.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2019/6/4 4:26, Jaegeuk Kim wrote:
> On 06/03, Chao Yu wrote:
>> On 2019/5/30 8:49, Daniel Rosenberg wrote:
>>> Fixes possible underflows when dealing with unusable blocks.
>>>
>>> Signed-off-by: Daniel Rosenberg <drosen@google.com>
>>> ---
>>>  fs/f2fs/f2fs.h | 15 ++++++++++-----
>>>  1 file changed, 10 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 9b3d9977cd1ef..a39cc4ffeb4b1 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -1769,8 +1769,12 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
>>>  
>>>  	if (!__allow_reserved_blocks(sbi, inode, true))
>>>  		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
>>> -	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
>>> -		avail_user_block_count -= sbi->unusable_block_count;
>>> +	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
>>> +		if (avail_user_block_count > sbi->unusable_block_count)
>>> +			avail_user_block_count = 0;
>>
>> avail_user_block_count -= sbi->unusable_block_count;
>>
>>> +		else
>>> +			avail_user_block_count -= sbi->unusable_block_count;
>>
>> avail_user_block_count = 0;
>>
> 
> I fixed this.

Okay, if there is no v4, please add

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> 
> Thanks,
> 
>> Thanks,
>>
>>> +	}
>>>  	if (unlikely(sbi->total_valid_block_count > avail_user_block_count)) {
>>>  		diff = sbi->total_valid_block_count - avail_user_block_count;
>>>  		if (diff > *count)
>>> @@ -1970,7 +1974,7 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
>>>  					struct inode *inode, bool is_inode)
>>>  {
>>>  	block_t	valid_block_count;
>>> -	unsigned int valid_node_count;
>>> +	unsigned int valid_node_count, user_block_count;
>>>  	int err;
>>>  
>>>  	if (is_inode) {
>>> @@ -1997,10 +2001,11 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
>>>  
>>>  	if (!__allow_reserved_blocks(sbi, inode, false))
>>>  		valid_block_count += F2FS_OPTION(sbi).root_reserved_blocks;
>>> +	user_block_count = sbi->user_block_count;
>>>  	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
>>> -		valid_block_count += sbi->unusable_block_count;
>>> +		user_block_count -= sbi->unusable_block_count;
>>>  
>>> -	if (unlikely(valid_block_count > sbi->user_block_count)) {
>>> +	if (unlikely(valid_block_count > user_block_count)) {
>>>  		spin_unlock(&sbi->stat_lock);
>>>  		goto enospc;
>>>  	}
>>>
> .
> 
