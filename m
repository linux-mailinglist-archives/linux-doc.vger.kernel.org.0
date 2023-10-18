Return-Path: <linux-doc+bounces-570-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E10747CEA40
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 23:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70785B20AF3
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 21:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CA83FB1E;
	Wed, 18 Oct 2023 21:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b="MV/2ipkd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gRW0f4Uw"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9455128DD9;
	Wed, 18 Oct 2023 21:51:16 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 209F2EA;
	Wed, 18 Oct 2023 14:51:15 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id C225E3200A21;
	Wed, 18 Oct 2023 17:51:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 18 Oct 2023 17:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1697665872; x=1697752272; bh=AlPk2h7qGZuNRoWEGnMtQ/VbGE5sTysrzAQ
	3hMfPOm0=; b=MV/2ipkds3A0kM23N1L6SvL5v39JUSZ/7dCiIgqUscjSfuR28xP
	+gHW717cx8Ou36WXe4hdkN2kn1v/thrNXX7/R6MnyQKyBLQl+kVSVzK4uvKJxDrR
	Qo8ckMRoPzCNGXhoUC2VX1wiJZOBMdgiGRjbqKiGNZ30CGpZic9RyTmAhpXS/JHV
	F4fHCFBwwnH2nvftiOscrz1cCsMsZQ6D2G6IIRXnUGFSDo9Nqp5XT3gAIS6FbE7t
	xmgpNg2E4HsT3dbm5MKU3E09NYzsFM07KY6R7Kw2u1oZa9C5tUvkGOL3Yn8wmWLp
	WUrhC3henRYpKXORIi4Y51iWGRKnbpdMnwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1697665872; x=1697752272; bh=AlPk2h7qGZuNRoWEGnMtQ/VbGE5sTysrzAQ
	3hMfPOm0=; b=gRW0f4Uw0B0uHLHG8GJg+TXyxwlgLiCedYCW3SP/qsX5PmafaTV
	lyuaeRKxB417SgrYQwIWXC6H0mXlVgC8YBqoTbM3bbY6b+ky+VjKUVBLAUfUAFhJ
	ug9Tbp3hqz4i5L3kqkdI736/uN4VlyPHmtLZVxSD7VLvNVfzbs1hsYeVnbtU8At0
	rdfNT3bzruY8ituZLgdIIiFKZO7BV/IBaZ+UFfDNjnnUAKKvFofP6tM8DPWxzoIE
	eWr2FbpY3eQn2TWrg3Vx3w3HGPITQnojl/lF0P9DdZp0E7uvE+oUxUM4KRelb4FD
	LFcdmcobhmL6foiGX7CLKX+gDa4vrEKj4AQ==
X-ME-Sender: <xms:T1MwZV4S4RSgsEWVy-U8rCiayMEnHitOoX_gY6b3gQu6lUIljzmI6A>
    <xme:T1MwZS5i89RomhrvzBhhe3tqZLN1TsAHlaRLCKdnA283VPWZhvMGTNJhG7iIquGOE
    T2SYZTSV6sQjQzbmg>
X-ME-Received: <xmr:T1MwZcd5nrOjAZ1OvPd0Thczof9IrtgtVEdER-8e-rXAyFKo-oDCqWClW3ZNQBFK8U1kCjGRY0x-ipV99YrSFMTI0vXz1YnjR9UY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjeehgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlihgt
    vgcutfihhhhluceorghlihgtvgesrhihhhhlrdhioheqnecuggftrfgrthhtvghrnhepfe
    fguefgtdeghfeuieduffejhfevueehueehkedvteefgfehhedtffdutdfgudejnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihgtvgesrh
    ihhhhlrdhioh
X-ME-Proxy: <xmx:T1MwZeIPOva27k4DFERVnumUg4IAsc4TZUBnX713HecdrQx-bq3qrg>
    <xmx:T1MwZZKTmd1BTYAs69H33kGVmUdMPQJTEoz7Kwi8M7zZc2DOoh_mxg>
    <xmx:T1MwZXydd3ylQRYNjbwr-oy78zzAIt1FfS4MlzKx4IH5F4y2NqqYIA>
    <xmx:UFMwZRLp8_Av_Tie1gf-y-TLEAzRLamoZbf9p6mFdT5n68xY2IBioA>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Oct 2023 17:51:07 -0400 (EDT)
Message-ID: <9f262bcc-a551-43c1-8bf2-c5c6eb6f99ed@ryhl.io>
Date: Wed, 18 Oct 2023 23:51:07 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kbuild: remove old Rust docs output path
Content-Language: en-US-large
To: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Carlos Bilbao <carlos.bilbao@amd.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>,
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
 Akira Yokosawa <akiyks@gmail.com>
References: <20231018160145.1017340-1-ojeda@kernel.org>
 <20231018160145.1017340-2-ojeda@kernel.org>
From: Alice Ryhl <alice@ryhl.io>
In-Reply-To: <20231018160145.1017340-2-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/23 18:01, Miguel Ojeda wrote:
> The Rust code documentation output path moved from `rust/doc` to
> `Documentation/output/rust/rustdoc`. The `make cleandocs` target
> takes care of cleaning it now since it is integrated with the rest
> of the documentation.
> 
> Thus remove the old reference.
> 
> Fixes: 48fadf440075 ("docs: Move rustdoc output, cross-reference it")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

