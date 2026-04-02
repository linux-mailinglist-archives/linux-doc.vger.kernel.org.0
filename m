Return-Path: <linux-doc+bounces-82218-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG2oErEYzmmnkgYAu9opvQ
	(envelope-from <linux-doc+bounces-82218-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Apr 2026 09:20:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 583F23850A6
	for <lists+linux-doc@lfdr.de>; Thu, 02 Apr 2026 09:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2470D300D0EF
	for <lists+linux-doc@lfdr.de>; Thu,  2 Apr 2026 07:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E473815E5;
	Thu,  2 Apr 2026 07:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rctgc0sm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DFD37C918
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 07:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113958; cv=pass; b=JNNHigSwaLCOKw7jND2whnnRa/UGxpaWAta/7FZBCzL3boCqYwUrcsSwf/eTRV419gD4im6g/Hm/uQ5lUIq8Qog27EbWXBrPurvVM/PnA4czBQio9GCcdju4bpigpbg/XFHHJPPwVQkirmpkDpQGP981Q2U6BwCSeDxJXcqZeHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113958; c=relaxed/simple;
	bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMRfSnOdn2OKRxI5OtGVxAN+PXnL3Jj8PzjKvPrbRmn3F87/6MTY5rcMKN91RWCrg429xNwugLqRnnr3i/Gcdxc+qqyf93d1D9QxSfltLaVTYplNuyn0QaoiQTvUAgqz3Iym0K4PW6uTjX6UnXV4/VpSNSSdFCfJ2sMDKLdMd8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rctgc0sm; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c6f5574d07so14118eec.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 00:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775113957; cv=none;
        d=google.com; s=arc-20240605;
        b=F7ixHlMX1ZKMiE6sTP7lTpr5hrEFFoRUzWB6s6oBKIF1GO4gC/u3A6c6lSdbFrAZkW
         D9kxK2D7Q2lkt8PPNTiBoN6Jd7Ae9niBECwno9pFR2HpeBB03e0ib25fTOHChbNFnj5t
         WzjsAhFi9MMdDw5+h1ldxZe1B2hwVSoWq6uNbbfTYa+ggg06mp4cfmGdLwxP/7ycWPM/
         npsDExVUD3ZPpKlMGELgyIRzM713TVJ6dQa43f51wwJXHYuUir4t8qdKzFcPn71UMva6
         IGK44F1O+KUVzH8m7LT6hKZV5cDkVm+64kwiZrUHnAf64jYGoQ2GLwKFfHsfEKNdoQGh
         Enwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        fh=MUgFSpRlcRIbba1LYDimkVKAuN7RuYs9DZBFMC2D8Hk=;
        b=HBi1DPi1P8mSQhwsFtTmCWwOpy8gz9h9db6Ue8g5RloKgDZokxKIS/m3u5wQUePtqp
         dfxLFZfyENBFkKpqToeHfL0PqjC5LLfJVDj9DvUwJAKJG/nZujdGMXScpnV10eHryIIm
         3LICpBihsiHwTgssmfJJLz+8dtliQ7qq7Ig4ZBQUdZZ4qvds/SZLaV+K0wzDw1rkv3sO
         J9bP+mHTd0/kVSsPu5m+a5wwhW9Jt8x2UkIDittHsvW7pifA7uTK/oKbSvWKgxuh7Ohj
         XNH7UI6rpdqMVOiUgL6heiEjdz3cQTCrfFzNR776NDZW5Su4ZClhjxi+5BBC/VXDSJOP
         0QrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775113957; x=1775718757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        b=Rctgc0smJaz1L/DzT0w31Pkz2ioXDTbLbdLHju8I+MYH+TZcUE3kHlF1I3EWm1SyCh
         eQiNL6PiFdoKan04df3xcrWzktvgLtMghA82LhAy1WM8mvZxgLz1GSwI8XqGOCnMQ7YT
         2D1lyJ0uq3ZCMkSjEpGiGkD4H86zNRjQKPGPw6RpZfq6HwjQJWO20WsfP29oaR3kWllo
         UTeti7cU9wsmV9EetTySmlcHgqjE7xKikJY34Of/cFLLlkcsUWK4X7Vkycacqi4xDHHa
         3JLgo68Gh6qywE0saN37PiY4ogF+/E6JrqwZSKSReopxi6fjf65hPIDqvZnM7SCkNmQJ
         AROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113957; x=1775718757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        b=cYhN7AFe+zk9gS96ZUZ4T0sq+OIY8uDuxV+gCFWHHk8D0ycoZryY4LCjwMK/4ygRmX
         pSlCkS7npKSY2ys4ZuORhbMURDiYIAjGMEaZF2CU8Qf4b7PkhCxTbVNXl/583vG4RY6Q
         +r9uozmAcklIEe99VOedx4lfx+gmPfGNO/30DKnBDp/Q9gst6Bok8VSnMdXoCzX74STt
         xlbvYEXeQAJAabknKmCu//kvCSHNMEa5JMspuDU47zTO9R3KP3m/atkCVLKFYOYhT0ng
         Hd8rwSkpx7soY+emvzPnHEB0GD9qVsl1ir42V7668aDhxbrj1j+qZqCbihQxoRJc/XSn
         H/BQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/lpFnOhaBnIWvQXVRZZ3+QjowTCGvUzohZOruHXq2NmenvmnJasnJqpfi/NBGBeKQVvKGEfdPHmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ4XEosEpj2J19PqeoU4eGxNGezQfAVN4LKFok/t93mnYO/HCj
	jE0MbSc0Wp/9juEJBjZOM7+cmnxPh8Afij+VCZllYwklqOcySWx+MfQc3UpEaN73s/C0UoC1jVN
	RMAHRr2/jZIHfoSB1OuGtHsy+/1i7v7A=
X-Gm-Gg: ATEYQzwXnMdAfMUIFZlXqiHRVSO1DGA7kFCED2nd586wReg92O5vhMdqWD0vEpRC7Jc
	cmNDl60R5R0TYY/i4Jdkl+EmG5rFAfjsoVtlz682d9NkPrN7lSMFHSKp3FAK0xlwXiZNpTBRzfd
	27BDkGa4G5rByh3V9IIS0yzp4AaqbfsEVtVT2wZS87Mz+ZDDY39rKV+r9dZgUnXxmNPsDjmbC2r
	EGoAiH2AlWyYPXLJ7qziAq4611v1Kul5LvfWmNYGLf7V/orW/Oyj2fTtRATr6qP4qqHHwLFiayP
	HLY4ZrF0hvmA2UTp9E/serIUqudX1ucePqkt09U905Ufaz5/2pjUMRrbmld/ms8slxqaKbH2Wqs
	TKWBOPqGhQyaPXW6hsZysouQ=
X-Received: by 2002:a05:7301:6790:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c9321b7bf4mr1634311eec.4.1775113956496; Thu, 02 Apr 2026
 00:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-16-ojeda@kernel.org>
 <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
In-Reply-To: <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Apr 2026 09:12:22 +0200
X-Gm-Features: AQROBzDaEWueCbjTzytnJo43NDIAkvyWYngeEqQLnAsLh-4PZJOJIJpad43tD2c
Message-ID: <CANiq72n4sCU=2m4Uee8Wpsv3mjkw_BuT8Sg54Gu0U68j7qAM5A@mail.gmail.com>
Subject: Re: [PATCH 15/33] rust: rust_is_available: remove warning for
 0.66.[01] buggy versions
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82218-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 583F23850A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 4:58=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The scripts/rust_is_available.sh change looks correct to me, although I c=
ouldn't
> get scripts/rust_is_available_test.py to run on NixOS.
>
> Looks like it filtered out PATH but uses /usr/bin/env to find python bina=
ry? For
> obvious reasons that will only work if python is located /usr/bin/python.

Yeah, the script has some assumptions on it (e.g. it also assumes
`dash` behavior vs. `bash` in a couple tests which I should relax
too). Happy to change that.

Thanks for testing it :)

Cheers,
Miguel

