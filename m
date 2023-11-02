Return-Path: <linux-doc+bounces-1651-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4DD7DFC95
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 23:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD601B21256
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 22:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25E2522314;
	Thu,  2 Nov 2023 22:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="K98Jxuuq"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20190219F1;
	Thu,  2 Nov 2023 22:46:57 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6F01A18B;
	Thu,  2 Nov 2023 15:46:53 -0700 (PDT)
Received: from [10.137.106.151] (unknown [131.107.159.23])
	by linux.microsoft.com (Postfix) with ESMTPSA id C13DC20B74C0;
	Thu,  2 Nov 2023 15:46:52 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C13DC20B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1698965212;
	bh=zECzFEhLJZ5ZPt0QhrmcHR1UAf4gGm3oyKqKdzzyJg0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K98Jxuuqyy5JEX8H2SOkXM0JOt3syfrkoX66GXi2xxRrDoduhyxy9oRxiql1yH8ka
	 dAUSZo7kQ56K3gMVzii2weYA/4k5pLl7iW6UWIptCGYGK39k3cGmgvoi3M0i516/JJ
	 UxKc6n+fwihjQ6lkpZHpWlBKZ4QO3gNL6m4nngzc=
Message-ID: <c40cd6a6-5c32-4e72-8831-f87ee0a09324@linux.microsoft.com>
Date: Thu, 2 Nov 2023 15:46:52 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v11 5/19] ipe: introduce 'boot_verified' as a trust
 provider
Content-Language: en-US
To: Paul Moore <paul@paul-moore.com>
Cc: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
 tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com,
 snitzer@kernel.org, eparis@redhat.com, linux-doc@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, audit@vger.kernel.org, roberto.sassu@huawei.com,
 linux-kernel@vger.kernel.org, Deven Bowers <deven.desai@linux.microsoft.com>
References: <1696457386-3010-6-git-send-email-wufan@linux.microsoft.com>
 <c53599e9d278fc55be30e3bac9411328.paul@paul-moore.com>
 <616a6fd7-47b1-4b46-af23-46f9b1a3eedf@linux.microsoft.com>
 <CAHC9VhScdtqJeUTTUQVk4D70tTLz4TgU_aRTMRnHa0OARyubaw@mail.gmail.com>
