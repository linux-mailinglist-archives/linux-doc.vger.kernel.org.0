Return-Path: <linux-doc+bounces-569-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE097CEA3C
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 23:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D3B11C20C5A
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 21:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0E44293F;
	Wed, 18 Oct 2023 21:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b="AkpGkNdC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o01eupX1"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481C981A;
	Wed, 18 Oct 2023 21:50:44 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD00FE;
	Wed, 18 Oct 2023 14:50:41 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 704B83200A2C;
	Wed, 18 Oct 2023 17:50:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 18 Oct 2023 17:50:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1697665835; x=1697752235; bh=dtw4GnkSOk7yUR8yZ4s9FY4KMKXBEBzSxdJ
	S7mZNAzo=; b=AkpGkNdCRzYLy8Yo4cuUWNveGsT0XMCWoPV43fm5gE8b16Rs6Vw
	5GibL/K8CGiM2TYdH5X4KWtDk3c/QiLpnqrO8h5vjnd/iFse2bmLBxV+Rh/bT53W
	KzX8u9lyzPeNb+pcttcz9Sv+xP4fLV5sIR1QazZIra2p2RA8kayBroxcixqRAB1L
	eORsKtP0eLR+e4jKdz1BWc/ocm+C21wdlRT5fGxwslEoACRr7xVGUneZ1/TjrvIl
	MpLmJlly/b9qLUfjzgWTWTG5celxY2dQnsZVLB+bKqRCwzUhviX476O0SI7t+zZu
	Rw9zEDzZfJ4nDl0QkNMV0wfsfaj2dK8DnqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1697665835; x=1697752235; bh=dtw4GnkSOk7yUR8yZ4s9FY4KMKXBEBzSxdJ
	S7mZNAzo=; b=o01eupX12CTf4Pxgax9u24mQUNSSndKO4LCLOek+ziKZJPYVNMw
	ge/p+sVuc3Omu9z3oOUrpBkv4Gn7pi33eXIgTB5JE3Mm5vXvs/FqPLEaIS4lKV8S
	KtUkZ9kpIAaNUx3Q67WvWNaD/8nzjWx870e00I6IxJX7A37Gcj4g/QBluxBtIRwK
	jZdrii5/Byvgy6H69NeG8OgewnEN5/zEebYfy/T/3DWWGXscOXOFkie1HGbydjdy
	3P9DfNrnd5AljdXoy66R4tz1dXhdl3WGvdqlkVvl4CgbJJr6vPiSVf1NNjw3Pgtz
	BtX8SxRRvwX/xVhGSBu/FlE9ed6W/sO5AOg==
X-ME-Sender: <xms:K1MwZWOk-lbM06q_4flNNA_kwCzXDVBglLrM1bWALFL_tIfW7ANlaA>
    <xme:K1MwZU8Mo-WtbnWY3gVJva8rbvolYHM49U8ZHSNfRjb0dKqo_YauBs6phA4ri9PI6
    -bdsbjtshqr8WSjDg>
X-ME-Received: <xmr:K1MwZdSPrxWOo7zPDJKbpVJtob0utWTMsTJ_K4bdWqMjcSWCqo7CA4VD7pa5zzRhJ1Z3lBe-kdTcD_C0UujusJWStzSL9tbhwweS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjeehgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlihgt
    vgcutfihhhhluceorghlihgtvgesrhihhhhlrdhioheqnecuggftrfgrthhtvghrnhepfe
    fguefgtdeghfeuieduffejhfevueehueehkedvteefgfehhedtffdutdfgudejnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihgtvgesrh
    ihhhhlrdhioh
X-ME-Proxy: <xmx:K1MwZWshTKs_gLcTrJ4fVXXbH4cunhv0Px61fjzFuSzhlQvtAhxddw>
    <xmx:K1MwZecgWCraxoGwLq92xXbDxQ_lBDpcKeuLkz--EC6QwVZp5AkQ5g>
    <xmx:K1MwZa0o8FyRCwjojUYuw8tTPgnRcxB6p_gqwOKSxXi81-Nppbe6-g>
    <xmx:K1MwZVD-ECej0Vp06Gs87IlC479dhGOPfZK1SVYv8kpAOhEkXPYz1g>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Oct 2023 17:50:32 -0400 (EDT)
Message-ID: <50fd5311-13e2-4345-9f86-21c8902badad@ryhl.io>
Date: Wed, 18 Oct 2023 23:50:29 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: rust: update Rust docs output path
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
 Akira Yokosawa <akiyks@gmail.com>,
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>
References: <20231018160145.1017340-1-ojeda@kernel.org>
Content-Language: en-US-large
From: Alice Ryhl <alice@ryhl.io>
In-Reply-To: <20231018160145.1017340-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/23 18:01, Miguel Ojeda wrote:
> The Rust code documentation output path moved from `rust/doc` to
> `Documentation/output/rust/rustdoc`, thus update the old reference.
> 
> Fixes: 48fadf440075 ("docs: Move rustdoc output, cross-reference it")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

