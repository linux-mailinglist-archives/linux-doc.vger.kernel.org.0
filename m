Return-Path: <linux-doc+bounces-77514-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PkbFVs8pWne6QUAu9opvQ
	(envelope-from <linux-doc+bounces-77514-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 02 Mar 2026 08:29:31 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2B61D3E86
	for <lists+linux-doc@lfdr.de>; Mon, 02 Mar 2026 08:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81E6F300E265
	for <lists+linux-doc@lfdr.de>; Mon,  2 Mar 2026 07:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82DB331222;
	Mon,  2 Mar 2026 07:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xrByk2Ka"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAD43FF1
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 07:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436568; cv=none; b=rA8QSB1XS9f2leKW+UXeqzukZjq3h2S1e8ZZfhTLu+XtH+sBTpzu1Z91+uoxCxgfZeGGr+tN+hrELB+A7XzFibyo5Fs+6kOzoi5T6bF3KUdC3QT29qxMEh7ORU7+a8APHQjPF7Ditkef0zZJuMJ1cYgXB6A5Xp+V0K94p9QVfaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436568; c=relaxed/simple;
	bh=+CoAt6fI9i0WpNCcNh5PHh9hQU7RcGZ0bzeTQpV2TTY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xse4htEsTjlpyM9S7Gri/oQtkSzDYnsX7uKOs8bMNhXhpHz9+KEweT0FRDCv5oSsQ1sUSTkJnK+MXXcmk1fMLvVHKI5M3tMN3dhsicXQR++FvkUlTzRLvUWcze5dpBNEMYfIA4Owg5m6c1Vju3gV7lflclusYcKRo0WMl89ubD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xrByk2Ka; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836abfc742so32500425e9.0
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 23:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772436566; x=1773041366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B++JTSOCDEejhrrruo0lwnBFAI5zm/KxsIu6HPW4OXU=;
        b=xrByk2Ka/lzxu00yJY0EYyeohoQB2Lahz89kcaasp+MxaDa9tmT2w9v0hEeUb5GcmK
         mbZHbVAAG2FBL/vEgkhOeT1M+8AxP6nxIYGwLCUuApJ2PTeLbMunwkZR95qI7pdffTlX
         mmGa8oxLBtFYYfuD3QE5YMb2H4rXnN2zyiCLQvqfg2u7L6KtyvvM0TLU6HreHz1jCkBc
         YmIt5gXISfHwOvdvtvjJ820ppmJ6GOCWDAWTAEoR0KyA8IdsjbIw7wJA2Y0MhrRFZlbk
         wkGdF2Em9qoqVGbUX6R2zLsC26oWWeeok4WRWG7QvJgN9MTnEz8+THOwh3mQDsLDwoV/
         /Zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772436566; x=1773041366;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B++JTSOCDEejhrrruo0lwnBFAI5zm/KxsIu6HPW4OXU=;
        b=TCo89HmteRAT2f3gyvUDs/z5xUHuCf4Rw1+uKBXzvUpFVGghIZAZ1+PH0prp65dZe0
         4Rw8YbiEV+1VnyVGJt20lFzSRGWqPLBrTVp4q9mnlqV9VZuIBSy8AJ545NOF25+t3QL8
         SaTugI9ekIK8V+b5sRa4uklFlajmwvJJn0qvwx9Si5pwI36tdBLUJX8153ci2bzDXYl5
         TUVmeAXJdrYRMPGOQVhG3xJVUCNYWhLLnHi4dSci5/v/YrgCAS20Y9NhBg6kpKupPd1I
         s1BeXdyTk+2v15BUi4XSA/7NvMMGWMiBFz6P1B+8OtzoH7jNg9iqD9hUY4X1pvcuh4gs
         rq2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrT0G7b5JJFilMLF1gLesBBy7HIaT5J4TRD2gO3j5M4ns0uvygrUwrccQIShCJnORVExVwb7Rc5K0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRw1A5BjfQRlnpvM/VuikQWmghhxEn/ES8P+D595rb8OfPC+WZ
	QljYuKh5L30JxljUKBOp0xxXC1UUnuK8qkim6Q2VCkgduA1epwHiNNH3PDqN4G4HGqQzmLyjc42
	pprfcsbMY9soAMLb6VQ==
X-Received: from wmna22.prod.google.com ([2002:a05:600c:696:b0:483:272e:764f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8e:b0:47a:8cce:2940 with SMTP id 5b1f17b1804b1-483c9ba2922mr208928775e9.14.1772436565594;
 Sun, 01 Mar 2026 23:29:25 -0800 (PST)
Date: Mon, 2 Mar 2026 07:29:24 +0000
In-Reply-To: <aaUlwfP72ZpshLPL@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
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
 <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
 <0a176f95-eeba-428e-b19b-b08503d9ca5d@ralfj.de> <aaUlwfP72ZpshLPL@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Message-ID: <aaU8VC-kLOKDyYDP@google.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
From: Alice Ryhl <aliceryhl@google.com>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Ralf Jung <post@ralfj.de>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Jubilee Young <workingjubilee@gmail.com>, Matthew Maurer <mmaurer@google.com>, 
	David Wood <david@davidtw.co>, Wesley Wiser <wwiser@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-77514-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ralfj.de,gmail.com,linkmauve.fr,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org,google.com,davidtw.co];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CE2B61D3E86
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:25:54AM +0530, Mukesh Kumar Chaurasiya wrote:
> On Tue, Feb 24, 2026 at 09:58:10AM +0100, Ralf Jung wrote:
> > Hi all,
> >=20
> > On 23.02.26 16:31, Miguel Ojeda wrote:
> > > On Mon, Feb 23, 2026 at 3:26=E2=80=AFAM Mukesh Kumar Chaurasiya
> > > <mkchauras@gmail.com> wrote:
> > > >=20
> > > > I think, disabling altivec, fpu and vsx with compiler flag will wor=
k.
> > > >=20
> > > > What are your opinion on this?
> > >=20
> > > It is really up to upstream Rust -- for us, i.e. the kernel, it
> > > usually doesn't really matter much how things like that are
> > > accomplished: whether via flags, a built-in target, a custom target,
> > > etc. However, we need to know what the path to stability is.
> > >=20
> > > My understanding (but I may be wrong) is that upstream Rust prefer we
> > > use built-in targets for softfloat instead of disabling via
> > > `-Ctarget-feature` (and that the other options may go away soon and/o=
r
> > > will never be stable) -- at least for some cases. For instance, for
> > > arm64, please this recent change kernel-side regarding `neon` as an
> > > entry point:
> > >=20
> > >    446a8351f160 ("arm64: rust: clean Rust 1.85.0 warning using softfl=
oat target")
> > >=20
> > > So please ask upstream Rust (probably in their Zulip, e.g. in
> > > t-compiler or rust-for-linux channels) what you should do for powerpc=
.
> > > They will likely be happy with a PR adding the target (or whatever
> > > they decide) as Alice mentions. And until we reach that minimum
> > > version (in a year or more), we can use something else meanwhile. But
> > > at least we will have a way towards the end goal, if that makes sense=
.
> > >=20
> > > In case it helps, let me Cc Ralf, Jubilee and Matthew who were
> > > involved in some of that discussion in the past, plus the compiler
> > > leads.
> >=20
> > Upstream Rust dev here. Indeed we'd strongly prefer if this could use a
> > built-in Rust target; we can work with you on adding a new target if th=
at is
> > needed.
> > The kernel currently uses a custom JSON target on x86 and that's quite =
the
> > headache for compiler development: JSON targets are highly unstable and
> > directly expose low-level details of how the compiler internally repres=
ents
> > targets. When we change that representation, we update all built-in tar=
gets,
> > but of course we cannot update JSON targets. So whenever possible we'd =
like
> > to move towards reducing the number of JSON targets used by the kernel,=
 not
> > increase it. :)
> >=20
> > Kind regards,
> > Ralf
> >=20
> Hey,
>=20
> Sorry for delayed response. I was out of network zone.
>=20
> I am not sure about the process of how to get this in rust toolchain.
> Should I raise an issue of github for this?

You would need to add a new file to compiler/rustc_target/src/spec/targets
in the rustc repository.

If you're not sure what to put there, I would suggest coming up with
something that looks plausible, and opening a PR with that. Then others
can help you with filling out the target correctly.

Alice

