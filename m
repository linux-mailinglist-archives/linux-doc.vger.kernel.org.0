Return-Path: <linux-doc+bounces-32406-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A979EB67C
	for <lists+linux-doc@lfdr.de>; Tue, 10 Dec 2024 17:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BB8A2832BD
	for <lists+linux-doc@lfdr.de>; Tue, 10 Dec 2024 16:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038FA19CD07;
	Tue, 10 Dec 2024 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="eq6m/CBu";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="BOStoOaG";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="eq6m/CBu";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="BOStoOaG"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D271114A60F;
	Tue, 10 Dec 2024 16:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733848324; cv=none; b=IwwCwRxEb0lzce78h70qtAbjFUMVl5XKdSJAVdVrSPhtrQcSCOgVRBCH0NjYgfmlURl7l680hxv99W/u72/gXwPBrSWVD/NjYahSPrjID+QlQ+DDdlyUZQUmrQ2Y46DLSr1L2KUAuYAmIq9QyxytYkYeffJOfQ+oD3uG217MXbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733848324; c=relaxed/simple;
	bh=4sm7H7fTaT41PHtP1BeOpCRRKD+9TY+4PyPoM3dnt9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=scT2eFdqWuH9JMqL6+rDO70zNajae3NtW4kFDm+Vt9NxXP7IPL4L1TbE6Sceefafi21QiZkDQ2g+ZWS8zAnF/PWyRS0iCwgx8oM6kvrAk5MFzUUINVox7X0940QKVxbgKwp57mnwxPrJCz0xKse4lhBbhkWKRIqojobrHgocMbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=eq6m/CBu; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=BOStoOaG; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=eq6m/CBu; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=BOStoOaG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0746E1F745;
	Tue, 10 Dec 2024 16:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733848321; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=H4QzrnIcKwul+n52y7N8R3JC2FUndA/mormrIAbUauU=;
	b=eq6m/CBuV0arvDq4YIgIlKCkanLooln5ZNhFRaiLNL/ZwkgsIvpFnQgAesu5fSOByE8XHt
	lELH3AdGWStJ/rC61Qf5xg9i/O6V2CHpNpEMaHx5fOfarGgvUF179tpd9f6jkKdeo8Cj4T
	xyPVQ5o69rUF7vUcY2imFe3NoqoRmK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733848321;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=H4QzrnIcKwul+n52y7N8R3JC2FUndA/mormrIAbUauU=;
	b=BOStoOaGGZA78KLqh+82eHfsySaoE6VLTJgE4Ug/sQkfCBbgEBBFmFJA6+5syHBddWq3CM
	uaTM5AjaUn/2n/Aw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733848321; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=H4QzrnIcKwul+n52y7N8R3JC2FUndA/mormrIAbUauU=;
	b=eq6m/CBuV0arvDq4YIgIlKCkanLooln5ZNhFRaiLNL/ZwkgsIvpFnQgAesu5fSOByE8XHt
	lELH3AdGWStJ/rC61Qf5xg9i/O6V2CHpNpEMaHx5fOfarGgvUF179tpd9f6jkKdeo8Cj4T
	xyPVQ5o69rUF7vUcY2imFe3NoqoRmK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733848321;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=H4QzrnIcKwul+n52y7N8R3JC2FUndA/mormrIAbUauU=;
	b=BOStoOaGGZA78KLqh+82eHfsySaoE6VLTJgE4Ug/sQkfCBbgEBBFmFJA6+5syHBddWq3CM
	uaTM5AjaUn/2n/Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA42B13A15;
	Tue, 10 Dec 2024 16:32:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SjIdLQBtWGdXPQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 10 Dec 2024 16:32:00 +0000
Message-ID: <643beb6c-4226-46ca-b7e9-292467479aea@suse.cz>
Date: Tue, 10 Dec 2024 17:32:00 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] mm: make vma cache SLAB_TYPESAFE_BY_RCU
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, hannes@cmpxchg.org,
 mjguzik@gmail.com, oliver.sang@intel.com, mgorman@techsingularity.net,
 david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net,
 paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com,
 hdanton@sina.com, hughd@google.com, minchan@google.com, jannh@google.com,
 shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com,
 corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20241206225204.4008261-1-surenb@google.com>
 <20241206225204.4008261-5-surenb@google.com>
 <6b29b2a5-c244-4930-a5a0-1a24a04e7e35@suse.cz>
 <CAJuCfpFxAZ-JwN8VqNF14zeBnsPM_pD0+-N2PDq5GcQGR1xqLQ@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <CAJuCfpFxAZ-JwN8VqNF14zeBnsPM_pD0+-N2PDq5GcQGR1xqLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,sina.com];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,oracle.com,suse.com,cmpxchg.org,gmail.com,intel.com,techsingularity.net,redhat.com,stgolabs.net,kernel.org,sina.com,google.com,linux.dev,soleen.com,lwn.net,vger.kernel.org,kvack.org,android.com];
	R_RATELIMIT(0.00)[to_ip_from(RLumbhs4xhzuuihrchnpuyb6qu)];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Flag: NO

