Return-Path: <linux-doc+bounces-93253-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VPZ6Ee+wOmryDwgAu9opvQ
	(envelope-from <linux-doc+bounces-93253-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 18:14:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 006376B89EC
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 18:14:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VUvN9dWT;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93253-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93253-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD9493051FD7
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 16:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB66230DEA6;
	Tue, 23 Jun 2026 16:14:20 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B592930B509;
	Tue, 23 Jun 2026 16:14:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231260; cv=none; b=vAlzajOkHwDOZLzg3tjGdCE2ETjwLooeSPRKBfsSGVgLqd5Cq62aFNJEvIv8R3p8sMNEL7QvTyzSPmH/JEVoP9L2Qh2sH3yBxfh3mnDYN6zICidANJqCBOYekhXNOLa1oDMr0nFVeC2ab/3Vwk4dVtRgSAZt5DQr2coEk2jWp58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231260; c=relaxed/simple;
	bh=6hqXlMyZk/NIPh19SfXJJkeRRc522Hu2RsCH3wrlF3g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IxH3oQWNv0WyBE4BKDjLl3CxMHnbWSqoyfHo+5A8FpOvwc/5UYyhi/Odsvr5VkjLZIPcaou+4LPj/tAMxmGqAqcYjmE32WKQVv/zKRcXOpAd2B6+SSAqFmR9tllDoz5YJ6muJhQJBiNaLpLI+yLX3FGC/qFPRnC+YO+usBKxF3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUvN9dWT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEC91F000E9;
	Tue, 23 Jun 2026 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782231259;
	bh=PcajKOa6/fzwx6pWaVxtdohrAAfHL26/qCXeO5E8rLc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=VUvN9dWTAFZGuCKtcfMvwtECLwgU5Wn05mBuXFWgGS2j0291eyLug/KqLvXNurhj/
	 8XotdQA07OI7UyAE1bzQQth+XawZek8UmEXl5zi6EpiYijhaMUlUJJvhJFaRD104BV
	 WSewTcfsySn74qg/SifAN6imZ0ebWGBZX9eMMD5P3Up66ERqjHY6jHDFS9zow2Whvo
	 EH9CmPWwa04RWZUyBQ6oqDohYdic1xUJ9pxNV4PSDsEqsyvdBuzfIV+aHFobf9FdME
	 gCMk4kdb3Ug2lmPiMTQaaDPOtCOcdeMdsSuEkgncoxS9U/PjwQFvHs1W+y7sglXYOl
	 cOVui2PvK+BAg==
From: Pratyush Yadav <pratyush@kernel.org>
To: tarunsahu@google.com
Cc: Ackerley Tng <ackerleytng@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  vannapurve@google.com,  fvdl@google.com,  Pasha
 Tatashin <pasha.tatashin@soleen.com>,  Shuah Khan
 <skhan@linuxfoundation.org>,  sagis@google.com,  aneesh.kumar@kernel.org,
  skhawaja@google.com,  vipinsh@google.com,  Pratyush Yadav
 <pratyush@kernel.org>,  david@redhat.com,  dmatlack@google.com,
  mark.rutland@arm.com,  Paolo Bonzini <pbonzini@redhat.com>,  Mike
 Rapoport <rppt@kernel.org>,  Alexander Graf <graf@amazon.com>,
  seanjc@google.com,  axelrasmussen@google.com,
  linux-kselftest@vger.kernel.org,  kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  kvm@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 06/10] kvm: guest_memfd: Add support for freezing
 and unfreezing mappings
In-Reply-To: <9huztsqtmihs.fsf@tarunix.c.googlers.com> (tarunsahu@google.com's
	message of "Tue, 23 Jun 2026 14:36:15 +0000")
References: <cover.1780676742.git.tarunsahu@google.com>
	<48777f4749fa43d5648085dbb2037aa99c144a88.1780676742.git.tarunsahu@google.com>
	<CAEvNRgFEHciT3T9y+qEYRvXhDwfrggoU7Rm=f9hT3OrV+wgpNQ@mail.gmail.com>
	<9huztsqtmihs.fsf@tarunix.c.googlers.com>
Date: Tue, 23 Jun 2026 18:14:14 +0200
Message-ID: <2vxz8q85mdyh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:tarunsahu@google.com,m:ackerleytng@google.com,m:corbet@lwn.net,m:vannapurve@google.com,m:fvdl@google.com,m:pasha.tatashin@soleen.com,m:skhan@linuxfoundation.org,m:sagis@google.com,m:aneesh.kumar@kernel.org,m:skhawaja@google.com,m:vipinsh@google.com,m:pratyush@kernel.org,m:david@redhat.com,m:dmatlack@google.com,m:mark.rutland@arm.com,m:pbonzini@redhat.com,m:rppt@kernel.org,m:graf@amazon.com,m:seanjc@google.com,m:axelrasmussen@google.com,m:linux-kselftest@vger.kernel.org,m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-93253-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 006376B89EC

On Tue, Jun 23 2026, tarunsahu@google.com wrote:

> Ackerley Tng <ackerleytng@google.com> writes:
>
>> Tarun Sahu <tarunsahu@google.com> writes:
>>
>>>  static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>>>  			       loff_t len)
>>>  {
>>> +	struct inode *inode = file_inode(file);
>>>  	int ret;
>>> +	int idx;
>>>
>>> -	if (!(mode & FALLOC_FL_KEEP_SIZE))
>>> -		return -EOPNOTSUPP;
>>> +	idx = srcu_read_lock(&kvm_gmem_freeze_srcu);
>>> +	if (kvm_gmem_is_frozen(inode)) {
>>> +		srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
>>> +		return -EPERM;
>>> +	}
>>
>> fallocate may eventually go to kvm_gmem_get_folio(), so that would check
>> kvm_gmem_is_frozen() twice. Is this meant to catch the punch hole case?

Yeah, I reckon you can get away with doing this check only in
kvm_gmem_get_folio(). Normally you'd like to fail early, but as of now I
don't see much of a problem. If you drop the check here and fail in
kvm_gmem_get_folio() you'd end up taking and releasing the mapping
invalidate_lock, but this isn't a fast path anyway so I don't think it
should matter much.

I think either way can work just as fine...

>>
>>>
>>> -	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE))
>>> -		return -EOPNOTSUPP;
>>> +	if (!(mode & FALLOC_FL_KEEP_SIZE)) {
>>> +		ret = -EOPNOTSUPP;
>>> +		goto out;
>>> +	}
>>>
>>> -	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
>>> -		return -EINVAL;
>>> +	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE)) {
>>> +		ret = -EOPNOTSUPP;
>>> +		goto out;
>>> +	}
>>> +
>>> +	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len)) {
>>> +		ret = -EINVAL;
>>> +		goto out;
>>> +	}
>>
>> There's some reordering here. Why not let the validation happen like
>> before, then check kvm_gmem_is_frozen()?

There is no reordering, if I am reading the diff correctly. The diff is
somewhat misleading. The kvm_gmem_is_frozen() call is added at the top
of the function, and then all the later checks are in the same place but
get a goto out (and hence a full body to the if block). So the diff
reads like reordering, but there is none.

It would be very neat if scru had a cleanup.h style scope-based locking
function, but on a quick glance I can't see one.

>
> To align with design. "stop the fallocate call if inode is frozen, No
> need to go further". I dont have strict opinion on this. I am fine with
> taking it across punch hole as well to make it more fine grained. But it
> will no longer claims stop the fallocate call (allocation one is stopped
> in separate path: fault path) , though functionally it does the same
> thing.
>
> WDYT?
>
> ~Tarun

-- 
Regards,
Pratyush Yadav

