Return-Path: <linux-doc+bounces-59996-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA140B539F2
	for <lists+linux-doc@lfdr.de>; Thu, 11 Sep 2025 19:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2AADB7B07BD
	for <lists+linux-doc@lfdr.de>; Thu, 11 Sep 2025 17:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8B035E4F4;
	Thu, 11 Sep 2025 17:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qu1NDyi9"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A83D3570B2
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 17:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757610383; cv=none; b=g2vNwrcGiSkfiRLfoXnuMfgAb/rRsMutKaB0RCTytMjrUDShZdN6b3FKniLPbQ6XdgVRL8RByrQUEfHMxhyYIipZ1rNLDNCE8XhNAcelyqG7gbSu4eQKwdFdk58/OP1773Zv4jsuJWMIJ9zYU0HzAGRKFDLAB5TR+cV7EBr8Tds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757610383; c=relaxed/simple;
	bh=lvrjzW87CssZVUkqSzlK7oisgAKff01VA0ToXi1SqT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCYQK97NA6n3ub7P0XNDcofI2Pd8Bpbw1vujPj674l8nGF7wvxsbT3C3aP9XrHfDXhA+np4HvTlavBjWs6eNUU/9GLJysTE/0CYy9YvJqcYstX9ToCazN7CJmAFw5dWBoeGQQ/YIELt1KeC92rnyyOUE2rPecUIV0L58Mw7dUtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qu1NDyi9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FFAC4CEF5
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 17:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757610383;
	bh=lvrjzW87CssZVUkqSzlK7oisgAKff01VA0ToXi1SqT8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qu1NDyi9Ijfpd9IYMxvHQ4ClNiRK1+UyPumE6L6vlZ4O801pVQ08pTKhIPvNO40Qc
	 Nt+p6t4Bv3IMvrVfo7iMK4imj/Wc/4gFpqg1/WujX6000vXKRhRgjIadQr3QR18l5Z
	 RRjyCJVoJH7cali73XbGRGFz9X5fS+/S52oOl8QWr8ViKlPz/F/IdHP/dNjHB7oyj7
	 OVRAXZu/ZYiIlOhG03VhoOn11IM3Y2WcMZcyBe8k1MQcTuinmRM0rzWY6LIEL2Ldif
	 VwmE9M3Z/FWV38CRy4wdKNVIfwYCXSd086AEBJWiX2uA3bll+XA1mdfvUfjJ7xc9O1
	 VVom7ozp+wcrw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-337f6cdaf2cso7454571fa.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 10:06:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpzwaHOmFdgIDvHFRDB9DQqvJQ+JZdO06GF8Z5AI687Koo4Qq8JEZ8+Z9w6MRJRyniKrOjbRS6XFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqVDGKKWY8MYqgkfZptzPgwmPiLn9BeOIv8NBsIVjUXs0Xz16P
	/9fOBp+Q7GZDIMSTetP/wme3Y+xstMqO7dJPgLfzmS0ZASntuDsBY9oRw/4q+jPG144U94QiVNC
	Wxxk44rIIAlVWFkQlGA0GcqPKprbypfE=
X-Google-Smtp-Source: AGHT+IH6OxQCUGtRgJcQjfKTf3hDdpLA4LF1aEmWb95lZSaQkLx0RVREkUE5VFqqShHQZVfqhkMomqskaRagF/iPoGM=
X-Received: by 2002:a2e:b5cd:0:b0:338:e6:e0bc with SMTP id 38308e7fff4ca-33b50bbbcf5mr41387191fa.2.1757610381479;
 Thu, 11 Sep 2025 10:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910015738.14848-2-bagasdotme@gmail.com> <CAMj1kXHCi1pr3XNzwe7b7EFBkPGjkppeNWNSvy4wU1VBHj9kfA@mail.gmail.com>
 <c30fb598-2878-4bdd-ab84-4f4d07d0db5d@app.fastmail.com> <CAMj1kXFtdqN+cDVVWK1KTbfyfe0kazHt1t1XmPz58uf+axknOg@mail.gmail.com>
 <4f36eee9-7e25-4e2f-ab9d-82f9732d0bf1@app.fastmail.com>
In-Reply-To: <4f36eee9-7e25-4e2f-ab9d-82f9732d0bf1@app.fastmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 11 Sep 2025 19:06:09 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG8V3UFrhJwKqzYasMPX2cJKa9OccVmpOidmwigfnhNGg@mail.gmail.com>
X-Gm-Features: Ac12FXzVKqtR8UjyR8-tiXHk0-xlLnOGpsTwQCGjtodW1x5XR5Ue_A2nus5b9H4
Message-ID: <CAMj1kXG8V3UFrhJwKqzYasMPX2cJKa9OccVmpOidmwigfnhNGg@mail.gmail.com>
Subject: Re: [PATCH] x86/Documentation: explain LINUX_EFI_INITRD_MEDIA_GUID
To: Hugo Osvaldo Barrera <hugo@whynothugo.nl>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Linux EFI <linux-efi@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Sept 2025 at 16:08, Hugo Osvaldo Barrera <hugo@whynothugo.nl> wrote:
>
>
> On Thu, 11 Sep 2025, at 14:49, Ard Biesheuvel wrote:
> > On Thu, 11 Sept 2025 at 13:23, Hugo Osvaldo Barrera <hugo@whynothugo.nl> wrote:
> >>
> >>
> >>
> >> On Thu, 11 Sep 2025, at 08:46, Ard Biesheuvel wrote:
> >> > On Wed, 10 Sept 2025 at 03:58, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> >> >>
> >> >> From: Hugo Osvaldo Barrera <hugo@whynothugo.nl>
> >> >>
> > ...
> >> >> +For sample implementations, refer to `the original u-boot implementation`_ or
> >> >> +`the implementation in candyboot`_.
> >> >> +
> >> >> +.. _the original u-boot implementation: https://github.com/u-boot/u-boot/commit/ec80b4735a593961fe701cc3a5d717d4739b0fd0
> >> >> +.. _the implementation in candyboot: https://git.sr.ht/~whynothugo/candyboot/tree/4097b2538d7f1cf85f03922bf42409490b666202/item/src/main.rs#L225
> >> >>
> >> >
> >> > What is candyboot, and why are we adding this plug for it into the
> >> > Linux documentation?
> >>
> >> It's a UEFI stub loader which can load the Linux kernel and provide it with an
> >> initramfs using the above described protocol.
> >>
> >> The original version of this patch was based on my notes researching _how_
> >> to implement this stub loader. The implementation is quite minimal, so I think
> >> it serves as a useful reference example.
> >>
> >
> > I think one example reference is sufficient, and I think piggybacking
> > a plug of your own project onto a documentation refactoring patch is
> > slightly dodgy, to be completely honest.
>
> I don't know what kind of reaction you're expecting. The documentation
> improvements were a side-effect of developing candyboot. You're free to
> exclude the mention if you feel it is inadequate, but I don't appreciate
> the personal attack.
>

No personal attack intended. I merely commented on the changes
themselves, not on your person, and the patch incorporates a reference
to your own project without calling that out in the commit log. I'm
sure it is a project you care about, and it looks like nice work (no
irony here) but it also looks like self-promotion being injected into
the Linux Documentation, given that the project in question is one of
many that implement LINUX_EFI_INITRD_MEDIA_GUID, including GRUB and
OVMF/edk2 which are much more widely known and much more relevant to
the audience.

And I am not the Documentation/ maintainer, so it is not up to me to
include or exclude the reference - that is the maintainer's job, which
is why I felt it appropriate to bring this to the attention of the
submitter and of the other people following this thread.

And this is all I am going to say about this.

