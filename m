Return-Path: <linux-doc+bounces-80684-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GgsI6hUwWlTSQQAu9opvQ
	(envelope-from <linux-doc+bounces-80684-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 15:56:40 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D52F57B7
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 15:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB0D630DA9FD
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 14:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C97220125F;
	Mon, 23 Mar 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEpGLon/"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2800A199FAB;
	Mon, 23 Mar 2026 14:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275670; cv=none; b=N6CtakY9razEjwNwKeR7Wyf+g7ojHfxuVF19IzG13paDm2kOCwzrVtQYCgb22iViot+hicG+mOjZq/R/JTMRZDYQ8gSth7ocQSBVmjqK0k6eaurNFABCjPK2gT5qwhdhfq/fyWTZfzW8qZIguR7kXfXhxv8FKETcIMYBu0It0+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275670; c=relaxed/simple;
	bh=pfaja9npXTBJVbbZ5cSxz+J/eQvQ2fURUlrTlcqfBVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T2ofTrRVvm7mQPp9irWXINan+pWm+tdSGGpJgx39iGMq9PqiKz469GZLvrGT2E1HNhBM9Ra7wtkN1dx9q3TpQlYeaOiiHtVptAxoKMxWAe9CDLVheohlL+0sJHLkggCO0s+ck+yOjETyZSK+/W6kZwXz6fltGtjXe5o4bY+ozUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEpGLon/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D61C2BCB4;
	Mon, 23 Mar 2026 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774275669;
	bh=pfaja9npXTBJVbbZ5cSxz+J/eQvQ2fURUlrTlcqfBVc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dEpGLon/VMU7tngHZQ6W9Iv45XhgyyUNQ0Awe81b5ojuhstGoG34Fn3tryY6cN57T
	 MG/LXWFfie6UKPM4CAttKSQW4bTNwTjg6rheBJ7kAS/JGVA2J0nU6HAHfplUYiaEsT
	 ESfY3WXfOs/fRuE3x/JUuaYxGJyszEWhtMZWryPGD5S9HKAyQb4AiHq2SwKuoqS6QS
	 PFD4iITcnjOy+2Hh2mgY3C2FULVR0zk5owMwsZiJNQMlHsCKKCZHZDqyQ0b9xA1v0i
	 sjlCxWOxRDXY+jHW3AflPSU7DxokNJMEtTbfUom7Q4GSpJp3JC0JWF/dAV8t4SNtw+
	 1KC88Wq135mAg==
Message-ID: <9a458b4e-982f-4371-8db5-295fce95f0ba@kernel.org>
Date: Mon, 23 Mar 2026 15:21:03 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] gpu: nova-core: convert PMC registers to kernel
 register macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260323-b4-nova-register-v3-0-ae2486ecef1b@nvidia.com>
 <20260323-b4-nova-register-v3-1-ae2486ecef1b@nvidia.com>
 <DHA4EQAOO8QW.3AFGNJZFQX6N7@kernel.org>
 <DHA81784G24U.1446CUTJC271J@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DHA81784G24U.1446CUTJC271J@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80684-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[google.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,garyguo.net,protonmail.com,umich.edu,nvidia.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F06D52F57B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 3:11 PM, Alexandre Courbot wrote:
> On Mon Mar 23, 2026 at 8:21 PM JST, Danilo Krummrich wrote:
>> On Mon Mar 23, 2026 at 12:07 PM CET, Alexandre Courbot wrote:
>>> -impl TryFrom<u8> for Architecture {
>>> +impl TryFrom<Bounded<u32, 6>> for Architecture {
>>>      type Error = Error;
>>>  
>>> -    fn try_from(value: u8) -> Result<Self> {
>>> -        match value {
>>> +    fn try_from(value: Bounded<u32, 6>) -> Result<Self> {
>>> +        match u8::from(value) {
>>>              0x16 => Ok(Self::Turing),
>>>              0x17 => Ok(Self::Ampere),
>>>              0x19 => Ok(Self::Ada),
>>> @@ -155,23 +151,26 @@ fn try_from(value: u8) -> Result<Self> {
>>>      }
>>>  }
>>>  
>>> -impl From<Architecture> for u8 {
>>> +impl From<Architecture> for Bounded<u32, 6> {
>>>      fn from(value: Architecture) -> Self {
>>> -        // CAST: `Architecture` is `repr(u8)`, so this cast is always lossless.
>>> -        value as u8
>>> +        match value {
>>> +            Architecture::Turing => Bounded::<u32, _>::new::<0x16>(),
>>> +            Architecture::Ampere => Bounded::<u32, _>::new::<0x17>(),
>>> +            Architecture::Ada => Bounded::<u32, _>::new::<0x19>(),
>>> +        }
>>>      }
>>>  }
>>
>> Can this use bounded_enum!()?
> 
> If we move it outside of `falcon.rs`, yes. I didn't want to make too
> permanent a solution with the `TryFrom` macro being developed, but if
> you prefer that way that's doable. I guess `bounded_enum` would need to
> be in the root module though to be accessible by both `falcon` and
> `gpu`.

Since we are going to have it as an intermediate solution, let's be consistent
about it. Maybe num.rs is a good place?

