Return-Path: <linux-doc+bounces-73315-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPl0HO/bb2n8RwAAu9opvQ
	(envelope-from <linux-doc+bounces-73315-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 20:47:59 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB23D4AB52
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 20:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A9028A49D15
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 18:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A0C4657EA;
	Tue, 20 Jan 2026 18:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5PDQPI4"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69804611F4;
	Tue, 20 Jan 2026 18:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768935379; cv=none; b=AVMaDtISzdPB/SPzt2z7Lz7S9gYXlmex47DUv+WIm33G7/ktSfo2MhIocJFPUqiMYZ+YlAj7Tw4vUD4dSKTJXDeZb2+/13URibPWuI5QlVzcmsJSoTOGnmVjV8Rg5DE5Y1QDD+ntoXBHB1zs922QVZSAC7Q2KUsEWZ6miqun4XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768935379; c=relaxed/simple;
	bh=NXgqW8xOX8NnK1Jm5wywr5UqQugivqCTFBrNxOL3X9o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fcbjhSscDBhjJ3nnF+dN+f7gm6RPEHKHCjFqSlhpk6iEBfQeed/ebBy4dVBfRnadhpwKpYdpHx9sQ4VkjbM4LXZYm3OFWI3d8cxCZ2jAuI3p0Uzb68r1LVd3cw48Xaqg5ms88+G/8YBl6eP5TlsZ1DoDCpHTEEgb2mDppfMiKFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5PDQPI4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A84DC16AAE;
	Tue, 20 Jan 2026 18:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768935379;
	bh=NXgqW8xOX8NnK1Jm5wywr5UqQugivqCTFBrNxOL3X9o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a5PDQPI4CaRseh0D+/3F6Ex115b3FY9vj36ryNtZS+MfjEwSdXipBJo3n9LMFULYx
	 JspPLSyiE46U5m4JWjjmsxPwhYXpAqnDX8l83Uqezxi497ThDqickWfFFV7KBUjzg/
	 IGIOcSf6ucIMXtt7ddriGQY2zFdfBJEpKDg36vP/pKaDRG9BYduuKbzeOSkhYjvmIc
	 2ODsi+ype4fBmrSJNDAPiQMbUoDOWXftp5Xjbfw8E2aYNGA8pK+h8A/N+ifPyly8K3
	 DwzprpcHZkOyMly23EdJhxlrGbotqeCVhYiPYpgwioayp/INcxmby38um4ghp+yQlc
	 uKF//m23MJqSA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  Alexander Graf <graf@amazon.com>,  Jason Miu
 <jasonmiu@google.com>,  Jonathan Corbet <corbet@lwn.net>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH 5/6] kho: Relocate vmalloc preservation structure to KHO
 ABI header
In-Reply-To: <aW_Mqp6HcqLwQImS@kernel.org> (Mike Rapoport's message of "Tue,
	20 Jan 2026 20:42:50 +0200")
References: <20260105165839.285270-1-rppt@kernel.org>
	<20260105165839.285270-6-rppt@kernel.org> <2vxzy0lscks4.fsf@kernel.org>
	<aW_Mqp6HcqLwQImS@kernel.org>
Date: Tue, 20 Jan 2026 18:56:16 +0000
Message-ID: <2vxz5x8wcdv3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73315-lists,linux-doc=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: EB23D4AB52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20 2026, Mike Rapoport wrote:

> On Tue, Jan 20, 2026 at 04:26:51PM +0000, Pratyush Yadav wrote:
>> On Mon, Jan 05 2026, Mike Rapoport wrote:
>> 
>> > From: Jason Miu <jasonmiu@google.com>
>> >
>> > The `struct kho_vmalloc` defines the in-memory layout for preserving
>> > vmalloc regions across kexec. This layout is a contract between kernels
>> > and part of the KHO ABI.
>> >
>> > To reflect this relationship, the related structs and helper macros are
>> > relocated to the ABI header, `include/linux/kho/abi/kexec_handover.h`.
>> > This move places the structure's definition under the protection of the
>> > KHO_FDT_COMPATIBLE version string.
>> >
>> > The structure and its components are now also documented within the
>> > ABI header to describe the contract and prevent ABI breaks.
>> >
>> > Signed-off-by: Jason Miu <jasonmiu@google.com>
>> > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> [...]
>> > +/* Helper macro to define a union for a serializable pointer. */
>> > +#define DECLARE_KHOSER_PTR(name, type)	\
>> > +	union {                        \
>> > +		u64 phys;              \
>> > +		type ptr;              \
>> > +	} name
>> > +
>> > +/* Stores the physical address of a serializable pointer. */
>> > +#define KHOSER_STORE_PTR(dest, val)               \
>> > +	({                                        \
>> > +		typeof(val) v = val;              \
>> > +		typecheck(typeof((dest).ptr), v); \
>> > +		(dest).phys = virt_to_phys(v);    \
>> > +	})
>> > +
>> > +/* Loads the stored physical address back to a pointer. */
>> > +#define KHOSER_LOAD_PTR(src)						\
>> > +	({                                                                   \
>> > +		typeof(src) s = src;                                         \
>> > +		(typeof((s).ptr))((s).phys ? phys_to_virt((s).phys) : NULL); \
>> > +	})
>> 
>> Nit: not a fan of exposing code internals to the ABI header. But without
>> this the definition of kho_vmalloc_hdr won't make any sense to someone
>> reading the doc without looking at the code. Dunno if we can do anything
>> better though...
>
> These might be actually useful for other KHO users. 

Hmm, okay. Let's keep them here then.

[...]

-- 
Regards,
Pratyush Yadav

