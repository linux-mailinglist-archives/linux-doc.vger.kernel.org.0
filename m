Return-Path: <linux-doc+bounces-502-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A90DE7CE2BD
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 18:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CAB3280F1E
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 16:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8EC3B7AF;
	Wed, 18 Oct 2023 16:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="vDoL0d5R"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB088358A1;
	Wed, 18 Oct 2023 16:27:48 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864E8BD;
	Wed, 18 Oct 2023 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7CcIfbyBlwtEIEjNNEeDSclhLBBZVgFLWIB2+oAlWik=; b=vDoL0d5RHghvBG0AVp5e/X9BAl
	KycxsCwTWQbZbIvpMqth2y7w4u2yn2/t2wNtFOvPIXuEgSzZHvOId6/NWoox9ucJeFAG8vZyvsvAT
	aBmJKlnS0IeDvFFDW2UtnJ/l99A1n2IXnRtMiH4pcGz/HYPTQLivKjh59nZYA9KJCXcY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qt9OL-002bMB-O5; Wed, 18 Oct 2023 18:27:29 +0200
Date: Wed, 18 Oct 2023 18:27:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [PATCH] docs: rust: add "The Rust experiment" section
Message-ID: <d47553f1-1832-4c69-8a8c-71c58048ff30@lunn.ch>
References: <20231018160922.1018962-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018160922.1018962-1-ojeda@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 18, 2023 at 06:09:22PM +0200, Miguel Ojeda wrote:
> Clarify that the Rust experiment is still going on to avoid
> confusion for both kernel maintainers and end users.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> Andrew: I did not add a `Suggested-by` just in case, but please let me know
> if you want it, of course.
> 
>  Documentation/rust/index.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/rust/index.rst b/Documentation/rust/index.rst
> index e599be2cec9b..aaed36af15ce 100644
> --- a/Documentation/rust/index.rst
> +++ b/Documentation/rust/index.rst
> @@ -6,6 +6,23 @@ Rust
>  Documentation related to Rust within the kernel. To start using Rust
>  in the kernel, please read the quick-start.rst guide.
> 
> +
> +The Rust experiment
> +-------------------
> +
> +The Rust support was merged in v6.1 into mainline in order to help in
> +determining whether Rust as a language was suitable for the kernel, i.e. worth
> +the tradeoffs.
> +
> +Currently, the Rust support is primarily intended for kernel developers and
> +maintainers interested in the Rust support, so that they can start working on
> +abstractions and drivers, as well as helping the development of infrastructure
> +and tools.
> +
> +In particular, if you are an end user, please note that there are no in-tree
> +drivers/modules suitable or intended for production use yet.

It very unlikely end users read this document. And that statement is
not limited to end users, it is true for everybody.

What we should be saying is that Rust for the Linux kernel in general
is not ready for production use. Developing drivers in Rust is
currently for experimentation only. Given the experimental nature of
the work, there is some risk Rust will never be ready for production
use.

   Andrew


