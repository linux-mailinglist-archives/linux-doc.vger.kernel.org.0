Return-Path: <linux-doc+bounces-4820-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A480F4D0
	for <lists+linux-doc@lfdr.de>; Tue, 12 Dec 2023 18:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F9D6B20BF1
	for <lists+linux-doc@lfdr.de>; Tue, 12 Dec 2023 17:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA95161FCB;
	Tue, 12 Dec 2023 17:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="lBoMODRj"
X-Original-To: linux-doc@vger.kernel.org
X-Greylist: delayed 113441 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 Dec 2023 09:43:28 PST
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E112BCF;
	Tue, 12 Dec 2023 09:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=gooevbgqcfc2zodvlhx4jfz534.protonmail; t=1702403007; x=1702662207;
	bh=y+TsCR4PW7NrBLfHsIFxa3geiSOoWWNUlAyAMODXi2o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lBoMODRjoIgqkk2bFCaW9BdVbEtpFOIDRkaLhi7QraiqqCQjY/TXaRk5xPU7corMA
	 WHNsgewGeHQMQr1Ru2hl0lGPh+vxMJHAFOnVImnoT9YdkVSebVZR6LALSiU+f6NZQT
	 vtfBUpD+p40GW8QhhycSYqzgLV4Z9H7ulmw3BU+MO+tk98QUb0z/Khj8jWo5ahwaoU
	 gm3gxI2zROKKqCPDPtRXn+ZRl5lPK2JJZ+Jmwvoow33CaaHxMTbwn/5mADQk5bedQb
	 9gkj9t+sVSW9N+v1iCNWVAaJT90eJDmrJQKvfDJoBU3MCijhRIS9HOwJXSeWoHQT9J
	 qAgfsygmmfxGA==
Date: Tue, 12 Dec 2023 17:43:16 +0000
To: Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] docs: rust: Clarify that 'rustup override' applies to build directory
Message-ID: <e9d84003-79bd-4b56-b0db-97f06f88af2f@proton.me>
In-Reply-To: <e2b943eca92abebbf035447b3569f09a7176c770.1702366951.git.viresh.kumar@linaro.org>
References: <e2b943eca92abebbf035447b3569f09a7176c770.1702366951.git.viresh.kumar@linaro.org>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/12/23 08:43, Viresh Kumar wrote:
> Rustup override is required to be set for the build directory and not
> necessarily the kernel source tree (unless the build directory is its
> subdir).
>=20
> Clarify the same in quick-start guide.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

--=20
Cheers,
Benno


