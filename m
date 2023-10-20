Return-Path: <linux-doc+bounces-700-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9777D1211
	for <lists+linux-doc@lfdr.de>; Fri, 20 Oct 2023 17:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D3BE1C210F6
	for <lists+linux-doc@lfdr.de>; Fri, 20 Oct 2023 15:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678AC1DDCF;
	Fri, 20 Oct 2023 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="HGA+cwA5"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A651DA4F;
	Fri, 20 Oct 2023 15:00:31 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D847FD52;
	Fri, 20 Oct 2023 08:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=RYGYs5XXTeoNP2XkujGDwK18zSEZgl2Ltx2KXN09L/Y=; b=HG
	A+cwA59FKS0ShhrY88XTfJ/LpcVSQzq8tIHV1WGxSA1v1l31BNcd1Xa/qUhf1xo1uVC/RLp9kEmAj
	bO1geBIpBP9NE2N6dx/3GjhQhi+YYBy5D8He5hRACOj5OlNOhUyV1qtjVsm1Pe+2csq/wJsEME6Js
	n+Iz8bEbaHfQVbQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qtqyt-002nOE-GB; Fri, 20 Oct 2023 17:00:07 +0200
Date: Fri, 20 Oct 2023 17:00:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Message-ID: <5c3f3ef8-e93c-49f1-881f-11c02afdaf7d@lunn.ch>
References: <20231018160922.1018962-1-ojeda@kernel.org>
 <d47553f1-1832-4c69-8a8c-71c58048ff30@lunn.ch>
 <CANiq72=E7TPLcq-yiQF9E8a33ghbogPcbv-yMqFKBxMQ0oOxNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=E7TPLcq-yiQF9E8a33ghbogPcbv-yMqFKBxMQ0oOxNQ@mail.gmail.com>

On Wed, Oct 18, 2023 at 06:41:10PM +0200, Miguel Ojeda wrote:
> On Wed, Oct 18, 2023 at 6:27 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > It very unlikely end users read this document.
> 
> We can add a note to the Kconfig symbol too -- would that be OK with you?
> 
> > And that statement is
> > not limited to end users, it is true for everybody.
> 
> Agreed, but that bit is meant to emphasize that end users do not have
> a reason to use it at all (unlike kernel developers etc. from the
> previous paragraph)
> 
> > What we should be saying is that Rust for the Linux kernel in general
> > is not ready for production use. Developing drivers in Rust is
> > currently for experimentation only. Given the experimental nature of
> > the work, there is some risk Rust will never be ready for production
> > use.
> 
> The risk is that Rust gets dropped from the kernel because it is not
> used enough, not so much that there is a fundamental problem to solve
> in order to reach production.

I've talked to a small number of netdev developers, not many, but
some. The general impression i get is that it is unclear what
experimental actually means, and they have no idea what makes it not
production ready. The two are also not necessarily mutually exclusive.

To me, it appears Rust is not production ready because:

You need to disable module versioning.
You need to disable structure layout randomisation

On X86, you need to disable X86_KERNEL_IBT and RETHUNK, both of which
are part of the mitigation for speculative execution vulnerabilities

So no vendor is going to release a kernel with these disabled.

Networking also tends to be architecture independent, so production
features need to run on X86, ARM, ARM64, and to a lesser extent MIPS,
RISC-V, etc. I know this is documented, but it does not appear to be
that well known within the networking community.

Networking people also tend to be interested in endianness, does the
code work on big endian as well as little endian? Big endian is dying
out, but its not gone yet. However, with only x86 supported in
mainline today, it does not seem possible to test big endian. I assume
the rust type system will actually deal with this to a large extent?
But are developers writing abstractions which are sound with respect
to endianness?

I think it would be good to describe the experiment a bit. With a
multi year experiment, you often have short term goals and long term
goals.  What are these goals? What is the Rust for linux community
trying to prove in the next few kernel cycles? What do you consider to
be 4 or more cycles away? What do you consider not so important now
because its not needed for your short term goals? That might also help
developers understand when it will transition to production ready, but
still be experimental.

And you obviously need a disclaimer, Rust for Linux is a community,
developers are free to scratch their own itch, so things might happen
in a different order. And information like this might help get people
involved, helping solve some of the limitations, spur research into
different goals etc.

	Andrew

