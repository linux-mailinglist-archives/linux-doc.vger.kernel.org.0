Return-Path: <linux-doc+bounces-85730-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KOsBA0B+Wmp4AIAu9opvQ
	(envelope-from <linux-doc+bounces-85730-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 22:26:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D084C38C4
	for <lists+linux-doc@lfdr.de>; Mon, 04 May 2026 22:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88A123021B01
	for <lists+linux-doc@lfdr.de>; Mon,  4 May 2026 20:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD1F3FB7E9;
	Mon,  4 May 2026 20:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xh5qp7Xh"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B5D3D34AB;
	Mon,  4 May 2026 20:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777926408; cv=none; b=dA2SUsV4RA2oqs9lvfFQSmUPqENAYtQlM6qLT+XnQbks8qY4dtot0YGuqqF5WFjm0f4UyZ8LHJP3aqq6w+rT3zj1TMDNY2CFhaLVw8k7iPdjWxjsRc1dvSpSNyyqnAwnMzt0eoPVoOOBnsmHmNire8ITRt07z6MX3KTyizHCEgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777926408; c=relaxed/simple;
	bh=VmFH5tiYZWd8I7xGp2Ix9lfuNXwvMmk6MoNhtVPAo7A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b5+kgEek1C4rdBckSY5O8sloVvq+T1Fi3lCK7BG6W+KB39h4mMgFVlalMhOKYBhRXfW9qWBk4bfTtrMFKPd23R7jxar9TuRWBTR+Z6F91WCm/qAPkjtFEO/yLaa9f51l6+0AZkRO2jmBuUyaqJJpWjoRoKdrZDxdmvlbj1UpwbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xh5qp7Xh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65116C2BCB8;
	Mon,  4 May 2026 20:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777926403;
	bh=VmFH5tiYZWd8I7xGp2Ix9lfuNXwvMmk6MoNhtVPAo7A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xh5qp7XhOyZj6VGsOizQ3hVHLhoYasE3XpX1L0fuwdAuHy2JceCEtLuuMIEA7YL+Q
	 YDi9QlQ82CJ8iKUR9ddQWMvmVRZ+iXSLkftAqzneKPnzMPtUCnqpzzjNxwCLGjLLzU
	 6CtHSkEsvBvfPCDfxDPIv9dX1Z6o8x2Z91JIKXXMfa61OYAMVfj3mONYMshJFJ+ni+
	 QLjCP985pz90FuBpFD9h2Bd/SwkEh/toeY6bHxF84OC0MGTXy5FxOoXAR70qsQm5QE
	 34chl961rzFUjNA6dLsDz/ixZodP1fWwGAm1lqNBBVSZG58JgeGFdHl8OIcNfaCgMM
	 pQ2m3MOAns7xw==
Date: Mon, 4 May 2026 22:26:37 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Alice Ryhl
 <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, Benno
 Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda
 <ojeda@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Trevor Gross
 <tmgross@umich.edu>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
Message-ID: <20260504222637.176edc7c@foz.lan>
In-Reply-To: <CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
	<fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
	<CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 65D084C38C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-85730-lists,linux-doc=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lwn.net,vger.kernel.org,kernel.org,protonmail.com,google.com,garyguo.net,linuxfoundation.org,umich.edu];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foz.lan:mid]

On Mon, 4 May 2026 18:08:06 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Mon, May 4, 2026 at 5:51=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Currently, there is a "P" entry for Rust pin-point that is
> > neither a valid ReST file nor an hyperlink. While the real =20
>=20
> I guess you mean pin-init above, i.e. this entry:
>=20
>     P: rust/pin-init/CONTRIBUTING.md
>=20
> It would be nice to clarify it in the commit message that it refers to
> a file (which is allowed for `P:` entries according to the docs).

It is not written there, but by file, it would actually be expected
a file within Documentation in ReST format ;-)

> And, yeah, ideally we could make it a hyperlink to the raw file.

I'm afraid that this is not possible. Sphinx doesn't allow
hyperlinks to point to files outside the documentation root
(which is Documentation/ when SPHINXDIRS is not used).

IMO the best would be to run:

	pandoc -i rust/pin-init/CONTRIBUTING.md -t rst -o Documentation/rust/pin-i=
nit-profile.rst
	sed s,rust/pin-init/CONTRIBUTING.md,Documentation/rust/pin-init-profile.rs=
t, -i MAINTAINERS

This way, it will generate a proper hyperlink.

Thanks,
Mauro

