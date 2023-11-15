Return-Path: <linux-doc+bounces-1640-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C257DFAF5
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 20:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F1421C20F86
	for <lists+linux-doc@lfdr.de>; Thu,  2 Nov 2023 19:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC1521372;
	Thu,  2 Nov 2023 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="gB5YaEFw"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD7221349;
	Thu,  2 Nov 2023 19:33:38 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id CB52D194;
	Thu,  2 Nov 2023 12:33:31 -0700 (PDT)
Received: from [10.137.106.151] (unknown [131.107.159.23])
	by linux.microsoft.com (Postfix) with ESMTPSA id C019120B74C0;
	Thu,  2 Nov 2023 12:33:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C019120B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1698953610;
	bh=BFv0LoFgCinTrSDNN0PUUDUwJMnBDe5xTh49JYLz3Y4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gB5YaEFwfIAnkOlr317P5lWnHUTOq+MksL4x/t6lqhrFaWrMyEanwJnIqhD9Ufzwy
	 IolfcJ5mTJlgR6Jri9QAkbJsElG9Na29MJLxkEA1Y4/xrIcTyc/ImgDrFg6i1yx2f9
	 LLDUkRU9KCRLP3D9LBySG2QN3Iaywco1wAyL8x78=
Message-ID: <b53c47f6-0cf3-448c-bb55-5f68ca48a872@linux.microsoft.com>
Date: Thu, 2 Nov 2023 12:33:30 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v11 15/19] fsverity: consume builtin signature via LSM
 hook
Content-Language: en-US
To: Paul Moore <paul@paul-moore.com>, Eric Biggers <ebiggers@kernel.org>
Cc: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
 tytso@mit.edu, axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org,
 eparis@redhat.com, linux-doc@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, audit@vger.kernel.org, roberto.sassu@huawei.com,
 linux-kernel@vger.kernel.org, Deven Bowers <deven.desai@linux.microsoft.com>
References: <1696457386-3010-16-git-send-email-wufan@linux.microsoft.com>
 <6efb7a80ba0eb3e02b3ae7a5c0a210f3.paul@paul-moore.com>
 <CAHC9VhQJkcb-k+o+NvVn7crrMMZqpBcZpnEbKBT+eZg4Ocjqhw@mail.gmail.com>
 <20231102025355.GA1498@sol.localdomain>
 <CAHC9VhScaajDOVpBoGPo80ceUggGyrP24pCoMy6d6uQ4r-WZjw@mail.gmail.com>
