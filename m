Return-Path: <linux-doc+bounces-22503-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B19EA94BFB2
	for <lists+linux-doc@lfdr.de>; Thu,  8 Aug 2024 16:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47FE6283C95
	for <lists+linux-doc@lfdr.de>; Thu,  8 Aug 2024 14:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF4C18E056;
	Thu,  8 Aug 2024 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="MCP2q9eS"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6BE637;
	Thu,  8 Aug 2024 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723127645; cv=none; b=SG8lwG+/pAz3/7HjE0yAtb/EDT00gem/Ms0DFbkIufw2Hvyso3cKmRNiSb/3DgMEv8OM2IWCci8YinFMGzf7NlqGQu5UbmIadGkDzfDjGtrof6cpSgRJmlPY4F5xPPa3wWv3+pT7zGPxlfHZiz3yi15XcKCeMotMRiMI3LEBW/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723127645; c=relaxed/simple;
	bh=esJQD0fZf8esCkWrMF7aZbYFwrQ+M+0lYRz32nZTci0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bpyj0jLF0lpRfzyfOt2dIVnX453ivovBoFHaIU/8I7vsnsMfRbbCgjQaqA0UJd+z26IBhmKYl9W5GnvetK9/BtB54qV9JIF/fzctKLTJLDR5kjOwKQ0A9l+4Tho10KvLSbp9PUa4VevpBXAynG5fRzXby268fIBwHcHz/aKkiiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=MCP2q9eS; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723127638; x=1723386838;
	bh=esJQD0fZf8esCkWrMF7aZbYFwrQ+M+0lYRz32nZTci0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MCP2q9eSf34L+cWotmxPxebSuYRMCxT3/u8Eg7JkyEE1eYRjBLpb9XUoyIDeQapP3
	 OkqFNN8zElZ1nWYT4Tmo3f3bOv1bCMfh3LKnLaInrVjQYFkGZF9rM+A+0yK5q0xrga
	 JnRUoQd2DamEDwmQB8NZcaFXOf8BJ1OheQcTUCk1FCbXgHT1rqAqACEnhr2nr+Us3C
	 CWFlBpzZGSPMS89kGNObtuLqtHpFy8mkFtjE29X5yDiut4gEjEWGuOhJs99U/ZJf+X
	 uGvqTjOikLqHL21J5/cXuyV+2b1uaQQnnbGynl5NoKDvUGqJbxDqrb4/PwFzNrgW7L
	 P1xBsPYgd2/2Q==
Date: Thu, 08 Aug 2024 14:33:55 +0000
To: Daniel Almeida <daniel.almeida@collabora.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/5] doc: rust: safety standard: add examples
Message-ID: <cfd4841d-040b-4101-88be-3eb42f2139ab@proton.me>
In-Reply-To: <9959901D-0839-454C-9141-F0661C956AD5@collabora.com>
References: <20240717221133.459589-1-benno.lossin@proton.me> <20240717221133.459589-3-benno.lossin@proton.me> <B0E3D539-2D29-4BB4-9CB7-98672F590A57@collabora.com> <37d7b08d-f37a-45ff-9993-08fa7ed87443@proton.me> <9959901D-0839-454C-9141-F0661C956AD5@collabora.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 60e328dc318d6a1d6b5ae404ae2fbb1d4875723d
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08.08.24 15:10, Daniel Almeida wrote:
> Hi Benno,
>=20
>>
>> I will try to rephrase this, tell me if it helps. When checking if an
>> API is sound, you are not allowed to change the code behind the API.
>> That is because `unsafe` code often relies on the surrounding safe code
>> to work properly. In the example above, safe code ensures that the raw
>> pointer `ptr` is valid. This is OK (and also very necessary), since we
>> expect people to be *aware* of the `unsafe` block and thus more
>> carefully review the changes in surrounding safe code. If you have safe
>> code that only interfaces with other safe code you don't need to be this
>> careful.
>>
>> Note that this heavily depends on where you put the API boundary. In our
>> case, we generally have this boundary: driver code <-> `kernel` crate.
>> But if your driver requires very specific helper code that does not fit
>> into the `kernel` crate, then you might also have an API boundary there.
>>
>> If it doesn't help, then it would great to get some more detailed
>> questions which part(s) you need help with.
>>
>> ---
>> Cheers,
>> Benno
>>
>>
>=20
> Yes, I think this is more clear, but note that this explanation is more t=
horough
> than the actual example.
>=20
> My point being, maybe you should take some of what you just wrote and put=
 it
> into the actual docs.

Yeah that was part of my plan :)

Thanks for taking a look.

---
Cheers,
Benno


