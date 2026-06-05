Return-Path: <linux-doc+bounces-91054-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 765MB6WRImpHaQEAu9opvQ
	(envelope-from <linux-doc+bounces-91054-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 11:06:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92826646B06
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 11:06:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=Gzzb9pgK;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91054-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91054-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 015C4304C10C
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 08:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63B6494A00;
	Fri,  5 Jun 2026 08:54:25 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CA43CD8CA;
	Fri,  5 Jun 2026 08:54:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649665; cv=none; b=ia+BuTMDPBEa6/Ga9OPQrFuePWpyBy/2PO7zabFosFvmQ29rXQ1pinkEC5oSIxpWPxmaYsPPeKM94ERnKOcxOSZwqrv9rgymQljeGRTcBzcknxt/+EScB8pnvZafEC3ktV+PJN7dZbl5r9Q4xb4SS5g3fq6dwZaIbHhQPrgSXeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649665; c=relaxed/simple;
	bh=za/Q5W3FetgNGBxC3/mNtBqJ6BCx8IDSiT33jjoXZNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pm8yLHMU0FSHv42HlYzliUvpAC4GQDZUuEUSNm3ar+YD/oCOhInywycxQlco664NYmq+Bcc8OJc1uibR5OindOycBu2GxOMjtN/aNpyHb1h9llJIBLPa/fxbI9cydXqsTPC9pbhNU1C6PpK5yyPTGG0o5pu01GlJgUmRyp8vcdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Gzzb9pgK; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A3204CE7;
	Fri,  5 Jun 2026 01:54:17 -0700 (PDT)
Received: from [10.57.92.75] (unknown [10.57.92.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36C5A3F632;
	Fri,  5 Jun 2026 01:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780649662; bh=za/Q5W3FetgNGBxC3/mNtBqJ6BCx8IDSiT33jjoXZNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gzzb9pgKm/VqzuNQWn4GqmeLpozOIVHEL4a7lpQ6LY9IuNt0PSiF4UMuyHA313reK
	 adqVfC75WvtPaiw9gE55+iUPvW+5IJFa0HDb8PCVsfPSAiOnAbMba7hYbKQPgjS02w
	 IVon2C90mRhBq/CB0loy54WttdKIcrw9FAQvra1o=
Message-ID: <3322698e-af49-4998-b619-34ab24094374@arm.com>
Date: Fri, 5 Jun 2026 09:54:12 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 20/42] KVM: SEV: Make 'uaddr' parameter optional for
 KVM_SEV_SNP_LAUNCH_UPDATE
Content-Language: en-GB
To: Ackerley Tng <ackerleytng@google.com>, aik@amd.com,
 andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org,
 chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com,
 jmattson@google.com, jthoughton@google.com, michael.roth@amd.com,
 oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com,
 rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com,
 steven.price@arm.com, tabba@google.com, willy@infradead.org,
 wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com,
 pratyush@kernel.org, aneesh.kumar@kernel.org, liam@infradead.org,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <20260522-gmem-inplace-conversion-v7-20-2f0fae496530@google.com>
 <9d15479e-e36b-4865-804c-7d93eb339e4e@arm.com>
 <CAEvNRgF43RBv77RgM67kXRRHDnQw4L5uwQTuvkJHzkHJWB1mag@mail.gmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CAEvNRgF43RBv77RgM67kXRRHDnQw4L5uwQTuvkJHzkHJWB1mag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91054-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ackerleytng@google.com,m:aik@amd.com,m:andrew.jones@linux.dev,m:binbin.wu@linux.intel.com,m:brauner@kernel.org,m:chao.p.peng@linux.intel.com,m:david@kernel.org,m:ira.weiny@intel.com,m:jmattson@google.com,m:jthoughton@google.com,m:michael.roth@amd.com,m:oupton@kernel.org,m:pankaj.gupta@amd.com,m:qperret@google.com,m:rick.p.edgecombe@intel.com,m:rientjes@google.com,m:shivankg@amd.com,m:steven.price@arm.com,m:tabba@google.com,m:willy@infradead.org,m:wyihan@google.com,m:yan.y.zhao@intel.com,m:forkloop@google.com,m:pratyush@kernel.org,m:aneesh.kumar@kernel.org,m:liam@infradead.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:shuah@kernel.org,m:vannapurve@google.com,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.c
 om,m:shikemeng@huaweicloud.com,m:nphamcs@gmail.com,m:bhe@redhat.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:youngjun.park@lge.com,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:jgg@ziepe.ca,m:vbabka@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[google.com,amd.com,linux.dev,linux.intel.com,kernel.org,intel.com,arm.com,infradead.org,redhat.com,alien8.de,zytor.com,goodmis.org,efficios.com,lwn.net,linuxfoundation.org,linux-foundation.org,tencent.com,huaweicloud.com,gmail.com,lge.com,ziepe.ca];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[suzuki.poulose@arm.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[64];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92826646B06

On 04/06/2026 20:05, Ackerley Tng wrote:
> Suzuki K Poulose <suzuki.poulose@arm.com> writes:
> 
>>
>> [...snip...]
>>
>>> +In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO, ``uaddr`` will be
>>> +ignored completely. Otherwise, ``uaddr`` is required if
>>> +kvm.vm_memory_attributes=1 and optional if kvm.vm_memory_attributes=0, since
>>> +in the latter case guest memory can be initialized directly from userspace
>>> +prior to converting it to private and passing the GPA range on to this
>>> +interface.
>>
>> Just to confirm, so the sev_gmem_prepare doesn't destroy the contents in
>> the process of making it "private" ? i.e., the contents of a SNP shared
>> page are preserved while transitioning to "SNP Private" (via RMP
>> update).
>>
>> Suzuki
>>
> 
> The following is the guest_memfd perspective, I didn't look at the SNP
> spec:
> 
> Do you mean specifically for KVM_SEV_SNP_PAGE_TYPE_ZERO, or for any
> type?
> 
> guest_memfd has no plans to do any special zeroing based on type.
> 
> guest_memfd decoupled zeroing from preparation a while ago (Michael had
> some patches), so zeroing is supposed to be once during folio ownership
> by guest_memfd, tracked by the uptodate flag, and preparation is tracked
> outside of guest_memfd. So far only SNP does preparation.

I am talking about the SEV SNP conversions (specifically quoted in my 
response), I will follow up on Michael's response.

Suzuki


