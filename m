Return-Path: <linux-doc+bounces-79972-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEixLG6+umkGbgIAu9opvQ
	(envelope-from <linux-doc+bounces-79972-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 16:02:06 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BB62BDC23
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 16:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D08A3067AD9
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 14:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004923DDDB8;
	Wed, 18 Mar 2026 14:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHhatJNJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A24EAC7
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844922; cv=pass; b=qo37tauwK6EE4JHqefxXbru9i8DCM21vQmXmAhiuQbc8otLm3LGHCF8PBi7I8IUBuHdOOiIabRiWNh7+FodXcuziEIeq/67x9QN9thDYcEm+EqF+HOY6UhdjNlOD+Y97GUnOvIaXe7aAUtqJSHcauHV5AW47S4WaoMxQFa+5rZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844922; c=relaxed/simple;
	bh=RTOE29KKEh2RCMQf09/Yf7/7d6oQT0Su+sy1NG6/ao4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c772cVEzENz2OPGS40/gqpafQLtQdPwgpExx/sTzPtUh10liuJgNRcz61Mmrnf/nnFquLf0XtrGV4G80/jgucwgNA914GtJvRYG1O0XMO6QrcRx1823Bk+OKogIU/x+HtMvRYsU8Sa7zbdJMaG2mlW3UHxal2zn+MArs5clsL7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHhatJNJ; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c0c9994199so147929eec.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 07:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773844920; cv=none;
        d=google.com; s=arc-20240605;
        b=gQvIXNWEM9ah2PlkGVHax0H7m1e2fV+33Rs91poIxv5mNx8lEhWGe/GWUvomCVGYKa
         MJNH7l2b3BCUgCgq1WcTEeXWQaY491+1eqKFzq8jL0rpYtQ6pys3g8M3c7t2L98AMJJ8
         g1Oe7k6+jFFK1VUyU/WdpdQtiPnzUxD+pBLfz0jfcY6XXvzqTz3tgnOOBsGmUbGhtFu1
         PwRODT18PgYqoCmW2cTapwVRyME06MpJGg2F5dKXZ6bMquEfoKUTvWLxzD5XiTzklM09
         El5zgaqZ3QaiyTldQNHykLaZFQD3qMAQ61y6JpzACR5c403TSSJhqD9Roj6LkyCxeL0p
         BrPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RTOE29KKEh2RCMQf09/Yf7/7d6oQT0Su+sy1NG6/ao4=;
        fh=u47O/ZDGm7eMKPUXJoXEYjt5cuAI15cXk7+Tk/iXNNg=;
        b=A5BELSDmoaZthwVs2XPe0j0k605Kf2NXd46zE2dJRw5oa4gTOgMHtblIbj8i0tXNOg
         rcG1pJD9C59hGzDEN8KAieyrAip1Fyf5XF8WK7CR9kutH7EYFX7JQYNkiPAj5K9vhXM/
         b8zW+tgC1uGSCGljuYwROhVwHPX4L0eQV9DsZuRkZA0djJqU7Sa9UuCoPS1gnKBTbVT6
         Ql8+NopBJ6QK6hdS128NiE9y2rrZuJQ1ongulrs18dU5xLWufdyRbX6CYwdTVrAInU3j
         4tVKK4fKjzByUOQl01JD6+i8THkYJhaovFiTBFVRjyaO9ducz5kbawR8Tw0TTTX3DIUJ
         a2pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773844920; x=1774449720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTOE29KKEh2RCMQf09/Yf7/7d6oQT0Su+sy1NG6/ao4=;
        b=CHhatJNJyvt21ikHjuZPr6+qHwBpJA4tTy0E6e/NlXO4QN/irSUV2UPrRjNdg570P4
         4W4wEsFDisbsvfQ8kUgqLFQKL202dFrUPS218bvfOPzm1IL+YEVD+XuvpaDbzpwEsJ3Q
         DuNUwHjvAr75ST5ptv0+jN/YZqVZ4m9ZT/7jisicTx2ZTQeP+ZmYEucYjHV+DUilrgOg
         j6ZoYOIxYwTAbOfhC4CyHLXGglQmrYdoA0Bwq57Tt+f7dhSzZSGFzUsmrxWi7ZQGx5Jj
         t+uXI+jWUTWy7a15bIOXNCM+0fIhuCvE2UOJfvRQkH0GESU1QFZt69FxpS8e0eUlJROc
         M2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844920; x=1774449720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RTOE29KKEh2RCMQf09/Yf7/7d6oQT0Su+sy1NG6/ao4=;
        b=Bphjp/yG9ghuct5JIHs7krKtuE80t6DtuqUzoV8RjWGgGufK04CGOTx2kZe97+Oth/
         wYlnCBd5X0vs0JRcpmh+5DICURF79DDQb8MdkQucE9Lvhmj3GdZMUjZQcgf/A1MhQ89K
         Mt4oRKwgRezQi7ts8skaPFzIIhPwo/jY6hUcEi8NSEXflnB39dD3PL888Ibxn5R9Vojt
         FKVpUT+d8xDPGdriSA7MD7BUPbzjgZCQkwmPKL02T5OP4B3ZqXflht6Sama9O7c6322A
         8LI4ULK3NFi4jdnDintuW+KTsx0clQ+M5Ebw/uVsNnMa69+UGKS4bkqvHSc/jVfUT8DZ
         pAYA==
X-Forwarded-Encrypted: i=1; AJvYcCV8XpmdSXXBmnt+vuZiNaRm47inuDtTNHN02ZNHmrrfD1cUCp4elPqAR0H1a9rrZcPZw7upOncjYq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcYWHfonix7TzquFzKjqCziDJem6GgqsUp5wlANkrRzAXn70jA
	qcJdCL2nc6U45Ewl04WvWuYBiLLckADDH36/4cH5XKvEfaKyvhysjKTkA0OECnK7XxAcuXegmBo
	8Eqk+brGPq0VJ6xaKiQzRz4zcyK59Tgs=
X-Gm-Gg: ATEYQzzpdfhzJS85Pj0jHRXtisCIoFFCmFQeNlCumbnC20CqhE5d/Cw34eZ3qFp7kTm
	UzEciMROkz/wB8ed1YVD5BIY/5bS+UgJOTFJafokKoOpK2JqbO7YRxb6dMw+frBRps/ZS9fxLnZ
	E5+LX6O1dUqBvfb7XPb8XHZQuJMvvBpgRqru6NUSBLn3PlrHFTweY8bxCLtcx6CNigixonRGwgM
	KZE1A3DXCwKrROf498UFXKyJfKgrrukG0U0/o8DrIMrJg+5BupYS8b7EGDqUD+6nzOCzaJZRcUR
	izu9qgep2Ew4iKEHJPE00GUgneTyT/p/VMMfuiYXUBMX6PLe5aODT+Fe873o1T6FxonHc+Wa6DH
	2XO4s33f4ooj2ScbbSuX+cmk=
X-Received: by 2002:a05:7300:3724:b0:2be:1f56:ed32 with SMTP id
 5a478bee46e88-2c0e4f79e7amr877942eec.1.1773844919477; Wed, 18 Mar 2026
 07:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
 <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com> <CAH5fLgg-kgeBw3Py-EZmAEJhm357u5NJP6na4qJe8v3aeFW5Cg@mail.gmail.com>
In-Reply-To: <CAH5fLgg-kgeBw3Py-EZmAEJhm357u5NJP6na4qJe8v3aeFW5Cg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 15:41:44 +0100
X-Gm-Features: AaiRm52glbQ5k03i38HLvFJrknMe1XNNnKvvWBogM8moiNwsNZDgYGGN20TDKPc
Message-ID: <CANiq72nad-60tOJeAfkvHTFrWXQS_wbG4JUGQNnkjm_NvhhaYw@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Alice Ryhl <aliceryhl@google.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-79972-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,redhat.com,linux.intel.com,suse.de,ffwll.ch,collabora.com,weathered-steel.dev,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[54];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.797];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C0BB62BDC23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 3:31=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> In principle this is possible using
>
> #[path =3D "pci/pci.rs"]
> pub mod pci;

No, I meant supported natively, i.e. without having to write an extra
file everywhere (which could perhaps be simpler as just a symlink
instead).

We could also generate the `mod.rs` on the fly, but that means a clean
tree isn't great for tooling etc.

Cheers,
Miguel

