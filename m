Return-Path: <linux-doc+bounces-76526-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BZYJWsdnGkZ/wMAu9opvQ
	(envelope-from <linux-doc+bounces-76526-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 10:27:07 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1219F173E3D
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 10:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F29D930053D3
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 09:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D079634CFCC;
	Mon, 23 Feb 2026 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dAyiTtQN"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F61434EEF8
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 09:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771838557; cv=none; b=ZNpIHXk1t2k7WLAvxmuy+iicBfJ7iwjbVuLMTiSTTJYja6Jn0OYbgNW36NjZsJIqMBsO7W2sGlTwDZ6zKBlMHbM2RZL8r1URARKyb7SJ7jrEuwMCoTS1qvT0DOhlBg63L+3/D8B2e/03NaCbG0P+gBQl/6MTp9nQcAHl8vZQS1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771838557; c=relaxed/simple;
	bh=ewIfZ3EnYBpT23se9tTPnU3gYWUWURZsHjmHpqyN3Hs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BI2e2+xjhAG5QC4WrrXXyCCTt1edEk6nhSFOI+6Q4dLucXFBUJRSW5ggED2Py92PmhX3iEzi1S5jKe9QDoFS0BP8ix5cHdKVl7fOgo01LsiQigQLhg5FgALlST3KKC0VGIDR0jyyNHUyfe5bCMlS9YZ6P7JH9RgKvlzKFWbhhMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dAyiTtQN; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4362197d1easo3476335f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 01:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771838554; x=1772443354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/py8COuiIEGDu7/nY5qfOGmBj2ryx1hQ7/J9NPZ4C0=;
        b=dAyiTtQNYDSh3VoNBkkzvrAeaKZO9NCnspRaX8dGg14yptNU9OrsCc4UF5P1W8lmZA
         gUSBXQAnfK/N4Yl+/Wf6FOZrgpiWyoSe+hAuCasO1/TNJ7DOuxJ6DbPzNuYX1eskFS9S
         sI6W8cm2NKgkr95JPa05dzz7nx9J0B6LPkOQgLb/ua8mzCYaoUuunySbjdVmwDYR8t8L
         XxKi455Jfb0wwFFusQBGmmfiwR5PWqLwrvSdSMMYhmnkzcmKmE+bA/UHe2wNcRZh6Diu
         wD7o7LrCDJ/sF79GV8zhvL0Da/nCpBg926/nuysuUoK69DwCFRIr4YNDpFq93MgGwr5W
         ySXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771838554; x=1772443354;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6/py8COuiIEGDu7/nY5qfOGmBj2ryx1hQ7/J9NPZ4C0=;
        b=E8kwXYKQtSHm7N7zFXSydzJR3Pyau0XY2K+bENOjznn6Wyd+X+fMoV4AfhPtAXi+WE
         /Mel96hufLw/PrQpY5J2nUBJDYf4ZuQrAHpRZZQv16NtbpAF9NrU1kVXmuFvxCWFh9ky
         MyhxtsSPDt9S2Y75INHo9/g0gZhX5Q8I8rD6BtFfLoeL5QQuRDP4KJAL2n80zVxU1D0T
         dh5tQtp81qBRvXwdo0EkNcMj3it9Ay/APksvLcNN7mWdsyBRV/D0oEwSQ1paoNIqJWfr
         6/zSIIfS8u7V8IcapahODQINUog4Z27gGWXFnQ+8rt/UI0pM7Guhmg9ssRnTDdeQtEF/
         wlSw==
X-Forwarded-Encrypted: i=1; AJvYcCV7DCaytjTbElKyku2mnOnK58liqODZ0Uww4RgCQN1Ymnu0+L6DcbF15QXw1UcfpiIp8xa5vm80JMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyziHY3mLciLuoU7hbp/GGo+HxlcfqqDCLkU5BaeApyQRQejxei
	oocLhPLbT6mx1yROYiY/MHXwWkzSH1RLVLWsPeN9k1rxPTiQyCcEHRQD1YrAkDdA1eidH7RVUdB
	58izzaSfCXTaRh4ZZbA==
X-Received: from wmga22.prod.google.com ([2002:a05:600c:2d56:b0:483:49c9:7c2e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c8a:b0:483:71f7:2782 with SMTP id 5b1f17b1804b1-483a95fc09emr129349825e9.12.1771838554485;
 Mon, 23 Feb 2026 01:22:34 -0800 (PST)
Date: Mon, 23 Feb 2026 09:22:33 +0000
In-Reply-To: <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260210090023.2587534-1-mkchauras@gmail.com> <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna> <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Message-ID: <aZwcWfYkBnivrgNa@google.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
From: Alice Ryhl <aliceryhl@google.com>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Link Mauve <linkmauve@linkmauve.fr>, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76526-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linkmauve.fr,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1219F173E3D
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 07:56:02AM +0530, Mukesh Kumar Chaurasiya wrote:
> On Sun, Feb 22, 2026 at 08:11:17PM +0100, Miguel Ojeda wrote:
> > On Sun, Feb 22, 2026 at 8:07=E2=80=AFPM Link Mauve <linkmauve@linkmauve=
.fr> wrote:
> > >
> > > Should we come back to describing the target like I did in my first
> > > patch[1] in scripts/generate_rust_target.rs, or should I bring that t=
o
> > > Rust to create a powerpc-unknown-unknown-softfloat target upstream?  =
Or
> > > is there a better third solution I=E2=80=99m not thinking of?
> >=20
> > We are trying to stop using the custom target specs, so we should ask
> > upstream to give you a built-in target you can use (or equivalently, a
> > flag to do what you need, but I think the idea is to not have such a
> > flag).
> >=20
> > i.e. even if you used the custom target JSON, we would still need to
> > ask, since the goal is to remove that script entirely.
>=20
> I think, disabling altivec, fpu and vsx with compiler flag will work.
>=20
> What are your opinion on this?

I think you can and should submit a PR to add a softfloat target to
upstream Rust right now, and I believe there should be no issue in
accepting that.

If there's a workaround we can use on existing compiler versions without
the target, that's great too, but we should get the target in upstream
asap.

Alice

