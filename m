Return-Path: <linux-doc+bounces-9023-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A45851EBA
	for <lists+linux-doc@lfdr.de>; Mon, 12 Feb 2024 21:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F83A1F22790
	for <lists+linux-doc@lfdr.de>; Mon, 12 Feb 2024 20:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB53F1EB58;
	Mon, 12 Feb 2024 20:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NjoZL6iY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312AF1EB34
	for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 20:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707770216; cv=none; b=lKT6/JO1RtQ4jXQlrcCEujCgn8mH/J2EucsRrCHcsONp+xTH4cCWnt0aGAug+8idFl42Xviz33wsIxKaTYoaH3eymd40WYjFVqO09my5GXJOzHy7TPFE3vJGE/aVV1J8+KBJvRhomip0oJM0SpZLsAXgVRrTsJTxgGZtON4N+Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707770216; c=relaxed/simple;
	bh=/Qq/MTNXhRSFGfhT1MpQL4wU8zE0C84XuaSbfhwx1Oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NdSQ84DftKvLcdeumj5d3Vj29pDzijTpNNflRD/cGUDmsvGd+istDMOiIKO2NNwTTtQPxd9VNHefeHZ90EeYVQtEzebP46orbMhm+YumjVOxoe+X5As6EF7VLk1dQwfLLspAP1L8rYSdXjR/y4nGdVj9fR4x6DW111owJ4GVa9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NjoZL6iY; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-46d331e3fd2so2082526137.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 12:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707770214; x=1708375014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Qq/MTNXhRSFGfhT1MpQL4wU8zE0C84XuaSbfhwx1Oc=;
        b=NjoZL6iYPpuIavLjRBXRakQeIQfNcFALN0lIhvqVa/PtYSrsWMHhX5ZVPtdo6eAnyM
         uen9fiFZSvvCnBI21ISLhGYYlFR5ed9JE0rvdOgVL5w0hpibwru1INFBjd/rei1GQp/f
         grAhkOm25LxpHFELEk8QV5JFPuu3AokXm8WP7nSIInq0OAxIyCJRymaI0y7wWKmoSGnU
         +ck94XCC5Q/10SY5Egc4aY5cAxLkckFKDqld/fzy3uTe474PombiL+Qes9BgRnzbboHc
         pmwSjA/hRShCE98aC+ZBeu2H5BSlLJOf8jYt8XU1QhE5iHIPcJj6jzHmC0jqTrGhMqY0
         Cqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707770214; x=1708375014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Qq/MTNXhRSFGfhT1MpQL4wU8zE0C84XuaSbfhwx1Oc=;
        b=i+E5SchVBeuy4uIq48YcgStYZQ5S/56quSKzo8wUmqIj+4GSFFDp/L6+Ue9dvU4Xsx
         cynPohLUh2d+8f+M1FCEUPjhhHjCndt1u/7zoY9raUIFEh1w2ThsMLASW1gQ57FHKuNq
         0S7642z8DBm0soxH3Lffr5lF1HgJM4WGNV17lPBCPyCGDDkPhUXyZxRMZBGjCt6kz/0R
         MlTV9X9rEMewk/oEQDdUCo123DAB37MfRnoXLaIP3W/93ctziDo74u/2+Q9WhNLtLQMX
         tOBzf+hlnLnk933r+XHRSW62UqT4ZAdicgh+3iL0oze2BEgzZFZNwyA8BRBjn/tlIlQK
         jRtA==
X-Forwarded-Encrypted: i=1; AJvYcCVtyNv4ouu7bR2Vf1r/BrYyiSmUTdA1LSOt25AMG/mn85axhDfH1cLsOZ2AFxXqjqsEz8xSZyKs6WjAJ6UxWlmBhiabJOTxntJW
X-Gm-Message-State: AOJu0YxtQp8urkZrmcbR3jq8LyrRSwRKGovJbSaiIhriDYOcu9qFtcRv
	IohSNTR4LVP8+XTiZb14z+JgBBxWpjX7pIHqD6i3m7EDDXNzoyzNx7Byp69JfN/qayxENzrJOED
	6vhdXu7qwu3HgP/nNg522AEY2Pmme/+deOxc2
X-Google-Smtp-Source: AGHT+IFWndKWzDTOT0x0/4s8Etpblas7Df8C2xR5KB9thOTs6aRnFjIThpiH1ujxZsNIy/J6F6pXaMbg0Ae3jkIJHZ8=
X-Received: by 2002:a67:e947:0:b0:46e:cadc:f340 with SMTP id
 p7-20020a67e947000000b0046ecadcf340mr645454vso.7.1707770213832; Mon, 12 Feb
 2024 12:36:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117-swiftly-parasail-618d62972d6e@spud> <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy> <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud> <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud> <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
 <CAOcBZOSfN8Yefez_Gy_T3_QTAd4HcLzmMCOoR37K2agWD_U_PQ@mail.gmail.com>
In-Reply-To: <CAOcBZOSfN8Yefez_Gy_T3_QTAd4HcLzmMCOoR37K2agWD_U_PQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 12 Feb 2024 12:36:15 -0800
Message-ID: <CABCJKueFuDkmUmXWbtA3DveQ719vdZx5kBQE1bZ1f6oD5zYNzA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Ramon de C Valle <rcvalle@google.com>
Cc: Trevor Gross <tmgross@umich.edu>, Conor Dooley <conor@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 11:04=E2=80=AFAM Ramon de C Valle <rcvalle@google.c=
om> wrote:
>
> Sorry for the late reply. Sami might be the best person to answer
> this, but KCFI (not CFI) tests are lowered by passes that are
> architecture specific (see https://reviews.llvm.org/D119296), so we'd
> need to add support for RISC-V. There is no additional work required
> in the Rust compiler besides enabling it for the new target.

LLVM 17 added KCFI support for RISC-V. Sounds like it's just a
question of whether rustc uses a new enough version of LLVM then?

Sami

