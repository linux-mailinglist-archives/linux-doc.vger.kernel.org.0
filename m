Return-Path: <linux-doc+bounces-555-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E0D7CE58C
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 19:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2899281CCB
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 17:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8109A3FB39;
	Wed, 18 Oct 2023 17:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="dRboJLM1"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36793FE23
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:57:15 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6311A13A;
	Wed, 18 Oct 2023 10:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1697651829; x=1697911029;
	bh=qg1FOCAW/ZNkhfLQUnB0m1HTCb5NKmRZ0oWQUjY7kLg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dRboJLM1CQ7qc7Ug/4scXZzoRb9hNkHsaj9XBRiea/xBLmykdWwbhiKlXU76Dejed
	 VgYNU5sYzH4B9vsaN5hdD4+d+lAh80rnEv6cz39rsAKQmutnyzTZ4mtBY/lP3o2c/5
	 vUHggxRe6+ySvwT4+bhYAsZK2PHJDNsi7kBzDrq8EfjyngIrpl9HeeMCt9lcIhJxev
	 +hQvHB2F4xYhF5QNit1eV/3papqbnSyhxlERLL64JKpA/WMaAj8MPsg0+f3RXGEOJb
	 TcHo76ycjFm4JWw85xzXPrnec1QDUpdtkZ937skpFLg6OgKAyFIknAuF8GfLopu0Ol
	 ZrzHtuXnwUdqg==
Date: Wed, 18 Oct 2023 17:56:52 +0000
To: Miguel Ojeda <ojeda@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Carlos Bilbao <carlos.bilbao@amd.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH 2/2] kbuild: remove old Rust docs output path
Message-ID: <c-GFV2p1lETIN6czmE3f0YFrusVTJ6kuiZXx_UA3FC_f6ORK3uGdQ5z_mCxLVkg4xktI79_Df3f-bTwhHUfzocoKJ8Go5TR4GRlcKxxMrrA=@proton.me>
In-Reply-To: <20231018160145.1017340-2-ojeda@kernel.org>
References: <20231018160145.1017340-1-ojeda@kernel.org> <20231018160145.1017340-2-ojeda@kernel.org>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 18.10.23 18:01, Miguel Ojeda wrote:
> The Rust code documentation output path moved from `rust/doc` to
> `Documentation/output/rust/rustdoc`. The `make cleandocs` target
> takes care of cleaning it now since it is integrated with the rest
> of the documentation.
>=20
> Thus remove the old reference.
>=20
> Fixes: 48fadf440075 ("docs: Move rustdoc output, cross-reference it")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

--=20
Cheers,
Benno

