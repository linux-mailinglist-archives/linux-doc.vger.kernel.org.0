Return-Path: <linux-doc+bounces-93353-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UvgKGtqcO2qDaQgAu9opvQ
	(envelope-from <linux-doc+bounces-93353-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 11:01:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 804866BCC49
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 11:01:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TxiostkA;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93353-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93353-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEEA9305C10F
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 09:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495C5263C8F;
	Wed, 24 Jun 2026 09:00:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3089939B49D;
	Wed, 24 Jun 2026 09:00:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291622; cv=none; b=XeXIEp0JZZD68jTtA8Ls3sHf8Ou+/sAScCIB5ipcGVVt5dJxfzM/f5fMqcBubyH+ZFxPEt4zFtalI2H+nMVX19odphFfr5Hns9Kug07CCpKMTPOjy6U9y+ltOWo6FF5mm47R4IflfthGLaaTatMPtM1zcb1DDqG2K+OYChI2M/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291622; c=relaxed/simple;
	bh=L4K9ivM+4+gVc1NLw1F+WL2oVL3+icBZmgGeI06sjMc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CkyduV84hYqCcYhQmfst7YEteBzq1YgsimUVZpl/0Q31SqTtF2ck/Za5mhkqggvbNh7Rbz2+17oKoBMzIb6RS+g52nco4OOqf+DVHdgPPrWQdvsvkHFd6GyS/wX0Dw2E8IlIdSCnTzl1qutIv5EHzd6lDnvIZb949joq8sYgw3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxiostkA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011781F000E9;
	Wed, 24 Jun 2026 09:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782291619;
	bh=Ude7fxjRQOGddru++6y+sDXghtwPibadLNbHTLXVa74=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=TxiostkAILnXpHLtckz/50qP4hggIdYeAhWBv19SYeKJ2UsA9mpyAdTl2uFBwp9WX
	 6rQlhX/86wZJ8Rg/hukqjeLq/PJ1gh5/K5qliq21GuuiBZJOknZm3gm2kjeuggfW/l
	 7tOpYh3yBcXu3rG+ykqiuUCy+IpRbYB3CMPiOsOwmRQ84pZ08UfCoKnydrlLqqs33D
	 sf4VR8FFbsINdyoz2C3WbEtK5Q+bOGPW7hoQKGqc/Y/G4Yw9OdF0ey2rmMxSWsdUGy
	 2suMZpIhzvWsEFTVb3O2MWCoD3i88l/2K7UO6ib4PBq/JWQFVreG/YXusE1z9ZXUOg
	 As5XjdYOpAngg==
From: Pratyush Yadav <pratyush@kernel.org>
To: tarunsahu@google.com
Cc: Pratyush Yadav <pratyush@kernel.org>,  Ackerley Tng
 <ackerleytng@google.com>,  Jonathan Corbet <corbet@lwn.net>,
  vannapurve@google.com,  fvdl@google.com,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Shuah Khan <skhan@linuxfoundation.org>,
  sagis@google.com,  aneesh.kumar@kernel.org,  skhawaja@google.com,
  vipinsh@google.com,  david@redhat.com,  dmatlack@google.com,
  mark.rutland@arm.com,  Paolo Bonzini <pbonzini@redhat.com>,  Mike
 Rapoport <rppt@kernel.org>,  Alexander Graf <graf@amazon.com>,
  seanjc@google.com,  axelrasmussen@google.com,
  linux-kselftest@vger.kernel.org,  kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  kvm@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 06/10] kvm: guest_memfd: Add support for freezing
 and unfreezing mappings
In-Reply-To: <9huzv7b910oe.fsf@tarunix.c.googlers.com> (tarunsahu@google.com's
	message of "Tue, 23 Jun 2026 20:06:41 +0000")
References: <cover.1780676742.git.tarunsahu@google.com>
	<48777f4749fa43d5648085dbb2037aa99c144a88.1780676742.git.tarunsahu@google.com>
	<CAEvNRgFEHciT3T9y+qEYRvXhDwfrggoU7Rm=f9hT3OrV+wgpNQ@mail.gmail.com>
	<9huztsqtmihs.fsf@tarunix.c.googlers.com> <2vxz8q85mdyh.fsf@kernel.org>
	<9huzv7b910oe.fsf@tarunix.c.googlers.com>
Date: Wed, 24 Jun 2026 11:00:14 +0200
Message-ID: <2vxzzf0kl3dt.fsf@kernel.org>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93353-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tarunsahu@google.com,m:pratyush@kernel.org,m:ackerleytng@google.com,m:corbet@lwn.net,m:vannapurve@google.com,m:fvdl@google.com,m:pasha.tatashin@soleen.com,m:skhan@linuxfoundation.org,m:sagis@google.com,m:aneesh.kumar@kernel.org,m:skhawaja@google.com,m:vipinsh@google.com,m:david@redhat.com,m:dmatlack@google.com,m:mark.rutland@arm.com,m:pbonzini@redhat.com,m:rppt@kernel.org,m:graf@amazon.com,m:seanjc@google.com,m:axelrasmussen@google.com,m:linux-kselftest@vger.kernel.org,m:kexec@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RSPAMD_EMAILBL_FAIL(0.00)[ackerleytng.google.com:server fail];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 804866BCC49

On Tue, Jun 23 2026, tarunsahu@google.com wrote:

> Pratyush Yadav <pratyush@kernel.org> writes:
>
>> On Tue, Jun 23 2026, tarunsahu@google.com wrote:
>>
>>> Ackerley Tng <ackerleytng@google.com> writes:
>>>
>>>> Tarun Sahu <tarunsahu@google.com> writes:
>>>>
>>>>>  static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>>>>>  			       loff_t len)
>>>>>  {
>>>>> +	struct inode *inode = file_inode(file);
>>>>>  	int ret;
>>>>> +	int idx;
>>>>>
>>>>> -	if (!(mode & FALLOC_FL_KEEP_SIZE))
>>>>> -		return -EOPNOTSUPP;
>>>>> +	idx = srcu_read_lock(&kvm_gmem_freeze_srcu);
>>>>> +	if (kvm_gmem_is_frozen(inode)) {
>>>>> +		srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
>>>>> +		return -EPERM;
>>>>> +	}
>>>>
>>>> fallocate may eventually go to kvm_gmem_get_folio(), so that would check
>>>> kvm_gmem_is_frozen() twice. Is this meant to catch the punch hole case?
>>
>> Yeah, I reckon you can get away with doing this check only in
>> kvm_gmem_get_folio(). Normally you'd like to fail early, but as of now I
>> don't see much of a problem. If you drop the check here and fail in
>> kvm_gmem_get_folio() you'd end up taking and releasing the mapping
>> invalidate_lock, but this isn't a fast path anyway so I don't think it
>> should matter much.
>
> No, Don't agree.
> kvm_gmem_get_folios already have the is_frozen check. which blocks the
> kvm_gmem_allocate. But not kvm_gmem_punch_hole. Your argument is correct
> for kvm_gmem_allocate only. So is_frozen check in fallocate is to
> block the punch hole as well. What ackerley said is correct.

Oh, right. Then we do need the check in both places.

[...]

-- 
Regards,
Pratyush Yadav