From: Fan Wu <wufan@linux.microsoft.com>
In-Reply-To: <CAHC9VhScdtqJeUTTUQVk4D70tTLz4TgU_aRTMRnHa0OARyubaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/26/2023 3:12 PM, Paul Moore wrote:
> On Thu, Oct 26, 2023 at 5:33 PM Fan Wu <wufan@linux.microsoft.com> wrote:
>> On 10/23/2023 8:52 PM, Paul Moore wrote:
>>> On Oct  4, 2023 Fan Wu <wufan@linux.microsoft.com> wrote:
>>>>
>>>> IPE is designed to provide system level trust guarantees, this usually
>>>> implies that trust starts from bootup with a hardware root of trust,
>>>> which validates the bootloader. After this, the bootloader verifies the
>>>> kernel and the initramfs.
>>>>
>>>> As there's no currently supported integrity method for initramfs, and
>>>> it's typically already verified by the bootloader, introduce a property
>>>> that causes the first superblock to have an execution to be "pinned",
>>>> which is typically initramfs.
>>>>
>>>> When the "pinned" device is unmounted, it will be "unpinned" and
>>>> `boot_verified` property will always evaluate to false afterward.
>>>>
>>>> We use a pointer with a spin_lock to "pin" the device instead of rcu
>>>> because rcu synchronization may sleep, which is not allowed when
>>>> unmounting a device.
>>>>
>>>> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
>>>> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
>> ...
>>>> ---
>>>>    security/ipe/eval.c          | 72 +++++++++++++++++++++++++++++++++++-
>>>>    security/ipe/eval.h          |  2 +
>>>>    security/ipe/hooks.c         | 12 ++++++
>>>>    security/ipe/hooks.h         |  2 +
>>>>    security/ipe/ipe.c           |  1 +
>>>>    security/ipe/policy.h        |  2 +
>>>>    security/ipe/policy_parser.c | 35 +++++++++++++++++-
>>>>    7 files changed, 124 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/security/ipe/eval.c b/security/ipe/eval.c
>>>> index 8a8bcc5c7d7f..bdac4abc0ddb 100644
>>>> --- a/security/ipe/eval.c
>>>> +++ b/security/ipe/eval.c
>>>> @@ -9,6 +9,7 @@
>>>>    #include <linux/file.h>
>>>>    #include <linux/sched.h>
>>>>    #include <linux/rcupdate.h>
>>>> +#include <linux/spinlock.h>
>>>>
>>>>    #include "ipe.h"
>>>>    #include "eval.h"
>>>> @@ -16,6 +17,44 @@
>>>>
>>>>    struct ipe_policy __rcu *ipe_active_policy;
>>>>
>>>> +static const struct super_block *pinned_sb;
>>>> +static DEFINE_SPINLOCK(pin_lock);
>>>> +#define FILE_SUPERBLOCK(f) ((f)->f_path.mnt->mnt_sb)
>>>> +
>>>> +/**
>>>> + * pin_sb - Pin the underlying superblock of @f, marking it as trusted.
>>>> + * @sb: Supplies a super_block structure to be pinned.
>>>> + */
>>>> +static void pin_sb(const struct super_block *sb)
>>>> +{
>>>> +    if (!sb)
>>>> +            return;
>>>> +    spin_lock(&pin_lock);
>>>> +    if (!pinned_sb)
>>>> +            pinned_sb = sb;
>>>> +    spin_unlock(&pin_lock);
>>>> +}
>>>> +
>>>> +/**
>>>> + * from_pinned - Determine whether @sb is the pinned super_block.
>>>> + * @sb: Supplies a super_block to check against the pinned super_block.
>>>> + *
>>>> + * Return:
>>>> + * * true   - @sb is the pinned super_block
>>>> + * * false  - @sb is not the pinned super_block
>>>> + */
>>>> +static bool from_pinned(const struct super_block *sb)
>>>> +{
>>>> +    bool rv;
>>>> +
>>>> +    if (!sb)
>>>> +            return false;
>>>> +    spin_lock(&pin_lock);
>>>> +    rv = !IS_ERR_OR_NULL(pinned_sb) && pinned_sb == sb;
>>>> +    spin_unlock(&pin_lock);
>>>
>>> It's okay for an initial version, but I still think you need to get
>>> away from this spinlock in from_pinned() as quickly as possible.
>>> Maybe I'm wrong, but this looks like a major source of lock contention.
>>>
>>> I understand the issue around RCU and the potential for matching on
>>> a reused buffer/address, but if you modified IPE to have its own LSM
>>> security blob in super_block::security you could mark the superblock
>>> when it was mounted and do a lockless lookup here in from_pinned().
>>
>> Thank you for the suggestion. After some testing, I discovered that
>> switching to RCU to pin the super block and using a security blob to
>> mark a pinned super block works. This approach do avoid many spinlock
>> operations. I'll incorporate these changes in the next version of the patch.
> 
> I probably wasn't as clear as I should have been, I was thinking of
> doing away with the @pinned_sb global variable entirely, as well as
> its associated lock problems and simply marking the initramfs/initrd
> superblock when it was mounted.  I will admit that I haven't fully
> thought about all the implementation details, but I think you could
> leverage the security_sb_mount() hook to set a flag in IPE's
> superblock metadata when the initramfs was mounted.
> 
> --
> paul-moore.com

I wasn't able to find a way to let LSM pin initramfs/initrd during mount 
time. But I think we could replace the global variable with a flag 
variable ipe_sb_state so we could use atomic operation to only mark one 
drive as pinned without any lock. The code will be like:

static void pin_sb(const struct super_block *sb)
{
	if (!sb)
		return;

	if (!test_and_set_bit_lock(IPE_SB_PINNED, &ipe_sb_state)) {
		ipe_sb(sb)->pinned = true;
	}
}

Would this sound better?

-Fan

