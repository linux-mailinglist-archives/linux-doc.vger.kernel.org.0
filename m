Return-Path: <linux-doc+bounces-77317-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMkqEmS+oWnPwAQAu9opvQ
	(envelope-from <linux-doc+bounces-77317-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 16:55:16 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E8C1BA5FC
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 16:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B575A306DA71
	for <lists+linux-doc@lfdr.de>; Fri, 27 Feb 2026 15:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A850343E9C2;
	Fri, 27 Feb 2026 15:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O4VApGig"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C43743E9D8
	for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207512; cv=none; b=M/IRsOQ6nXmJIQD7BpyxJS8p3WZrsM2PeftKkvW15s+7+OnTOe5cXSCTOTR5amPtsRpYcC4DJ0edrvYv3PHb52VWh8nN0/tTO86YIAIGwo7TLb/X5/pdosVwqyzbU5+5d5CBbCWLYxbhdVG1Mt6z3+JXry8JiiYZ/h4Cl31wz88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207512; c=relaxed/simple;
	bh=v+ZzH2ONIU5UzI0hdG284tUJ4QN5VqVURM/gZR3mibQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9czgTeZ3p2zaqOZUy0uOtZ+gYwf9lGR0HT8sWetsaa8XfLSb29iu3rkH1sMhM+ERWEpDhY+1VQaU64rUVwGF4T/ZWzmfvluDjC7UbU+Rln6HP57SZhZoe4o/r6qMhM0JzgLquUq+UTXMmqE2kcidIgHjOa7O0b9Nmf/X1E66gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O4VApGig; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <1d3c1c86-7382-4c2a-ab3e-3e6938d055ec@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772207497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MaJxtRy1gxu5Hm6tq13uMb/9SHoCAIyHdACW5TaPNP8=;
	b=O4VApGigh6dfWOJ9Vb5+0CQiVHhKjSZySfd6btG/EKcPBAUptNJb4/YDic3YfSQ0J8VAGe
	hZ/07Q7h657LWWPzTUyyfY/nw/ws6+i/16B29wlwXRCsnqs1muOE91VHh5HeFCpqC42LSN
	SqIKXtc4WN41DQjWrPhh33QzvyF2Et8=
Date: Fri, 27 Feb 2026 23:50:59 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v11 2/2] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, Nikola Djukic
 <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20260224222734.3153931-1-joelagnelf@nvidia.com>
 <20260224222734.3153931-3-joelagnelf@nvidia.com>
 <dbbb1a93-93fc-4ea6-bd6f-6f7fbfcc4710@linux.dev>
 <20260226193442.GA4077409@joelbox2>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <20260226193442.GA4077409@joelbox2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,redhat.com,linux.intel.com,suse.de,ffwll.ch,collabora.com,nvidia.com,weathered-steel.dev,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-77317-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alvin.sun@linux.dev,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 02E8C1BA5FC
X-Rspamd-Action: no action


On 2/27/26 03:34, Joel Fernandes wrote:
> On Fri, 27 Feb 2026, Alvin Sun wrote:
>> Thanks for the clist abstraction. The Tyr debugfs [1] I'm implementing
>> needs to iterate over a GpuVm's VA list, and I'd like to switch that to
>> a CList-based implementation.
> Thanks for looking into using CList for this!
>
>> Could you make CListHeadIter public and expose a public constructor?
>> Or do you have a better suggestion?
> I think this can be handled without exposing CListHeadIter. See below.
>
>> The VA list mixes two node types in one list — GpuVa (with driver-specific
>> data) and KernelGpuVa — so we have to filter/skip nodes and can't use
>> CList as-is. With a public CListHeadIter and new(), we can implement a
>> custom iterator (like our current GpuVaIter) on top of CListHeadIter and
>> then migrate that code to clist instead of hand-rolled list traversal.
> Looking at the Tyr code, both GpuVa and KernelGpuVa are
> #[repr(transparent)] wrappers over the same C struct (drm_gpuva), linked
> through the same list_head field at the same offset. The "two types" are
> a Rust-level modeling choice for safety, not a structural difference in
> the list — every node in that list is a drm_gpuva.
>
> So CList's typed iteration already works here. You can iterate over all
> nodes using a common Rust wrapper type (like a #[repr(transparent)]
> wrapper over drm_gpuva), and then skip the kernel-reserved node by
> pointer identity — since drm_gpuvm has its kernel_alloc_node as a named
> field, its address is known. Something like:
>
>      // Iterate all nodes as a common base type.
>      let list = clist_create!(unsafe { head, RawGpuVa, drm_gpuva, rb.entry });
>      let kernel_ptr = unsafe { &raw mut (*gpuvm_raw).kernel_alloc_node };
>
>      for va in list.iter() {
>          if va.as_raw() == kernel_ptr {
>              continue;  // skip
>          }
>
>          // Cast to &GpuVa
>          let gpu_va = unsafe { GpuVa::from_raw(va.as_raw()) };
>          ...
>      }
>
> If you need a named iterator type (e.g. for returning from a method),
> you can wrap CListIter in your own GpuVaIter struct that stores the
> kernel node pointer and filters in its Iterator::next() impl. That would
> probably also be cleaner.
That's a good idea! I will try to implement GpuVaIter based on CListIter.

Thanks,
Alvin Sun
>
> OTOH, with CListHeadIter you'd need to do container_of manually on each node,
> which might be more erroneous code, whereas CListIter handles that for you.
> And anyway, the pointer comparison needed to skip the kernel node is the same
> in both approaches.
>
> Would this work for the Tyr debugfs use case?
>
> --
> Joel Fernandes
>