On 12/10/24 17:20, Suren Baghdasaryan wrote:
> On Tue, Dec 10, 2024 at 6:21 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>>
>> On 12/6/24 23:52, Suren Baghdasaryan wrote:
>> > To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
>> > object reuse before RCU grace period is over will be detected inside
>> > lock_vma_under_rcu().
>> > lock_vma_under_rcu() enters RCU read section, finds the vma at the
>> > given address, locks the vma and checks if it got detached or remapped
>> > to cover a different address range. These last checks are there
>> > to ensure that the vma was not modified after we found it but before
>> > locking it.
>> > vma reuse introduces several new possibilities:
>> > 1. vma can be reused after it was found but before it is locked;
>> > 2. vma can be reused and reinitialized (including changing its vm_mm)
>> > while being locked in vma_start_read();
>> > 3. vma can be reused and reinitialized after it was found but before
>> > it is locked, then attached at a new address or to a new mm while
>> > read-locked;
>> > For case #1 current checks will help detecting cases when:
>> > - vma was reused but not yet added into the tree (detached check)
>> > - vma was reused at a different address range (address check);
>> > We are missing the check for vm_mm to ensure the reused vma was not
>> > attached to a different mm. This patch adds the missing check.
>> > For case #2, we pass mm to vma_start_read() to prevent access to
>> > unstable vma->vm_mm. This might lead to vma_start_read() returning
>> > a false locked result but that's not critical if it's rare because
>> > it will only lead to a retry under mmap_lock.
>> > For case #3, we ensure the order in which vma->detached flag and
>> > vm_start/vm_end/vm_mm are set and checked. vma gets attached after
>> > vm_start/vm_end/vm_mm were set and lock_vma_under_rcu() should check
>> > vma->detached before checking vm_start/vm_end/vm_mm. This is required
>> > because attaching vma happens without vma write-lock, as opposed to
>> > vma detaching, which requires vma write-lock. This patch adds memory
>> > barriers inside is_vma_detached() and vma_mark_attached() needed to
>> > order reads and writes to vma->detached vs vm_start/vm_end/vm_mm.
>> > After these provisions, SLAB_TYPESAFE_BY_RCU is added to vm_area_cachep.
>> > This will facilitate vm_area_struct reuse and will minimize the number
>> > of call_rcu() calls.
>> >
>> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>>
>> I'm wondering about the vma freeing path. Consider vma_complete():
>>
>> vma_mark_detached(vp->remove);
>>   vma->detached = true; - plain write
>> vm_area_free(vp->remove);
>>   vma->vm_lock_seq = UINT_MAX; - plain write
>>   kmem_cache_free(vm_area_cachep)
>> ...
>> potential reallocation
>>
>> against:
>>
>> lock_vma_under_rcu()
>> - mas_walk finds a stale vma due to race
>> vma_start_read()
>>   if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence))
>>   - can be false, the vma was not being locked on the freeing side?
>>   down_read_trylock(&vma->vm_lock.lock) - suceeds, wasn't locked
>>     this is acquire, but was there any release?
> 
> Yes, there was a release. I think what you missed is that
> vma_mark_detached() that is called from vma_complete() requires VMA to
> be write-locked (see vma_assert_write_locked() in
> vma_mark_detached()). The rule is that a VMA can be attached without
> write-locking but only a write-locked VMA can be detached. So, after

OK but write unlocking means the mm's seqcount is bumped and becomes
non-equal with vma's vma->vm_lock_seq, right?

Yet in the example above we happily set it to UINT_MAX and thus effectively
false unlock it for vma_start_read()?

And this is all done before the vma_complete() side would actually reach
mmap_write_unlock(), AFAICS.

> vma_mark_detached() and before down_read_trylock(&vma->vm_lock.lock)
> in vma_start_read() the VMA write-lock should have been released by
> mmap_write_unlock() and therefore vma->detached=false should be
> visible to the reader when it executed lock_vma_under_rcu().
> 
>>   is_vma_detached() - false negative as the write above didn't propagate
>>     here yet; a read barrier but where is the write barrier?
>>   checks for vma->vm_mm, vm_start, vm_end - nobody reset them yet so false
>>     positive, or they got reset on reallocation but writes didn't propagate
>>
>> Am I missing something that would prevent lock_vma_under_rcu() falsely
>> succeeding here?
>>


