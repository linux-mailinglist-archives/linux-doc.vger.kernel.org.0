Return-Path: <linux-doc+bounces-553-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BF87CE56E
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 19:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FEF8281D3A
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 17:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D303FB39;
	Wed, 18 Oct 2023 17:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="LXdbYs+n"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8CE3FE2B
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 17:56:16 +0000 (UTC)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5C1FEA
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 10:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=id5jhg4t6jh75dlqjp6pot5zcy.protonmail; t=1697651770; x=1697910970;
	bh=+Do60tFHTgD/yzVC6yohA+Xb+DeuzbVb/pyouLR43hE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LXdbYs+nAy09u7e3TbPcQo2fVpqLTtG1rOME0Ve16ipPFbaG1XVeNxSqmsqek1QpU
	 ErMTgCXBfV2e57cG3V0+htGeydsqb/fk135HE00P7rjfFyJwrN8kvFLsLiT2wxDG9b
	 HM4sK8FUsKPR2SQpWoNG1m1Ynp0BgeO8Tf2O9p+EHY1zU37qIRPBeVvhA1kzvIjgpf
	 Tmy1VMw8JggmdrPRLfkewxHrp8cWxnRIP6VI28yuyBgt1RYShb4Joc3HkoX7QlIVfG
	 tBPP8Lr0PItp1Z3KVJDNmLyg2JErVyhC9fQTmcGbOmuhuEdMCHeFAnxYL/YrJ8ISLW
	 ogx2NOXKEKIPA==
Date: Wed, 18 Oct 2023 17:55:59 +0000
To: Miguel Ojeda <ojeda@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Carlos Bilbao <carlos.bilbao@amd.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, patches@lists.linux.dev, Akira Yokosawa <akiyks@gmail.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Subject: Re: [PATCH 1/2] docs: rust: update Rust docs output path
Message-ID: <9zPimFJ-VQdlvUz-8ChRRxxHCJviKOt0uoclPqJzpAL9t_1s7NoPnTzCcHC-0XAbWKoRK_VLIN_duiv09Zrb0EW2rixLUv0cbxBIy6GsG_w=@proton.me>
In-Reply-To: <20231018160145.1017340-1-ojeda@kernel.org>
References: <20231018160145.1017340-1-ojeda@kernel.org>
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
> `Documentation/output/rust/rustdoc`, thus update the old reference.
>=20
> Fixes: 48fadf440075 ("docs: Move rustdoc output, cross-reference it")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

--=20
Cheers,
Benno

