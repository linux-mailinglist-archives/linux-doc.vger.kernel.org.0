Return-Path: <linux-doc+bounces-88774-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABO+BmDbDmrmCgYAu9opvQ
	(envelope-from <linux-doc+bounces-88774-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 21 May 2026 12:16:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 765B95A315F
	for <lists+linux-doc@lfdr.de>; Thu, 21 May 2026 12:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5CDB307873F
	for <lists+linux-doc@lfdr.de>; Thu, 21 May 2026 10:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAF138E121;
	Thu, 21 May 2026 10:14:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD08390C90
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358490; cv=none; b=Igc+jsuDc8WBgYuqwAF2iy9Y0HgqYZjkJF2uVacE0a/dBLy4rlZ1DYx/TINYtKu0LZjvUXKACTuKYjzClq7o/9GJIWqXBjU7oQz6vgxTZYJGq+J0O8DwR4Pt7Wz899ND3WS9O7QZWp2PhY/kbMr+CS/fMa+yinR/1GH13suYzF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358490; c=relaxed/simple;
	bh=qQMwPn7/lfIvsYleutoUSdCGdr5YbpqsWWM385H7f00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLPou+x/D8cVtYeCv1p29SWi+nV1OsfyyQEm0cng1VmFjev4G9MtwZ3yvefE+kKtsBUSlSYsZkpj+K4OiCg6DG/1HG9JbXwh2O/luEWoO6ymNJST0BEIv5PTrDK20R0m9TAl7GfP/zXBqk1gXo0WJ1ycwowXUte6GQ4ycfeU/aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-43a2ad7bcc4so2668602fac.1
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 03:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358487; x=1779963287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sd7k3LYNnD6K4NFyQw1AVAVbnXODVWOuybVQwPcxYzs=;
        b=rZggrb+e9/UALYq8wQ+TjQB/Uutq2QpZEMDi5wbTBG4lGVbp/ovTrMyCxPfomTAKQ9
         fR7LIcLx4khM3m1q2xj61ZTWaaHRzgnfJzH6eBuK1cE6UXcjTF40qqPBgt0gxFsl9Hog
         Izvw/scNH9zZn9V8AJklTbmVDLHRxug/x0zI8EulSgHDPUSi/kBl26Fw+KgulK0F9txo
         5EoM7gKXD/W8SQrVU4gIQIq8iDMp65BUT/qSiWjkM++7QotUHUIADNftEIxFMymo2o/z
         sIyZEjSoTAedeLZR1xmXrYXEw3kVKk2YCrq1l4HBrfP6ToVcM7mRPQKzRIThjdKlHBf2
         z1xQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6lWNV91UiyjfD7xYY+zwa0pfKWKiUqSSpDNkzyMjwhqGIAdpNWg4132wA3ZWmAEWBfVPwEtOQ7ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuM/ihW8PVJhb55suLnTeveDmgbnEh1WmYE0qG/7kD1LZDAl1A
	5GTqvMgxF3PeRXczCOFkCPS8UJuiT2FeESUBJgUFlUr3dvS9rrslPjCkkBpuI9KU
X-Gm-Gg: Acq92OHThZKBxpu/N5m9E9fPWTV5tmT2QqPjQrfYiNeIBOB/nZiXZAkz1pOPUWlO+EL
	lwg41Agxw13hWfQmabxtyHcbWFNhd7tmIkX4ohz/AFUyWX3mxKEdalkKUffE3LSIjqHQb9+6uQt
	/y3YMnyYmgpemlZhyscHVHyWfCnD+0JNkQ0aJcc0qGMHEcauy34aLMQXjZjvFgYz8mOuLAFUYn/
	HhmHfKV3RmOk1Am6agZ5u6IRfrbGpXRKy8vzm8jBdbHZJhBLhqGj5pVNUvKWgXWPeNY4djouMd6
	RRnkmq676Z6l1PThh89KXkDDah1jEL+ZhaU+jCCG+xK92iwhN139h6MMSimZpt4pmhoVwzkb9n9
	bqWzQ2c0854sG6SvNL/4PBPbfO0m897+smg8ya2FBYj1oArzZrvBFYPlnGgeEcRe6Ro09cxVFXg
	ghCxDlD2QgXiU08HPDrHYqpYzFKu7tZ98Hs5FVwianuid+TycHtSCkoEgxj4k9abJbrDFuu9bXe
	qCluAo8aI+FWlDuVo6rsbpy9Aln7UQoKm5seb0wqvhXcOoduzvFdSowepIEAeHSqQx/UCOv9Q==
X-Received: by 2002:a05:6870:21e1:b0:439:7835:136c with SMTP id 586e51a60fabf-43b2ea90582mr1269619fac.23.1779358487510;
        Thu, 21 May 2026 03:14:47 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b44935225sm294314fac.5.2026.05.21.03.14.46
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:14:46 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e4de538f83so3461649a34.1
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 03:14:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+xHSLo0MAygb33rKbi0Gfei7siGkS8ayAwXvpDv75VnBQY2deUXMy46bCAfBkChC3CDUvl9cJMzkk=@vger.kernel.org
X-Received: by 2002:a05:6830:3141:b0:7dc:dd91:b5b1 with SMTP id
 46e09a7af769-7e5ec03344cmr1089299a34.5.1779358486210; Thu, 21 May 2026
 03:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-evolve-to-crab-v2-1-c18e0e98fc54@chaosmail.tech>
In-Reply-To: <20260521-evolve-to-crab-v2-1-c18e0e98fc54@chaosmail.tech>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 21 May 2026 06:14:09 -0400
X-Gmail-Original-Message-ID: <CAEg-Je96T9hQ7GrwWo5pzfesBdumEhmNtnnpFM+7jdKDPe+RZQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ku0c_K-_Ko4PGfdu84e-M2GHJhf2RMMyNarSTSj4XW-x2EBje0JdkBkmc
Message-ID: <CAEg-Je96T9hQ7GrwWo5pzfesBdumEhmNtnnpFM+7jdKDPe+RZQ@mail.gmail.com>
Subject: Re: [PATCH v2] Fail the build on RUST=y and RUST_IS_AVAILABLE=n
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Trevor Gross <tmgross@umich.edu>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,protonmail.com,garyguo.net,lwn.net,linuxfoundation.org,umich.edu,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-88774-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[gompa.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neal@gompa.dev,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,msgid.link:url,gompa.dev:email]
X-Rspamd-Queue-Id: 765B95A315F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 4:32=E2=80=AFAM Sasha Finkelstein <k@chaosmail.tech=
> wrote:
>
> The current approach of silently disabling all rust drivers if the
> toolchain is missing results in users that try to compile their own
> kernels getting a "successful" build and then being confused about where
> did their drivers go. In comparison, missing openssl results in a build
> failure, not a disappearance of everything that depends on it.
>
> This also means that allyesconfig will depend on rust, but since the
> rust experiment concluded with "rust is here to stay", i believe that
> allyesconfig should be building rust drivers too.
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Changes in v2:
> - No longer a RFC, let's make it happen.
> - Update the docs.
> - Link to v1: https://patch.msgid.link/20260510-evolve-to-crab-v1-1-208df=
84e67be@chaosmail.tech
> ---
>  Documentation/rust/quick-start.rst | 6 +++---
>  init/Kconfig                       | 1 -
>  2 files changed, 3 insertions(+), 4 deletions(-)
>

At this point, yes, we should just go ahead and do this.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

