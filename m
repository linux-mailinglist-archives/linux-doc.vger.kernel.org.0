Return-Path: <linux-doc+bounces-93310-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fhe5AITnOmo8KwgAu9opvQ
	(envelope-from <linux-doc+bounces-93310-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 22:07:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAA36B9D8E
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 22:07:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="hItVHB/p";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93310-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93310-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB82E300EF91
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 20:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE523955FC;
	Tue, 23 Jun 2026 20:06:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C8726A1CF
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 20:06:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782245205; cv=none; b=PZ5w4lOmYMSdAf74/4xZjdv+frcx8uLrhXI0wdobyT1PPrhRjFtUMgyDuIwycVRg/jgsTkJwwAnp5lCO50TDcCydpRPQe0KlgyDh766PD7mxEHaksmVcb78v4WlJ4GERzGYejewG0LyST1lq6n838cwJaJuAdThWjPXm758/MuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782245205; c=relaxed/simple;
	bh=ykMC2ieYQYVSxbapdFkuFJd/A1i/SI/0S63Ag5SQ2+E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IRMx8gS1Lay8UvSxPVBWG/DGUeYrsRsp4uX/dip6xO//elmATS3dypq/RmYPxyn9/cZUyKgoOp7PxR5hYlsP6NFvBkETtaDOoA/yxt4d/sHmet6gpGLwxL7TjExNg3GAAG29vEpDA+BZZunNvL9jFBxRE7Jkj33EZZ2Yzv5xHN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hItVHB/p; arc=none smtp.client-ip=209.85.208.73
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-697498c701eso146753a12.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 13:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782245203; x=1782850003; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kYPy5Kp/eciXGU33EP09NXjsbX2uzzGfRHxirk+T+0A=;
        b=hItVHB/p6ViFVNt7PxMzW+TnRr3F7wzqELOAGwnVrgdqD7j0ceDj9QeSkB/wMVAvZo
         bV/gGRlk+etAb/RTu9kTPIS03VXX7FdRRuQz8FrfWfscyJLD7OOxHdNYaAj9B4ka5KTE
         iH5bxbf+4A3d6ZhCrc0zzuiEARShuiAiP+m89iv94cok2uUkaNbxLjOSPMbUkYV6Bvp2
         4bvOBNPQTjO/+VkQCqn0YjKra2i/UVG9w5OG0HvdqLFrEweVYQXclb2EB3sYoQHoKDNx
         oCpWw77zyfkhx7L9foHDxNstlsTNv94HID+mnWG2As+J9ck6LEul/e2p47tGaycrbjGC
         Bn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782245203; x=1782850003;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYPy5Kp/eciXGU33EP09NXjsbX2uzzGfRHxirk+T+0A=;
        b=pGFjTQ5oVzKPif3SVPDwoJyVzf5vjfaIXgAG40moJ/2ZdH3z/vvz5s229bT06YsVGv
         sSaU4ISfy8N/Gzgama/FFBlsKb/B6Gl1MNl3sg5ce+A8J3/A7lurUNE+e09DqsYKeM1n
         KG1y2azpEy2tE8IfNVxthZNO0GvrZMBEZLSvH76L3wt3qF6JDhY5CBI/NDzVKX+7YIKP
         gSke9Ba9NRB2+z5quVSBrbI1tk8+yRlBvsMZeZeiCgC2zqZJBnDwhIkV0n0DhcwQDd9l
         Qj1Bw/wBdBhUTVaA0kt4PkqlAo0pokUa8nGrYNyhkWg/6RSLrYRGdYFL5+e8z3+FGn2X
         jEDA==
X-Forwarded-Encrypted: i=1; AFNElJ8YOz/dl4KtzrDeWMrjPMXFkVCN5rUcgHPRQfbqEDnw0DSN9z8Z116XKEU4AtaymyHlN4ULCt4gw2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD5U+GSCdx80Jg5NnYp2+dlsmhVzRa4FkBNhOqAZ6hkmPeIb47
	Hzd3RzTyRUG3jkYA4Gejr/Wu8sQboVz7FHOIC8kOWyTUUCZiFCd/X38USrpRGFwsjC4kDa1xCPC
	ZEnuUIFFadHwY72KKXQ==
X-Received: from edyc13.prod.google.com ([2002:aa7:df0d:0:b0:697:e99f:d111])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3554:b0:691:b5aa:5a7a with SMTP id 4fb4d7f45d1cf-697f3adf4a5mr19296a12.21.1782245202451;
 Tue, 23 Jun 2026 13:06:42 -0700 (PDT)
Date: Tue, 23 Jun 2026 20:06:41 +0000
In-Reply-To: <2vxz8q85mdyh.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1780676742.git.tarunsahu@google.com> <48777f4749fa43d5648085dbb2037aa99c144a88.1780676742.git.tarunsahu@google.com>
 <CAEvNRgFEHciT3T9y+qEYRvXhDwfrggoU7Rm=f9hT3OrV+wgpNQ@mail.gmail.com>
 <9huztsqtmihs.fsf@tarunix.c.googlers.com> <2vxz8q85mdyh.fsf@kernel.org>
Message-ID: <9huzv7b910oe.fsf@tarunix.c.googlers.com>
Subject: Re: [RFC PATCH v2 06/10] kvm: guest_memfd: Add support for freezing
 and unfreezing mappings
From: tarunsahu@google.com
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Ackerley Tng <ackerleytng@google.com>, Jonathan Corbet <corbet@lwn.net>, vannapurve@google.com, 
	fvdl@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, sagis@google.com, aneesh.kumar@kernel.org, 
	skhawaja@google.com, vipinsh@google.com, Pratyush Yadav <pratyush@kernel.org>, 
	david@redhat.com, dmatlack@google.com, mark.rutland@arm.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>, 
	seanjc@google.com, axelrasmussen@google.com, linux-kselftest@vger.kernel.org, 
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pratyush@kernel.org,m:ackerleytng@google.com,m:corbet@lwn.net,m:vannapurve@google.com,m:fvdl@google.com,m:pasha.tatashin@soleen.com,m:skhan@linuxfoundation.org,m:sagis@google.com,m:aneesh.kumar@kernel.org,m:skhawaja@google.com,m:vipinsh@google.com,m:david@redhat.com,m:dmatlack@google.com,m:mark.rutland@arm.com,m:pbonzini@redhat.com,m:rppt@kernel.org,m:graf@amazon.com,m:seanjc@google.com,m:axelrasmussen@google.com,m:linux-kselftest@vger.kernel.org,m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93310-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER(0.00)[tarunsahu@google.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[tarunsahu@google.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,tarunix.c.googlers.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FAA36B9D8E

Pratyush Yadav <pratyush@kernel.org> writes:

> On Tue, Jun 23 2026, tarunsahu@google.com wrote:
>
>> Ackerley Tng <ackerleytng@google.com> writes:
>>
>>> Tarun Sahu <tarunsahu@google.com> writes:
>>>
>>>>  static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>>>>  			       loff_t len)
>>>>  {
>>>> +	struct inode *inode = file_inode(file);
>>>>  	int ret;
>>>> +	int idx;
>>>>
>>>> -	if (!(mode & FALLOC_FL_KEEP_SIZE))
>>>> -		return -EOPNOTSUPP;
>>>> +	idx = srcu_read_lock(&kvm_gmem_freeze_srcu);
>>>> +	if (kvm_gmem_is_frozen(inode)) {
>>>> +		srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
>>>> +		return -EPERM;
>>>> +	}
>>>
>>> fallocate may eventually go to kvm_gmem_get_folio(), so that would check
>>> kvm_gmem_is_frozen() twice. Is this meant to catch the punch hole case?
>
> Yeah, I reckon you can get away with doing this check only in
> kvm_gmem_get_folio(). Normally you'd like to fail early, but as of now I
> don't see much of a problem. If you drop the check here and fail in
> kvm_gmem_get_folio() you'd end up taking and releasing the mapping
> invalidate_lock, but this isn't a fast path anyway so I don't think it
> should matter much.

No, Don't agree.
kvm_gmem_get_folios already have the is_frozen check. which blocks the
kvm_gmem_allocate. But not kvm_gmem_punch_hole. Your argument is correct
for kvm_gmem_allocate only. So is_frozen check in fallocate is to
block the punch hole as well. What ackerley said is correct.

>
> I think either way can work just as fine...
>
>>>
>>>>
>>>> -	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE))
>>>> -		return -EOPNOTSUPP;
>>>> +	if (!(mode & FALLOC_FL_KEEP_SIZE)) {
>>>> +		ret = -EOPNOTSUPP;
>>>> +		goto out;
>>>> +	}
>>>>
>>>> -	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
>>>> -		return -EINVAL;
>>>> +	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE)) {
>>>> +		ret = -EOPNOTSUPP;
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len)) {
>>>> +		ret = -EINVAL;
>>>> +		goto out;
>>>> +	}
>>>
>>> There's some reordering here. Why not let the validation happen like
>>> before, then check kvm_gmem_is_frozen()?
>
> There is no reordering, if I am reading the diff correctly. The diff is
> somewhat misleading. The kvm_gmem_is_frozen() call is added at the top
> of the function, and then all the later checks are in the same place but
> get a goto out (and hence a full body to the if block). So the diff
> reads like reordering, but there is none.
>

That is right. I thought Ackerley was asking why not add the check after
the all the if condition and before the kvm_gmem_punch_hole/allocate calls.

> It would be very neat if scru had a cleanup.h style scope-based locking
> function, but on a quick glance I can't see one.
>
>>
>> To align with design. "stop the fallocate call if inode is frozen, No
>> need to go further". I dont have strict opinion on this. I am fine with
>> taking it across punch hole as well to make it more fine grained. But it
>> will no longer claims stop the fallocate call (allocation one is stopped
>> in separate path: fault path) , though functionally it does the same
>> thing.
>>
>> WDYT?
>>
>> ~Tarun
>
> -- 
> Regards,
> Pratyush Yadav

