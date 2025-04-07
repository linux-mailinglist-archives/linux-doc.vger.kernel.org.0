Return-Path: <linux-doc+bounces-42377-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B9A7E5ED
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 18:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E9123A5793
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 16:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB24207A08;
	Mon,  7 Apr 2025 16:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="CpxpPHsu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F9B2066F9
	for <linux-doc@vger.kernel.org>; Mon,  7 Apr 2025 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041878; cv=none; b=pHcTwuAp86IITMB6cxINBkTK21jDCIrhLFR4PMmXn4aReEOaPYQmOpBZiydzjpWoXllpBRJYJSuhRsa7VFkezBPTU7YgxFnkKx10Ahfs92kBbGuePgW4dOUuxJlHOkwMskiUbsGNlOOwrzJmpnF1UYiYbHiQ/xXxrrEiiP5a2FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041878; c=relaxed/simple;
	bh=GNUSzaOcgFQk60bWM8QYk1wqj9/Vo9XPbUt/LsFcc8Q=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nXcNPnkPb6uzll5XUtp9Mt4HvVb8/OUo5N+ua6vZGNhfc5iHNRmFLqLRNHU3/lhMCQQb9NEk18keoS3pJbU0MX3mkoxpUn/L+DH+T2ktBTOv/JKoD6yLUP06muBOCV4512YyKyUPZ6pCPlOuS92Sx3Hg2SCtaVXM23+AuNb7cWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=CpxpPHsu; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744041874; x=1744301074;
	bh=GNUSzaOcgFQk60bWM8QYk1wqj9/Vo9XPbUt/LsFcc8Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=CpxpPHsuagmo+doNhthzjtDX94Jvqbzn8G3IdrO8J6Cuw0vK1Q4Y2FylBZZwHrlFS
	 tu7Y8cw3SQeIyr8nBJVHuLzEek83jRwFNf6jzI60Kp69Ptr1A1lyfn2sIQ2Bi5gzgy
	 wBengVKTQ86AWLW3y9Z7YQKAHnpVcX/dfx8SM5dp1nJYmCfeW4WcPSd9+/6oxWSqFn
	 Q78oepSvBUM3K/CVoob6fkehQTjGz9fVMaL3qeuVsAki6kfa8IwFbeiPqfWQ0GlABB
	 XuQX+UdIQcTuMxzDHbTit1dGFmCYfazqoG6Z1J9QEY1MEYrHAGB74iXfq4zm9zkRhk
	 dAv9S2iTuu54A==
Date: Mon, 07 Apr 2025 16:04:14 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Manish Shakya <msh.shakya@gmail.com>, chrisi.schrefl@gmail.com, Jamie.Cunliffe@arm.com, a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, andrew@lunn.ch, ardb@kernel.org, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, ojeda@kernel.org, rust-for-linux@vger.kernel.org, stappers@stappers.nl, thesven73@gmail.com, tmgross@umich.edu
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
Message-ID: <D90J8JOGEBWI.4P0BAZG2R4G7@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 8658cf0c921339d197ea49fb11cd0a4f0a98f0fe
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun Apr 6, 2025 at 11:31 PM CEST, Miguel Ojeda wrote:
> On Sun, Apr 6, 2025 at 11:17=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
>>
>> Maybe we should rename it to something more discouraging then. Eg
>> CONFIG_RUST_BUILD_ASSERT_DISABLE.
>
> To clarify: it doesn't disable them, but rather converts them to runtime =
checks.

Yeah I checked what it does before. I still think that we should
consider this as disabling the build asserts.

> Perhaps it should be _ESCAPE_HATCH or _KEEP_DISABLED or _AT_RUNTIME or
> similar -- though changing it now may be even more confusing.

I don't understand what _KEEP_DISABLED would mean. For me, _DISABLE
sounds much more "threatening" than the other options.

Maybe we should also hide it behind CONFIG_EXPERT?

> The description already mentions it should not happen, and that is an
> escape hatch, and the recommendation and the default is N. So if
> someone enables it in production, they really went out of their way to
> do so, and even then they are protected by the panics (that they
> shouldn't hit at all).

I suspect that most of the people sadly don't read the description.

> Eventually, we may just want to remove it entirely if we never see a
> case failing and/or if we get proper support for those from upstream
> Rust for this.

Yeah, the upstream support would be the best. Did we ever need to enable
this option?

---
Cheers,
Benno