From: Fan Wu <wufan@linux.microsoft.com>
In-Reply-To: <CAHC9VhScaajDOVpBoGPo80ceUggGyrP24pCoMy6d6uQ4r-WZjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/2/2023 8:42 AM, Paul Moore wrote:
> On Wed, Nov 1, 2023 at 10:54 PM Eric Biggers <ebiggers@kernel.org> wrote:
>> On Wed, Nov 01, 2023 at 08:40:06PM -0400, Paul Moore wrote:
>>> On Mon, Oct 23, 2023 at 11:52 PM Paul Moore <paul@paul-moore.com> wrote:
>>>> On Oct  4, 2023 Fan Wu <wufan@linux.microsoft.com> wrote:
>>>>>
>>>>> fsverity represents a mechanism to support both integrity and
>>>>> authenticity protection of a file, supporting both signed and unsigned
>>>>> digests.
>>>>>
>>>>> An LSM which controls access to a resource based on authenticity and
>>>>> integrity of said resource, can then use this data to make an informed
>>>>> decision on the authorization (provided by the LSM's policy) of said
>>>>> claim.
>>>>>
>>>>> This effectively allows the extension of a policy enforcement layer in
>>>>> LSM for fsverity, allowing for more granular control of how a
>>>>> particular authenticity claim can be used. For example, "all (built-in)
>>>>> signed fsverity files should be allowed to execute, but only these
>>>>> hashes are allowed to be loaded as kernel modules".
>>>>>
>>>>> This enforcement must be done in kernel space, as a userspace only
>>>>> solution would fail a simple litmus test: Download a self-contained
>>>>> malicious binary that never touches the userspace stack. This
>>>>> binary would still be able to execute.
>>>>>
>>>>> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
>>>>> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
>>>>> ---
>>>>> v1-v6:
>>>>>    + Not present
>>>>>
>>>>> v7:
>>>>>    Introduced
>>>>>
>>>>> v8:
>>>>>    + Split fs/verity/ changes and security/ changes into separate patches
>>>>>    + Change signature of fsverity_create_info to accept non-const inode
>>>>>    + Change signature of fsverity_verify_signature to accept non-const inode
>>>>>    + Don't cast-away const from inode.
>>>>>    + Digest functionality dropped in favor of:
>>>>>      ("fs-verity: define a function to return the integrity protected
>>>>>        file digest")
>>>>>    + Reworded commit description and title to match changes.
>>>>>    + Fix a bug wherein no LSM implements the particular fsverity @name
>>>>>      (or LSM is disabled), and returns -EOPNOTSUPP, causing errors.
>>>>>
>>>>> v9:
>>>>>    + No changes
>>>>>
>>>>> v10:
>>>>>    + Rename the signature blob key
>>>>>    + Cleanup redundant code
>>>>>    + Make the hook call depends on CONFIG_FS_VERITY_BUILTIN_SIGNATURES
>>>>>
>>>>> v11:
>>>>>    + No changes
>>>>> ---
>>>>>   fs/verity/fsverity_private.h |  2 +-
>>>>>   fs/verity/open.c             | 26 +++++++++++++++++++++++++-
>>>>>   include/linux/fsverity.h     |  2 ++
>>>>>   3 files changed, 28 insertions(+), 2 deletions(-)
>>>>
>>>> We need an ACK from some VFS folks on this.
>>>
>>> Eric and/or Ted, can we get either an ACK or some feedback on this patch?
>>>
>>> For reference, the full patchset can be found on lore at the link below:
>>>
>>> https://lore.kernel.org/linux-security-module/1696457386-3010-1-git-send-email-wufan@linux.microsoft.com/
>>
>> Well, technically I already gave some (minor) feedback on this exact patch, and
>> it's not yet been addressed:
>> https://lore.kernel.org/linux-security-module/20231005022707.GA1688@quark.localdomain/
Yes thanks for the review. We will certainly add the parameter 
constification in the next version.

> 
> Hopefully Fan can comment on that, unless I'm forgetting some
> implementation details it seems like a reasonable request.
> 
>> Of course, it would also be nice if the commit message mentioned what the patch
>> actually does.
> 
> While I think the commit description does provide a reasonable summary
> of IPE as it relates to fsverify, I agree that the specifics of the
> changes presented in the patch are lacking.  Fan, could you update the
> commit description to add a paragraph explaining what IPE would do in
> the security_inode_setsecurity() hook called from within
> fsverity_inode_setsecurity()?
>
Sorry for the lack of clarity. The hook call happens right after the 
built-in signature verification in fsverity. This hook's main job is to 
allow LSM to store the verified signature so that it can be used for 
future LSM checks.

>> At a higher level, I've said before, I'm not super happy about the use of
>> fsverity builtin signatures growing.  (For some of the reasons why, see the
>> guidance in the fsverity documentation at
>> https://docs.kernel.org/filesystems/fsverity.html#built-in-signature-verification)
>> That being said, if the people who are doing the broader review of IPE believe
>> this is how its fsverity integration should work, I can live with that ...
> 
> Fan can surely elaborate on this more, but my understanding is that
> IPE can help provide the missing authorization piece.
>
As Paul mentioned, with IPE, we can add kernel enforcement that only 
files with the fs-verity built-in signature enabled are allowed. 
Currently, IPE uses the above hook to save the signature in the file's 
security blob, and then it decides whether to permit or deny file 
operations based on the presence of the fs-verity built-in signature.

But our plans don't end there. In the future, we intend to add more 
features to address the security gaps mentioned in the documentation 
related to the fs-verity built-in signature. For instance, we will 
introduce a certificate policy rule to limit which signatures can be 
trusted, thus resolving issues related to the validity period of 
certificates. Additionally, we will implement file path rules, allowing 
different certificates to permit or deny access to different files.

>> ... I don't
>> intend to block the IPE patchset if enough people want it to be merged.  I've
>> really been hoping to see engagement with the people involved in IMA, as IPE
>> basically duplicates/replaces IMA.  But I haven't seen that, so maybe things
>> need to move on without them.
> 
> We are getting a bit beyond the integration of IPE and fsverity so I
> don't want to spend a lot of time here, but IPE and IMA work quite a
> bit differently as they serve different purposes.  IPE provides a file
> authorization mechanism that grants access based on the specified
> policy and the file's underlying backing store; IPE does not measure
> files like IMA to provide additional integrity checking, it relies on
> the storage medium's integrity mechanisms.
> 
> I have no doubt Fan could provide a much better summary if needed, and
> of course there are the documentation patches in the patchset too.
> 

I would like to emphasize that IPE is not meant to replace IMA.

IPE is a different approach, specifically designed for a particular part 
of IMA's capabilities, which is "appraisal. While IPE's approach also 
limits IPE's use cases to highly secure, locked-down devices where 
almost everything is made read-only. In contrast, IMA is a versatile 
solution suitable for a wide range of scenarios, and IPE cannot address 
all of these.

In practice, we often use both IMA (including measurement and appraisal) 
and IPE simultaneously in production. These two solutions can coexist 
and complement each other, and they are not mutually exclusive.

-Fan



